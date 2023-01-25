using Belaz.WeldingApp.WeldingApi.DataLayer.Repositories.Interfaces;
using Belaz.WeldingApp.WeldingApi.Domain.Dtos.ProductioArea;
using Microsoft.AspNetCore.Mvc;

namespace Belaz.WeldingApp.WeldingApi.Controllers;

[ApiController]
[Route("api/[controller]")]
public class ProductionAreaController : ControllerBase
{
    private readonly IProductionAreaRepository _productionAreaManager;

    public ProductionAreaController(IProductionAreaRepository productionAreaManager)
    {
        _productionAreaManager = productionAreaManager;
    }

    [HttpGet]
    public async Task<ActionResult<IEnumerable<ProductionAreaDto>>> GetAllAsync()
    {
        return await _productionAreaManager.GetAllAsync();
    }
}