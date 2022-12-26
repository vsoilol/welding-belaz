using Belaz.WeldingApp.IntegrationApi.Contracts.Responses.Product;
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
public class ProductController : ControllerBase
{
    private readonly IProductIntegrationApi _productIntegrationApi;

    public ProductController(IProductIntegrationApi productIntegrationApi)
    {
        _productIntegrationApi = productIntegrationApi;
    }

    [HttpGet("byStatus/{status}")]
    [AuthorizeRoles(Role.Admin,Role.Master,Role.TechUser)]
    [ProducesResponseType(typeof(IEnumerable<ProductDto>), StatusCodes.Status200OK)]
    public async Task<ActionResult<IEnumerable<ProductDto>>> GetAllByTaskStatusAsync([FromRoute] Status status)
    {
        return await _productIntegrationApi.GetAllByTaskStatusAsync(status);
    }

    [HttpGet("{id}")]
    [AuthorizeRoles(Role.Admin,Role.Master,Role.TechUser)]
    [ProducesResponseType(typeof(ProductDto), StatusCodes.Status200OK)]
    public async Task<ActionResult<ProductDto?>> GetByIdAsync([FromRoute] Guid id)
    {
        return await _productIntegrationApi.GetByIdAsync(id);
    }
}
