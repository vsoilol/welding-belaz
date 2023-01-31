using Belaz.WeldingApp.FileApi.DataLayer;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace Belaz.WeldingApp.FileApi.Controllers;

[Route("api/files")]
[ApiController]
public class FileController : ControllerBase
{
    private readonly ApplicationContext _context;

    public FileController(ApplicationContext context)
    {
        _context = context;
    }

    [HttpGet]
    public async Task<IActionResult> Get()
    {
        return Ok(await _context.Chiefs.ToListAsync());
    }
}
