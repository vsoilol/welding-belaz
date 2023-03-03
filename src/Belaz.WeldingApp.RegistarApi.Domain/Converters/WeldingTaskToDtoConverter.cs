using AutoMapper;
using Belaz.WeldingApp.RegistarApi.Domain.Dtos;
using Belaz.WeldingApp.RegistarApi.Domain.Entities.ProductInfo;
using Belaz.WeldingApp.RegistarApi.Domain.Entities.TaskInfo;
using WeldingApp.Common.Enums;

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
        destination.Seam = GetSeamInfo(source);
        destination.TechnologicalInstruction = _mapper.Map<TechnologicalInstructionDto>(
            source.Seam.TechnologicalInstruction
        );
        destination.TechnologicalProcess = _mapper.Map<TechnologicalProcessDto>(
            source.Seam.Product.TechnologicalProcess
        );
        destination.WeldPassageInstructions = _mapper.Map<List<WeldPassageInstructionDto>>(
            source.Seam.TechnologicalInstruction!.WeldPassageInstructions
        );

        return destination;
    }

    private SeamDto GetSeamInfo(WeldingTask source)
    {
        var seam = _mapper.Map<SeamDto>(source.Seam);

        var seamProducts = GetSeamProducts(source.Seam).Where(_ => _ is not null);
        SetProductsToSeam(seam, seamProducts!);

        return seam;
    }

    private List<Product?> GetSeamProducts(Seam seam)
    {
        var seamProduct = seam.Product;

        var secondSeamProduct = GetMainProductByChild(seamProduct);
        var thirdSeamProduct = GetMainProductByChild(secondSeamProduct);

        return new List<Product?> { seamProduct, secondSeamProduct, thirdSeamProduct };
    }

    private Product? GetMainProductByChild(Product? childProduct)
    {
        if (childProduct is null || childProduct.ProductType == ProductType.Product)
        {
            return null;
        }

        return childProduct.ProductMain!.MainProduct;
    }

    private void SetProductsToSeam(SeamDto seam, IEnumerable<Product> products)
    {
        foreach (var product in products)
        {
            switch (product.ProductType)
            {
                case ProductType.Product:
                    seam.Product = _mapper.Map<ProductDto>(product);
                    break;

                case ProductType.Knot:
                    seam.Knot = _mapper.Map<ProductDto>(product);
                    break;

                case ProductType.Detail:
                    seam.Detail = _mapper.Map<ProductDto>(product);
                    break;
            }
        }
    }
}
