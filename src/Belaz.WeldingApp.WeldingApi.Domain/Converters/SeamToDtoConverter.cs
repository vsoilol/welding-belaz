using AutoMapper;
using Belaz.WeldingApp.WeldingApi.Domain.Dtos.Product;
using Belaz.WeldingApp.WeldingApi.Domain.Dtos.ProductionArea;
using Belaz.WeldingApp.WeldingApi.Domain.Dtos.Seam;
using Belaz.WeldingApp.WeldingApi.Domain.Dtos.TechnologicalInstruction;
using Belaz.WeldingApp.WeldingApi.Domain.Dtos.TechnologicalProcess;
using Belaz.WeldingApp.WeldingApi.Domain.Dtos.Workshop;
using Belaz.WeldingApp.WeldingApi.Domain.Entities.ProductInfo;
using WeldingApp.Common.Enums;

namespace Belaz.WeldingApp.WeldingApi.Domain.Converters;

public class SeamToDtoConverter : ITypeConverter<Seam, SeamDto>
{
    private readonly IMapper _mapper;

    public SeamToDtoConverter(IMapper mapper)
    {
        _mapper = mapper;
    }

    public SeamDto Convert(Seam source, SeamDto destination, ResolutionContext context)
    {
        destination ??= new SeamDto();

        destination.Id = source.Id;
        destination.IdFromSystem = source.IdFromSystem;
        destination.Number = source.Number;
        destination.Length = source.Length;
        destination.IsPerformed = source.IsPerformed;
        destination.IsControlSubject = source.IsControlSubject;

        destination.TechnologicalInstruction = _mapper.Map<TechnologicalInstructionBriefDto>(
            source.TechnologicalInstruction
        );
        destination.TechnologicalProcess = _mapper.Map<TechnologicalProcessBriefDto>(
            source.Product.TechnologicalProcess
        );
        destination.Workshop = _mapper.Map<WorkshopBriefDto>(source.ProductionArea!.Workshop);
        destination.ProductionArea = _mapper.Map<ProductionAreaBriefDto>(source.ProductionArea);

        SetProductsToSeam(source, destination);

        return destination;
    }

    private void SetProductsToSeam(Seam seam, SeamDto seamDto)
    {
        var seamProducts = GetSeamProducts(seam).Where(_ => _ is not null);

        foreach (var product in seamProducts)
        {
            switch (product!.ProductType)
            {
                case ProductType.Product:
                    seamDto.Product = _mapper.Map<MainProductDto>(product);
                    break;

                case ProductType.Knot:
                    seamDto.Knot = _mapper.Map<MainProductDto>(product);
                    break;

                case ProductType.Detail:
                    seamDto.Detail = _mapper.Map<MainProductDto>(product);
                    break;
            }
        }
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
}
