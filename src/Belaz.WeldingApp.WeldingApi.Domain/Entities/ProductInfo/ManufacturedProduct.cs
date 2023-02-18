using System.ComponentModel.DataAnnotations.Schema;
using Belaz.WeldingApp.WeldingApi.Domain.Entities.Production;
using Belaz.WeldingApp.WeldingApi.Domain.Entities.Users;

namespace Belaz.WeldingApp.WeldingApi.Domain.Entities.ProductInfo;

public class ManufacturedProduct : Entity
{
    public int AmountFromPlan { get; set; }

    public DateTime DateFromPlan { get; set; }

    public List<ResultProduct> ResultProducts { get; set; } = null!;

    public Guid ProductId { get; set; }

    [ForeignKey(nameof(ProductId))] public Product Product { get; set; } = null!;

    public Guid? MasterId { get; set; }

    [ForeignKey(nameof(MasterId))] public Master? Master { get; set; }

    public Guid? InspectorId { get; set; }

    [ForeignKey(nameof(InspectorId))] public Inspector? Inspector { get; set; }

    public List<Welder> Welders { get; set; } = null!;

    public Guid WorkshopId { get; set; }

    [ForeignKey(nameof(WorkshopId))] 
    public Workshop Workshop { get; set; } = null!;
}