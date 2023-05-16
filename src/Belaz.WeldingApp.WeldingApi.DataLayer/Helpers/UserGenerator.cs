using Belaz.WeldingApp.Common.Entities.IdentityUser;
using Belaz.WeldingApp.Common.Enums;

namespace Belaz.WeldingApp.WeldingApi.DataLayer.Helpers;

public class UserGenerator
{
    public static UserData GenerateAdmin()
    {
        var admin = new UserData
        {
            Id = Guid.Parse("11506328-827d-42fa-9bfb-328308ec4914"),
            Email = "admin@admin.com",
            FirstName = "Admin",
            MiddleName = "Admin",
            LastName = "Adminovich",
            UserName = "admin1@admin.com",
            PasswordHash = "$MYHASH$V1$10000$ghqyzdnfjI+uNru6pK5JHJJuAN6hD/YP9vcUP+uDlTYP7QUv",
            Role = Role.Admin
        };

        return admin;
    }
}