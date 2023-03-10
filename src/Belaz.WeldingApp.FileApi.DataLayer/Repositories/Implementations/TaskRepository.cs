using AutoMapper;
using AutoMapper.QueryableExtensions;
using Belaz.WeldingApp.FileApi.DataLayer.Repositories.Interfaces;
using Belaz.WeldingApp.FileApi.Domain.Dtos.SeamPassportInfo;
using Belaz.WeldingApp.FileApi.Domain.Entities.ProductInfo;
using Microsoft.EntityFrameworkCore;
using WeldingApp.Common.Enums;

namespace Belaz.WeldingApp.FileApi.DataLayer.Repositories.Implementations;

public class TaskRepository : ITaskRepository
{
    private readonly ApplicationContext _context;
    private readonly IMapper _mapper;

    public TaskRepository(ApplicationContext context, IMapper mapper)
    {
        _context = context;
        _mapper = mapper;
    }

    public async Task<TaskDto> GetByIdAsync(Guid id)
    {
        var task = (
            await _context.WeldingTasks
                .Where(_ => _.Id == id)
                .ProjectTo<TaskDto>(_mapper.ConfigurationProvider)
                .FirstOrDefaultAsync()
        )!;

        var seamProducts = (await GetSeamProductsAsync(id)).Where(_ => _ is not null);
        SetProductsToSeam(task.Seam, seamProducts!);

        return task;
    }

    private async Task<List<Product?>> GetSeamProductsAsync(Guid weldingTaskId)
    {
        var seamProduct = (
            await _context.WeldingTasks
                .Include(_ => _.SeamAccount.Seam.Product)
                .FirstOrDefaultAsync(_ => _.Id == weldingTaskId)
        )!
            .SeamAccount
            .Seam
            .Product;

        var secondSeamProduct = await GetMainProductByChildAsync(seamProduct);
        var thirdSeamProduct = await GetMainProductByChildAsync(secondSeamProduct);

        return new List<Product?> { seamProduct, secondSeamProduct, thirdSeamProduct };
    }

    private async Task<Product?> GetMainProductByChildAsync(Product? childProduct)
    {
        if (childProduct is null || childProduct.ProductType == ProductType.Product)
        {
            return null;
        }

        return await _context.Products.FirstOrDefaultAsync(
            _ => _.ProductInsides.Any(inside => inside.InsideProductId == childProduct.Id)
        );
    }

    private void SetProductsToSeam(SeamDto seam, IEnumerable<Product> products)
    {
        foreach (var product in products)
        {
            switch (product.ProductType)
            {
                case ProductType.Product:
                    seam.Product = _mapper.Map<ProductBriefDto>(product);
                    break;

                case ProductType.Knot:
                    seam.Knot = _mapper.Map<ProductBriefDto>(product);
                    break;

                case ProductType.Detail:
                    seam.Detail = _mapper.Map<ProductBriefDto>(product);
                    break;
            }
        }
    }
}
