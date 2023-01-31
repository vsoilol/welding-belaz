﻿using Belaz.WeldingApp.WeldingApi.Domain.Dtos.Product;
using Belaz.WeldingApp.WeldingApi.Domain.Entities.ProductInfo;
using WeldingApp.Common.Enums;

namespace Belaz.WeldingApp.WeldingApi.DataLayer.Repositories.Interfaces;

public interface IProductRepository
{
    Task<List<ProductDto>> GetAllByStatusAsync(ProductStatus status, ProductType productType);

    Task<List<ProductDto>> GetAllByControlSubjectAsync(bool isControlSubject, ProductType productType);

    Task<ProductDto> GetByIdAsync(Guid id);
    
    Task<ProductDto> ChangeStatusAsync(Guid id, ProductStatus status, bool isAddManually);

    Task<List<ProductDto>> GetAllByMasterIdAsync(Guid masterId, ProductType productType);

    Task<List<ProductDto>> GetAllByInspectorIdAsync(Guid inspectorId, ProductType productType);

    Task<ProductDto> CreateAsync(Product entity, IReadOnlyList<Guid>? seamIds, IReadOnlyList<Guid>? insideProductIds);

    Task<ProductDto> UpdateAsync(Product entity, IReadOnlyList<Guid>? seamIds, IReadOnlyList<Guid>? insideProductIds);

    Task AssignProductToMasterAsync(Guid productId, Guid masterId);

    Task AssignProductToInspectorAsync(Guid productId, Guid inspectorId);
}