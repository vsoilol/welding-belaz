namespace Belaz.WeldingApp.WeldingApi.Extensions;

public static class TimeSpanExtension
{
    public static string? ToHoursMinutesSecondsString(this TimeSpan? timeSpan) => timeSpan?.ToString(@"hh\:mm\:ss");
}
