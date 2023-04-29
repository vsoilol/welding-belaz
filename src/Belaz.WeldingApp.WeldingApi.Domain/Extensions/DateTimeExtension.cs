using System.Globalization;

namespace Belaz.WeldingApp.WeldingApi.Domain.Extensions;

public static class DateTimeExtension
{
    public static string ToDayInfoString(this DateTime dateTime) => $"{dateTime:dd.MM.yyyy}";

    public static string ToBelarusDayInfoString(this DateTime dateTime)
    {
        var minskZone = TimeZoneInfo.FindSystemTimeZoneById("Belarus Standard Time");
        var minskTime = TimeZoneInfo.ConvertTimeFromUtc(dateTime, minskZone);
        return $"{minskTime:dd.MM.yyyy}";
    }
    
    public static string ToBelarusHoursMinutesSecondsString(this DateTime dateTime)
    {
        var minskZone = TimeZoneInfo.FindSystemTimeZoneById("Belarus Standard Time");
        var minskTime = TimeZoneInfo.ConvertTimeFromUtc(dateTime, minskZone);
        return minskTime.TimeOfDay.ToString(@"hh\:mm\:ss");
    }

    public static string? ToDayInfoString(this DateTime? dateTime) =>
        dateTime is null ? null : $"{dateTime:dd.MM.yyyy}";

    public static DateTime ToDateTime(this string dateTime) =>
        DateTime.ParseExact(dateTime, "dd.MM.yyyy", CultureInfo.InvariantCulture);
}