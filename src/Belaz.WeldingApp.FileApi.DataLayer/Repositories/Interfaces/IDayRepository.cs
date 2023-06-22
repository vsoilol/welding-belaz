using Belaz.WeldingApp.FileApi.Domain.Dtos.CalendarInfo;

namespace Belaz.WeldingApp.FileApi.DataLayer.Repositories.Interfaces;

public interface IDayRepository
{
    Task<List<DayDto>> GetAllDaysByDatePeriodAsync(DateTime startDate, DateTime endDate);

    Task<List<DayDto>> GetAllDaysByDatePeriodForWelderAsync(DateTime startDate, 
        DateTime endDate,
        Guid? welderId);
    
    Task<List<DayDto>> GetAllDaysByDatePeriodForEquipmentAsync(DateTime startDate, 
        DateTime endDate,
        Guid? weldingEquipmentId);
}