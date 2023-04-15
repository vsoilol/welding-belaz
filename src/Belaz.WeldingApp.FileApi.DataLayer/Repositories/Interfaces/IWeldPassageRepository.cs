using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Belaz.WeldingApp.FileApi.Domain.Dtos.DeviationsReportInfo;
using Belaz.WeldingApp.FileApi.Domain.Dtos.SeamPassportInfo;

namespace Belaz.WeldingApp.FileApi.DataLayer.Repositories.Interfaces;

public interface IWeldPassageRepository
{
    Task<List<WeldPassageDeviationsDto>> GetAllDeviationsByWorkshopAndDatePeriodAsync(
        Guid workshopId,
        Guid productId,
        Guid? seamId,
        DateTime startDate,
        DateTime endDate
    );

    Task<List<WeldPassageDeviationsDto>> GetAllDeviationsByProductionAreaAndDatePeriodAsync(
        Guid productionAreaId,
        Guid productId,
        Guid? seamId,
        DateTime startDate,
        DateTime endDate
    );

    Task<List<WeldPassageDeviationsDto>> GetAllDeviationsByWelderAndDatePeriodAsync(
        Guid welderId,
        Guid productId,
        Guid? seamId,
        DateTime startDate,
        DateTime endDate
    );

    Task<List<WeldPassageDeviationsDto>> GetAllDeviationsByWorkplaceAndDatePeriodAsync(
        Guid workplaceId,
        Guid productId,
        Guid? seamId,
        DateTime startDate,
        DateTime endDate
    );
}
