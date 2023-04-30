using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.ProductionArea;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Services.Interfaces;
using Belaz.WeldingApp.WeldingApi.Domain.Dtos.ProductionArea;
using Belaz.WeldingApp.WeldingApi.Extensions;
using LanguageExt;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Belaz.WeldingApp.Common.Attributes;
using Belaz.WeldingApp.Common.Enums;
using Belaz.WeldingApp.WeldingApi.Contracts;

namespace Belaz.WeldingApp.WeldingApi.Controllers;

[ApiController]
[Route("api/[controller]")]
[Authorize(AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
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
        var result = await _productionAreaService.GetAllAsync();

        HttpContext.Items[ContextItems.LogMessage] = result.LogMessage;

        return result.Result;
    }

    [HttpGet("{id}")]
    [ProducesResponseType(typeof(ProductionAreaDto), StatusCodes.Status200OK)]
    public async Task<ActionResult<ProductionAreaDto>> GetByIdAsync([FromRoute] Guid id)
    {
        var result = await _productionAreaService.GetByIdAsync(
            new GetProductionAreaByIdRequest { Id = id }
        );
        
        HttpContext.Items[ContextItems.LogMessage] = result.LogMessage;

        return result.Result.ToOk();
    }

    [HttpPost]
    [ProducesResponseType(typeof(ProductionAreaDto), StatusCodes.Status200OK)]
    public async Task<ActionResult<ProductionAreaDto>> CreateAsync(
        [FromBody] CreateProductionAreaRequest request
    )
    {
        var result = await _productionAreaService.CreateAsync(request);
        return result.ToOk(_ =>
        {
            HttpContext.Items[ContextItems.LogMessage] =
                $"Создание производственного участка. Номер: {_.Number}, Наименование: {_.Name}";
        });
    }

    [HttpPut]
    [ProducesResponseType(typeof(ProductionAreaDto), StatusCodes.Status200OK)]
    public async Task<ActionResult<ProductionAreaDto>> UpdateAsync(
        [FromBody] UpdateProductionAreaRequest request
    )
    {
        var result = await _productionAreaService.UpdateAsync(request);
        return result.ToOk(_ =>
        {
            HttpContext.Items[ContextItems.LogMessage] =
                $"Обновление производственного участка. Номер: {_.Number}, Наименование: {_.Name}";
        });
    }

    [HttpDelete("{id}")]
    public async Task<ActionResult> DeleteAsync([FromRoute] Guid id)
    {
        var result = await _productionAreaService.DeleteAsync(
            new DeleteProductionAreaRequest { Id = id }
        );

        return result.ToEmptyOk(_ =>
        {
            HttpContext.Items[ContextItems.LogMessage] =
                $"Удаление производственного участка. Номер: {_.Number}, Наименование: {_.Name}";
        });
    }
}