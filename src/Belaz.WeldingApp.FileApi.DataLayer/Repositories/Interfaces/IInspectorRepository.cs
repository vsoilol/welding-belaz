using Belaz.WeldingApp.Common.Entities.Users;
using Belaz.WeldingApp.FileApi.Domain.Dtos;

namespace Belaz.WeldingApp.FileApi.DataLayer.Repositories.Interfaces;

public interface IInspectorRepository
{
    Task<InspectorBriefDto?> GetByServiceNumberOrDefaultAsync(string serviceNumber);
    
    Task AddAsync(Inspector inspector);
    
    Task UpdateAsync(Inspector inspector);
}