using Belaz.WeldingApp.FileApi.Domain.Dtos.CalendarInfo;

namespace Belaz.WeldingApp.FileApi.DataLayer.Repositories.Interfaces;

public interface IWorkingShiftRepository
{
    Task<List<WorkingShiftDto>> GetWorkingShiftsByDatePeriodAsync(DateTime startDate, DateTime endDate);
    
    Task<List<WorkingShiftDto>> GetWorkingShiftsByDatePeriodForWelderAsync(DateTime startDate, 
        DateTime endDate,
        Guid? welderId);
    
    Task<List<WorkingShiftDto>> GetWorkingShiftsByDatePeriodForEquipmentAsync(DateTime startDate, 
        DateTime endDate,
        Guid? weldingEquipmentId);
}