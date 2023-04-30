using AutoMapper;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Extensions;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.Calendar;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Services.Interfaces;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.Services;
using Belaz.WeldingApp.WeldingApi.DataLayer.Repositories.Interfaces;
using Belaz.WeldingApp.WeldingApi.Domain.Dtos;
using Belaz.WeldingApp.Common.Entities.CalendarInfo;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests;
using LanguageExt.Common;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Services.Implementations;

public class CalendarService : ICalendarService
{
    private readonly IValidationService _validationService;
    private readonly IMapper _mapper;
    private readonly ICalendarRepository _calendarRepository;
    private readonly IWeldingEquipmentRepository _weldingEquipmentRepository;
    private readonly IWelderRepository _welderRepository;

    public CalendarService(IValidationService validationService, IMapper mapper,
        ICalendarRepository calendarRepository,
        IWelderRepository welderRepository,
        IWeldingEquipmentRepository weldingEquipmentRepository)
    {
        _validationService = validationService;
        _mapper = mapper;
        _calendarRepository = calendarRepository;
        _welderRepository = welderRepository;
        _weldingEquipmentRepository = weldingEquipmentRepository;
    }

    public async Task<BaseResultRequest<CalendarDto>> CreateAsync(CreateCalendarRequest request, bool isMain)
    {
        var validationResult = await _validationService.ValidateAsync(request);

        if (!validationResult.IsValid)
        {
            var result = new Result<CalendarDto>(validationResult.Exception);
            return new BaseResultRequest<CalendarDto>(result);
        }

        var calendar = _mapper.Map<Calendar>(request);
        calendar.IsMain = isMain;

        var days = _mapper.Map<List<Day>>(request.Days);
        var workingShifts = _mapper.Map<List<WorkingShift>>(request.MainWorkingShift);

        var data = await _calendarRepository.CreateAsync(calendar, days, workingShifts);
        var message = $"Создание производственного календаря на {data.Year}.";

        return new BaseResultRequest<CalendarDto>(data, message);
    }

    public async Task<BaseResultRequest<CalendarDto>> CreateForEquipmentAsync(
        CreateCalendarWithEquipmentIdRequest request)
    {
        var validationResult = await _validationService.ValidateAsync(request);

        if (!validationResult.IsValid)
        {
            var result = new Result<CalendarDto>(validationResult.Exception);
            return new BaseResultRequest<CalendarDto>(result);
        }

        var calendar = _mapper.Map<Calendar>(request);
        calendar.IsMain = false;

        var days = _mapper.Map<List<Day>>(request.Days);
        var workingShifts = _mapper.Map<List<WorkingShift>>(request.MainWorkingShift);

        var data = await _calendarRepository.CreateAsync(calendar, days, workingShifts);

        var equipment = await _weldingEquipmentRepository.GetBriefInfoByIdAsync(request.WeldingEquipmentId);
        var message =
            $"Создание производственного календаря для " +
            $"сварочного оборудования {equipment.FactoryNumber} на {data.Year}.";

        return new BaseResultRequest<CalendarDto>(data, message);
    }

    public async Task<BaseResultRequest<CalendarDto>> CreateForWelderAsync(CreateCalendarWithWelderIdRequest request)
    {
        var validationResult = await _validationService.ValidateAsync(request);

        if (!validationResult.IsValid)
        {
            var result = new Result<CalendarDto>(validationResult.Exception);
            return new BaseResultRequest<CalendarDto>(result);
        }

        var calendar = _mapper.Map<Calendar>(request);
        calendar.IsMain = false;

        var days = _mapper.Map<List<Day>>(request.Days);
        var workingShifts = _mapper.Map<List<WorkingShift>>(request.MainWorkingShift);

        var data = await _calendarRepository.CreateAsync(calendar, days, workingShifts);

        var welder = await _welderRepository.GetUserFullNameByIdAsync(request.WelderId);
        var message =
            $"Создание производственного календаря для " +
            $"сварщика {welder.MiddleName} {welder.FirstName} {welder.LastName} на {data.Year}.";

        return new BaseResultRequest<CalendarDto>(data, message);
    }

    public async Task<BaseResultRequest<CalendarDto>> UpdateAsync(UpdateCalendarRequest request)
    {
        var validationResult = await _validationService.ValidateAsync(request);

        if (!validationResult.IsValid)
        {
            var result = new Result<CalendarDto>(validationResult.Exception);
            return new BaseResultRequest<CalendarDto>(result);
        }

        var calendar = _mapper.Map<Calendar>(request);

        var data = await _calendarRepository.UpdateAsync(calendar);
        var message = $"Обновление производственного календаря на {data.Year}.";

        return new BaseResultRequest<CalendarDto>(data, message);
    }

    public async Task<BaseResultRequest<CalendarDto?>> GetMainCalendarByYearAsync(GetMainCalendarByYearRequest request)
    {
        var validationResult = await _validationService.ValidateAsync(request);

        if (!validationResult.IsValid)
        {
            var result = new Result<CalendarDto?>(validationResult.Exception);
            return new BaseResultRequest<CalendarDto?>(result);
        }

        var data = await _calendarRepository.GetMainCalendarByYearAsync(request.Year);
        var message = data is not null ? $"Получение производственного календаря на {data.Year}." : null;

        return new BaseResultRequest<CalendarDto?>(data, message);
    }

    public async Task<BaseResultRequest<CalendarDto?>> GetByWelderIdAndYearAsync(GetByWelderIdRequest request)
    {
        var validationResult = await _validationService.ValidateAsync(request);

        if (!validationResult.IsValid)
        {
            var result = new Result<CalendarDto?>(validationResult.Exception);
            return new BaseResultRequest<CalendarDto?>(result);
        }

        var data = await _calendarRepository.GetByWelderIdAndYearAsync(request.WelderId, request.Year);

        var welder = await _welderRepository.GetUserFullNameByIdAsync(request.WelderId);
        var message = data is not null
            ? $"Получение производственного календаря для " +
              $"сварщика {welder.MiddleName} {welder.FirstName} {welder.LastName} на {data.Year}."
            : null;

        return new BaseResultRequest<CalendarDto?>(data, message);
    }

    public async Task<BaseResultRequest<CalendarDto?>> GetByEquipmentIdAndYearAsync(GetByEquipmentIdRequest request)
    {
        var validationResult = await _validationService.ValidateAsync(request);

        if (!validationResult.IsValid)
        {
            var result = new Result<CalendarDto?>(validationResult.Exception);
            return new BaseResultRequest<CalendarDto?>(result);
        }

        var data = await _calendarRepository.GetByEquipmentIdAndYearAsync(request.WeldingEquipmentId, request.Year);

        var equipment = await _weldingEquipmentRepository.GetBriefInfoByIdAsync(request.WeldingEquipmentId);
        var message = data is not null
            ? $"Получение производственного календаря для " +
              $"сварочного оборудования {equipment.FactoryNumber} на {data.Year}."
            : null;

        return new BaseResultRequest<CalendarDto?>(data, message);
    }
}