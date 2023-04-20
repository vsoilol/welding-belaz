using Belaz.WeldingApp.IdentityApi.Data.DataAccess;
using Belaz.WeldingApp.IdentityApi.Data.Repositories.Entities;
using Belaz.WeldingApp.IdentityApi.Data.Repositories.Interfaces;
using Belaz.WeldingApp.IdentityApi.Extensions;
using Microsoft.EntityFrameworkCore;
using Belaz.WeldingApp.Common.Enums;

namespace Belaz.WeldingApp.IdentityApi.Helpers;

public class DataSeed
{
    public static async Task SeedSampleDataAsync(
        IRepository<RoleData> roleRepository,
        IRepository<UserData> userRepository,
        IdentityDbContext context
    )
    {
        await CreateRolesAsync(roleRepository);
        await CreateAdminAsync(roleRepository, userRepository);
        await CreateWelderAsync(roleRepository, userRepository);
        await CreateInspectorAsync(roleRepository, userRepository, context);
        await CreateChiefAsync(roleRepository, userRepository);
        await CreateMasterAsync(roleRepository, userRepository, context);
    }

    private static async Task CreateMasterAsync(
        IRepository<RoleData> roleRepository,
        IRepository<UserData> userRepository,
        IdentityDbContext context
    )
    {
        var productionArea = await context.ProductionAreas.FirstOrDefaultAsync(_ => _.Number == 6);

        var master = new UserData()
        {
            Email = "master@master.com",
            FirstName = "Имя начальника цеха",
            MiddleName = "Фамилия начальника цеха",
            LastName = "Отчество начальника цеха",
            UserName = "master@master.com",
            PasswordHash = SecurePasswordHasher.Hash("master12345"),
            ProductionArea = productionArea
        };

        var masterRole = await roleRepository.GetByFilterAsync(_ => _.Name == nameof(Role.Master));
        master.UserRoles = masterRole.Select(_ => new UserRole { Role = _ }).ToList();

        if (!(await userRepository.GetByFilterAsync(_ => _.UserName == master.UserName)).Any())
        {
            var user = await userRepository.AddAsync(master);
            await userRepository.SaveAsync();

            var masterData = new Master { UserInfo = user };

            context.Masters.Add(masterData);
            await userRepository.SaveAsync();
        }
    }

    private static async Task CreateChiefAsync(
        IRepository<RoleData> roleRepository,
        IRepository<UserData> userRepository
    )
    {
        var chief = new UserData()
        {
            Email = "chief@chief.com",
            FirstName = "Имя начальника цеха",
            MiddleName = "Фамилия начальника цеха",
            LastName = "Отчество начальника цеха",
            UserName = "chief@chief.com",
            PasswordHash = SecurePasswordHasher.Hash("chief12345"),
        };

        var chiefRole = await roleRepository.GetByFilterAsync(_ => _.Name == nameof(Role.Chief));
        chief.UserRoles = chiefRole.Select(_ => new UserRole { Role = _ }).ToList();

        if (!(await userRepository.GetByFilterAsync(_ => _.UserName == chief.UserName)).Any())
        {
            await userRepository.AddAsync(chief);
            await userRepository.SaveAsync();
        }
    }

    private static async Task CreateInspectorAsync(
        IRepository<RoleData> roleRepository,
        IRepository<UserData> userRepository,
        IdentityDbContext context
    )
    {
        var productionArea = await context.ProductionAreas.FirstOrDefaultAsync(_ => _.Number == 6);

        var inspector = new UserData()
        {
            Email = "inspector@inspector.com",
            FirstName = "Имя контролера",
            MiddleName = "Фамилия контролера",
            LastName = "Отчество контролера",
            UserName = "inspector@inspector.com",
            PasswordHash = SecurePasswordHasher.Hash("inspector12345"),
            ProductionArea = productionArea
        };

        var inspectorRole = await roleRepository.GetByFilterAsync(
            _ => _.Name == nameof(Role.Inspector)
        );
        inspector.UserRoles = inspectorRole.Select(_ => new UserRole { Role = _ }).ToList();

        if (!(await userRepository.GetByFilterAsync(_ => _.UserName == inspector.UserName)).Any())
        {
            var user = await userRepository.AddAsync(inspector);
            await userRepository.SaveAsync();

            var inspectorData = new Inspector { UserInfo = user };

            context.Inspectors.Add(inspectorData);
            await userRepository.SaveAsync();
        }
    }

    private static async Task CreateWelderAsync(
        IRepository<RoleData> roleRepository,
        IRepository<UserData> userRepository
    )
    {
        var welder = new UserData()
        {
            Email = "welder@welder.com",
            FirstName = "Имя сварщика",
            MiddleName = "Фамилия сварщика",
            LastName = "Отчество сварщика",
            UserName = "welder@welder.com",
            PasswordHash = SecurePasswordHasher.Hash("welder12345"),
        };

        var welderRole = await roleRepository.GetByFilterAsync(_ => _.Name == nameof(Role.Welder));
        welder.UserRoles = welderRole.Select(_ => new UserRole { Role = _ }).ToList();

        if (!(await userRepository.GetByFilterAsync(_ => _.UserName == welder.UserName)).Any())
        {
            await userRepository.AddAsync(welder);
            await userRepository.SaveAsync();
        }
    }

    private static async Task CreateAdminAsync(
        IRepository<RoleData> roleRepository,
        IRepository<UserData> userRepository
    )
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
