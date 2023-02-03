﻿namespace Belaz.WeldingApp.FileApi.BusinessLayer.Helpers.Interfaces;

public interface IMarkEstimateService
{
    double? GetAverageEstimation(double[] weldingCurrents, double[] voltages, double? minAllowanceWeldingCurrent,
        double? maxAllowanceWeldingCurrent, double? minAllowanceVoltage,  double? maxAllowanceVoltage);
}