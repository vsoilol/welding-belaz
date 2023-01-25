using AutoMapper;
using AutoMapper.QueryableExtensions;
using Belaz.WeldingApp.WeldingApi.Contracts.Requests.Day;
using Belaz.WeldingApp.WeldingApi.Contracts.Responses;
using Belaz.WeldingApp.WeldingApi.Exceptions;
using Belaz.WeldingApp.WeldingApi.Managers.Interfaces;
using Belaz.WeldingApp.WeldingApi.Repositories;
using Belaz.WeldingApp.WeldingApi.Repositories.Entities.CalendarInfo;
using Microsoft.EntityFrameworkCore;

namespace Belaz.WeldingApp.WeldingApi.Managers.Implementations;

public class DayManager : IDayManager
{
    private readonly IMapper _mapper;
    private readonly EntityFrameworkRepository<Day> _dayRepository;
    private readonly EntityFrameworkRepository<Calendar> _calendarRepository;

    public DayManager(IMapper mapper, EntityFrameworkRepository<Day> dayRepository,
        EntityFrameworkRepository<Calendar> calendarRepository)
    {
        _mapper = mapper;
        _dayRepository = dayRepository;
        _calendarRepository = calendarRepository;
    }

    public async Task<DayDto?> CreateAsync(CreateDayWithYearRequest request)
    {
        var day = _mapper.Map<Day>(request);

        var calendar = (await _calendarRepository
                .GetByFilterAsync(_ => _.Year == request.Year &&
                                       _.WelderId == request.WelderId &&
                                       _.WeldingEquipmentId == request.WeldingEquipmentId))
            .FirstOrDefault();

        if (calendar is null)
        {
            var newCalendar = new Calendar
            {
                Year = request.Year,
                WelderId = request.WelderId,
                WeldingEquipmentId = request.WeldingEquipmentId,
                IsMain = (request.WelderId is null) && (request.WeldingEquipmentId is null)
            };

            calendar = _calendarRepository.Add(newCalendar);
        }

        day.CalendarId = calendar.Id;
        var createdDay = _dayRepository.Add(day);
        await _dayRepository.SaveAsync();

        return await _dayRepository
            .AsQueryable()
            .Where(_ => _.Id == createdDay.Id)
            .ProjectTo<DayDto>(_mapper.ConfigurationProvider)
            .FirstOrDefaultAsync();
    }

    public Task<List<DayDto>> GetAllMainAsync()
    {
        return _dayRepository
            .AsQueryable()
            .Where(_ => _.Calendar.IsMain)
            .ProjectTo<DayDto>(_mapper.ConfigurationProvider)
            .ToListAsync();
    }

    public Task<List<DayDto>> GetAllByWelderIdAsync(Guid welderId)
    {
        return _dayRepository
            .AsQueryable()
            .Where(_ => _.Calendar.WelderId == welderId)
            .ProjectTo<DayDto>(_mapper.ConfigurationProvider)
            .ToListAsync();
    }

    public Task<List<DayDto>> GetAllByEquipmentIdAsync(Guid equipmentId)
    {
        return _dayRepository
            .AsQueryable()
            .Where(_ => _.Calendar.WeldingEquipmentId == equipmentId)
            .ProjectTo<DayDto>(_mapper.ConfigurationProvider)
            .ToListAsync();
    }

    public async Task<DayDto?> UpdateAsync(UpdateDayRequest request)
    {
        var day = _mapper.Map<Day>(request);

        var isUpdate = await _dayRepository.UpdateAsync(day);

        if (!isUpdate)
        {
            throw new UpdateFailedException(typeof(Calendar), request.Id);
        }

        return await _dayRepository
            .AsQueryable()
            .Where(_ => _.Id == request.Id)
            .ProjectTo<DayDto>(_mapper.ConfigurationProvider)
            .FirstOrDefaultAsync();
    }

    public Task CreateRangeAsync(List<CreateDayRequest> values, Guid calendarId)
    {
        var days = _mapper.Map<List<Day>>(values);
        days.ForEach(_ => _.CalendarId = calendarId);

        return _dayRepository.AddRangeAsync(days);
    }

    public Task UpdateRangeAsync(List<UpdateDayRequest> values)
    {
        throw new NotImplementedException();
    }
}