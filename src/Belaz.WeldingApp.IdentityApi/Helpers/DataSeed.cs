using Belaz.WeldingApp.IdentityApi.Data.Repositories.Entities;
using Belaz.WeldingApp.IdentityApi.Data.Repositories.Interfaces;
using Belaz.WeldingApp.IdentityApi.Extensions;
using WeldingApp.Common.Enums;

namespace Belaz.WeldingApp.IdentityApi.Helpers
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
                UserName = "admin1@admin.com",
                PasswordHash = SecurePasswordHasher.Hash("_admin123A"),
            };

            var adminRole = await roleRepository.GetByFilterAsync(_ => _.Name == nameof(Role.Admin));
            admin.UserRoles = adminRole.Select(_ => new UserRole { Role = _ }).ToList();

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
