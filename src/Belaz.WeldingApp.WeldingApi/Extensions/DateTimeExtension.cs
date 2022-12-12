namespace Belaz.WeldingApp.WeldingApi.Extensions;

public static class DateTimeExtension
{
    public static string ToDayInfoString(this DateTime dateTime) => $"{dateTime:dd.MM.yyyy}";
}
