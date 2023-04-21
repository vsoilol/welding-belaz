using AutoMapper;
using Belaz.WeldingApp.FileApi.DataLayer.Repositories.Interfaces;
using Belaz.WeldingApp.FileApi.Domain.Dtos;
using Belaz.WeldingApp.Common.Entities.ProductInfo;
using Microsoft.EntityFrameworkCore;
using Belaz.WeldingApp.Common.Enums;

namespace Belaz.WeldingApp.FileApi.DataLayer.Repositories.Implementations;

public class SeamAccountRepository : ISeamAccountRepository
{
    private readonly ApplicationContext _context;
    private readonly IMapper _mapper;

    public SeamAccountRepository(ApplicationContext context, IMapper mapper)
    {
        _context = context;
        _mapper = mapper;
    }

    public async Task<SeamAmountDto?> GetSeamAmountByWorkshopAndDatePeriodAsync(
        Guid workshopId,
        DateTime startDate,
        DateTime endDate
    )
    {
        var query = QuerySeamAccountsWithFilters(startDate, endDate);

        query = query.Where(_ => _.Seam.ProductionArea!.WorkshopId == workshopId);

        if (!(await query.AnyAsync()))
        {
            return null;
        }

        var result = await GetSeamAmountFromSeamAccounts(query);

        return result;
    }

    public async Task<SeamAmountDto?> GetSeamAmountByWelderAndDatePeriodAsync(
        Guid welderId,
        DateTime startDate,
        DateTime endDate
    )
    {
        var query = QuerySeamAccountsWithFilters(startDate, endDate);

        query = query.Where(_ => _.WeldingTasks.Any(wt => wt.WelderId == welderId));

        if (!(await query.AnyAsync()))
        {
            return null;
        }

        var result = await GetSeamAmountFromSeamAccounts(query, false);

        return result;
    }

    public async Task<SeamAmountDto?> GetSeamAmountByWorkplaceAndDatePeriodAsync(
        Guid workplaceId,
        DateTime startDate,
        DateTime endDate
    )
    {
        var query = QuerySeamAccountsWithFilters(startDate, endDate);

        query = query.Where(
            _ =>
                _.WeldingTasks.Any(
                    wt =>
                        wt.WeldPassages.Any(
                            wp =>
                                wp.WeldingRecord.WeldingEquipment.Workplaces.Any(
                                    workplace => workplace.Id == workplaceId
                                )
                        )
                )
        );

        if (!(await query.AnyAsync()))
        {
            return null;
        }

        var result = await GetSeamAmountFromSeamAccounts(query, false);

        return result;
    }

    public async Task<SeamAmountDto?> GetSeamAmountByProductionAreaAndDatePeriodAsync(
        Guid productionAreaId,
        DateTime startDate,
        DateTime endDate
    )
    {
        var query = QuerySeamAccountsWithFilters(startDate, endDate);

        query = query.Where(_ => _.Seam.ProductionAreaId == productionAreaId);

        if (!(await query.AnyAsync()))
        {
            return null;
        }

        var result = await GetSeamAmountFromSeamAccounts(query);

        return result;
    }

    private IQueryable<SeamAccount> QuerySeamAccountsWithFilters(
        DateTime startDate,
        DateTime endDate
    )
    {
        var query = _context.SeamAccounts.Where(
            _ =>
                _.WeldingTasks.Any(
                    weldingTask =>
                        weldingTask.WeldingDate.Date <= endDate.Date
                        && weldingTask.WeldingDate.Date >= startDate.Date
                )
        );

        return query;
    }

    private async Task<SeamAmountDto> GetSeamAmountFromSeamAccounts(
        IQueryable<SeamAccount> seamAccounts,
        bool hasAddedManually = true
    )
    {
        var numControlledRegistrar = await GetNumControlledRegistrarSeamsAsync(seamAccounts);
        var numManufacturedSeams = await GetNumManufacturedSeamsAsync(seamAccounts);

        var numAddedManually = GetNumAddedManuallySeams(
            numManufacturedSeams,
            numControlledRegistrar
        );

        var numDeviantWelding = await GetNumDeviantWeldingSeamsAsync(seamAccounts);

        var allRejectedSeams = await GetAllRejectedSeamsSeamsCountAsync(seamAccounts);

        var numRejectedRegistrar = GetNumRejectedRegistrarSeams(
            allRejectedSeams,
            numAddedManually,
            numControlledRegistrar
        );

        var numRejectedManually = allRejectedSeams - numRejectedRegistrar;

        return new SeamAmountDto
        {
            NumControlledRegistrar = numControlledRegistrar,
            NumAddedManually = hasAddedManually ? numAddedManually : 0,
            NumDeviantWelding = numDeviantWelding,
            NumRejectedRegistrar = numRejectedRegistrar,
            NumRejectedManually = hasAddedManually ? numRejectedManually : 0
        };
    }

    private Task<int> GetNumControlledRegistrarSeamsAsync(IQueryable<SeamAccount> seamAccounts)
    {
        var numControlledRegistrar = seamAccounts.SumAsync(
            _ =>
                _.WeldingTasks.Sum(
                    weldingTask => weldingTask.WeldPassages.Count(_ => _.Number == 1)
                )
        );

        return numControlledRegistrar;
    }

    private Task<int> GetNumManufacturedSeamsAsync(IQueryable<SeamAccount> seamAccounts)
    {
        var numManufacturedSeams = seamAccounts.SumAsync(
            _ =>
                _.SeamResults
                    .FirstOrDefault(
                        seamResult => seamResult.Status == ResultProductStatus.Manufactured
                    )!
                    .Amount
        );

        return numManufacturedSeams;
    }

    private int GetNumAddedManuallySeams(int numManufacturedSeams, int numControlledRegistrar)
    {
        var numAddedManually =
            numManufacturedSeams < numControlledRegistrar
                ? 0
                : numManufacturedSeams - numControlledRegistrar;

        return numAddedManually;
    }

    private async Task<int> GetNumDeviantWeldingSeamsAsync(IQueryable<SeamAccount> seamAccounts)
    {
        var deviantWeldPassages = await seamAccounts
            .SelectMany(_ => _.WeldingTasks)
            .Where(
                _ =>
                    _.WeldPassages.Any(
                        _ =>
                            (
                                _.IsEnsuringCurrentAllowance != null
                                && !(bool)_.IsEnsuringCurrentAllowance
                            )
                            || (
                                _.IsEnsuringTemperatureAllowance != null
                                && !(bool)_.IsEnsuringTemperatureAllowance
                            )
                            || (
                                _.IsEnsuringVoltageAllowance != null
                                && !(bool)_.IsEnsuringVoltageAllowance
                            )
                    )
            )
            .SelectMany(_ => _.WeldPassages)
            .ToListAsync();

        var numDeviantWelding = deviantWeldPassages.GroupBy(_ => _.Number).Max(_ => _.Count());

        return numDeviantWelding;
    }

    private Task<int> GetAllRejectedSeamsSeamsCountAsync(IQueryable<SeamAccount> seamAccounts)
    {
        var allRejectedSeams = seamAccounts.SumAsync(
            _ =>
                _.SeamResults
                    .FirstOrDefault(
                        seamResult => seamResult.Status == ResultProductStatus.Defective
                    )!
                    .Amount
        );

        return allRejectedSeams;
    }

    private int GetNumRejectedRegistrarSeams(
        int allRejectedSeams,
        int numAddedManually,
        int numControlledRegistrar
    )
    {
        var numAddedManuallyPercent =
            (double)numAddedManually / (numAddedManually + numControlledRegistrar);

        var numControlledRegistrarPercent =
            (double)numControlledRegistrar / (numAddedManually + numControlledRegistrar);

        var numRejectedRegistrar = (int)
            Math.Round(numControlledRegistrarPercent * allRejectedSeams);

        return numRejectedRegistrar;
    }
}
