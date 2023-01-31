using System.Net;
using System.Text.Json;
using Belaz.WeldingApp.WeldingApi.Domain.Exceptions;
using WeldingApp.Common.Models;

namespace Belaz.WeldingApp.WeldingApi.Middlewares;

public class ExceptionHandlerMiddleware
{
    private const string ServerErrorMessage = "There was a problem handling your request. Please try again.";

    private readonly RequestDelegate _next;
    private readonly ILogger _logger;

    public ExceptionHandlerMiddleware(RequestDelegate next, ILogger<ExceptionHandlerMiddleware> logger)
    {
        _next = next;
        _logger = logger;
    }

    public async Task InvokeAsync(HttpContext httpContext)
    {
        try
        {
            await _next(httpContext);
        }
        catch (NotSuchValidatorException ex)
        {
            _logger.LogError(ex, ex.Message);
            await HandleExceptionAsync(httpContext, ex.Message, HttpStatusCode.BadRequest);
        }
        catch (Exception ex)
        {
            _logger.LogError(ex, ex.Message);
            await HandleExceptionAsync(httpContext, ServerErrorMessage, HttpStatusCode.InternalServerError);
        }
    }

    private async Task HandleExceptionAsync(HttpContext context, string errorMessage, HttpStatusCode statusCode)
    {
        context.Response.Clear();
        context.Response.ContentType = "application/json";
        context.Response.StatusCode = (int)statusCode;

        var badRequestResult = new BadRequestResult
        {
            Errors = errorMessage, 
            StatusCode = context.Response.StatusCode, 
            Title = "Internal Server Error"
        };

        var serializedResponseMessage = JsonSerializer.Serialize(badRequestResult);

        await context.Response.WriteAsync(serializedResponseMessage);
    }
}
