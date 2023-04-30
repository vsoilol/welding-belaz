using System.Security.Claims;
using Belaz.WeldingApp.WeldingApi.DataLayer;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Filters;
using Microsoft.EntityFrameworkCore;

namespace Belaz.WeldingApp.WeldingApi.Filters;

public class AuthorizationFilter : IAsyncAuthorizationFilter
{
    private readonly ApplicationContext _context;

    public AuthorizationFilter(ApplicationContext context)
    {
        _context = context;
    }
    
    public async Task OnAuthorizationAsync(AuthorizationFilterContext context)
    {
        var userId = context.HttpContext.User.FindFirstValue("id");

        if (userId is null)
        {
            return;
        }

        var id = Guid.Parse(userId);
        var isUserExist = await _context.Users.AnyAsync(_ => _.Id == id);

        if (!isUserExist)
        {
            context.Result = new UnauthorizedResult();
        }
    }
}