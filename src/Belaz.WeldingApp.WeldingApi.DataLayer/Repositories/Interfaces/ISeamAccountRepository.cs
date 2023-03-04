using Belaz.WeldingApp.WeldingApi.Domain.Dtos;

namespace Belaz.WeldingApp.WeldingApi.DataLayer.Repositories.Interfaces;

public interface ISeamAccountRepository
{
    Task<List<SeamAccountDto>> GetAllByProductAccountIdAsync(Guid productAccountId);

    Task<SeamAccountDto> ChangeDefectiveAmountAsync(Guid seamAccountId, int amount);

    Task<SeamAccountDto> SetSeamAccountDefectiveReasonAsync(
        Guid seamAccountId,
        string defectiveReason
    );
}
