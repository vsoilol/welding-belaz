using Belaz.WeldingApp.WeldingApi.Domain.Dtos;
using Belaz.WeldingApp.WeldingApi.Domain.Entities.CalendarInfo;

namespace Belaz.WeldingApp.WeldingApi.DataLayer.Repositories.Interfaces;

public interface ICalendarRepository
{
    Task<CalendarDto?> GetByIdAsync(Guid id);

    Task<List<CalendarDto>> GetAllAsync();

    Task<IQueryable<Calendar>> AddAsync(Guid id);

    Task<IQueryable<Calendar>> UpdateAsync(Guid id);

    Task<IQueryable<Calendar>> GetMainCalendarByYearAsync(int year);

    Task<IQueryable<Calendar>> GetByWelderIdAsync(int year, Guid welderId);

    Task<IQueryable<Calendar>> GetByEquipmentIdAsync(int year, Guid weldingEquipmentId);
}