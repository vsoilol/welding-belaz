using Belaz.WeldingApp.Common.Entities.IdentityUser;
using Belaz.WeldingApp.Common.Entities.Users;
using Belaz.WeldingApp.Common.Enums;
using Belaz.WeldingApp.IdentityApi.BusinessLayer.Extensions;
using Belaz.WeldingApp.IdentityApi.DataLayer;
using Microsoft.EntityFrameworkCore;

namespace Belaz.WeldingApp.IdentityApi.BusinessLayer.Helpers;

public class DataSeed
{
    public static async Task SeedSampleDataAsync(
        ApplicationContext context
    )
    {
        await CreateAdminAsync(context);
        await CreateWelderAsync(context);
        await CreateInspectorAsync(context);
        await CreateChiefAsync(context);
        await CreateMasterAsync(context);
    }

    private static async Task CreateMasterAsync(
        ApplicationContext context
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

        if (!(await context.Users.AnyAsync(_ => _.UserName == master.UserName)))
        {
            var user = context.Users.Add(master);
            await context.SaveChangesAsync();

            var masterData = new Master { UserInfo = user.Entity };

            context.Masters.Add(masterData);
            await context.SaveChangesAsync();
        }
    }

    private static async Task CreateChiefAsync(
        ApplicationContext context
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

        if (!(await context.Users.AnyAsync(_ => _.UserName == chief.UserName)))
        {
            context.Users.Add(chief);
            await context.SaveChangesAsync();
        }
    }

    private static async Task CreateInspectorAsync(
        ApplicationContext context
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

        if (!(await context.Users.AnyAsync(_ => _.UserName == inspector.UserName)))
        {
            var user = context.Users.Add(inspector);
            await context.SaveChangesAsync();

            var inspectorData = new Inspector { UserInfo = user.Entity };

            context.Inspectors.Add(inspectorData);
            await context.SaveChangesAsync();
        }
    }

    private static async Task CreateWelderAsync(
        ApplicationContext context
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

        if (!(await context.Users.AnyAsync(_ => _.UserName == welder.UserName)))
        {
            context.Users.Add(welder);
            await context.SaveChangesAsync();
        }
    }

    private static async Task CreateAdminAsync(
        ApplicationContext context
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

        if (!(await context.Users.AnyAsync(_ => _.UserName == admin.UserName)))
        {
            context.Users.Add(admin);
            await context.SaveChangesAsync();
        }
    }
}
