using WeldingApp.Common.Enums;

namespace Belaz.WeldingApp.WeldingApi.Domain.Contracts.Responses;

public class ProductBriefDto
{
    public Guid Id { get; set; }

    public string? Name { get; set; }

    public int Number { get; set; }

    public ProductType ProductType { get; set; }
}