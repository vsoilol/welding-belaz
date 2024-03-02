using AutoMapper;
using Belaz.WeldingApp.Common.Entities.ProductInfo;
using Belaz.WeldingApp.FileApi.Domain.Mappings;

namespace Belaz.WeldingApp.FileApi.Domain.Dtos;

public class ProductAccountTaskAmountDto : IMapFrom<ProductAccountTask>
{
    public DateTime Date { get; set; }

    public int ManufacturedAmount { get; set; }

    public int AcceptedAmount { get; set; }

    public int DefectiveAmount { get; set; }

    /// <summary>
    ///     Норма времени на изготовление
    /// </summary>
    public double ManufacturingTime { get; set; }

    public Guid ProductId { get; set; }

    public int AmountFromPlan { get; } = 1;

    public void Mapping(Profile profile)
    {
        profile
            .CreateMap<ProductAccountTask, ProductAccountTaskAmountDto>()
            .ForMember(
                dto => dto.Date,
                opt =>
                    opt.MapFrom(x => x.DateFromPlan)
            ).ForMember(
                dto => dto.Date,
                opt =>
                    opt.MapFrom(x => x.DateFromPlan)
            ).ForMember(
                dto => dto.ProductId,
                opt =>
                    opt.MapFrom(x => x.ProductAccount.ProductId)
            )
            .ForMember(
                dto => dto.ManufacturingTime,
                opt =>
                    opt.MapFrom(x => x.ProductAccount.Product.ManufacturingTime)
            );
    }
}