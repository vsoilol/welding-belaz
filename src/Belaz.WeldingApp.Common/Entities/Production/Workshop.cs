using Belaz.WeldingApp.Common.Entities.Users;

namespace Belaz.WeldingApp.Common.Entities.Production;

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
