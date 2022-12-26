using Belaz.WeldingApp.IntegrationApi.Contracts.Responses.ProductionArea;
using Belaz.WeldingApp.IntegrationApi.IntegrationApi.Interfaces;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using WeldingApp.Common.Attributes;
using WeldingApp.Common.Enums;

namespace Belaz.WeldingApp.IntegrationApi.Controllers;

[ApiController]
[Route("api/[controller]")]
[Authorize(AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
public class ProductionAreaController : ControllerBase
{
    private readonly IProductionAreaIntegrationApi _productionAreaIntegrationApi;

    public ProductionAreaController(IProductionAreaIntegrationApi productionAreaIntegrationApi)
    {
        _productionAreaIntegrationApi = productionAreaIntegrationApi;
    }

    [HttpGet]
    [AuthorizeRoles(Role.Admin,Role.Master,Role.TechUser)]
    [ProducesResponseType(typeof(IEnumerable<ProductionAreaDto>), StatusCodes.Status200OK)]
    public async Task<ActionResult<IEnumerable<ProductionAreaDto>>> GetAllAsync()
    {
        return await _productionAreaIntegrationApi.GetAllAsync();
    }

    [HttpGet("{id}")]
    [AuthorizeRoles(Role.Admin,Role.Master,Role.TechUser)]
    [ProducesResponseType(typeof(ProductionAreaDto), StatusCodes.Status200OK)]
    public async Task<ActionResult<ProductionAreaDto?>> GetByIdAsync([FromRoute] Guid id)
    {
        return await _productionAreaIntegrationApi.GetByIdAsync(id);
    }
}
