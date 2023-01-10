using System.Net;
using Belaz.WeldingApp.WeldingApi.Contracts.Requests.Post;
using Belaz.WeldingApp.WeldingApi.Contracts.Requests.ProductInfo;
using Belaz.WeldingApp.WeldingApi.Contracts.Responses.Post;
using Belaz.WeldingApp.WeldingApi.Managers.Interfaces;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using WeldingApp.Common.Attributes;
using WeldingApp.Common.Enums;
using BadRequestResult = WeldingApp.Common.Models.BadRequestResult;

namespace Belaz.WeldingApp.WeldingApi.Controllers;

[ApiController]
[Route("api/[controller]")]
[Authorize(AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
public class PostController : ControllerBase
{
    private readonly IPostManager _postManager;

    public PostController(IPostManager postManager)
    {
        _postManager = postManager;
    }
    
    [HttpGet]
    [AuthorizeRoles(Role.Admin,Role.Master,Role.TechUser)]
    [ProducesResponseType(typeof(IEnumerable<PostDto>), StatusCodes.Status200OK)]
    public async Task<ActionResult<IEnumerable<PostDto>>> GetAllAsync()
    {
        return await _postManager.GetAllAsync();
    }
    
    [HttpGet("{id}")]
    [AuthorizeRoles(Role.Admin,Role.Master,Role.TechUser)]
    [ProducesResponseType(typeof(PostDto), StatusCodes.Status200OK)]
    public async Task<ActionResult<PostDto?>> GetByIdAsync([FromRoute] Guid id)
    {
        return await _postManager.GetByIdAsync(id);
    }
    
    [HttpPost]
    [AuthorizeRoles(Role.Admin,Role.Master,Role.TechUser)]
    [ProducesResponseType(typeof(PostDto), StatusCodes.Status200OK)]
    public async Task<ActionResult<PostDto?>> CreateAsync([FromBody] CreatePostRequest request)
    {
        return await _postManager.CreateAsync(request);
    }
    
    [HttpPut]
    [AuthorizeRoles(Role.Admin,Role.Master,Role.TechUser)]
    public async Task<IActionResult> UpdateAsync([FromBody] UpdatePostRequest request)
    {
        var result = await _postManager.UpdateAsync(request);

        if (!result)
        {
            var problemDetails = new BadRequestResult
            {
                Title = "Update Error",
                StatusCode = (int) (HttpStatusCode.BadRequest),
                Errors = $"Error when update Post with id {request.Id}",
            };

            return BadRequest(problemDetails);
        }
        
        return Ok();
    }
}