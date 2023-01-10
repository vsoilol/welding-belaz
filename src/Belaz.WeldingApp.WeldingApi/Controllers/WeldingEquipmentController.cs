﻿using System.Net;
using AutoMapper;
using Belaz.WeldingApp.WeldingApi.Contracts.Requests.WeldingEquipment;
using Belaz.WeldingApp.WeldingApi.Contracts.Responses.WeldingEquipment;
using Belaz.WeldingApp.WeldingApi.Managers.Interfaces;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using WeldingApp.Common.Attributes;
using WeldingApp.Common.Enums;
using BadRequestResult = WeldingApp.Common.Models.BadRequestResult;

namespace Belaz.WeldingApp.WeldingApi.Controllers;

[Route("api/[controller]")]
[ApiController]
[Authorize(AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
public class WeldingEquipmentController : ControllerBase
{
    private readonly IWeldingEquipmentManager _weldingEquipmentManager;

    public WeldingEquipmentController(IWeldingEquipmentManager weldingEquipmentManager)
    {
        _weldingEquipmentManager = weldingEquipmentManager;
    }

    [HttpGet]
    [AuthorizeRoles(Role.Admin,Role.Master,Role.TechUser)]
    [ProducesResponseType(typeof(IEnumerable<WeldingEquipmentDto>), StatusCodes.Status200OK)]
    public async Task<ActionResult<IEnumerable<WeldingEquipmentDto>>> GetAllWeldingEquipmentsAsync()
    {
        return await _weldingEquipmentManager.GetAllAsync();
    }

    [HttpGet("downtime")]
    [AuthorizeRoles(Role.Admin,Role.Master,Role.TechUser)]
    [ProducesResponseType(typeof(IEnumerable<WeldingEquipmentDowntimeDto>), StatusCodes.Status200OK)]
    public async Task<ActionResult<IEnumerable<WeldingEquipmentDowntimeDto>>> GetAllWeldingEquipmentDowntimesAsync()
    {
        return await _weldingEquipmentManager.GetAllWeldingEquipmentDowntimesAsync();
    }
    
    [HttpPost]
    [AuthorizeRoles(Role.Admin,Role.Master,Role.TechUser)]
    [ProducesResponseType(typeof(WeldingEquipmentDto), StatusCodes.Status200OK)]
    public async Task<ActionResult<WeldingEquipmentDto?>> CreateAsync([FromBody] CreateEquipmentRequest request)
    {
        return await _weldingEquipmentManager.CreateAsync(request);
    }
    
    [HttpPut]
    [AuthorizeRoles(Role.Admin,Role.Master,Role.TechUser)]
    public async Task<IActionResult> UpdateAsync([FromBody] UpdateEquipmentRequest request)
    {
        var result = await _weldingEquipmentManager.UpdateAsync(request);

        if (!result)
        {
            var problemDetails = new BadRequestResult
            {
                Title = "Update Error",
                StatusCode = (int) (HttpStatusCode.BadRequest),
                Errors = $"Error when update Welding Equipment with id {request.Id}",
            };

            return BadRequest(problemDetails);
        }
        
        return Ok();
    }
}
