﻿using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.Product;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Services.Interfaces;
using Belaz.WeldingApp.WeldingApi.Domain.Dtos.Product;
using Belaz.WeldingApp.WeldingApi.Extensions;
using LanguageExt;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using WeldingApp.Common.Attributes;
using WeldingApp.Common.Enums;

namespace Belaz.WeldingApp.WeldingApi.Controllers;

[ApiController]
[Authorize(AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
[AuthorizeRoles(Role.Admin, Role.Master, Role.TechUser)]
public abstract class CommonProductController : ControllerBase
{
    private readonly IProductService _productService;
    private readonly ProductType _type;

    protected CommonProductController(IProductService productService, ProductType type)
    {
        _productService = productService;
        _type = type;
    }

    [HttpGet("byControlSubject/{isControlSubject}")]
    [ProducesResponseType(typeof(List<ProductDto>), StatusCodes.Status200OK)]
    public async Task<ActionResult<List<ProductDto>>> GetAllByControlSubjectAsync([FromRoute] bool isControlSubject)
    {
        var result = await _productService.GetAllByControlSubjectAsync(
            new GetAllByControlSubjectRequest
            {
                IsControlSubject = isControlSubject,
                Type = _type
            });
        return result.ToOk();
    }

    [HttpGet("{id}")]
    [ProducesResponseType(typeof(ProductDto), StatusCodes.Status200OK)]
    public async Task<ActionResult<ProductDto>> GetByIdAsync([FromRoute] Guid id)
    {
        var result = await _productService.GetByIdAsync(new GetProductByIdRequest { Id = id });
        return result.ToOk();
    }

    /// <summary>
    /// Gets all products by status
    /// </summary>
    /// <param name="status">1 - Не изготовлен, 2 - Изготовлен, но не принят или не проверен, 3 - Принят, 4 - Забракован</param>
    [HttpGet("byStatus/{status}")]
    [ProducesResponseType(typeof(List<ProductDto>), StatusCodes.Status200OK)]
    public async Task<ActionResult<List<ProductDto>>> GetAllByStatusAsync([FromRoute] ProductStatus status)
    {
        var result = await _productService.GetAllByStatusAsync(
            new GetAllByTaskStatusRequest
            {
                Status = status,
                Type = _type
            });
        return result.ToOk();
    }

    [HttpPost]
    [ProducesResponseType(typeof(ProductDto), StatusCodes.Status200OK)]
    public async Task<ActionResult<ProductDto>> CreateAsync([FromBody] CreateProductWithoutTypeRequest request)
    {
        var result = await _productService.CreateAsync(new CreateProductRequest
        {
            Request = request,
            Type = _type
        });
        return result.ToOk();
    }

    [HttpPut]
    [ProducesResponseType(typeof(ProductDto), StatusCodes.Status200OK)]
    public async Task<ActionResult<ProductDto>> UpdateAsync([FromBody] UpdateProductWithoutTypeRequest request)
    {
        var result = await _productService.UpdateAsync(new UpdateProductRequest
        {
            Request = request,
            Type = _type
        });
        return result.ToOk();
    }

    [HttpGet("byInspector/{inspectorId}")]
    [ProducesResponseType(typeof(List<ProductDto>), StatusCodes.Status200OK)]
    public async Task<ActionResult<List<ProductDto>>> GetAllByInspectorIdAsync([FromRoute] Guid inspectorId)
    {
        var result = await _productService.GetAllByInspectorIdAsync(
            new GetAllByInspectorIdRequest
            {
                InspectorId = inspectorId,
                Type = _type
            });
        return result.ToOk();
    }

    [HttpGet("byMaster/{masterId}")]
    [ProducesResponseType(typeof(List<ProductDto>), StatusCodes.Status200OK)]
    public async Task<ActionResult<List<ProductDto>>> GetAllByMasterIdAsync([FromRoute] Guid masterId)
    {
        var result = await _productService.GetAllByMasterIdAsync(
            new GetAllByMasterIdRequest
            {
                MasterId = masterId,
                Type = _type
            });
        return result.ToOk();
    }

    [HttpPut("assignInspector")]
    public async Task<ActionResult<Unit>> AssignProductToInspectorAsync(
        [FromBody] AssignProductToInspectorRequest request)
    {
        var result = await _productService.AssignProductToInspectorAsync(request);
        return result.ToOk();
    }

    [HttpPut("assignMaster")]
    public async Task<ActionResult<Unit>> AssignProductToMasterAsync([FromBody] AssignProductToMasterRequest request)
    {
        var result = await _productService.AssignProductToMasterAsync(request);
        return result.ToOk();
    }

    [HttpPut("changeStatus")]
    [ProducesResponseType(typeof(ProductDto), StatusCodes.Status200OK)]
    public async Task<ActionResult<ProductDto>> ChangeStatusAsync([FromBody] ChangeProductStatusRequest request)
    {
        var result = await _productService.ChangeStatusAsync(request);
        return result.ToOk();
    }
}