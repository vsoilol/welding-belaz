namespace Belaz.WeldingApp.FileApi.Domain.Dtos;

public class WelderOperationTimeDto
{
    /// <summary>
    /// Подготовка к сварке
    /// </summary>
    public double WeldingPreparationTimeMinutes { get; set; }

    /// <summary>
    /// СВАРКА
    /// </summary>
    public double WorkTimeMinutes { get; set; }

    /// <summary>
    /// Вынужденный простой
    /// </summary>
    public double DowntimeMinutes { get; set; }

    /// <summary>
    /// Средняя оценка за период
    /// </summary>
    public double AverageEstimation { get; set; }
}
