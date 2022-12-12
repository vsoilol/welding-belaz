using Microsoft.AspNetCore.Authorization;
using WeldingApp.Common.Enums;

namespace WeldingApp.Common.Attributes;

public class AuthorizeRolesAttribute : AuthorizeAttribute
{
    public AuthorizeRolesAttribute(params Role[] allowedRoles)
    {
        var allowedRolesAsStrings = allowedRoles.Select(x => Enum.GetName(typeof(Role), x));
        Roles = string.Join(",", allowedRolesAsStrings);
    }
}