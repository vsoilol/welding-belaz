using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;

namespace Belaz.WeldingApp.Common.Entities;

[Index(nameof(RfidTag), IsUnique = true)]
public abstract class EntityWithRfidTag : Entity
{
    /// <summary>
    /// RFID-метка
    /// </summary>
    public string? RfidTag { get; set; }
}
