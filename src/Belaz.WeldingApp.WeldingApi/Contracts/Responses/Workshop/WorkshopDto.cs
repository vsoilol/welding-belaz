﻿namespace Belaz.WeldingApp.WeldingApi.Contracts.Responses.Workshop;

public class WorkshopDto
{
    public Guid Id { get; set; }

    public string Name { get; set; } = null!;

    public int Number { get; set; }
}