﻿namespace Belaz.WeldingApp.WeldingApi.Contracts.Responses;

public class WorkingShiftDto
{
    public Guid Id { get; set; }
    
    public int Number { get; set; }

    public string ShiftStart { get; set; } = null!;

    public string ShiftEnd { get; set; } = null!;

    public string? BreakStart { get; set; }

    public string? BreakEnd { get; set; }
}