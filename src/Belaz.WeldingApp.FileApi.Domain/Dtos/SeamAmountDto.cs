namespace Belaz.WeldingApp.FileApi.Domain.Dtos;

public class SeamAmountDto
{
    /// <summary>
    /// Количество швов, проконтролированных регистратором
    /// </summary>
    public int NumControlledRegistrar { get; set; }

    /// <summary>
    /// Количество швов, добавленных вручную
    /// </summary>
    public int NumAddedManually { get; set; }

    /// <summary>
    /// Количество швов с отклонениями от нормативных параметров режима сварки
    /// </summary>
    public int NumDeviantWelding { get; set; }

    /// <summary>
    /// Количество забракованных швов среди проконтролированных регистратором
    /// </summary>
    public int NumRejectedRegistrar { get; set; }

    /// <summary>
    /// Количество забракованных швов среди добавленных вручную
    /// </summary>
    public int NumRejectedManually { get; set; }
}
