using AutoMapper;
using Belaz.WeldingApp.Common.Enums;
using Belaz.WeldingApp.RegistarApi.BusinessLayer.Extensions;
using Belaz.WeldingApp.RegistarApi.BusinessLayer.Models;
using Belaz.WeldingApp.RegistarApi.BusinessLayer.Requests;
using Belaz.WeldingApp.RegistarApi.BusinessLayer.Responses;
using Belaz.WeldingApp.RegistarApi.BusinessLayer.Services.Interfaces;
using Belaz.WeldingApp.RegistarApi.BusinessLayer.Validations.Services;
using Belaz.WeldingApp.RegistarApi.DataLayer.Repositories.Interfaces;
using Belaz.WeldingApp.Common.Entities.TaskInfo;
using Belaz.WeldingApp.Common.Entities.WeldingEquipmentInfo;
using LanguageExt;
using LanguageExt.Common;
using Belaz.WeldingApp.RegistarApi.BusinessLayer.Helpers.Interfaces;

namespace Belaz.WeldingApp.RegistarApi.BusinessLayer.Services.Implementations;

public class RegistarService : IRegistarService
{
    private const int MaxIdleMinutes = 3;
    private const int MaxForcedDowntimeMinutes = 5;

    private readonly IValidationService _validationService;
    private readonly IMapper _mapper;
    private readonly IWeldingEquipmentRepository _weldingEquipmentRepository;
    private readonly IWelderRepository _welderRepository;
    private readonly IMasterRepository _masterRepository;
    private readonly IRecordRepository _recordRepository;
    private readonly IWeldingTaskRepository _weldingTaskRepository;
    private readonly IWeldPassageRepository _weldPassageRepository;
    private readonly IWeldPassageInstructionRepository _weldPassageInstructionRepository;
    private readonly IMarkEstimateService _markEstimateService;
    private readonly IEmailSender _emailSender;
    private readonly ISeamRepository _seamRepository;

    public RegistarService(
        IValidationService validationService,
        IMapper mapper,
        IWeldingEquipmentRepository weldingEquipmentRepository,
        IWelderRepository welderRepository,
        IRecordRepository recordRepository,
        IMasterRepository masterRepository,
        IWeldingTaskRepository weldingTaskRepository,
        IWeldPassageRepository weldPassageRepository,
        IWeldPassageInstructionRepository weldPassageInstructionRepository,
        IMarkEstimateService markEstimateService, IEmailSender emailSender, ISeamRepository seamRepository)
    {
        _validationService = validationService;
        _mapper = mapper;
        _weldingEquipmentRepository = weldingEquipmentRepository;
        _welderRepository = welderRepository;
        _recordRepository = recordRepository;
        _masterRepository = masterRepository;
        _weldingTaskRepository = weldingTaskRepository;
        _weldPassageRepository = weldPassageRepository;
        _weldPassageInstructionRepository = weldPassageInstructionRepository;
        _markEstimateService = markEstimateService;
        _emailSender = emailSender;
        _seamRepository = seamRepository;
    }

    public async Task<Result<WelderWithEquipmentResponse>> GetWelderWithEquipmentAsync(
        GetWelderWithEquipmentRequest request
    )
    {
        var validationResult = await _validationService.ValidateAsync(request);

        return await validationResult.ToDataResult(async () =>
        {
            var weldingEquipment = await _weldingEquipmentRepository.GetByRfidTagAsync(
                request.EquipmentRfidTag
            );

            var welder = await _welderRepository.GetByRfidTagAsync(request.WelderRfidTag);

            await UpdateWeldingEquipmentConditionAsync(
                request.StartDateTime.Date,
                request.StartDateTime.TimeOfDay,
                weldingEquipment.Id,
                welder.Id
            );

            return new WelderWithEquipmentResponse
            {
                WelderId = welder.Id,
                ServiceNumber = welder.ServiceNumber,
                FirstName = welder.FirstName,
                MiddleName = welder.MiddleName,
                LastName = welder.LastName,
                Position = welder.Position,
                EquipmentId = weldingEquipment.Id,
                EquipmentName = weldingEquipment.Name,
                EquipmentMarking = weldingEquipment.Marking,
                EquipmentFactoryNumber = weldingEquipment.FactoryNumber,
                WorkshopId = welder.Workshop.Id,
                WorkshopName = welder.Workshop.Name,
                WorkshopNumber = welder.Workshop.Number,
                ProductionAreaId = welder.ProductionArea.Id,
                ProductionAreaName = welder.ProductionArea.Name,
                ProductionAreaNumber = welder.ProductionArea.Number,
                PostId = welder.Post?.Id ?? null,
                PostNumber = welder.Post?.Number ?? null,
                WorkplaceId = welder.Workplace?.Id ?? null,
                WorkplaceNumber = welder.Workplace?.Number ?? null
            };
        });
    }

    public async Task<Result<Unit>> CreateRecordWithoutTaskAsync(RecordWithoutTaskRequest request)
    {
        var validationResult = await _validationService.ValidateAsync(request);

        return await validationResult.ToDataResult(async () =>
        {
            var weldingRecord = _mapper.Map<WeldingRecord>(request);

            var weldingRecordLimit = await _recordRepository.GetWeldingRecordLimitAsync();

            var amperagesTermDeviation = CalculateTermDeviation(
                weldingRecord.WeldingCurrentValues,
                weldingRecordLimit.WeldingCurrentMin,
                weldingRecordLimit.WeldingCurrentMax
            );

            var voltagesTermDeviation = CalculateTermDeviation(
                weldingRecord.ArcVoltageValues,
                weldingRecordLimit.ArcVoltageMin,
                weldingRecordLimit.ArcVoltageMax
            );

            weldingRecord.IsEnsuringCurrentAllowance = IsProvideAllowance(
                amperagesTermDeviation.LongCount,
                weldingRecordLimit.WeldingCurrentMin,
                weldingRecordLimit.WeldingCurrentMax
            );
            weldingRecord.IsEnsuringVoltageAllowance = IsProvideAllowance(
                voltagesTermDeviation.LongCount,
                weldingRecordLimit.ArcVoltageMin,
                weldingRecordLimit.ArcVoltageMax
            );

            var masterId = await _masterRepository.GetMasterIdByEquipmentIdAsync(request.WeldingEquipmentId);

            if (masterId.HasValue && (weldingRecord.IsEnsuringCurrentAllowance.HasValue
                                      || weldingRecord.IsEnsuringVoltageAllowance.HasValue))
            {
                await _emailSender.SendDeviationRecordEmailAsync(
                    weldingRecord.IsEnsuringVoltageAllowance,
                    weldingRecord.IsEnsuringCurrentAllowance,
                    masterId.Value,
                    request.WelderId,
                    request.WeldingEquipmentId,
                    null);
            }

            await CreateWeldingRecordAsync(
                weldingRecord,
                request.WeldingEquipmentId,
                request.WelderId,
                request.Voltages.Length,
                request.StartDateTime
            );

            return Unit.Default;
        });
    }

    public async Task<Result<List<WeldingTaskBriefResponse>>> GetAllTasksByDateAndEquipmentAsync(
        GetAllTasksByDateAndEquipmentRequest request
    )
    {
        var validationResult = await _validationService.ValidateAsync(request);

        return await validationResult.ToDataResult(async () =>
        {
            var equipment = await _weldingEquipmentRepository.GetByRfidTagAsync(
                request.EquipmentRfidTag
            );

            var welder = await _welderRepository.GetByRfidTagAsync(request.WelderRfidTag);

            var tasks =
                await _weldingTaskRepository.GetAllTasksByDateEquipmentAndWelderRfidTagAsync(
                    request.StartDateTime,
                    request.EquipmentRfidTag,
                    request.WelderRfidTag
                );

            var result = _mapper.Map<List<WeldingTaskBriefResponse>>(tasks);

            result.ForEach(_ =>
            {
                _.WelderId = welder.Id;
                _.EquipmentId = equipment.Id;
            });

            return result;
        });
    }

    public async Task<Result<Unit>> CreateRecordWithTaskAsync(RecordWithTaskRequest request)
    {
        var validationResult = await _validationService.ValidateAsync(request);

        return await validationResult.ToDataResult(async () =>
        {
            var weldingRecord = _mapper.Map<WeldingRecord>(request);

            var record = await CreateWeldingRecordAsync(
                weldingRecord,
                request.WeldingEquipmentId,
                request.WelderId,
                request.Voltages.Length,
                request.StartDateTime
            );

            await CreateWeldPassageAsync(
                record,
                request.TaskId,
                request.WeldPassageNumber,
                request.PreheatingTemperature
            );

            await _weldingTaskRepository.UpdateWeldingTaskStatusAsync(
                request.TaskId,
                request.WelderId,
                WeldingTaskStatus.ExecutionAccepted
            );

            return Unit.Default;
        });
    }

    public async Task<Result<WeldingTaskResponse>> GetTaskByIdAsync(GetTaskByIdRequest request)
    {
        var validationResult = await _validationService.ValidateAsync(request);

        return await validationResult.ToDataResult(async () =>
        {
            var welder = await _welderRepository.GetByRfidTagAsync(request.WelderRfidTag);

            var equipment = await _weldingEquipmentRepository.GetByRfidTagAsync(
                request.EquipmentRfidTag
            );

            await _weldingTaskRepository.UpdateWeldingTaskStatusAsync(
                request.TaskId,
                welder.Id,
                WeldingTaskStatus.ExecutionAccepted
            );

            var weldingTask = await _weldingTaskRepository.GetTaskByIdAsync(request.TaskId);

            var result = _mapper.Map<WeldingTaskResponse>(weldingTask);

            result.WelderId = welder.Id;
            result.EquipmentId = equipment.Id;

            return result;
        });
    }

    public async Task<Result<Unit>> MarkWeldingTaskAsCompletedAsync(
        MarkWeldingTaskAsCompletedRequest request
    )
    {
        var validationResult = await _validationService.ValidateAsync(request);

        return await validationResult.ToDataResult(async () =>
        {
            await _weldingTaskRepository.MarkWeldingTaskAsCompletedAsync(request.TaskId);

            return Unit.Default;
        });
    }

    private bool? IsProvideAllowance(int longCount, double? min, double? max)
    {
        if (min is null || max is null)
        {
            return null;
        }

        var outOfAllowance = longCount > 0;
        return !outOfAllowance;
    }

    private bool? IsTemperatureProvideAllowance(
        double preheatingTemperature,
        double? max,
        double? min
    )
    {
        if (min is null || max is null)
        {
            return null;
        }

        return preheatingTemperature <= max && preheatingTemperature >= min;
    }

    private async Task<WeldingRecord> CreateWeldingRecordAsync(
        WeldingRecord record,
        Guid weldingEquipmentId,
        Guid welderId,
        int valuesLength,
        DateTime startDateTime
    )
    {
        record.MasterId = await _masterRepository.GetMasterIdByEquipmentIdAsync(weldingEquipmentId);

        record.ArcVoltageAverage = Math.Round(record.ArcVoltageValues.Average(), 2);
        record.WeldingCurrentAverage = Math.Round(record.WeldingCurrentValues.Average(), 2);

        var seconds = 0.1 * valuesLength;
        var weldingEndTime = record.WeldingStartTime.Add(TimeSpan.FromSeconds(seconds));

        record.WeldingEndTime = weldingEndTime;

        var weldingEquipmentConditionTime = new WeldingEquipmentConditionTime
        {
            Condition = Condition.AtWork,
            Time = seconds / 60,
            Date = startDateTime.Date,
            StartConditionTime = startDateTime.TimeOfDay,
            WeldingEquipmentId = weldingEquipmentId,
            WelderId = welderId
        };

        await _weldingEquipmentRepository.AddWeldingEquipmentConditionTimeAsync(
            weldingEquipmentConditionTime
        );

        return await _recordRepository.CreateRecordWithoutTaskAsync(record);
    }

    private async Task CreateWeldPassageAsync(
        WeldingRecord record,
        Guid taskId,
        int weldPassageNumber,
        double preheatingTemperature
    )
    {
        var weldPassageInstruction = await _weldPassageInstructionRepository.GetByTaskIdAndNumber(
            taskId,
            weldPassageNumber
        );

        var estimation = _markEstimateService.GetAverageEstimation(
            record.WeldingCurrentValues,
            record.ArcVoltageValues,
            weldPassageInstruction.WeldingCurrentMin,
            weldPassageInstruction.WeldingCurrentMax,
            weldPassageInstruction.ArcVoltageMin,
            weldPassageInstruction.ArcVoltageMax
        );

        var amperagesTermDeviation = CalculateTermDeviation(
            record.WeldingCurrentValues,
            weldPassageInstruction.WeldingCurrentMin,
            weldPassageInstruction.WeldingCurrentMax
        );

        var voltagesTermDeviation = CalculateTermDeviation(
            record.ArcVoltageValues,
            weldPassageInstruction.ArcVoltageMin,
            weldPassageInstruction.ArcVoltageMax
        );

        double shortTermDeviation;
        double longTermDeviation;

        if (amperagesTermDeviation.ShortCount > voltagesTermDeviation.ShortCount ||
            amperagesTermDeviation.LongCount > voltagesTermDeviation.LongCount)
        {
            shortTermDeviation = amperagesTermDeviation.ShortCount * 0.1d;
            longTermDeviation = amperagesTermDeviation.LongCount * 0.1d;
        }
        else
        {
            shortTermDeviation = voltagesTermDeviation.ShortCount * 0.1d;
            longTermDeviation = voltagesTermDeviation.LongCount * 0.1d;
        }

        var weldPassage = new WeldPassage
        {
            Number = weldPassageNumber,
            Name = weldPassageInstruction.Name,
            PreheatingTemperature = preheatingTemperature,
            WeldingTaskId = taskId,
            WeldingRecord = record,
            Estimation = estimation,
            ShortTermDeviation = shortTermDeviation,
            LongTermDeviation = longTermDeviation,
            IsEnsuringCurrentAllowance = IsProvideAllowance(
                amperagesTermDeviation.LongCount,
                weldPassageInstruction.WeldingCurrentMin,
                weldPassageInstruction.WeldingCurrentMax
            ),
            IsEnsuringVoltageAllowance = IsProvideAllowance(
                voltagesTermDeviation.LongCount,
                weldPassageInstruction.ArcVoltageMin,
                weldPassageInstruction.ArcVoltageMax
            ),
            IsEnsuringTemperatureAllowance = IsTemperatureProvideAllowance(
                preheatingTemperature,
                weldPassageInstruction.PreheatingTemperatureMin,
                weldPassageInstruction.PreheatingTemperatureMax
            )
        };

        var masterId = await _masterRepository.GetMasterIdByWeldingTaskIdAsync(taskId);
        var seamId = await _seamRepository.GetSeamIdByWeldingTaskIdAsync(taskId);

        if (masterId.HasValue && (weldPassage.IsEnsuringCurrentAllowance.HasValue
                                  || weldPassage.IsEnsuringVoltageAllowance.HasValue))
        {
            await _emailSender.SendDeviationRecordEmailAsync(
                weldPassage.IsEnsuringVoltageAllowance,
                weldPassage.IsEnsuringCurrentAllowance,
                masterId.Value,
                record.WelderId,
                record.WeldingEquipmentId,
                seamId);
        }

        await _weldPassageRepository.CreateAsync(weldPassage);
    }

    private TermDeviation CalculateTermDeviation(double[] values, double? min, double? max)
    {
        if (min is null || max is null)
        {
            return new TermDeviation();
        }

        var result = new TermDeviation();
        int countSequential = 0;

        var lastValue = values;

        for (var i = 0; i < values.Length; i++)
        {
            if (values[i] < min || values[i] > max)
            {
                countSequential++;

                if (i != values.Length - 1)
                    continue;
            }

            if (countSequential > 50)
            {
                result.LongCount += countSequential;
            }

            if (countSequential != 0 && countSequential <= 50)
            {
                result.ShortCount += countSequential;
            }

            countSequential = 0;
        }

        return result;
    }

    private async Task UpdateWeldingEquipmentConditionAsync(
        DateTime date,
        TimeSpan startConditionTime,
        Guid weldingEquipmentId,
        Guid welderId
    )
    {
        var existingConditionTime = await _weldingEquipmentRepository.GetLastConditionTimeAsync(
            weldingEquipmentId
        );

        if (
            existingConditionTime == null
            || existingConditionTime.Condition == Condition.AtWork
            || existingConditionTime.Condition == Condition.Off
        )
        {
            await CreateWeldingEquipmentConditionTimeAsync(
                Condition.On,
                date,
                startConditionTime,
                weldingEquipmentId,
                welderId
            );
            return;
        }

        var lastConditionDateTime = existingConditionTime.Date
            .Add(existingConditionTime.StartConditionTime)
            .AddMinutes(existingConditionTime.Time);

        var newConditionDateTime = date.Add(startConditionTime);

        var idleMinutes = newConditionDateTime.Subtract(lastConditionDateTime).TotalMinutes;

        if (idleMinutes >= MaxIdleMinutes)
        {
            await CreateWeldingEquipmentConditionTimeAsync(
                Condition.On,
                date,
                startConditionTime,
                weldingEquipmentId,
                welderId
            );
            return;
        }
        
        var lastConditionStartDateTime = existingConditionTime.Date
            .Add(existingConditionTime.StartConditionTime);

        var newMinutes = newConditionDateTime.Subtract(lastConditionStartDateTime).TotalMinutes;

        if (existingConditionTime.Condition == Condition.On && newMinutes > MaxForcedDowntimeMinutes)
        {
            await _weldingEquipmentRepository.UpdateEquipmentConditionTimeAsync(
                existingConditionTime.Id,
                Condition.ForcedDowntime,
                newMinutes);
            return;
        }
        
        if (newMinutes >= existingConditionTime.Time)
        {
            await _weldingEquipmentRepository.UpdateEquipmentConditionTimeAsync(
                existingConditionTime.Id,
                newMinutes
            );
        }
    }

    private Task CreateWeldingEquipmentConditionTimeAsync(
        Condition condition,
        DateTime date,
        TimeSpan startConditionTime,
        Guid weldingEquipmentId,
        Guid welderId
    )
    {
        return _weldingEquipmentRepository.AddWeldingEquipmentConditionTimeAsync(
            new WeldingEquipmentConditionTime
            {
                Condition = condition,
                Time = 0,
                Date = date,
                StartConditionTime = startConditionTime,
                WeldingEquipmentId = weldingEquipmentId,
                WelderId = welderId
            }
        );
    }
}