using Belaz.WeldingApp.IntegrationApi.Contracts.Responses.Post;
using Belaz.WeldingApp.IntegrationApi.IntegrationApi.Interfaces;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using WeldingApp.Common.Attributes;
using WeldingApp.Common.Enums;

namespace Belaz.WeldingApp.IntegrationApi.Controllers;

[ApiController]
[Route("api/[controller]")]
[Authorize(AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
public class PostController : ControllerBase
{
    private readonly IPostIntegrationApi _postIntegrationApi;

    public PostController(IPostIntegrationApi postIntegrationApi)
    {
        _postIntegrationApi = postIntegrationApi;
    }

    [HttpGet]
    [AuthorizeRoles(Role.Admin,Role.Master,Role.TechUser)]
    [ProducesResponseType(typeof(IEnumerable<PostDto>), StatusCodes.Status200OK)]
    public async Task<ActionResult<IEnumerable<PostDto>>> GetAllAsync()
    {
        return await _postIntegrationApi.GetAllAsync();
    }

    [HttpGet("{id}")]
    [AuthorizeRoles(Role.Admin,Role.Master,Role.TechUser)]
    [ProducesResponseType(typeof(PostDto), StatusCodes.Status200OK)]
    public async Task<ActionResult<PostDto?>> GetByIdAsync([FromRoute] Guid id)
    {
        return await _postIntegrationApi.GetByIdAsync(id);
    }
}
