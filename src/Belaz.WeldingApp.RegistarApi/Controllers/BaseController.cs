using Belaz.WeldingApp.RegistarApi.BusinessLayer.Requests;
using Belaz.WeldingApp.RegistarApi.DataLayer;
using Belaz.WeldingApp.RegistarApi.Domain.Entities.Users;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace Belaz.WeldingApp.RegistarApi.Controllers;

[ApiController]
[Route("api/[controller]")]
public class BaseController : ControllerBase
{
    private readonly ApplicationContext _context;


    public BaseController(ApplicationContext context)
    {
        _context = context;
    }
    
    [HttpGet]
    public async Task<ActionResult<List<Welder>>> GetAllWeldersAsync()
    {
        var result = await _context.Welders.ToListAsync();
        return result;
    }
    
    [HttpPost]
    public async Task<ActionResult<List<Welder>>> CreateAsync([FromBody] RecordWithoutTaskRequest request)
    {
        var result = await _context.Welders.ToListAsync();
        return result;
    }
}