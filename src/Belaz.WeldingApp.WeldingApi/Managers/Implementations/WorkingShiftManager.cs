using AutoMapper;
using Belaz.WeldingApp.WeldingApi.Contracts.Requests.WorkingShift;
using Belaz.WeldingApp.WeldingApi.Contracts.Responses;
using Belaz.WeldingApp.WeldingApi.Managers.Interfaces;
using Belaz.WeldingApp.WeldingApi.Repositories;
using Belaz.WeldingApp.WeldingApi.Repositories.Entities.CalendarInfo;

namespace Belaz.WeldingApp.WeldingApi.Managers.Implementations;

public class WorkingShiftManager : IWorkingShiftManager
{
    private readonly IMapper _mapper;
    private readonly EntityFrameworkRepository<WorkingShift> _dayRepository;

    public WorkingShiftManager(EntityFrameworkRepository<WorkingShift> dayRepository, IMapper mapper)
    {
        _dayRepository = dayRepository;
        _mapper = mapper;
    }

    public Task<WorkingShiftDto?> CreateAsync(CreateWorkingShiftRequest request)
    {
        throw new NotImplementedException();
    }

    public Task CreateRangeAsync(List<CreateWorkingShiftRequest> values, Guid calendarId)
    {
        var workingShifts = _mapper.Map<List<WorkingShift>>(values);
        workingShifts.ForEach(_ => _.CalendarId = calendarId);

        return _dayRepository.AddRangeAsync(workingShifts);
    }
}