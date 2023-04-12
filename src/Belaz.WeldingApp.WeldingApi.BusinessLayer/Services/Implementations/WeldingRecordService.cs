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

    public WeldingRecordService(
        IWeldingRecordRepository weldingRecordRepository,
        IValidationService validationService
    )
    {
        _weldingRecordRepository = weldingRecordRepository;
        _validationService = validationService;
    }

    public async Task<Result<Unit>> DeleteAsync(DeleteWeldingRecordRequest request)
    {
        var validationResult = await _validationService.ValidateAsync(request);

        return await validationResult.ToDataResult(async () =>
        {
            await _weldingRecordRepository.DeleteAsync(request.Id);
            return Unit.Default;
        });
    }

    public Task<List<RecordDto>> GetAllAsync()
    {
        return _weldingRecordRepository.GetAllAsync();
    }
}
