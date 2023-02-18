using AutoMapper;
using Belaz.WeldingApp.RegistarApi.BusinessLayer.Extensions;
using Belaz.WeldingApp.RegistarApi.BusinessLayer.Requests;
using Belaz.WeldingApp.RegistarApi.BusinessLayer.Responses;
using Belaz.WeldingApp.RegistarApi.BusinessLayer.Services.Interfaces;
using Belaz.WeldingApp.RegistarApi.BusinessLayer.Validations.Services;
using Belaz.WeldingApp.RegistarApi.DataLayer.Repositories.Interfaces;
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

    public RegistarService(IValidationService validationService, IMapper mapper,
        IWeldingEquipmentRepository weldingEquipmentRepository, IWelderRepository welderRepository)
    {
        _validationService = validationService;
        _mapper = mapper;
        _weldingEquipmentRepository = weldingEquipmentRepository;
        _welderRepository = welderRepository;
    }

    public async Task<Result<WelderWithEquipmentResponse>> GetWelderWithEquipmentAsync(GetWelderWithEquipmentRequest request)
    {
        var validationResult = await _validationService.ValidateAsync(request);

        return await validationResult.ToDataResult(async () =>
        {
            var weldingEquipment = await _weldingEquipmentRepository.GetByRfidTagAsync(request.EquipmentRfidTag);

            var weldingEquipmentConditionTime = new WeldingEquipmentConditionTime
            {
                Condition = Condition.On,
                Time = 1,
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

    public Task<Result<Unit>> CreateRecordWithoutTaskAsync(RecordWithoutTaskRequest request)
    {
        throw new NotImplementedException();
    }
}