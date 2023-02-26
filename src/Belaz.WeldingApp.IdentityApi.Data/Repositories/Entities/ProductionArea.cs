using System.ComponentModel.DataAnnotations.Schema;

namespace Belaz.WeldingApp.IdentityApi.Data.Repositories.Entities;

/// <summary>
/// Производственный участок
/// </summary>
public class ProductionArea : Entity
{
    public string Name { get; set; } = null!;

    public int Number { get; set; }

    public List<UserData> Users { get; set; } = null!;
}
