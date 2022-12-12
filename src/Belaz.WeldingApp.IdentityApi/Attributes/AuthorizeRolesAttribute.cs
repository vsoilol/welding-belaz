using Belaz.WeldingApp.IdentityApi.Constants;
using Microsoft.AspNetCore.Authorization;

namespace Belaz.WeldingApp.IdentityApi.Attributes
{
    internal class AuthorizeRolesAttribute : AuthorizeAttribute
    {
        public AuthorizeRolesAttribute(params Role[] allowedRoles)
        {
            var allowedRolesAsStrings = allowedRoles.Select(x => Enum.GetName(typeof(Role), x));
            Roles = string.Join(",", allowedRolesAsStrings);
        }
    }
}
