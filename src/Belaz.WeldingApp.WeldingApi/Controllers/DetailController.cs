using Belaz.WeldingApp.WeldingApi.Contracts.Responses;
using Belaz.WeldingApp.WeldingApi.Managers.Interfaces;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using WeldingApp.Common.Attributes;
using WeldingApp.Common.Enums;

namespace Belaz.WeldingApp.WeldingApi.Controllers;

[ApiController]
[Route("api/[controller]")]
[Authorize(AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
public class DetailController
{
    private readonly IProductManager _productManager;

    public DetailController(IProductManager productManager)
    {
        _productManager = productManager;
    }
    
    [HttpGet("byControlSubject/{isControlSubject}")]
    [AuthorizeRoles(Role.Admin,Role.Master,Role.TechUser)]
    [ProducesResponseType(typeof(ProductDto), StatusCodes.Status200OK)]
    public async Task<ActionResult<IEnumerable<ProductDto>>> GetAllByControlSubject([FromRoute] bool isControlSubject)
    {
        return await _productManager.GetAllByControlSubject(isControlSubject, ProductType.Detail);
    }
    
    [HttpGet("{id}")]
    [AuthorizeRoles(Role.Admin,Role.Master,Role.TechUser)]
    [ProducesResponseType(typeof(ProductDto), StatusCodes.Status200OK)]
    public async Task<ActionResult<ProductDto?>> GetAllByControlSubject([FromRoute] Guid id)
    {
        return await _productManager.GetByIdAsync(id);
    }
    
    [HttpGet("byStatus/{status}")]
    [AuthorizeRoles(Role.Admin,Role.Master,Role.TechUser)]
    [ProducesResponseType(typeof(IEnumerable<ProductDto>), StatusCodes.Status200OK)]
    public async Task<ActionResult<IEnumerable<ProductDto>>> GetAllByTaskStatusAsync([FromRoute] Status status)
    {
        return await _productManager.GetAllByWeldingTaskStatus(status, ProductType.Detail);
    }
}