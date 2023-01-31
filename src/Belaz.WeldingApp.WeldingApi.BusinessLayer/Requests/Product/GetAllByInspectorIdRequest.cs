using WeldingApp.Common.Enums;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.Product;

public class GetAllByInspectorIdRequest
{
    public Guid InspectorId { get; set; }
    
    public ProductType Type { get; set; }
}