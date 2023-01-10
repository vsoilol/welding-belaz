namespace WeldingApp.Common.Enums
{
    [Flags]
    public enum Role
    {
        Admin = 1,
        Master = 2,
        Executor = 3,
        TechUser = 4,
        Chief = 5,
    }
}
