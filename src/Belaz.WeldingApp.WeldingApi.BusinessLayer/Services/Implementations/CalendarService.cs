using AutoMapper;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Extensions;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.Calendar;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Services.Interfaces;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.Services;
using Belaz.WeldingApp.WeldingApi.DataLayer.Repositories.Interfaces;
using Belaz.WeldingApp.WeldingApi.Domain.Dtos;
using Belaz.WeldingApp.WeldingApi.Domain.Entities.CalendarInfo;
using LanguageExt.Common;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Services.Implementations;

public class CalendarService : ICalendarService
{
    private readonly IValidationService _validationService;
    private readonly IMapper _mapper;
    private readonly ICalendarRepository _calendarRepository;

    public CalendarService(IValidationService validationService, IMapper mapper, ICalendarRepository calendarRepository)
    {
        _validationService = validationService;
        _mapper = mapper;
        _calendarRepository = calendarRepository;
    }

    public async Task<Result<CalendarDto>> CreateAsync(CreateCalendarRequest request, bool isMain)
    {
        var validationResult = await _validationService.ValidateAsync(request);

        return await validationResult.ToDataResult(() =>
        {
            var calendar = _mapper.Map<Calendar>(request);
            calendar.IsMain = isMain;

            var days = _mapper.Map<List<Day>>(request.Days);
            var workingShifts = _mapper.Map<List<WorkingShift>>(request.MainWorkingShift);

            return _calendarRepository.CreateAsync(calendar, days, workingShifts);
        });
    }

    public async Task<Result<CalendarDto>> CreateForEquipmentAsync(CreateCalendarWithEquipmentIdRequest request)
    {
        var validationResult = await _validationService.ValidateAsync(request);

        return await validationResult.ToDataResult(() =>
        {
            var calendar = _mapper.Map<Calendar>(request);
            calendar.IsMain = false;

            var days = _mapper.Map<List<Day>>(request.Days);
            var workingShifts = _mapper.Map<List<WorkingShift>>(request.MainWorkingShift);

            return _calendarRepository.CreateAsync(calendar, days, workingShifts);
        });
    }

    public async Task<Result<CalendarDto>> CreateForWelderAsync(CreateCalendarWithWelderIdRequest request)
    {
        var validationResult = await _validationService.ValidateAsync(request);

        return await validationResult.ToDataResult(() =>
        {
            var calendar = _mapper.Map<Calendar>(request);
            calendar.IsMain = false;

            var days = _mapper.Map<List<Day>>(request.Days);
            var workingShifts = _mapper.Map<List<WorkingShift>>(request.MainWorkingShift);

            return _calendarRepository.CreateAsync(calendar, days, workingShifts);
        });
    }

    public async Task<Result<CalendarDto>> UpdateAsync(UpdateCalendarRequest request)
    {
        var validationResult = await _validationService.ValidateAsync(request);

        return await validationResult.ToDataResult(() =>
        {
            var calendar = _mapper.Map<Calendar>(request);

            return _calendarRepository.UpdateAsync(calendar);
        });
    }

    public async Task<Result<CalendarDto?>> GetMainCalendarByYearAsync(GetMainCalendarByYearRequest request)
    {
        var validationResult = await _validationService.ValidateAsync(request);

        return await validationResult.ToDataResult(() =>
            _calendarRepository.GetMainCalendarByYearAsync(request.Year));
    }

    public async Task<Result<CalendarDto?>> GetByWelderIdAndYearAsync(GetByWelderIdRequest request)
    {
        var validationResult = await _validationService.ValidateAsync(request);

        return await validationResult.ToDataResult(() =>
            _calendarRepository.GetByWelderIdAndYearAsync(request.WelderId, request.Year));
    }

    public async Task<Result<CalendarDto?>> GetByEquipmentIdAndYearAsync(GetByEquipmentIdRequest request)
    {
        var validationResult = await _validationService.ValidateAsync(request);

        return await validationResult.ToDataResult(() =>
            _calendarRepository.GetByEquipmentIdAndYearAsync(request.WeldingEquipmentId, request.Year));
    }
}