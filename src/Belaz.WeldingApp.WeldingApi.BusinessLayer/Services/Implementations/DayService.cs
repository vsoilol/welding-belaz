using AutoMapper;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Extensions;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.Day;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Services.Interfaces;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.Services;
using Belaz.WeldingApp.WeldingApi.DataLayer.Repositories.Interfaces;
using Belaz.WeldingApp.WeldingApi.Domain.Dtos;
using Belaz.WeldingApp.Common.Entities.CalendarInfo;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests;
using Belaz.WeldingApp.WeldingApi.Domain.Models;
using LanguageExt.Common;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Services.Implementations;

public class DayService : IDayService
{
    private readonly IValidationService _validationService;
    private readonly IMapper _mapper;
    private readonly IDayRepository _dayRepository;
    private readonly IWelderRepository _welderRepository;
    private readonly IWeldingEquipmentRepository _weldingEquipmentRepository;

    public DayService(
        IValidationService validationService,
        IMapper mapper,
        IDayRepository dayRepository, IWeldingEquipmentRepository weldingEquipmentRepository,
        IWelderRepository welderRepository)
    {
        _validationService = validationService;
        _mapper = mapper;
        _dayRepository = dayRepository;
        _weldingEquipmentRepository = weldingEquipmentRepository;
        _welderRepository = welderRepository;
    }

    public async Task<BaseResultRequest<DayDto>> CreateAsync(CreateDayWithYearRequest request)
    {
        var validationResult = await _validationService.ValidateAsync(request);

        if (!validationResult.IsValid)
        {
            var result = new Result<DayDto>(validationResult.Exception);
            return new BaseResultRequest<DayDto>(result);
        }

        var day = _mapper.Map<Day>(request);

        var data = await _dayRepository.CreateAsync(
            day,
            request.Year,
            request.WeldingEquipmentId,
            request.WelderId
        );

        var message = $"Создание дня на {data.Number}.{data.MonthNumber}.{data.Year}";
        return new BaseResultRequest<DayDto>(data, message);
    }

    public async Task<BaseRequest<List<DayDto>>> GetAllMainAsync()
    {
        var data = await _dayRepository.GetAllMainAsync();
        var message = $"Получение всех дней";

        return new BaseRequest<List<DayDto>>(data, message);
    }

    public async Task<BaseResultRequest<List<DayDto>>> GetAllByWelderIdAsync(GetDaysByWelderIdRequest request)
    {
        var validationResult = await _validationService.ValidateAsync(request);

        if (!validationResult.IsValid)
        {
            var result = new Result<List<DayDto>>(validationResult.Exception);
            return new BaseResultRequest<List<DayDto>>(result);
        }

        var data = await _dayRepository.GetAllByWelderIdAsync(request.WelderId);
        var welder = await _welderRepository.GetUserFullNameByIdAsync(request.WelderId);

        var message = $"Получение всех дней для сварщика {welder.MiddleName} {welder.FirstName} {welder.LastName}";
        return new BaseResultRequest<List<DayDto>>(data, message);
    }

    public async Task<BaseResultRequest<List<DayDto>>> GetAllByEquipmentIdAsync(
        GetDaysByEquipmentIdRequest request
    )
    {
        var validationResult = await _validationService.ValidateAsync(request);

        if (!validationResult.IsValid)
        {
            var result = new Result<List<DayDto>>(validationResult.Exception);
            return new BaseResultRequest<List<DayDto>>(result);
        }

        var data = await _dayRepository.GetAllByEquipmentIdAsync(request.EquipmentId);
        var equipment = await _weldingEquipmentRepository.GetBriefInfoByIdAsync(request.EquipmentId);

        var message = $"Получение всех дней для сварочного оборудования {equipment.FactoryNumber}";
        return new BaseResultRequest<List<DayDto>>(data, message);
    }

    public async Task<BaseResultRequest<DayDto>> UpdateAsync(UpdateDayRequest request)
    {
        var validationResult = await _validationService.ValidateAsync(request);

        if (!validationResult.IsValid)
        {
            var result = new Result<DayDto>(validationResult.Exception);
            return new BaseResultRequest<DayDto>(result);
        }

        var day = _mapper.Map<Day>(request);

        var data = await _dayRepository.UpdateAsync(day);
        var message = $"Обновление информации о дне {data.Number}.{data.MonthNumber}.{data.Year}";

        return new BaseResultRequest<DayDto>(data, message);
    }
}