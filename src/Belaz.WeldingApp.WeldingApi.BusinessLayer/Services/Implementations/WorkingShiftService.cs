using AutoMapper;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Extensions;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.WorkingShift;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Services.Interfaces;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.Services;
using Belaz.WeldingApp.WeldingApi.DataLayer.Repositories.Interfaces;
using Belaz.WeldingApp.WeldingApi.Domain.Dtos;
using Belaz.WeldingApp.WeldingApi.Domain.Entities.CalendarInfo;
using LanguageExt.Common;

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

    public async Task<Result<WorkingShiftDto>> CreateAsync(CreateWorkingShiftWithYearRequest request)
    {
        var validationResult = await _validationService.ValidateAsync(request);

        return await validationResult.ToDataResult(() =>
        {
            var workingShift = _mapper.Map<WorkingShift>(request);

            return _workingShiftRepository.CreateAsync(workingShift);
        });
    }

    public async Task<Result<WorkingShiftDto>> UpdateAsync(UpdateWorkingShiftRequest request)
    {
        var validationResult = await _validationService.ValidateAsync(request);

        return await validationResult.ToDataResult(() =>
        {
            var workingShift = _mapper.Map<WorkingShift>(request);

            return _workingShiftRepository.UpdateAsync(workingShift);
        });
    }

    public Task CreateRangeAsync(List<CreateWorkingShiftRequest> values, Guid calendarId)
    {
        var workingShifts = _mapper.Map<List<WorkingShift>>(values);
        workingShifts.ForEach(_ => _.CalendarId = calendarId);

        return _workingShiftRepository.AddRangeAsync(workingShifts);
    }
}