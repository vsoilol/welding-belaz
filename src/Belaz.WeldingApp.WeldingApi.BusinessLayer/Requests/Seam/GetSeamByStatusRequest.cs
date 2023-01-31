using WeldingApp.Common.Enums;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.Seam;

public class GetSeamByStatusRequest
{
    public ProductStatus Status { get; set; }
}