using AutoMapper;
using Belaz.WeldingApp.RegistarApi.BusinessLayer.Extensions;
using Belaz.WeldingApp.RegistarApi.BusinessLayer.Models;
using Belaz.WeldingApp.RegistarApi.BusinessLayer.Requests;
using Belaz.WeldingApp.RegistarApi.BusinessLayer.Responses;
using Belaz.WeldingApp.RegistarApi.BusinessLayer.Services.Interfaces;
using Belaz.WeldingApp.RegistarApi.BusinessLayer.Validations.Services;
using Belaz.WeldingApp.RegistarApi.DataLayer.Repositories.Interfaces;
using Belaz.WeldingApp.RegistarApi.Domain.Dtos;
using Belaz.WeldingApp.RegistarApi.Domain.Entities.ProductInfo;
using Belaz.WeldingApp.RegistarApi.Domain.Entities.TaskInfo;
using Belaz.WeldingApp.RegistarApi.Domain.Entities.WeldingEquipmentInfo;
using LanguageExt;
using LanguageExt.Common;
using WeldingApp.Common.Enums;

namespace Belaz.WeldingApp.RegistarApi.BusinessLayer.Services.Implementations;

public class RegistarService : IRegistarService
{
    private readonly IValidationService _validationService;
    private readonly IMapper _mapper;
    private readonly IWeldingEquipmentRepository _weldingEquipmentRepository;
    private readonly IWelderRepository _welderRepository;
    private readonly IMasterRepository _masterRepository;
    private readonly IRecordRepository _recordRepository;
    private readonly IWeldingTaskRepository _weldingTaskRepository;
    private readonly IWeldPassageRepository _weldPassageRepository;
    private readonly IWeldPassageInstructionRepository _weldPassageInstructionRepository;

    public RegistarService(
        IValidationService validationService,
        IMapper mapper,
        IWeldingEquipmentRepository weldingEquipmentRepository,
        IWelderRepository welderRepository,
        IRecordRepository recordRepository,
        IMasterRepository masterRepository,
        IWeldingTaskRepository weldingTaskRepository,
        IWeldPassageRepository weldPassageRepository,
        IWeldPassageInstructionRepository weldPassageInstructionRepository
    )
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

            var weldingEquipmentConditionTime = new WeldingEquipmentConditionTime
            {
                Condition = Condition.On,
                Time = 60,
                Date = request.StartDateTime.Date,
                StartConditionTime = request.StartDateTime.TimeOfDay,
                WeldingEquipmentId = weldingEquipment.Id
            };

            await _weldingEquipmentRepository.AddWeldingEquipmentConditionTimeAsync(
                weldingEquipmentConditionTime
            );

            var welder = await _welderRepository.GetByRfidTagAsync(request.WelderRfidTag);

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

            await CreateWeldingRecordAsync(
                weldingRecord,
                request.WeldingEquipmentId,
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
                request.Voltages.Length,
                request.StartDateTime
            );

            await CreateWeldPassageAsync(
                record,
                request.TaskId,
                request.WeldPassageNumber,
                request.PreheatingTemperature
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

    private bool? IsProvideAllowance(double[] values, double? min, double? max)
    {
        if (min is null || max is null)
        {
            return null;
        }

        var outOfAllowance = values.Count(x => x < min || x > max) >= 10;
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
        int valuesLength,
        DateTime startDateTime
    )
    {
        record.MasterId = await _masterRepository.GetMasterIdByEquipmentIdAsync(weldingEquipmentId);

        var seconds = (int)Math.Round(0.1 * valuesLength);
        var weldingEndTime = record.WeldingStartTime.Add(TimeSpan.FromSeconds(seconds));

        record.WeldingEndTime = weldingEndTime;

        var weldingEquipmentConditionTime = new WeldingEquipmentConditionTime
        {
            Condition = Condition.AtWork,
            Time = seconds,
            Date = startDateTime.Date,
            StartConditionTime = startDateTime.TimeOfDay,
            WeldingEquipmentId = weldingEquipmentId
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

        var weldPassage = new WeldPassage
        {
            Number = weldPassageNumber,
            Name = weldPassageInstruction.Name,
            PreheatingTemperature = preheatingTemperature,
            WeldingTaskId = taskId,
            WeldingRecord = record,
            ShortTermDeviation =
                (amperagesTermDeviation.ShortCount + voltagesTermDeviation.ShortCount) * 0.1,
            LongTermDeviation =
                (amperagesTermDeviation.LongCount + voltagesTermDeviation.LongCount) * 0.1,
            IsEnsuringCurrentAllowance = IsProvideAllowance(
                record.WeldingCurrentValues,
                weldPassageInstruction.WeldingCurrentMin,
                weldPassageInstruction.WeldingCurrentMax
            ),
            IsEnsuringVoltageAllowance = IsProvideAllowance(
                record.ArcVoltageValues,
                weldPassageInstruction.ArcVoltageMin,
                weldPassageInstruction.ArcVoltageMax
            ),
            IsEnsuringTemperatureAllowance = IsTemperatureProvideAllowance(
                preheatingTemperature,
                weldPassageInstruction.PreheatingTemperatureMin,
                weldPassageInstruction.PreheatingTemperatureMax
            )
        };

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

        for (int i = 0; i < values.Length; i++)
        {
            if (values[i] < min || values[i] > max)
            {
                countSequential++;

                if (i != values.Length - 1)
                    continue;
            }

            if (countSequential > 10)
            {
                result.LongCount += countSequential;
            }

            if (countSequential != 0 && countSequential <= 10)
            {
                result.ShortCount += countSequential;
            }

            countSequential = 0;
        }

        return result;
    }
}
