﻿using Belaz.WeldingApp.WeldingApi.Contracts.Requests.Common;
using Belaz.WeldingApp.WeldingApi.Contracts.Responses.Inspector;
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
public class InspectorController : ControllerBase
{
    private readonly IInspectorManager _inspectorManager;

    public InspectorController(IInspectorManager inspectorManager)
    {
        _inspectorManager = inspectorManager;
    }

    [HttpGet]
    [AuthorizeRoles(Role.Admin, Role.Master, Role.TechUser)]
    [ProducesResponseType(typeof(IEnumerable<InspectorDto>), StatusCodes.Status200OK)]
    public async Task<ActionResult<IEnumerable<InspectorDto>>> GetAllWeldersAsync()
    {
        return await _inspectorManager.GetAllAsync();
    }
    
    [HttpPost]
    [AuthorizeRoles(Role.Admin,Role.Master,Role.TechUser)]
    [ProducesResponseType(typeof(InspectorDto), StatusCodes.Status200OK)]
    public async Task<ActionResult<InspectorDto?>> CreateAsync([FromBody] CreateUserRequest request)
    {
        return await _inspectorManager.CreateAsync(request);
    }
    
    [HttpPut]
    [AuthorizeRoles(Role.Admin,Role.Master,Role.TechUser)]
    [ProducesResponseType(typeof(InspectorDto), StatusCodes.Status200OK)]
    public async Task<ActionResult<InspectorDto?>> UpdateAsync([FromBody] UpdateUserRequest request)
    {
        return await _inspectorManager.UpdateAsync(request);
    }
}