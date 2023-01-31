using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.Post;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Services.Interfaces;
using Belaz.WeldingApp.WeldingApi.Domain.Dtos.Post;
using Belaz.WeldingApp.WeldingApi.Extensions;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using WeldingApp.Common.Attributes;
using WeldingApp.Common.Enums;

namespace Belaz.WeldingApp.WeldingApi.Controllers;

[ApiController]
[Route("api/[controller]")]
public class PostController : ControllerBase
{
    private readonly IPostService _postService;

    public PostController(IPostService postService)
    {
        _postService = postService;
    }

    [HttpGet]
    [ProducesResponseType(typeof(IEnumerable<PostDto>), StatusCodes.Status200OK)]
    public async Task<ActionResult<IEnumerable<PostDto>>> GetAllAsync()
    {
        return await _postService.GetAllAsync();
    }

    [HttpGet("{id}")]
    [ProducesResponseType(typeof(PostDto), StatusCodes.Status200OK)]
    public async Task<ActionResult<PostDto>> GetByIdAsync([FromRoute] Guid id)
    {
        var result = await _postService.GetByIdAsync(new GetPostByIdRequest { Id = id });
        return result.ToOk();
    }

    [HttpPost]
    [ProducesResponseType(typeof(PostDto), StatusCodes.Status200OK)]
    public async Task<ActionResult<PostDto>> CreateAsync([FromBody] CreatePostRequest request)
    {
        var result = await _postService.CreateAsync(request);
        return result.ToOk();
    }

    [HttpPut]   
    [ProducesResponseType(typeof(PostDto), StatusCodes.Status200OK)]
    public async Task<ActionResult<PostDto>> UpdateAsync([FromBody] UpdatePostRequest request)
    {
        var result = await _postService.UpdateAsync(request);
        return result.ToOk();
    }
}