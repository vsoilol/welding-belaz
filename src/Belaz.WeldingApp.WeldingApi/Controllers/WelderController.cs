﻿using Belaz.WeldingApp.WeldingApi.Contracts.Requests.Welder;
using Belaz.WeldingApp.WeldingApi.Contracts.Responses.Welder;
using Belaz.WeldingApp.WeldingApi.Managers.Interfaces;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using WeldingApp.Common.Attributes;
using WeldingApp.Common.Enums;

namespace Belaz.WeldingApp.WeldingApi.Controllers;

[Route("api/[controller]")]
[ApiController]
[Authorize(AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
public class WelderController : ControllerBase
{
    private readonly IWelderManager _welderManager;

    public WelderController(IWelderManager welderManager)
    {
        _welderManager = welderManager;
    }

    [HttpGet]
    [AuthorizeRoles(Role.Admin, Role.Master, Role.TechUser)]
    [ProducesResponseType(typeof(IEnumerable<WelderDto>), StatusCodes.Status200OK)]
    public async Task<ActionResult<IEnumerable<WelderDto>>> GetAllWeldersAsync()
    {
        return await _welderManager.GetAllAsync();
    }
    
    [HttpPost]
    [AuthorizeRoles(Role.Admin,Role.Master,Role.TechUser)]
    [ProducesResponseType(typeof(WelderDto), StatusCodes.Status200OK)]
    public async Task<ActionResult<WelderDto?>> CreateAsync([FromBody] CreateWelderRequest request)
    {
        return await _welderManager.CreateAsync(request);
    }
    
    [HttpPut]
    [AuthorizeRoles(Role.Admin,Role.Master,Role.TechUser)]
    [ProducesResponseType(typeof(WelderDto), StatusCodes.Status200OK)]
    public async Task<ActionResult<WelderDto?>> UpdateAsync([FromBody] UpdateWelderRequest request)
    {
        return await _welderManager.UpdateAsync(request);
    }
}
