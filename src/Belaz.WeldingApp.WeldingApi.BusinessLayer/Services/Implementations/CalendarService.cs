using AutoMapper;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.Calendar;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Services.Interfaces;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.Services;
using Belaz.WeldingApp.WeldingApi.DataLayer.Repositories.Interfaces;
using Belaz.WeldingApp.WeldingApi.Domain.Dtos;

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

    public Task<CalendarDto> CreateAsync(CreateCalendarRequest request, bool isMain)
    {
        throw new NotImplementedException();
    }

    public Task<CalendarDto> CreateForEquipmentAsync(CreateCalendarWithEquipmentIdRequest request)
    {
        throw new NotImplementedException();
    }

    public Task<CalendarDto> CreateForWelderAsync(CreateCalendarWithWelderIdRequest request)
    {
        throw new NotImplementedException();
    }

    public Task<CalendarDto> UpdateAsync(UpdateCalendarRequest request)
    {
        throw new NotImplementedException();
    }

    public Task<CalendarDto?> GetMainCalendarByYearAsync(int year)
    {
        throw new NotImplementedException();
    }

    public Task<CalendarDto?> GetByWelderIdAsync(GetByWelderIdRequest request)
    {
        throw new NotImplementedException();
    }

    public Task<CalendarDto?> GetByEquipmentIdAsync(GetByEquipmentIdRequest request)
    {
        throw new NotImplementedException();
    }
}