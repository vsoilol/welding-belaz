namespace Belaz.WeldingApp.FileApi.Domain.Extensions;

public static class TimeSpanExtension
{
    public static string? ToHoursMinutesSecondsString(this TimeSpan? timeSpan) => timeSpan?.ToString(@"hh\:mm\:ss");
    
    public static string ToHoursMinutesSecondsString(this TimeSpan timeSpan) => timeSpan.ToString(@"hh\:mm\:ss");
    
    public static string? ToHoursMinutesString(this TimeSpan? timeSpan) => timeSpan?.ToString(@"hh\:mm");
    
    public static string ToHoursMinutesString(this TimeSpan timeSpan) => timeSpan.ToString(@"hh\:mm");
    
    public static string ToMinutesSecondsString(this TimeSpan timeSpan) => timeSpan.ToString(@"mm\,ss");

    public static TimeSpan? ToTimeSpan(this string? value) => value is null ? null : TimeSpan.Parse(value);
}
