namespace Belaz.WeldingApp.FileApi.BusinessLayer.Models;

public class ProductAccountUpdateInfo
{
    public Guid ProductId { get; set; }

    /// <summary>
    /// План
    /// </summary>
    public int AmountFromPlan { get; set; }

    /// <summary>
    /// Дата
    /// </summary>
    public DateTime Date { get; set; }
}