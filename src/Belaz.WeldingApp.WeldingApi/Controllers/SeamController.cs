using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.Seam;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Services.Interfaces;
using Belaz.WeldingApp.WeldingApi.Domain.Dtos.Seam;
using Belaz.WeldingApp.WeldingApi.Extensions;
using LanguageExt;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Belaz.WeldingApp.Common.Attributes;
using Belaz.WeldingApp.Common.Enums;
using GetAllByInspectorIdRequest = Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.Seam.GetAllByInspectorIdRequest;

namespace Belaz.WeldingApp.WeldingApi.Controllers;

[ApiController]
[Route("api/[controller]")]
[Authorize(AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
public class SeamController : ControllerBase
{
    private readonly ISeamService _seamService;

    public SeamController(ISeamService seamService)
    {
        _seamService = seamService;
    }

    [HttpGet]
    [ProducesResponseType(typeof(IEnumerable<SeamDto>), StatusCodes.Status200OK)]
    public async Task<ActionResult<IEnumerable<SeamDto>>> GetAllAsync()
    {
        return await _seamService.GetAllAsync();
    }

    [HttpGet("{id}")]
    [ProducesResponseType(typeof(SeamDto), StatusCodes.Status200OK)]
    public async Task<ActionResult<SeamDto>> GetByIdAsync([FromRoute] Guid id)
    {
        var result = await _seamService.GetByIdAsync(new GetSeamByIdRequest { Id = id });
        return result.ToOk();
    }

    [HttpGet("byControlSubject/{isControlSubject}")]
    [ProducesResponseType(typeof(IEnumerable<SeamDto>), StatusCodes.Status200OK)]
    public async Task<ActionResult<IEnumerable<SeamDto>>> GetAllByControlSubjectAsync(
        [FromRoute] bool isControlSubject
    )
    {
        return await _seamService.GetAllByControlSubjectAsync(isControlSubject);
    }

    [HttpPost]
    [ProducesResponseType(typeof(SeamDto), StatusCodes.Status200OK)]
    public async Task<ActionResult<SeamDto>> CreateAsync([FromBody] CreateSeamRequest request)
    {
        var result = await _seamService.CreateAsync(request);
        return result.ToOk();
    }

    [HttpPut]
    [ProducesResponseType(typeof(SeamDto), StatusCodes.Status200OK)]
    public async Task<ActionResult<SeamDto>> UpdateAsync([FromBody] UpdateSeamRequest request)
    {
        var result = await _seamService.UpdateAsync(request);
        return result.ToOk();
    }

    [HttpGet("byInspector/{inspectorId}")]
    [ProducesResponseType(typeof(List<SeamDto>), StatusCodes.Status200OK)]
    public async Task<ActionResult<List<SeamDto>>> GetAllByInspectorIdAsync(
        [FromRoute] Guid inspectorId
    )
    {
        var result = await _seamService.GetAllByInspectorIdAsync(
            new GetAllByInspectorIdRequest { InspectorId = inspectorId }
        );
        return result.ToOk();
    }

    /*
    [HttpPut("assignWelder")]
    public async Task<ActionResult<Unit>> AssignSeamToWelderAsync([FromBody] AssignSeamToWelderRequest request)
    {
        var result = await _seamService.AssignSeamToWelderAsync(request);
        return result.ToOk();
    }*/

    /*[HttpPut("assignInspector")]
    public async Task<ActionResult<Unit>> AssignSeamToInspectorAsync([FromBody] AssignSeamToInspectorRequest request)
    {
        var result = await _seamService.AssignSeamToInspectorAsync(request);
        return result.ToOk();
    }*/

    [HttpPut("assignInspector")]
    public async Task<ActionResult<Unit>> AssignSeamsToInspectorAsync(
        [FromBody] AssignSeamsToInspectorRequest request
    )
    {
        var result = await _seamService.AssignSeamsToInspectorAsync(request);
        return result.ToOk();
    }

    [HttpGet("defective")]
    [ProducesResponseType(typeof(IEnumerable<DefectiveSeamDto>), StatusCodes.Status200OK)]
    public async Task<ActionResult<IEnumerable<DefectiveSeamDto>>> GetAllDefectiveSeamsAsync()
    {
        return await _seamService.GetAllDefectiveSeamsAsync();
    }

    [HttpPost("defective")]
    [ProducesResponseType(typeof(DefectiveSeamDto), StatusCodes.Status200OK)]
    public async Task<ActionResult<DefectiveSeamDto>> AddDefectiveReasonToSeamAsync(
        [FromBody] AddDefectiveReasonToSeamRequest request
    )
    {
        var result = await _seamService.AddDefectiveReasonToSeamAsync(request);
        return result.ToOk();
    }

    [HttpPut("defective")]
    [ProducesResponseType(typeof(DefectiveSeamDto), StatusCodes.Status200OK)]
    public async Task<ActionResult<DefectiveSeamDto>> UpdateDefectiveReasonSeamAsync(
        [FromBody] UpdateDefectiveReasonToSeamRequest request
    )
    {
        var result = await _seamService.UpdateDefectiveReasonSeamAsync(request);
        return result.ToOk();
    }

    [HttpDelete("{id}")]
    public async Task<ActionResult<Unit>> DeleteAsync([FromRoute] Guid id)
    {
        var result = await _seamService.DeleteAsync(new DeleteSeamRequest { Id = id });
        return result.ToOk();
    }
}
