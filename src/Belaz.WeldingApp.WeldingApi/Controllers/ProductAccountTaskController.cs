using Belaz.WeldingApp.WeldingApi.BusinessLayer.Services.Interfaces;
using Belaz.WeldingApp.WeldingApi.Domain.Dtos.ProductAccount;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace Belaz.WeldingApp.WeldingApi.Controllers;

[ApiController]
[Route("api/[controller]")]
[Authorize(AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
public class ProductAccountTaskController : ControllerBase
{
    private IProductAccountTaskService _productAccountTaskService;

    public ProductAccountTaskController(IProductAccountTaskService productAccountTaskService)
    {
        _productAccountTaskService = productAccountTaskService;
    }

    [HttpGet]
    [ProducesResponseType(typeof(List<ProductAccountTaskDto>), StatusCodes.Status200OK)]
    public async Task<ActionResult<List<ProductAccountTaskDto>>> GetAllProductAccountTasksAsync()
    {
        var result = await _productAccountTaskService.GetAllProductAccountTasksAsync();

        return result;
    }
}