﻿using System.Net;
using Belaz.WeldingApp.WeldingApi.Contracts.Requests.ProductionArea;
using Belaz.WeldingApp.WeldingApi.Contracts.Responses.ProductionArea;
using Belaz.WeldingApp.WeldingApi.Managers.Interfaces;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using WeldingApp.Common.Attributes;
using WeldingApp.Common.Enums;
using BadRequestResult = WeldingApp.Common.Models.BadRequestResult;

namespace Belaz.WeldingApp.WeldingApi.Controllers;

[ApiController]
[Route("api/[controller]")]
[Authorize(AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
public class ProductionAreaController : ControllerBase
{
    private readonly IProductionAreaManager _productionAreaManager;

    public ProductionAreaController(IProductionAreaManager productionAreaManager)
    {
        _productionAreaManager = productionAreaManager;
    }
    
    [HttpGet]
    [AuthorizeRoles(Role.Admin,Role.Master,Role.TechUser)]
    [ProducesResponseType(typeof(IEnumerable<ProductionAreaDto>), StatusCodes.Status200OK)]
    public async Task<ActionResult<IEnumerable<ProductionAreaDto>>> GetAllAsync()
    {
        return await _productionAreaManager.GetAllAsync();
    }
    
    [HttpGet("{id}")]
    [AuthorizeRoles(Role.Admin,Role.Master,Role.TechUser)]
    [ProducesResponseType(typeof(ProductionAreaDto), StatusCodes.Status200OK)]
    public async Task<ActionResult<ProductionAreaDto?>> GetByIdAsync([FromRoute] Guid id)
    {
        return await _productionAreaManager.GetByIdAsync(id);
    }
    
    [HttpPost]
    [AuthorizeRoles(Role.Admin,Role.Master,Role.TechUser)]
    [ProducesResponseType(typeof(ProductionAreaDto), StatusCodes.Status200OK)]
    public async Task<ActionResult<ProductionAreaDto?>> CreateAsync([FromBody] CreateProductionAreaRequest request)
    {
        return await _productionAreaManager.CreateAsync(request);
    }
    
    [HttpPut]
    [AuthorizeRoles(Role.Admin,Role.Master,Role.TechUser)]
    [ProducesResponseType(typeof(ProductionAreaDto), StatusCodes.Status200OK)]
    public async Task<ActionResult<ProductionAreaDto?>> UpdateAsync([FromBody] UpdateProductionAreaRequest request)
    {
        return await _productionAreaManager.UpdateAsync(request);
    }
}