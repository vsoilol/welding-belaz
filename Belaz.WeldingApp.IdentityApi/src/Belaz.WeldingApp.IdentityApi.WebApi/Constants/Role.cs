namespace Belaz.WeldingApp.IdentityApi.WebApi.Constants
{
    [Flags]
    public enum Role
    {
        Admin = 1,
        Master = 2,
        Executor = 3,
        TechUser = 4
    }
}
