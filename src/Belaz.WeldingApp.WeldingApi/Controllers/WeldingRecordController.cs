using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.WeldingRecord;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Services.Interfaces;
using Belaz.WeldingApp.WeldingApi.Domain.Dtos;
using Belaz.WeldingApp.WeldingApi.Extensions;
using LanguageExt;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using WeldingApp.Common.Attributes;
using WeldingApp.Common.Enums;

namespace Belaz.WeldingApp.WeldingApi.Controllers;

[ApiController]
[Route("api/[controller]")]
[Authorize(AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
[AuthorizeRoles(Role.Admin, Role.Master, Role.Inspector, Role.Welder, Role.Chief)]
public class WeldingRecordController : ControllerBase
{
    private readonly IWeldingRecordService _weldingRecordService;

    public WeldingRecordController(IWeldingRecordService weldingRecordService)
    {
        _weldingRecordService = weldingRecordService;
    }

    [HttpGet]
    [ProducesResponseType(typeof(IEnumerable<RecordDto>), StatusCodes.Status200OK)]
    public async Task<ActionResult<IEnumerable<RecordDto>>> GetAllWeldingEquipmentsAsync()
    {
        return await _weldingRecordService.GetAllAsync();
    }

    [HttpDelete("{id}")]
    public async Task<ActionResult<Unit>> DeleteAsync([FromRoute] Guid id)
    {
        var result = await _weldingRecordService.DeleteAsync(
            new DeleteWeldingRecordRequest { Id = id }
        );
        return result.ToOk();
    }
}
