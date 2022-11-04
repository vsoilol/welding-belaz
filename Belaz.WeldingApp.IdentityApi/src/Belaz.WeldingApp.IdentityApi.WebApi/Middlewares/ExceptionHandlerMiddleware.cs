using System.Net;
using System.Text.Json;

namespace Belaz.WeldingApp.IdentityApi.WebApi.Middlewares
{
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
            catch (Exception ex)
            {
                _logger.LogError(ex, ex.Message);
                //to-do need to add catches for each unique exceptions.
                await HandleExceptionAsync(httpContext, ServerErrorMessage, HttpStatusCode.InternalServerError);
            }
        }

        private async Task HandleExceptionAsync(HttpContext context, string errorMessage, HttpStatusCode statusCode)
        {
            context.Response.Clear();
            context.Response.ContentType = "application/json";
            context.Response.StatusCode = (int)statusCode;

            var serializedResponseMessage = JsonSerializer.Serialize(errorMessage);

            await context.Response.WriteAsync(serializedResponseMessage);
        }
    }
}
