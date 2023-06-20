using AutoMapper;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Extensions;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.WorkingShift;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Services.Interfaces;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.Services;
using Belaz.WeldingApp.WeldingApi.DataLayer.Repositories.Interfaces;
using Belaz.WeldingApp.WeldingApi.Domain.Dtos;
using Belaz.WeldingApp.Common.Entities.CalendarInfo;
using LanguageExt.Common;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Services.Implementations;

public class WorkingShiftService : IWorkingShiftService
{
    private readonly IValidationService _validationService;
    private readonly IMapper _mapper;
    private readonly IWorkingShiftRepository _workingShiftRepository;

    public WorkingShiftService(
        IValidationService validationService,
        IMapper mapper,
        IWorkingShiftRepository workingShiftRepository
    )
    {
        _validationService = validationService;
        _mapper = mapper;
        _workingShiftRepository = workingShiftRepository;
    }

    public async Task<Result<WorkingShiftDto>> CreateAsync(
        CreateWorkingShiftWithYearRequest request
    )
    {
        var validationResult = await _validationService.ValidateAsync(request);

        if (!validationResult.IsValid)
        {
            return new Result<WorkingShiftDto>(validationResult.Exception);
        }

        var workingShift = _mapper.Map<WorkingShift>(request);

        return await _workingShiftRepository.CreateAsync(workingShift, request.Year);
    }

    public async Task<Result<WorkingShiftDto>> UpdateAsync(UpdateWorkingShiftRequest request)
    {
        var validationResult = await _validationService.ValidateAsync(request);

        if (!validationResult.IsValid)
        {
            return new Result<WorkingShiftDto>(validationResult.Exception);
        }

        var workingShift = _mapper.Map<WorkingShift>(request);

        return await _workingShiftRepository.UpdateAsync(workingShift);
    }

    public async Task<Result<List<WorkingShiftDto>>> GetAllMainWorkingShiftsByYearAsync(GetAllMainWorkingShiftsByYearRequest request)
    {
        var validationResult = await _validationService.ValidateAsync(request);

        if (!validationResult.IsValid)
        {
            return new Result<List<WorkingShiftDto>>(validationResult.Exception);
        }

        return await _workingShiftRepository.GetAllMainWorkingShiftsByYearAsync(request.Year);
    }

    public async Task<Result<List<WorkingShiftDto>>> GetAllWorkingShiftsByEquipmentIdAndYearAsync(GetAllWorkingShiftsByEquipmentIdAndYearRequest request)
    {
        var validationResult = await _validationService.ValidateAsync(request);

        if (!validationResult.IsValid)
        {
            return new Result<List<WorkingShiftDto>>(validationResult.Exception);
        }

        return await _workingShiftRepository
            .GetAllWorkingShiftsByEquipmentIdAndYearAsync(request.Year, request.EquipmentId);
    }

    public async Task<Result<List<WorkingShiftDto>>> GetAllWorkingShiftsByWelderIdAndYearAsync(GetAllWorkingShiftsByWelderIdAndYearRequest request)
    {
        var validationResult = await _validationService.ValidateAsync(request);

        if (!validationResult.IsValid)
        {
            return new Result<List<WorkingShiftDto>>(validationResult.Exception);
        }

        return await _workingShiftRepository
            .GetAllWorkingShiftsByWelderIdAndYearAsync(request.Year, request.WelderId);
    }
}
