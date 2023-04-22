using Belaz.WeldingApp.FileApi.Domain.Dtos;

namespace Belaz.WeldingApp.FileApi.DataLayer.Repositories.Interfaces;

public interface ISeamAccountRepository
{
    Task<SeamAmountDto?> GetSeamAmountByWelderAndDatePeriodAsync(
        Guid welderId,
        DateTime startDate,
        DateTime endDate
    );

    Task<SeamAmountDto?> GetSeamAmountByWorkshopAndDatePeriodAsync(
        Guid workshopId,
        DateTime startDate,
        DateTime endDate
    );

    Task<SeamAmountDto?> GetSeamAmountByWorkplaceAndDatePeriodAsync(
        Guid workplaceId,
        DateTime startDate,
        DateTime endDate
    );

    Task<SeamAmountDto?> GetSeamAmountByProductionAreaAndDatePeriodAsync(
        Guid productionAreaId,
        DateTime startDate,
        DateTime endDate
    );

    Task<SeamAmountDto?> GetSeamAmountByDatePeriodAsync(DateTime startDate, DateTime endDate);
}
