using WeldingApp.Common.Enums;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.Product;

public class ChangeProductStatusRequest
{
    public Guid Id { get; set; }

    public ProductStatus Status { get; set; }

    public bool IsAddManually { get; set; }
}