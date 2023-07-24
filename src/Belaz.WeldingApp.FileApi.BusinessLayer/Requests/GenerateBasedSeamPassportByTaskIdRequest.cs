﻿namespace Belaz.WeldingApp.FileApi.BusinessLayer.Requests;

public class GenerateBasedSeamPassportByTaskIdRequest
{
    public Guid TaskId { get; set; }

    public int? SequenceNumber { get; set; }

    public double? AverageIntervalSeconds { get; set; }
    
    public double? SecondsToIgnoreBetweenGraphs { get; set; }
}