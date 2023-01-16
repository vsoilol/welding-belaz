namespace Belaz.WeldingApp.WeldingApi.Extensions;

public static class TimeSpanExtension
{
    public static string? ToHoursMinutesSecondsString(this TimeSpan? timeSpan) => timeSpan?.ToString(@"hh\:mm\:ss");
    
    public static string? ToHoursMinutesString(this TimeSpan? timeSpan) => timeSpan?.ToString(@"hh\:mm\:ss");
    
    public static string ToHoursMinutesString(this TimeSpan timeSpan) => timeSpan.ToString(@"hh\:mm\:ss");

    public static TimeSpan? ToTimeSpan(this string? value) => value is null ? null : TimeSpan.Parse(value);
}
