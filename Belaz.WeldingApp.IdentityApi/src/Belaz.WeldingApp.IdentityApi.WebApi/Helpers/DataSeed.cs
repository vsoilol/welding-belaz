using Belaz.WeldingApp.IdentityApi.Data.Repositories.Entities;
using Belaz.WeldingApp.IdentityApi.Data.Repositories.Interfaces;
using Belaz.WeldingApp.IdentityApi.WebApi.Constants;
using Belaz.WeldingApp.IdentityApi.WebApi.Extensions;

namespace Belaz.WeldingApp.IdentityApi.WebApi.Helpers
{
    public class DataSeed
    {
        public static async Task SeedSampleDataAsync(IRepository<RoleData> roleRepository,
            IRepository<UserData> userRepository)
        {
            await CreateRolesAsync(roleRepository);
            await CreateAdminAsync(roleRepository, userRepository);
        }

        private static async Task CreateAdminAsync(IRepository<RoleData> roleRepository,
            IRepository<UserData> userRepository)
        {
            var admin = new UserData()
            {
                Email = "admin@admin.com",
                FirstName = "Admin",
                MiddleName = "Admin",
                LastName = "Adminovich",
                UserName = "admin",
                PasswordHash = SecurePasswordHasher.Hash("admin"),
            };

            admin.Roles = (await roleRepository.GetByFilterAsync(_ => _.Name == nameof(Role.Admin))).ToList();

            if (!(await userRepository.GetByFilterAsync(_ => _.UserName == admin.UserName)).Any())
            {
                await userRepository.AddAsync(admin);
                await userRepository.SaveAsync();
            }
        }

        private static async Task CreateRolesAsync(IRepository<RoleData> roleRepository)
        {
            var enumValues = Enum.GetNames(typeof(Role));

            foreach (var role in enumValues)
            {
                if (!(await roleRepository.GetByFilterAsync(_ => _.Name == role)).Any())
                {
                    var creationRole = new RoleData { Name = role };
                    await roleRepository.AddAsync(creationRole);
                    await roleRepository.SaveAsync();
                }
            }
        }
    }
}
