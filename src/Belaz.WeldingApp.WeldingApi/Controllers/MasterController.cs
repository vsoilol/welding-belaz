﻿using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.Master;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Services.Interfaces;
using Belaz.WeldingApp.WeldingApi.Domain.Dtos;
using Belaz.WeldingApp.WeldingApi.Extensions;
using Microsoft.AspNetCore.Mvc;

namespace Belaz.WeldingApp.WeldingApi.Controllers;

[ApiController]
[Route("api/[controller]")]
public class MasterController : ControllerBase
{
    private readonly IMasterService _masterService;

    public MasterController(IMasterService masterService)
    {
        _masterService = masterService;
    }

    [HttpGet]
    [ProducesResponseType(typeof(IEnumerable<MasterDto>), StatusCodes.Status200OK)]
    public async Task<ActionResult<IEnumerable<MasterDto>>> GetAllWeldersAsync()
    {
        return await _masterService.GetAllAsync();
    }

    [HttpPost]
    [ProducesResponseType(typeof(MasterDto), StatusCodes.Status200OK)]
    public async Task<ActionResult<MasterDto>> CreateAsync([FromBody] CreateMasterRequest request)
    {
        var result = await _masterService.CreateAsync(request);
        return result.ToOk();
    }

    [HttpPut]
    [ProducesResponseType(typeof(MasterDto), StatusCodes.Status200OK)]
    public async Task<ActionResult<MasterDto>> UpdateAsync([FromBody] UpdateMasterRequest request)
    {
        var result = await _masterService.UpdateAsync(request);
        return result.ToOk();
    }
}