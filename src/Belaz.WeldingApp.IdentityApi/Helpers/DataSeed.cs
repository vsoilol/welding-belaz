using Belaz.WeldingApp.IdentityApi.Data.DataAccess;
using Belaz.WeldingApp.IdentityApi.Data.Repositories.Interfaces;
using Belaz.WeldingApp.IdentityApi.Extensions;
using Microsoft.EntityFrameworkCore;
using Belaz.WeldingApp.Common.Enums;
using Belaz.WeldingApp.Common.Entities.IdentityUser;
using Belaz.WeldingApp.Common.Entities.Users;

namespace Belaz.WeldingApp.IdentityApi.Helpers;

public class DataSeed
{
    public static async Task SeedSampleDataAsync(
        IRepository<UserData> userRepository,
        IdentityDbContext context
    )
    {
        await CreateAdminAsync(userRepository);
        await CreateWelderAsync(userRepository);
        await CreateInspectorAsync(userRepository, context);
        await CreateChiefAsync(userRepository);
        await CreateMasterAsync(userRepository, context);
    }

    private static async Task CreateMasterAsync(
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
            ProductionArea = productionArea,
            Role = Role.Master
        };

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
            Role = Role.Chief
        };

        if (!(await userRepository.GetByFilterAsync(_ => _.UserName == chief.UserName)).Any())
        {
            await userRepository.AddAsync(chief);
            await userRepository.SaveAsync();
        }
    }

    private static async Task CreateInspectorAsync(
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
            ProductionArea = productionArea,
            Role = Role.Inspector
        };

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
            Role = Role.Welder
        };

        if (!(await userRepository.GetByFilterAsync(_ => _.UserName == welder.UserName)).Any())
        {
            await userRepository.AddAsync(welder);
            await userRepository.SaveAsync();
        }
    }

    private static async Task CreateAdminAsync(
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
            Role = Role.Admin
        };

        if (!(await userRepository.GetByFilterAsync(_ => _.UserName == admin.UserName)).Any())
        {
            await userRepository.AddAsync(admin);
            await userRepository.SaveAsync();
        }
    }
}
