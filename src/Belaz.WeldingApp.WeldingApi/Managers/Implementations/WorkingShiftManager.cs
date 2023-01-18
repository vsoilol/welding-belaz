using AutoMapper;
using AutoMapper.QueryableExtensions;
using Belaz.WeldingApp.WeldingApi.Contracts.Requests.WorkingShift;
using Belaz.WeldingApp.WeldingApi.Contracts.Responses;
using Belaz.WeldingApp.WeldingApi.Exceptions;
using Belaz.WeldingApp.WeldingApi.Managers.Interfaces;
using Belaz.WeldingApp.WeldingApi.Repositories;
using Belaz.WeldingApp.WeldingApi.Repositories.Entities.CalendarInfo;
using Microsoft.EntityFrameworkCore;

namespace Belaz.WeldingApp.WeldingApi.Managers.Implementations;

public class WorkingShiftManager : IWorkingShiftManager
{
    private readonly IMapper _mapper;
    private readonly EntityFrameworkRepository<WorkingShift> _workingShiftRepository;

    public WorkingShiftManager(EntityFrameworkRepository<WorkingShift> workingShiftRepository, IMapper mapper)
    {
        _workingShiftRepository = workingShiftRepository;
        _mapper = mapper;
    }

    public async Task<WorkingShiftDto?> CreateAsync(CreateWorkingShiftWithIdRequest request)
    {
        var workingShift = _mapper.Map<WorkingShift>(request);
        
        var createdWorkingShift = _workingShiftRepository.Add(workingShift);
        await _workingShiftRepository.SaveAsync();

        return await _workingShiftRepository
            .AsQueryable()
            .Where(_ => _.Id == createdWorkingShift.Id)
            .ProjectTo<WorkingShiftDto>(_mapper.ConfigurationProvider)
            .FirstOrDefaultAsync();
    }

    public async Task<WorkingShiftDto?> UpdateAsync(UpdateWorkingShiftRequest request)
    {
        var workingShift = _mapper.Map<WorkingShift>(request);
        
        var isUpdate = await _workingShiftRepository.UpdateAsync(workingShift);

        if (!isUpdate)
        {
            throw new UpdateFailedException(typeof(WorkingShift), request.Id);
        }
        
        return await _workingShiftRepository
            .GetByIdAsQueryable(request.Id)
            .ProjectTo<WorkingShiftDto>(_mapper.ConfigurationProvider)
            .FirstOrDefaultAsync();
    }

    public Task CreateRangeAsync(List<CreateWorkingShiftRequest> values, Guid calendarId)
    {
        var workingShifts = _mapper.Map<List<WorkingShift>>(values);
        workingShifts.ForEach(_ => _.CalendarId = calendarId);

        return _workingShiftRepository.AddRangeAsync(workingShifts);
    }
}