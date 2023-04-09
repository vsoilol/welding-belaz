using AutoMapper;
using Belaz.WeldingApp.WeldingApi.Domain.Mappings;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.Product;

public class UpdateProductWithoutTypeRequest : IMapTo<Domain.Entities.ProductInfo.Product>
{
    public Guid Id { get; set; }

    public string? Name { get; set; }

    public string Number { get; set; } = null!;

    /// <summary>
    /// Подлежит ли контролю
    /// </summary>
    public bool IsControlSubject { get; set; }

    public Guid ProductionAreaId { get; set; }

    public Guid TechnologicalProcessId { get; set; }

    public Guid? MainProductId { get; set; }

    public void Mapping(Profile profile)
    {
        profile
            .CreateMap<UpdateProductWithoutTypeRequest, Domain.Entities.ProductInfo.Product>()
            .ForMember(dto => dto.Seams, opt => opt.Ignore());
    }
}
