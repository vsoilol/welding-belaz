using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using Belaz.WeldingApp.Common.Entities;
using Belaz.WeldingApp.IdentityApi.Contracts;
using Belaz.WeldingApp.IdentityApi.Data.DataAccess;
using Microsoft.AspNetCore.Mvc.Filters;

namespace Belaz.WeldingApp.IdentityApi.Filters;

internal class LogEventFilter : IAsyncResultFilter
{
    private readonly IdentityDbContext _context;

    public LogEventFilter(IdentityDbContext context)
    {
        _context = context;
    }

    public async Task OnResultExecutionAsync(ResultExecutingContext context, ResultExecutionDelegate next)
    {
        await next();

        // Get the JWT token from the request header
        var userId = context.HttpContext.Items["id"] is null
            ? Guid.Parse(context.HttpContext.User.FindFirstValue("id"))
            : (Guid)context.HttpContext.Items["id"]!;

        var logMessage = (string?)context.HttpContext.Items[ContextItems.LogMessage];

        if (logMessage is null)
        {
            return;
        }

        var eventLog = new EventLog { UserId = userId, DateTime = DateTime.UtcNow, Information = logMessage };

        _context.EventLogs.Add(eventLog);
        await _context.SaveChangesAsync();
    }
}
