using Belaz.WeldingApp.WeldingApi.Contracts.Requests.ProductInfo;
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
public class DetailController : ControllerBase
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
    
    [HttpPost]
    [AuthorizeRoles(Role.Admin,Role.Master,Role.TechUser)]
    [ProducesResponseType(typeof(ProductDto), StatusCodes.Status200OK)]
    public async Task<ActionResult<ProductDto?>> CreateAsync([FromBody] CreateProductWithoutTypeRequest request)
    {
        var detail = await _productManager.CreateAsync(request, ProductType.Detail);
        return detail;
    }
    
    [HttpPut]
    [AuthorizeRoles(Role.Admin,Role.Master,Role.TechUser)]
    [ProducesResponseType(typeof(ProductDto), StatusCodes.Status200OK)]
    public async Task<ActionResult<ProductDto?>> UpdateAsync([FromBody] UpdateProductWithoutTypeRequest request)
    {
        return await _productManager.UpdateAsync(request, ProductType.Detail);
    }
    
    [HttpGet("byInspector/{inspectorId}")]
    [AuthorizeRoles(Role.Admin,Role.Master,Role.TechUser)]
    [ProducesResponseType(typeof(IEnumerable<ProductDto>), StatusCodes.Status200OK)]
    public async Task<ActionResult<IEnumerable<ProductDto>>> GetAllByInspectorIdAsync([FromRoute] Guid inspectorId)
    {
        return await _productManager.GetAllByInspectorIdAsync(inspectorId, ProductType.Detail);
    }
    
    [HttpGet("byMaster/{masterId}")]
    [AuthorizeRoles(Role.Admin,Role.Master,Role.TechUser)]
    [ProducesResponseType(typeof(IEnumerable<ProductDto>), StatusCodes.Status200OK)]
    public async Task<ActionResult<IEnumerable<ProductDto>>> GetAllByWelderIdAsync([FromRoute] Guid masterId)
    {
        return await _productManager.GetAllByMasterIdAsync(masterId, ProductType.Detail);
    }
}