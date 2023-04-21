using AutoMapper;
using Belaz.WeldingApp.Common.Enums;
using Belaz.WeldingApp.RegistarApi.Domain.Dtos;
using Belaz.WeldingApp.Common.Entities.ProductInfo;
using Belaz.WeldingApp.Common.Entities.TaskInfo;

namespace Belaz.WeldingApp.RegistarApi.Domain.Converters;

public class WeldingTaskToDtoConverter : ITypeConverter<WeldingTask, WeldingTaskDto>
{
    private readonly IMapper _mapper;

    public WeldingTaskToDtoConverter(IMapper mapper)
    {
        _mapper = mapper;
    }

    public WeldingTaskDto Convert(
        WeldingTask source,
        WeldingTaskDto destination,
        ResolutionContext context
    )
    {
        destination ??= new WeldingTaskDto();

        destination.Id = source.Id;
        destination.Number = source.Number;

        MapRelatedEntities(source, destination);

        return destination;
    }

    private void MapRelatedEntities(WeldingTask source, WeldingTaskDto destination)
    {
        destination.TechnologicalInstruction = _mapper.Map<TechnologicalInstructionDto>(
            source.SeamAccount.Seam.TechnologicalInstruction
        );
        destination.TechnologicalProcess = _mapper.Map<TechnologicalProcessDto>(
            source.SeamAccount.Seam.Product.TechnologicalProcess
        );
        destination.WeldPassageInstructions = _mapper.Map<List<WeldPassageInstructionDto>>(
            source.SeamAccount.Seam.TechnologicalInstruction!.WeldPassageInstructions.OrderBy(
                _ => _.Number
            )
        );

        var seamDto = _mapper.Map<SeamDto>(source.SeamAccount.Seam);

        MapProductsToSeam(source.SeamAccount.Seam, seamDto);

        destination.Seam = seamDto;
    }

    private void MapProductsToSeam(Seam seam, SeamDto seamDto)
    {
        var products = GetSeamProducts(seam);

        if (products.Product != null)
        {
            seamDto.Product = _mapper.Map<ProductDto>(products.Product);
        }

        if (products.Knot != null)
        {
            seamDto.Knot = _mapper.Map<ProductDto>(products.Knot);
        }

        if (products.Detail != null)
        {
            seamDto.Detail = _mapper.Map<ProductDto>(products.Detail);
        }
    }

    private (Product? Product, Product? Knot, Product? Detail) GetSeamProducts(Seam seam)
    {
        var product = GetProductByTypeInHierarchy(seam.Product, ProductType.Product);
        var knot = GetProductByTypeInHierarchy(seam.Product, ProductType.Knot);
        var detail = GetProductByTypeInHierarchy(seam.Product, ProductType.Detail);

        return (product, knot, detail);
    }

    private Product? GetProductByTypeInHierarchy(Product? product, ProductType type)
    {
        while (product?.ProductType != type && product?.ProductMain?.MainProduct != null)
        {
            product = product.ProductMain.MainProduct;
        }

        return product?.ProductType == type ? product : null;
    }
}
