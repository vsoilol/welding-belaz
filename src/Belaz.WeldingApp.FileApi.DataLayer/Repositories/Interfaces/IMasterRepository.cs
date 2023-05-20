using Belaz.WeldingApp.Common.Entities.Users;
using Belaz.WeldingApp.FileApi.Domain.Dtos;

namespace Belaz.WeldingApp.FileApi.DataLayer.Repositories.Interfaces;

public interface IMasterRepository
{
    Task<MasterBriefDto?> GetByServiceNumberOrDefaultAsync(string serviceNumber);
    
    Task AddAsync(Master master);
    
    Task UpdateAsync(Master master);
}