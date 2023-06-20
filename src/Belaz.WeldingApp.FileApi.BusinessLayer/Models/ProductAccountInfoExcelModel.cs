namespace Belaz.WeldingApp.FileApi.BusinessLayer.Models;

public class ProductAccountInfoExcelModel
{
    public string ProductIndex { get; set; } = null!;

    public string DetailNumber { get; set; } = null!;

    public string Suffix { get; set; } = null!;

    public DateTime Date { get; set; }

    public int AmountFromPlan { get; set; }
    
    public int AmountAccept { get; set; }
    
    public int AmountDefective { get; set; }
    
    public int AmountManufactured { get; set; }
    
    public string Workshop { get; set; } = null!;
    
    public string ProductionArea { get; set; } = null!;
}