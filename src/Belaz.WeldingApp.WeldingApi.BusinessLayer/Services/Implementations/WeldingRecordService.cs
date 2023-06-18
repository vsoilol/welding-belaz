using AutoMapper;
using Belaz.WeldingApp.Common.Entities.TaskInfo;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Extensions;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.WeldingRecord;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Services.Interfaces;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.Services;
using Belaz.WeldingApp.WeldingApi.DataLayer.Repositories.Interfaces;
using Belaz.WeldingApp.WeldingApi.Domain.Dtos;
using LanguageExt;
using LanguageExt.Common;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Services.Implementations;

public class WeldingRecordService : IWeldingRecordService
{
    private readonly IWeldingRecordRepository _weldingRecordRepository;
    private readonly IValidationService _validationService;
    private readonly IMapper _mapper;

    public WeldingRecordService(
        IWeldingRecordRepository weldingRecordRepository,
        IValidationService validationService, IMapper mapper)
    {
        _weldingRecordRepository = weldingRecordRepository;
        _validationService = validationService;
        _mapper = mapper;
    }

    public Task<List<RecordDto>> GetAllWithDeviationsAsync()
    {
        return _weldingRecordRepository.GetAllWithDeviationsAsync();
    }

    public async Task<Result<Unit>> DeleteAsync(DeleteWeldingRecordRequest request)
    {
        var validationResult = await _validationService.ValidateAsync(request);

        if (!validationResult.IsValid)
        {
            return new Result<Unit>(validationResult.Exception);
        }

        await _weldingRecordRepository.DeleteAsync(request.Id);
        return Unit.Default;
    }

    public async Task<Result<WeldingRecordLimitDto>> UpdateWeldingRecordLimitAsync(
        UpdateWeldingRecordLimitRequest request)
    {
        var validationResult = await _validationService.ValidateAsync(request);

        if (!validationResult.IsValid)
        {
            return new Result<WeldingRecordLimitDto>(validationResult.Exception);
        }

        var entity = _mapper.Map<WeldingRecordLimit>(request);

        var result = await _weldingRecordRepository.UpdateWeldingRecordLimitAsync(entity);
        return result;
    }

    public Task<WeldingRecordLimitDto> GetWeldingRecordLimitAsync()
    {
        return _weldingRecordRepository.GetWeldingRecordLimitAsync();
    }

    public Task<List<RecordDto>> GetAllAsync()
    {
        return _weldingRecordRepository.GetAllAsync();
    }
}