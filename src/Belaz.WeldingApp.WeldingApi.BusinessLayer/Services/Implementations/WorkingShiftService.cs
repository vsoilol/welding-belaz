using AutoMapper;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.WorkingShift;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Services.Interfaces;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.Services;
using Belaz.WeldingApp.WeldingApi.DataLayer.Repositories.Interfaces;
using Belaz.WeldingApp.WeldingApi.Domain.Dtos;
using Belaz.WeldingApp.WeldingApi.Domain.Entities.CalendarInfo;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Services.Implementations;

public class WorkingShiftService : IWorkingShiftService
{
    private readonly IValidationService _validationService;
    private readonly IMapper _mapper;
    private readonly IWorkingShiftRepository _workingShiftRepository;

    public WorkingShiftService(IValidationService validationService, IMapper mapper,
        IWorkingShiftRepository workingShiftRepository)
    {
        _validationService = validationService;
        _mapper = mapper;
        _workingShiftRepository = workingShiftRepository;
    }

    public async Task<WorkingShiftDto> CreateAsync(CreateWorkingShiftWithYearRequest request)
    {
        await _validationService.ValidateAsync(request);

        var workingShift = _mapper.Map<WorkingShift>(request);

        return await _workingShiftRepository.CreateAsync(workingShift);
    }

    public async Task<WorkingShiftDto> UpdateAsync(UpdateWorkingShiftRequest request)
    {
        await _validationService.ValidateAsync(request);

        var workingShift = _mapper.Map<WorkingShift>(request);

        return await _workingShiftRepository.UpdateAsync(workingShift);
    }

    public Task CreateRangeAsync(List<CreateWorkingShiftRequest> values, Guid calendarId)
    {
        var workingShifts = _mapper.Map<List<WorkingShift>>(values);
        workingShifts.ForEach(_ => _.CalendarId = calendarId);

        return _workingShiftRepository.AddRangeAsync(workingShifts);
    }
}