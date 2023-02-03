namespace WeldingApp.Common.Enums
{
    [Flags]
    public enum Role
    {
        Admin = 1,
        Master = 2,
        Welder = 3,
        Inspector = 4,
        Chief = 5,
    }
}
