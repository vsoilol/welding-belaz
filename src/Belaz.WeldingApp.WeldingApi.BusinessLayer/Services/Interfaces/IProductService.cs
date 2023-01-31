﻿using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.Product;
using Belaz.WeldingApp.WeldingApi.Domain.Dtos.Product;
using LanguageExt;
using LanguageExt.Common;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Services.Interfaces;

public interface IProductService
{
    Task<Result<List<ProductDto>>> GetAllByStatusAsync(GetAllByTaskStatusRequest request);

    Task<Result<List<ProductDto>>> GetAllByControlSubjectAsync(GetAllByControlSubjectRequest request);

    Task<Result<ProductDto>> GetByIdAsync(GetProductByIdRequest request);

    Task<Result<List<ProductDto>>> GetAllByMasterIdAsync(GetAllByMasterIdRequest request);

    Task<Result<List<ProductDto>>> GetAllByInspectorIdAsync(GetAllByInspectorIdRequest request);

    Task<Result<ProductDto>> CreateAsync(CreateProductRequest request);

    Task<Result<ProductDto>> UpdateAsync(UpdateProductRequest request);

    Task<Result<Unit>> AssignProductToMasterAsync(AssignProductToMasterRequest request);

    Task<Result<Unit>> AssignProductToInspectorAsync(AssignProductToInspectorRequest request);
    
    Task<Result<ProductDto>> ChangeStatusAsync(ChangeProductStatusRequest request);

}