using AutoMapper;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Extensions;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.Seam;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Services.Interfaces;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.Services;
using Belaz.WeldingApp.WeldingApi.DataLayer.Repositories.Interfaces;
using Belaz.WeldingApp.WeldingApi.Domain.Dtos.Seam;
using Belaz.WeldingApp.WeldingApi.Domain.Entities.ProductInfo;
using LanguageExt;
using LanguageExt.Common;
using WeldingApp.Common.Enums;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Services.Implementations;

public class SeamService : ISeamService
{
    private readonly IValidationService _validationService;
    private readonly IMapper _mapper;
    private readonly ISeamRepository _seamRepository;

    public SeamService(IValidationService validationService, IMapper mapper, ISeamRepository seamRepository)
    {
        _validationService = validationService;
        _mapper = mapper;
        _seamRepository = seamRepository;
    }

    public Task<List<SeamDto>> GetAllAsync()
    {
        return _seamRepository.GetAllAsync();
    }

    public Task<List<SeamDto>> GetAllByStatusAsync(ProductStatus status)
    {
        return _seamRepository.GetAllByStatusAsync(status);
    }

    public async Task<Result<SeamDto>> GetByIdAsync(GetSeamByIdRequest request)
    {
        var validationResult = await _validationService.ValidateAsync(request);

        return await validationResult.ToDataResult(() =>
            _seamRepository.GetByIdAsync(request.Id));
    }

    public Task<List<SeamDto>> GetAllByControlSubjectAsync(bool isControlSubject)
    {
        return _seamRepository.GetAllByControlSubjectAsync(isControlSubject);
    }

    public async Task<Result<SeamDto>> CreateAsync(CreateSeamRequest request)
    {
        var validationResult = await _validationService.ValidateAsync(request);

        return await validationResult.ToDataResult(() =>
        {
            var seam = _mapper.Map<Seam>(request);

            return _seamRepository.CreateAsync(seam);
        });
    }

    public async Task<Result<SeamDto>> UpdateAsync(UpdateSeamRequest request)
    {
        var validationResult = await _validationService.ValidateAsync(request);

        return await validationResult.ToDataResult(() =>
        {
            var seam = _mapper.Map<Seam>(request);

            return _seamRepository.UpdateAsync(seam);
        });
    }

    public async Task<Result<List<SeamDto>>> GetAllByInspectorIdAsync(GetAllByInspectorIdRequest request)
    {
        var validationResult = await _validationService.ValidateAsync(request);

        return await validationResult.ToDataResult(() =>
            _seamRepository.GetAllByInspectorIdAsync(request.InspectorId));
    }

    public async Task<Result<List<SeamDto>>> GetAllByWelderIdAsync(GetAllByWelderIdRequest request)
    {
        var validationResult = await _validationService.ValidateAsync(request);

        return await validationResult.ToDataResult(() =>
            _seamRepository.GetAllByWelderIdAsync(request.WelderId));
    }

    public async Task<Result<Unit>> AssignSeamToWelderAsync(AssignSeamToWelderRequest request)
    {
        var validationResult = await _validationService.ValidateAsync(request);

        return await validationResult.ToDataResult(async () =>
        {
            await _seamRepository.AssignSeamToWelderAsync(request.SeamId, request.WelderId);
            return Unit.Default;
        });
    }

    public async Task<Result<Unit>> AssignSeamToInspectorAsync(AssignSeamToInspectorRequest request)
    {
        var validationResult = await _validationService.ValidateAsync(request);

        return await validationResult.ToDataResult(async () =>
        {
            await _seamRepository.AssignSeamToInspectorAsync(request.SeamId, request.InspectorId);
            return Unit.Default;
        });
    }

    public async Task<Result<Unit>> AssignSeamsToWelderAsync(AssignSeamsToWelderRequest request)
    {
        var validationResult = await _validationService.ValidateAsync(request);

        return await validationResult.ToDataResult(async () =>
        {
            await _seamRepository.AssignSeamsToWelderAsync(request.SeamIds, request.WelderId);
            return Unit.Default;
        });
    }

    public async Task<Result<Unit>> AssignSeamsToInspectorAsync(AssignSeamsToInspectorRequest request)
    {
        var validationResult = await _validationService.ValidateAsync(request);

        return await validationResult.ToDataResult(async () =>
        {
            await _seamRepository.AssignSeamsToInspectorAsync(request.SeamIds, request.InspectorId);
            return Unit.Default;
        });
    }

    public Task<List<DefectiveSeamDto>> GetAllDefectiveSeamsAsync()
    {
        return _seamRepository.GetAllDefectiveSeamsAsync();
    }

    public async Task<Result<DefectiveSeamDto>> AddDefectiveReasonToSeamAsync(AddDefectiveReasonToSeamRequest request)
    {
        var validationResult = await _validationService.ValidateAsync(request);

        return await validationResult.ToDataResult(() =>
        {
            var statusReason = _mapper.Map<StatusReason>(request);

            return _seamRepository.AddDefectiveReasonToSeamAsync(statusReason);
        });
    }

    public async Task<Result<DefectiveSeamDto>> UpdateDefectiveReasonSeamAsync(
        UpdateDefectiveReasonToSeamRequest request)
    {
        var validationResult = await _validationService.ValidateAsync(request);

        return await validationResult.ToDataResult(() =>
        {
            var statusReason = _mapper.Map<StatusReason>(request);

            return _seamRepository.UpdateDefectiveReasonSeamAsync(statusReason);
        });
    }

    public async Task<Result<SeamDto>> ChangeStatusAsync(ChangeSeamStatusRequest request)
    {
        var validationResult = await _validationService.ValidateAsync(request);

        return await validationResult.ToDataResult(() =>
            _seamRepository.ChangeStatusAsync(request.Id, request.Status, request.IsAddManually));
    }
}