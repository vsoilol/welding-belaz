using AutoMapper;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.Day;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Services.Interfaces;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.Services;
using Belaz.WeldingApp.WeldingApi.DataLayer.Repositories.Interfaces;
using Belaz.WeldingApp.WeldingApi.Domain.Dtos;
using Belaz.WeldingApp.WeldingApi.Domain.Entities.CalendarInfo;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Services.Implementations;

public class DayService : IDayService
{
    private readonly IValidationService _validationService;
    private readonly IMapper _mapper;
    private readonly IDayRepository _dayRepository;

    public DayService(IValidationService validationService, IMapper mapper, IDayRepository dayRepository)
    {
        _validationService = validationService;
        _mapper = mapper;
        _dayRepository = dayRepository;
    }

    public async Task<DayDto> CreateAsync(CreateDayWithYearRequest request)
    {
        await _validationService.ValidateAsync(request);

        var day = _mapper.Map<Day>(request);

        return await _dayRepository
            .CreateAsync(day, request.Year, request.WeldingEquipmentId, request.WelderId);
    }

    public Task<List<DayDto>> GetAllMainAsync()
    {
        return _dayRepository.GetAllMainAsync();
    }

    public Task<List<DayDto>> GetAllByWelderIdAsync(Guid welderId)
    {
        return _dayRepository.GetAllByWelderIdAsync(welderId);
    }

    public Task<List<DayDto>> GetAllByEquipmentIdAsync(Guid equipmentId)
    {
        return _dayRepository.GetAllByWelderIdAsync(equipmentId);
    }

    public async Task<DayDto> UpdateAsync(UpdateDayRequest request)
    {
        await _validationService.ValidateAsync(request);

        var day = _mapper.Map<Day>(request);

        return await _dayRepository.UpdateAsync(day);
    }

    public Task CreateRangeAsync(List<CreateDayRequest> values, Guid calendarId)
    {
        var days = _mapper.Map<List<Day>>(values);
        days.ForEach(_ => _.CalendarId = calendarId);

        return _dayRepository.AddRangeAsync(days);
    }
}