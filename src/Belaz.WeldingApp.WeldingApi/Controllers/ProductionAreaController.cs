using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.ProductionArea;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Services.Interfaces;
using Belaz.WeldingApp.WeldingApi.Domain.Dtos.ProductionArea;
using Belaz.WeldingApp.WeldingApi.Extensions;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using WeldingApp.Common.Attributes;
using WeldingApp.Common.Enums;

namespace Belaz.WeldingApp.WeldingApi.Controllers;

[ApiController]
[Route("api/[controller]")]
[Authorize(AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
[AuthorizeRoles(Role.Admin, Role.Master, Role.TechUser)]
public class ProductionAreaController : ControllerBase
{
    private readonly IProductionAreaService _productionAreaService;

    public ProductionAreaController(IProductionAreaService productionAreaService)
    {
        _productionAreaService = productionAreaService;
    }

    [HttpGet]
    [ProducesResponseType(typeof(IEnumerable<ProductionAreaDto>), StatusCodes.Status200OK)]
    public async Task<ActionResult<IEnumerable<ProductionAreaDto>>> GetAllAsync()
    {
        return await _productionAreaService.GetAllAsync();
    }

    [HttpGet("{id}")]
    [ProducesResponseType(typeof(ProductionAreaDto), StatusCodes.Status200OK)]
    public async Task<ActionResult<ProductionAreaDto>> GetByIdAsync([FromRoute] Guid id)
    {
        var result = await _productionAreaService.GetByIdAsync(new GetProductionAreaByIdRequest { Id = id });
        return result.ToOk();
    }

    [HttpPost]
    [ProducesResponseType(typeof(ProductionAreaDto), StatusCodes.Status200OK)]
    public async Task<ActionResult<ProductionAreaDto>> CreateAsync([FromBody] CreateProductionAreaRequest request)
    {
        var result = await _productionAreaService.CreateAsync(request);
        return result.ToOk();
    }

    [HttpPut]
    [ProducesResponseType(typeof(ProductionAreaDto), StatusCodes.Status200OK)]
    public async Task<ActionResult<ProductionAreaDto>> UpdateAsync([FromBody] UpdateProductionAreaRequest request)
    {
        var result = await _productionAreaService.UpdateAsync(request);
        return result.ToOk();
    }
}