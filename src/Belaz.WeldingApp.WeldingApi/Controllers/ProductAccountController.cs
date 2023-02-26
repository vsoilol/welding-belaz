using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Threading.Tasks;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.Common;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Services.Interfaces;
using Belaz.WeldingApp.WeldingApi.Extensions;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using WeldingApp.Common.Attributes;
using WeldingApp.Common.Enums;

namespace Belaz.WeldingApp.WeldingApi.Controllers;

[ApiController]
[Route("api/[controller]")]
[Authorize(AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
[AuthorizeRoles(Role.Admin, Role.Master, Role.Inspector, Role.Welder, Role.Chief)]
public class ProductAccountController : ControllerBase
{
    private readonly IProductAccountService _productAccountService;

    public ProductAccountController(IProductAccountService productAccountService)
    {
        _productAccountService = productAccountService;
    }

    [HttpGet("dates/{productionAreaId}")]
    [ProducesResponseType(typeof(List<string>), StatusCodes.Status200OK)]
    public async Task<ActionResult<List<string>>> GetAllDatesByProductionAreaAsync(
        [FromRoute] Guid productionAreaId
    )
    {
        var result = await _productAccountService.GetAllDatesByProductionAreaAsync(
            new ProductionAreaIdRequest { ProductionAreaId = productionAreaId }
        );

        return result.ToOk();
    }
}
