namespace Belaz.WeldingApp.IntegrationApi.Contracts.Responses.ProductionArea;

public class ProductionAreaDto
{
    public string Name { get; set; }

    public int Number { get; set; }

    public Guid WorkshopId { get; set; }
}
