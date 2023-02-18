using System.ComponentModel.DataAnnotations.Schema;
using WeldingApp.Common.Enums;

namespace Belaz.WeldingApp.WeldingApi.Domain.Entities.ProductInfo;

public class ResultProduct : Entity
{
    public int Amount { get; set; }
    
    public ResultProductStatus Status { get; set; }

    public string? Reason { get; set; }

    public string? DetectedDefects { get; set; }
    
    public Guid ManufacturedProductId { get; set; }

    [ForeignKey(nameof(ManufacturedProductId))]
    public ManufacturedProduct ManufacturedProduct { get; set; } = null!;
}