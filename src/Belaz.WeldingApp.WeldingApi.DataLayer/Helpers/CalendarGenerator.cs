using Belaz.WeldingApp.Common.Entities.CalendarInfo;

namespace Belaz.WeldingApp.WeldingApi.DataLayer.Helpers;

internal static class CalendarGenerator
{
    public static Calendar GenerateCalendar()
    {
        var calendar = new Calendar
        {
            Year = 2023,
            IsMain = true,
            Days = new List<Day>
            {
                new Day
                {
                    MonthNumber = 1,
                    Number = 1,
                    IsWorkingDay = false,
                },
                new Day
                {
                    MonthNumber = 1,
                    Number = 2,
                    IsWorkingDay = false,
                },
                new Day
                {
                    MonthNumber = 1,
                    Number = 7,
                    IsWorkingDay = false,
                },
                new Day
                {
                    MonthNumber = 1,
                    Number = 8,
                    IsWorkingDay = false,
                },
                new Day
                {
                    MonthNumber = 1,
                    Number = 14,
                    IsWorkingDay = false,
                },
                new Day
                {
                    MonthNumber = 1,
                    Number = 15,
                    IsWorkingDay = false,
                },
                new Day
                {
                    MonthNumber = 1,
                    Number = 21,
                    IsWorkingDay = false,
                },
                new Day
                {
                    MonthNumber = 1,
                    Number = 22,
                    IsWorkingDay = false,
                },
                new Day
                {
                    MonthNumber = 1,
                    Number = 28,
                    IsWorkingDay = false,
                },
                new Day
                {
                    MonthNumber = 1,
                    Number = 29,
                    IsWorkingDay = false,
                },
                new Day
                {
                    MonthNumber = 2,
                    Number = 4,
                    IsWorkingDay = false,
                },
                new Day
                {
                    MonthNumber = 2,
                    Number = 5,
                    IsWorkingDay = false,
                },
                new Day
                {
                    MonthNumber = 2,
                    Number = 11,
                    IsWorkingDay = false,
                },
                new Day
                {
                    MonthNumber = 2,
                    Number = 12,
                    IsWorkingDay = false,
                },
                new Day
                {
                    MonthNumber = 2,
                    Number = 18,
                    IsWorkingDay = false,
                },
                new Day
                {
                    MonthNumber = 2,
                    Number = 19,
                    IsWorkingDay = false,
                },
                new Day
                {
                    MonthNumber = 2,
                    Number = 25,
                    IsWorkingDay = false,
                },
                new Day
                {
                    MonthNumber = 2,
                    Number = 26,
                    IsWorkingDay = false,
                },
                new Day
                {
                    MonthNumber = 3,
                    Number = 4,
                    IsWorkingDay = false,
                },
                new Day
                {
                    MonthNumber = 3,
                    Number = 5,
                    IsWorkingDay = false,
                },
                new Day
                {
                    MonthNumber = 3,
                    Number = 8,
                    IsWorkingDay = false,
                },
                new Day
                {
                    MonthNumber = 3,
                    Number = 11,
                    IsWorkingDay = false,
                },
                new Day
                {
                    MonthNumber = 3,
                    Number = 12,
                    IsWorkingDay = false,
                },
                new Day
                {
                    MonthNumber = 3,
                    Number = 18,
                    IsWorkingDay = false,
                },
                new Day
                {
                    MonthNumber = 3,
                    Number = 19,
                    IsWorkingDay = false,
                },
                new Day
                {
                    MonthNumber = 3,
                    Number = 25,
                    IsWorkingDay = false,
                },
                new Day
                {
                    MonthNumber = 3,
                    Number = 26,
                    IsWorkingDay = false,
                },
                new Day
                {
                    MonthNumber = 4,
                    Number = 1,
                    IsWorkingDay = false,
                },
                new Day
                {
                    MonthNumber = 4,
                    Number = 2,
                    IsWorkingDay = false,
                },
                new Day
                {
                    MonthNumber = 4,
                    Number = 8,
                    IsWorkingDay = false,
                },
                new Day
                {
                    MonthNumber = 4,
                    Number = 9,
                    IsWorkingDay = false,
                },
                new Day
                {
                    MonthNumber = 4,
                    Number = 15,
                    IsWorkingDay = false,
                },
                new Day
                {
                    MonthNumber = 4,
                    Number = 16,
                    IsWorkingDay = false,
                },
                new Day
                {
                    MonthNumber = 4,
                    Number = 23,
                    IsWorkingDay = false,
                },
                new Day
                {
                    MonthNumber = 4,
                    Number = 24,
                    IsWorkingDay = false,
                },
                new Day
                {
                    MonthNumber = 4,
                    Number = 25,
                    IsWorkingDay = false,
                },
                new Day
                {
                    MonthNumber = 4,
                    Number = 29,
                    IsWorkingDay = false,
                },
                new Day
                {
                    MonthNumber = 4,
                    Number = 30,
                    IsWorkingDay = false,
                },
                new Day
                {
                    MonthNumber = 5,
                    Number = 1,
                    IsWorkingDay = false,
                },
                new Day
                {
                    MonthNumber = 5,
                    Number = 6,
                    IsWorkingDay = false,
                },
                new Day
                {
                    MonthNumber = 5,
                    Number = 7,
                    IsWorkingDay = false,
                },
                new Day
                {
                    MonthNumber = 5,
                    Number = 8,
                    IsWorkingDay = false,
                },
                new Day
                {
                    MonthNumber = 5,
                    Number = 9,
                    IsWorkingDay = false,
                },
                new Day
                {
                    MonthNumber = 5,
                    Number = 14,
                    IsWorkingDay = false,
                },
                new Day
                {
                    MonthNumber = 5,
                    Number = 20,
                    IsWorkingDay = false,
                },
                new Day
                {
                    MonthNumber = 5,
                    Number = 21,
                    IsWorkingDay = false,
                },
                new Day
                {
                    MonthNumber = 5,
                    Number = 27,
                    IsWorkingDay = false,
                },
                new Day
                {
                    MonthNumber = 5,
                    Number = 28,
                    IsWorkingDay = false,
                },
                new Day
                {
                    MonthNumber = 6,
                    Number = 3,
                    IsWorkingDay = false,
                },
                new Day
                {
                    MonthNumber = 6,
                    Number = 4,
                    IsWorkingDay = false,
                },
                new Day
                {
                    MonthNumber = 6,
                    Number = 10,
                    IsWorkingDay = false,
                },
                new Day
                {
                    MonthNumber = 6,
                    Number = 11,
                    IsWorkingDay = false,
                },
                new Day
                {
                    MonthNumber = 6,
                    Number = 17,
                    IsWorkingDay = false,
                },
                new Day
                {
                    MonthNumber = 6,
                    Number = 18,
                    IsWorkingDay = false,
                },
                new Day
                {
                    MonthNumber = 6,
                    Number = 24,
                    IsWorkingDay = false,
                },
                new Day
                {
                    MonthNumber = 6,
                    Number = 25,
                    IsWorkingDay = false,
                },
                new Day
                {
                    MonthNumber = 7,
                    Number = 1,
                    IsWorkingDay = false,
                },
                new Day
                {
                    MonthNumber = 7,
                    Number = 2,
                    IsWorkingDay = false,
                },
                new Day
                {
                    MonthNumber = 7,
                    Number = 8,
                    IsWorkingDay = false,
                },
                new Day
                {
                    MonthNumber = 7,
                    Number = 9,
                    IsWorkingDay = false,
                },
                new Day
                {
                    MonthNumber = 7,
                    Number = 15,
                    IsWorkingDay = false,
                },
                new Day
                {
                    MonthNumber = 7,
                    Number = 16,
                    IsWorkingDay = false,
                },
                new Day
                {
                    MonthNumber = 7,
                    Number = 22,
                    IsWorkingDay = false,
                },
                new Day
                {
                    MonthNumber = 7,
                    Number = 23,
                    IsWorkingDay = false,
                },
                new Day
                {
                    MonthNumber = 7,
                    Number = 29,
                    IsWorkingDay = false,
                },
                new Day
                {
                    MonthNumber = 7,
                    Number = 30,
                    IsWorkingDay = false,
                },
                new Day
                {
                    MonthNumber = 8,
                    Number = 5,
                    IsWorkingDay = false,
                },
                new Day
                {
                    MonthNumber = 8,
                    Number = 6,
                    IsWorkingDay = false,
                },
                new Day
                {
                    MonthNumber = 8,
                    Number = 12,
                    IsWorkingDay = false,
                },
                new Day
                {
                    MonthNumber = 8,
                    Number = 13,
                    IsWorkingDay = false,
                },
                new Day
                {
                    MonthNumber = 8,
                    Number = 19,
                    IsWorkingDay = false,
                },
                new Day
                {
                    MonthNumber = 8,
                    Number = 20,
                    IsWorkingDay = false,
                },
                new Day
                {
                    MonthNumber = 8,
                    Number = 26,
                    IsWorkingDay = false,
                },
                new Day
                {
                    MonthNumber = 8,
                    Number = 27,
                    IsWorkingDay = false,
                },
                new Day
                {
                    MonthNumber = 9,
                    Number = 2,
                    IsWorkingDay = false,
                },
                new Day
                {
                    MonthNumber = 9,
                    Number = 3,
                    IsWorkingDay = false,
                },
                new Day
                {
                    MonthNumber = 9,
                    Number = 9,
                    IsWorkingDay = false,
                },
                new Day
                {
                    MonthNumber = 9,
                    Number = 10,
                    IsWorkingDay = false,
                },
                new Day
                {
                    MonthNumber = 9,
                    Number = 16,
                    IsWorkingDay = false,
                },
                new Day
                {
                    MonthNumber = 9,
                    Number = 17,
                    IsWorkingDay = false,
                },
                new Day
                {
                    MonthNumber = 9,
                    Number = 23,
                    IsWorkingDay = false,
                },
                new Day
                {
                    MonthNumber = 9,
                    Number = 24,
                    IsWorkingDay = false,
                },
                new Day
                {
                    MonthNumber = 9,
                    Number = 30,
                    IsWorkingDay = false,
                },
                new Day
                {
                    MonthNumber = 10,
                    Number = 1,
                    IsWorkingDay = false,
                },
                new Day
                {
                    MonthNumber = 10,
                    Number = 7,
                    IsWorkingDay = false,
                },
                new Day
                {
                    MonthNumber = 10,
                    Number = 8,
                    IsWorkingDay = false,
                },
                new Day
                {
                    MonthNumber = 10,
                    Number = 14,
                    IsWorkingDay = false,
                },
                new Day
                {
                    MonthNumber = 10,
                    Number = 15,
                    IsWorkingDay = false,
                },
                new Day
                {
                    MonthNumber = 10,
                    Number = 21,
                    IsWorkingDay = false,
                },
                new Day
                {
                    MonthNumber = 10,
                    Number = 22,
                    IsWorkingDay = false,
                },
                new Day
                {
                    MonthNumber = 10,
                    Number = 28,
                    IsWorkingDay = false,
                },
                new Day
                {
                    MonthNumber = 10,
                    Number = 29,
                    IsWorkingDay = false,
                },
                new Day
                {
                    MonthNumber = 11,
                    Number = 4,
                    IsWorkingDay = false,
                },
                new Day
                {
                    MonthNumber = 11,
                    Number = 5,
                    IsWorkingDay = false,
                },
                new Day
                {
                    MonthNumber = 11,
                    Number = 6,
                    IsWorkingDay = false,
                },
                new Day
                {
                    MonthNumber = 11,
                    Number = 7,
                    IsWorkingDay = false,
                },
                new Day
                {
                    MonthNumber = 11,
                    Number = 12,
                    IsWorkingDay = false,
                },
                new Day
                {
                    MonthNumber = 11,
                    Number = 18,
                    IsWorkingDay = false,
                },
                new Day
                {
                    MonthNumber = 11,
                    Number = 19,
                    IsWorkingDay = false,
                },
                new Day
                {
                    MonthNumber = 11,
                    Number = 25,
                    IsWorkingDay = false,
                },
                new Day
                {
                    MonthNumber = 11,
                    Number = 26,
                    IsWorkingDay = false,
                },
                new Day
                {
                    MonthNumber = 12,
                    Number = 2,
                    IsWorkingDay = false,
                },
                new Day
                {
                    MonthNumber = 12,
                    Number = 3,
                    IsWorkingDay = false,
                },
                new Day
                {
                    MonthNumber = 12,
                    Number = 9,
                    IsWorkingDay = false,
                },
                new Day
                {
                    MonthNumber = 12,
                    Number = 10,
                    IsWorkingDay = false,
                },
                new Day
                {
                    MonthNumber = 12,
                    Number = 16,
                    IsWorkingDay = false,
                },
                new Day
                {
                    MonthNumber = 12,
                    Number = 17,
                    IsWorkingDay = false,
                },
                new Day
                {
                    MonthNumber = 12,
                    Number = 23,
                    IsWorkingDay = false,
                },
                new Day
                {
                    MonthNumber = 12,
                    Number = 24,
                    IsWorkingDay = false,
                },
                new Day
                {
                    MonthNumber = 12,
                    Number = 25,
                    IsWorkingDay = false,
                },
                new Day
                {
                    MonthNumber = 12,
                    Number = 30,
                    IsWorkingDay = false,
                },
                new Day
                {
                    MonthNumber = 12,
                    Number = 31,
                    IsWorkingDay = false,
                },
                new Day
                {
                    MonthNumber = 1,
                    Number = 6,
                    IsWorkingDay = true,
                    WorkingShifts = new List<WorkingShift>
                    {
                        new WorkingShift
                        {
                            Number = 1,
                            ShiftStart = new TimeSpan(7, 30, 0),
                            ShiftEnd = new TimeSpan(15, 0, 0),
                            BreakStart = new TimeSpan(12, 0, 0),
                            BreakEnd = new TimeSpan(12, 30, 0),
                        },
                        new WorkingShift
                        {
                            Number = 2,
                            ShiftStart = new TimeSpan(16, 0, 0),
                            ShiftEnd = new TimeSpan(23, 30, 0),
                            BreakStart = new TimeSpan(20, 0, 0),
                            BreakEnd = new TimeSpan(20, 30, 0),
                        },
                        new WorkingShift
                        {
                            Number = 3,
                            ShiftStart = new TimeSpan(0, 30, 0),
                            ShiftEnd = new TimeSpan(6, 50, 0),
                            BreakStart = new TimeSpan(2, 0, 0),
                            BreakEnd = new TimeSpan(2, 20, 0),
                        }
                    }
                },
                new Day
                {
                    MonthNumber = 3,
                    Number = 7,
                    IsWorkingDay = true,
                    WorkingShifts = new List<WorkingShift>
                    {
                        new WorkingShift
                        {
                            Number = 1,
                            ShiftStart = new TimeSpan(7, 30, 0),
                            ShiftEnd = new TimeSpan(15, 0, 0),
                            BreakStart = new TimeSpan(12, 0, 0),
                            BreakEnd = new TimeSpan(12, 30, 0),
                        },
                        new WorkingShift
                        {
                            Number = 2,
                            ShiftStart = new TimeSpan(16, 0, 0),
                            ShiftEnd = new TimeSpan(23, 30, 0),
                            BreakStart = new TimeSpan(20, 0, 0),
                            BreakEnd = new TimeSpan(20, 30, 0),
                        },
                        new WorkingShift
                        {
                            Number = 3,
                            ShiftStart = new TimeSpan(0, 30, 0),
                            ShiftEnd = new TimeSpan(6, 50, 0),
                            BreakStart = new TimeSpan(2, 0, 0),
                            BreakEnd = new TimeSpan(2, 20, 0),
                        }
                    }
                },
                new Day
                {
                    MonthNumber = 4,
                    Number = 22,
                    IsWorkingDay = true,
                    WorkingShifts = new List<WorkingShift>
                    {
                        new WorkingShift
                        {
                            Number = 1,
                            ShiftStart = new TimeSpan(7, 30, 0),
                            ShiftEnd = new TimeSpan(15, 0, 0),
                            BreakStart = new TimeSpan(12, 0, 0),
                            BreakEnd = new TimeSpan(12, 30, 0),
                        },
                        new WorkingShift
                        {
                            Number = 2,
                            ShiftStart = new TimeSpan(16, 0, 0),
                            ShiftEnd = new TimeSpan(23, 30, 0),
                            BreakStart = new TimeSpan(20, 0, 0),
                            BreakEnd = new TimeSpan(20, 30, 0),
                        },
                        new WorkingShift
                        {
                            Number = 3,
                            ShiftStart = new TimeSpan(0, 30, 0),
                            ShiftEnd = new TimeSpan(6, 50, 0),
                            BreakStart = new TimeSpan(2, 0, 0),
                            BreakEnd = new TimeSpan(2, 20, 0),
                        }
                    }
                },
                new Day
                {
                    MonthNumber = 5,
                    Number = 13,
                    IsWorkingDay = true,
                    WorkingShifts = new List<WorkingShift>
                    {
                        new WorkingShift
                        {
                            Number = 1,
                            ShiftStart = new TimeSpan(7, 30, 0),
                            ShiftEnd = new TimeSpan(15, 0, 0),
                            BreakStart = new TimeSpan(12, 0, 0),
                            BreakEnd = new TimeSpan(12, 30, 0),
                        },
                        new WorkingShift
                        {
                            Number = 2,
                            ShiftStart = new TimeSpan(16, 0, 0),
                            ShiftEnd = new TimeSpan(23, 30, 0),
                            BreakStart = new TimeSpan(20, 0, 0),
                            BreakEnd = new TimeSpan(20, 30, 0),
                        },
                        new WorkingShift
                        {
                            Number = 3,
                            ShiftStart = new TimeSpan(0, 30, 0),
                            ShiftEnd = new TimeSpan(6, 50, 0),
                            BreakStart = new TimeSpan(2, 0, 0),
                            BreakEnd = new TimeSpan(2, 20, 0),
                        }
                    }
                },
                new Day
                {
                    MonthNumber = 11,
                    Number = 11,
                    IsWorkingDay = true,
                    WorkingShifts = new List<WorkingShift>
                    {
                        new WorkingShift
                        {
                            Number = 1,
                            ShiftStart = new TimeSpan(7, 30, 0),
                            ShiftEnd = new TimeSpan(15, 0, 0),
                            BreakStart = new TimeSpan(12, 0, 0),
                            BreakEnd = new TimeSpan(12, 30, 0),
                        },
                        new WorkingShift
                        {
                            Number = 2,
                            ShiftStart = new TimeSpan(16, 0, 0),
                            ShiftEnd = new TimeSpan(23, 30, 0),
                            BreakStart = new TimeSpan(20, 0, 0),
                            BreakEnd = new TimeSpan(20, 30, 0),
                        },
                        new WorkingShift
                        {
                            Number = 3,
                            ShiftStart = new TimeSpan(0, 30, 0),
                            ShiftEnd = new TimeSpan(6, 50, 0),
                            BreakStart = new TimeSpan(2, 0, 0),
                            BreakEnd = new TimeSpan(2, 20, 0),
                        }
                    }
                }
            },
            MainWorkingShifts = new List<WorkingShift>
            {
                new WorkingShift
                {
                    Number = 1,
                    ShiftStart = new TimeSpan(7, 30, 0),
                    ShiftEnd = new TimeSpan(16, 0, 0),
                    BreakStart = new TimeSpan(12, 0, 0),
                    BreakEnd = new TimeSpan(12, 30, 0),
                },
                new WorkingShift
                {
                    Number = 2,
                    ShiftStart = new TimeSpan(16, 0, 0),
                    ShiftEnd = new TimeSpan(0, 30, 0),
                    BreakStart = new TimeSpan(20, 0, 0),
                    BreakEnd = new TimeSpan(20, 30, 0),
                },
                new WorkingShift
                {
                    Number = 3,
                    ShiftStart = new TimeSpan(0, 30, 0),
                    ShiftEnd = new TimeSpan(7, 50, 0),
                    BreakStart = new TimeSpan(2, 0, 0),
                    BreakEnd = new TimeSpan(2, 20, 0),
                }
            }
        };

        return calendar;
    }
}
