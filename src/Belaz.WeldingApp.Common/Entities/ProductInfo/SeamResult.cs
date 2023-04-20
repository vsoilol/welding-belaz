using System.ComponentModel.DataAnnotations.Schema;
using Belaz.WeldingApp.Common.Enums;

namespace Belaz.WeldingApp.Common.Entities.ProductInfo;

public class SeamResult : Entity
{
    public int Amount { get; set; }

    public ResultProductStatus Status { get; set; }

    public string? Reason { get; set; }

    public string? DetectedDefects { get; set; }

    public Guid SeamAccountId { get; set; }

    [ForeignKey(nameof(SeamAccountId))]
    public SeamAccount SeamAccount { get; set; } = null!;
}