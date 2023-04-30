using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Extensions;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.SeamAccount;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Services.Interfaces;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.Services;
using Belaz.WeldingApp.WeldingApi.DataLayer.Repositories.Interfaces;
using Belaz.WeldingApp.WeldingApi.Domain.Dtos;
using LanguageExt.Common;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Services.Implementations;

public class SeamAccountService : ISeamAccountService
{
    private readonly IValidationService _validationService;

    private readonly ISeamAccountRepository _seamAccountRepository;

    public SeamAccountService(
        IValidationService validationService,
        ISeamAccountRepository seamAccountRepository
    )
    {
        _validationService = validationService;
        _seamAccountRepository = seamAccountRepository;
    }

    public async Task<Result<SeamAccountDto>> ChangeDefectiveAmountAsync(
        ChangeSeamAccountDefectiveAmountRequest request
    )
    {
        var validationResult = await _validationService.ValidateAsync(request);

        if (!validationResult.IsValid)
        {
            return new Result<SeamAccountDto>(validationResult.Exception);
        }

        return await _seamAccountRepository.ChangeDefectiveAmountAsync(
            request.SeamAccountId,
            request.Amount
        );
    }

    public async Task<Result<List<SeamAccountDto>>> GetAllByProductAccountIdAsync(
        GetAllByProductAccountIdRequest request
    )
    {
        var validationResult = await _validationService.ValidateAsync(request);

        if (!validationResult.IsValid)
        {
            return new Result<List<SeamAccountDto>>(validationResult.Exception);
        }

        return await _seamAccountRepository.GetAllByProductAccountIdAsync(request.ProductAccountId);
    }

    public async Task<Result<SeamAccountDto>> SetSeamAccountDefectiveReasonAsync(
        SetSeamAccountDefectiveReasonRequest request
    )
    {
        var validationResult = await _validationService.ValidateAsync(request);

        if (!validationResult.IsValid)
        {
            return new Result<SeamAccountDto>(validationResult.Exception);
        }

        return await _seamAccountRepository.SetSeamAccountDefectiveReasonAsync(
            request.SeamAccountId,
            request.DefectiveReason
        );
    }
}
