using AutoMapper;
using Belaz.WeldingApp.WeldingApi.Domain.Mappings;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.Product;

public class CreateProductWithoutTypeRequest
    : IMapTo<Belaz.WeldingApp.Common.Entities.ProductInfo.Product>
{
    public string? Name { get; set; }

    public string Number { get; set; } = null!;

    /// <summary>
    /// Подлежит ли контролю
    /// </summary>
    public bool IsControlSubject { get; set; }

    public Guid ProductionAreaId { get; set; }

    public Guid TechnologicalProcessId { get; set; }

    public Guid? MainProductId { get; set; }

    /// <summary>
    /// Норма времени на изготовление
    /// </summary>
    public double ManufacturingTime { get; set; }

    public void Mapping(Profile profile)
    {
        profile
            .CreateMap<
                CreateProductWithoutTypeRequest,
                Belaz.WeldingApp.Common.Entities.ProductInfo.Product
            >()
            .ForMember(dto => dto.Seams, opt => opt.Ignore());
    }
}
