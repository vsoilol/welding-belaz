
using Belaz.WeldingApp.WeldingApi.DataLayer.Entities.CalendarInfo;
using Belaz.WeldingApp.WeldingApi.Domain.Contracts.Responses;

namespace Belaz.WeldingApp.WeldingApi.DataLayer.Repositories.Interfaces;

public interface ICalendarRepository
{
    Task<CalendarDto?> GetByIdAsync(Guid id);
    
    Task<IQueryable<Calendar>> AddAsync(Guid id);
    
    Task<IQueryable<Calendar>> UpdateAsync(Guid id);

    Task<IQueryable<Calendar>> GetMainCalendarByYearAsync(int year);

    Task<IQueryable<Calendar>> GetByWelderIdAsync(int year, Guid welderId);

    Task<IQueryable<Calendar>> GetByEquipmentIdAsync(int year, Guid weldingEquipmentId);
}