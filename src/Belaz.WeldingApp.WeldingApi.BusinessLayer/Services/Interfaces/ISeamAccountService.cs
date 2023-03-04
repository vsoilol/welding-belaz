using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.SeamAccount;
using Belaz.WeldingApp.WeldingApi.Domain.Dtos;
using LanguageExt.Common;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Services.Interfaces;

public interface ISeamAccountService
{
    Task<Result<List<SeamAccountDto>>> GetAllByProductAccountIdAsync(
        GetAllByProductAccountIdRequest request
    );

    Task<Result<SeamAccountDto>> SetSeamAccountDefectiveReasonAsync(
        SetSeamAccountDefectiveReasonRequest request
    );

    Task<Result<SeamAccountDto>> ChangeDefectiveAmountAsync(
        ChangeSeamAccountDefectiveAmountRequest request
    );
}
