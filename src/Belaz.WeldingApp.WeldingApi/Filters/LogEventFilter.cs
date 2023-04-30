using System.Security.Claims;
using Belaz.WeldingApp.Common.Entities;
using Belaz.WeldingApp.WeldingApi.Contracts;
using Belaz.WeldingApp.WeldingApi.DataLayer;
using Microsoft.AspNetCore.Mvc.Filters;
using Microsoft.EntityFrameworkCore;

namespace Belaz.WeldingApp.WeldingApi.Filters;

internal class LogEventFilter : IAsyncResultFilter
{
    private readonly ApplicationContext _context;

    public LogEventFilter(ApplicationContext context)
    {
        _context = context;
    }

    public async Task OnResultExecutionAsync(ResultExecutingContext context, ResultExecutionDelegate next)
    {
        await next();

        if (context.HttpContext.Items["id"] is null &&
            context.HttpContext.User.FindFirstValue("id") is null)
        {
            return;
        }

        // Get the JWT token from the request header
        var userId = context.HttpContext.Items["id"] is null
            ? Guid.Parse(context.HttpContext.User.FindFirstValue("id"))
            : (Guid)context.HttpContext.Items["id"]!;

        if (!(await _context.Users.AnyAsync(_ => _.Id == userId)))
        {
            return;
        }

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
