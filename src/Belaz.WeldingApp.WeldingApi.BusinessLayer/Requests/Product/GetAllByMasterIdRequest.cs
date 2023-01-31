using WeldingApp.Common.Enums;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.Product;

public class GetAllByMasterIdRequest
{
    public Guid MasterId { get; set; }
    
    public ProductType Type { get; set; }
}