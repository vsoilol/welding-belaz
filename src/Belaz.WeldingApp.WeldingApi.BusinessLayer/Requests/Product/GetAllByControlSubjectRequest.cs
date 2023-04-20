using Belaz.WeldingApp.Common.Enums;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.Product;

public class GetAllByControlSubjectRequest
{
    public bool IsControlSubject { get; set; }

    public ProductType Type { get; set; }
}