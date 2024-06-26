﻿using System.Globalization;

namespace Belaz.WeldingApp.WeldingApi.Extensions;

public static class DateTimeExtension
{
    public static string ToDayInfoString(this DateTime dateTime) => $"{dateTime:dd.MM.yyyy}";

    public static DateTime ToDateTime(this string dateTime) =>
        DateTime.ParseExact(dateTime, "dd.MM.yyyy", CultureInfo.InvariantCulture);
}