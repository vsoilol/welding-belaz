using Belaz.WeldingApp.IdentityApi.Data.Repositories.Entities;

namespace Belaz.WeldingApp.IdentityApi.Data.Repositories.Interfaces
{
    public interface IRoleRepository
    {
        Task<List<RoleData>> GetAllRolesByNames(List<string> names);

        Task<RoleData?> GetRoleByName(string name);
    }
}
