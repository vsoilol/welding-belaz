using Belaz.WeldingApp.WeldingApi.DataLayer.Repositories.Interfaces;
using Belaz.WeldingApp.WeldingApi.Domain.Dtos.WeldingEquipment;
using Microsoft.AspNetCore.Mvc;

namespace Belaz.WeldingApp.WeldingApi.Controllers;

[Route("api/[controller]")]
[ApiController]
public class WeldingEquipmentController : ControllerBase
{
    private readonly IWeldingEquipmentRepository _weldingEquipmentManager;

    public WeldingEquipmentController(IWeldingEquipmentRepository weldingEquipmentManager)
    {
        _weldingEquipmentManager = weldingEquipmentManager;
    }

    [HttpGet]
    public async Task<ActionResult<IEnumerable<WeldingEquipmentDto>>> GetAllWeldingEquipmentsAsync()
    {
        return await _weldingEquipmentManager.GetAllAsync();
    }
}