namespace Belaz.WeldingApp.WeldingApi.Domain.Contracts.Responses.Production;

public class ProductionWithNameDto
{
    public Guid Id { get; set; }

    public int Number { get; set; }

    public string Name { get; set; } = null!;
}