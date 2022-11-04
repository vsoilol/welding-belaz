namespace Belaz.WeldingApp.IdentityApi.WebApi.Constants
{
    public static class RoleCollection
    {
        public static Dictionary<string, int> Roles = new Dictionary<string, int>
        {
            { "Admin",  1 },
            { "Master",  2 },
            { "Executor",  3 },
            { "TechUser",  4 }
        };
    }
}
