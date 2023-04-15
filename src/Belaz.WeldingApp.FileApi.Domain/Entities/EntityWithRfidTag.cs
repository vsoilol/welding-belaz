using Microsoft.EntityFrameworkCore;

namespace Belaz.WeldingApp.FileApi.Domain.Entities;

[Index(nameof(RfidTag), IsUnique = true)]
public abstract class EntityWithRfidTag : Entity
{
    /// <summary>
    /// RFID-метка
    /// </summary>
    public string? RfidTag { get; set; }
}
