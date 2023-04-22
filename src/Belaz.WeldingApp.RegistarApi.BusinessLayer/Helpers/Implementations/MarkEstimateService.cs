using Belaz.WeldingApp.RegistarApi.BusinessLayer.Helpers.Interfaces;

namespace Belaz.WeldingApp.RegistarApi.BusinessLayer.Helpers.Implementations;

public class MarkEstimateService : IMarkEstimateService
{
    private const int NormalSignificanceLevel = 5;
    private const int HighSignificanceLevel = 10;

    public double? GetAverageEstimation(
        double[] weldingCurrents,
        double[] voltages,
        double? minAllowanceWeldingCurrent,
        double? maxAllowanceWeldingCurrent,
        double? minAllowanceVoltage,
        double? maxAllowanceVoltage
    )
    {
        if (
            IsAllowancesNullOrEqualZero(
                minAllowanceWeldingCurrent,
                maxAllowanceWeldingCurrent,
                minAllowanceVoltage,
                maxAllowanceVoltage
            )
        )
        {
            return null;
        }

        var estimations = new List<double>();
        var dataCount = weldingCurrents.Length;

        for (var i = 0; i < dataCount; i++)
        {
            var estimation = GetEstimation(
                weldingCurrents[i],
                minAllowanceWeldingCurrent,
                maxAllowanceWeldingCurrent,
                voltages[i],
                minAllowanceVoltage,
                maxAllowanceVoltage
            );

            estimations.Add(estimation);
        }

        var averageEstimation = estimations.Average();

        return Math.Round(averageEstimation, 2);
    }

    private bool IsAllowancesNullOrEqualZero(
        double? minAllowanceWeldingCurrent,
        double? maxAllowanceWeldingCurrent,
        double? minAllowanceVoltage,
        double? maxAllowanceVoltage
    )
    {
        return minAllowanceWeldingCurrent is null or 0
            && maxAllowanceWeldingCurrent is null or 0
            && minAllowanceVoltage is null or 0
            && maxAllowanceVoltage is null or 0;
    }

    private double GetEstimation(
        double currencyValue,
        double? minAllowanceWeldingCurrent,
        double? maxAllowanceWeldingCurrent,
        double voltageValue,
        double? minAllowanceVoltage,
        double? maxAllowanceVoltage
    )
    {
        var Io =
            minAllowanceWeldingCurrent is null || maxAllowanceWeldingCurrent is null
                ? 0
                : GetMark(
                    currencyValue,
                    (double)minAllowanceWeldingCurrent,
                    (double)maxAllowanceWeldingCurrent
                );

        var Uo =
            minAllowanceVoltage is null || maxAllowanceVoltage is null
                ? 0
                : GetMark(voltageValue, (double)minAllowanceVoltage, (double)maxAllowanceVoltage);

        if (Io == 0 && Uo != 0)
        {
            return Uo * HighSignificanceLevel;
        }

        if (Uo == 0 && Io != 0)
        {
            return Io * HighSignificanceLevel;
        }

        return Io * NormalSignificanceLevel + Uo * NormalSignificanceLevel;
    }

    private double GetMark(double value, double minValue, double maxValue)
    {
        if (!IsValuePassedRequirements(value, minValue, maxValue))
        {
            return 0;
        }

        if (maxValue == 0 && minValue == 0)
        {
            return 0;
        }

        var averageByAllowance = (maxValue + minValue) / 2.0;
        double absVal = 0,
            difMaxAvv = 1;

        if (value > averageByAllowance)
        {
            absVal = maxValue - value;
            difMaxAvv = maxValue - averageByAllowance;
        }

        if (value <= averageByAllowance)
        {
            absVal = value - minValue;
            difMaxAvv = averageByAllowance - minValue;
        }

        var Vo = absVal / difMaxAvv;

        return Vo;
    }

    private bool IsValuePassedRequirements(double value, double minValue, double maxValue)
    {
        var isValueMoreThenMaxValue = value < maxValue;
        var isValueLessThenMinValue = value > minValue;

        return isValueMoreThenMaxValue && isValueLessThenMinValue;
    }
}
