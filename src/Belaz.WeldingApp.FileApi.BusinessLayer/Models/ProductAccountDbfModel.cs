namespace Belaz.WeldingApp.FileApi.BusinessLayer.Models;

public class ProductAccountDbfModel
{
    public string? ProductIndex { get; set; }

    public string? DetailNumber { get; set; }

    public string? Suffix { get; set; }

    public DateTime Date { get; set; }
    
    public int AmountFromPlan { get; set; }
}