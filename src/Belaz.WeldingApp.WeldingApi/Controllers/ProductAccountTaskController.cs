using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.ProductAccountTask;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Services.Interfaces;
using Belaz.WeldingApp.WeldingApi.Domain.Dtos.ProductAccount;
using Belaz.WeldingApp.WeldingApi.Extensions;
using LanguageExt;
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

    [HttpPut("assign-equipments")]
    public async Task<ActionResult<Unit>> AssignProductAccountTaskToWeldingEquipmentsAsync(
        [FromBody] AssignProductAccountTaskToWeldingEquipmentsRequest request
    )
    {
        var result = await _productAccountTaskService.AssignProductAccountTaskToWeldingEquipmentsAsync(
            request
        );

        return result.ToOk();
    }

    [HttpPut("update-welding-end-date")]
    [ProducesResponseType(typeof(ProductAccountTaskDto), StatusCodes.Status200OK)]
    public async Task<ActionResult<ProductAccountTaskDto>> ChangeEndWeldingDateAsync(
        [FromBody] ChangeEndWeldingDateRequest request)
    {
        var result = await _productAccountTaskService.ChangeEndWeldingDateAsync(request);
        return result.ToOk();
    }

    [HttpPut("manufactured-amount")]
    [ProducesResponseType(typeof(ProductAccountTaskDto), StatusCodes.Status200OK)]
    public async Task<ActionResult<ProductAccountTaskDto>> ChangeManufacturedAmountAsync(
        [FromBody] ChangeManufacturedAmountRequest request
    )
    {
        var result = await _productAccountTaskService.ChangeManufacturedAmountAsync(request);

        return result.ToOk();
    }

    [HttpPut("update-defective-amount")]
    [ProducesResponseType(typeof(ProductAccountTaskDto), StatusCodes.Status200OK)]
    public async Task<ActionResult<ProductAccountTaskDto>> ChangeDefectiveAmountAsync(
        [FromBody] ChangeDefectiveAmountRequest request)
    {
        var result = await _productAccountTaskService.ChangeDefectiveAmountAsync(request);
        return result.ToOk();
    }
    
    [HttpPut("update-welding-material")]
    [ProducesResponseType(typeof(ProductAccountTaskDto), StatusCodes.Status200OK)]
    public async Task<ActionResult<ProductAccountTaskDto>> UpdateWeldingMaterialInfoAsync(
        [FromBody] UpdateWeldingMaterialInfoRequest request)
    {
        var result = await _productAccountTaskService.UpdateWeldingMaterialInfoAsync(request);
        return result.ToOk();
    }
}