using AutoMapper;
using Belaz.WeldingApp.RegistarApi.BusinessLayer.Extensions;
using Belaz.WeldingApp.RegistarApi.BusinessLayer.Requests;
using Belaz.WeldingApp.RegistarApi.BusinessLayer.Responses;
using Belaz.WeldingApp.RegistarApi.BusinessLayer.Services.Interfaces;
using Belaz.WeldingApp.RegistarApi.BusinessLayer.Validations.Services;
using Belaz.WeldingApp.RegistarApi.DataLayer.Repositories.Interfaces;
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

    public RegistarService(IValidationService validationService, IMapper mapper,
        IWeldingEquipmentRepository weldingEquipmentRepository, IWelderRepository welderRepository,
        IRecordRepository recordRepository, IMasterRepository masterRepository)
    {
        _validationService = validationService;
        _mapper = mapper;
        _weldingEquipmentRepository = weldingEquipmentRepository;
        _welderRepository = welderRepository;
        _recordRepository = recordRepository;
        _masterRepository = masterRepository;
    }

    public async Task<Result<WelderWithEquipmentResponse>> GetWelderWithEquipmentAsync(
        GetWelderWithEquipmentRequest request)
    {
        var validationResult = await _validationService.ValidateAsync(request);

        return await validationResult.ToDataResult(async () =>
        {
            var weldingEquipment = await _weldingEquipmentRepository.GetByRfidTagAsync(request.EquipmentRfidTag);

            var weldingEquipmentConditionTime = new WeldingEquipmentConditionTime
            {
                Condition = Condition.On,
                Time = 60,
                Date = request.StartDateTime.Date,
                StartConditionTime = request.StartDateTime.TimeOfDay,
                WeldingEquipmentId = weldingEquipment.Id
            };

            await _weldingEquipmentRepository
                .AddWeldingEquipmentConditionTimeAsync(weldingEquipmentConditionTime);

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

            weldingRecord.MasterId = await _masterRepository.GetMasterIdByWelderIdAsync(request.WelderId);
            
            var seconds = (int)Math.Round(0.1 * request.Voltages.Length);
            var weldingEndTime = weldingRecord.WeldingStartTime.Add(TimeSpan.FromSeconds(seconds));

            weldingRecord.WeldingEndTime = weldingEndTime;
            
            var weldingEquipmentConditionTime = new WeldingEquipmentConditionTime
            {
                Condition = Condition.AtWork,
                Time = seconds,
                Date = request.StartDateTime.Date,
                StartConditionTime = request.StartDateTime.TimeOfDay,
                WeldingEquipmentId = request.WeldingEquipmentId
            };
            
            await _weldingEquipmentRepository
                .AddWeldingEquipmentConditionTimeAsync(weldingEquipmentConditionTime);

            await _recordRepository.CreateRecordWithoutTaskAsync(weldingRecord);
            
            return Unit.Default;
        });
    }
}