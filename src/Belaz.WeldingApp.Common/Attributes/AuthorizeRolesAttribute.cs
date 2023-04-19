using Belaz.WeldingApp.Common.Enums;
using Microsoft.AspNetCore.Authorization;

namespace Belaz.WeldingApp.Common.Attributes;

public class AuthorizeRolesAttribute : AuthorizeAttribute
{
    public AuthorizeRolesAttribute(params Role[] allowedRoles)
    {
        var allowedRolesAsStrings = allowedRoles.Select(x => Enum.GetName(typeof(Role), x));
        Roles = string.Join(",", allowedRolesAsStrings);
    }
}
