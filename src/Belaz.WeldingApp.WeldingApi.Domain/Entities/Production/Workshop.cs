using Belaz.WeldingApp.WeldingApi.Domain.Entities.Users;

namespace Belaz.WeldingApp.WeldingApi.Domain.Entities.Production;

/// <summary>
/// Цех
/// </summary>
public class Workshop : Entity
{
    public string Name { get; set; } = null!;

    public int Number { get; set; }

    public List<ProductionArea> ProductionAreas { get; set; } = null!;

    public List<Chief> Chiefs { get; set; } = null!;
}