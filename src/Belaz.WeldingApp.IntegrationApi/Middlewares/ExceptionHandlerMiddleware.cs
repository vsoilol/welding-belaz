using System.Net;
using Belaz.WeldingApp.IntegrationApi.Presenters.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Options;
using Newtonsoft.Json;

namespace Belaz.WeldingApp.IntegrationApi.Middlewares
{
    public class ExceptionHandlerMiddleware
    {
        private const string ServerErrorMessage = "There was a problem handling your request. Please try again.";

        private readonly RequestDelegate _next;
        private readonly IOptions<MvcNewtonsoftJsonOptions> _options;
        private readonly ILogger _logger;

        public ExceptionHandlerMiddleware(
            RequestDelegate next,
            ILogger<ExceptionHandlerMiddleware> logger,
            IOptions<MvcNewtonsoftJsonOptions> options)
        {
            _next = next;
            _logger = logger;
            _options = options;
        }

        public async Task InvokeAsync(HttpContext httpContext)
        {
            try
            {
                await _next(httpContext);
            }
            catch (ArgumentException ex)
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

            var exceptionContract = new ExceptionContract()
            {
                Code = context.Response.StatusCode.ToString(),
                Message = errorMessage,
            };

            var serializedResponseMessage = JsonConvert.SerializeObject(exceptionContract, _options.Value.SerializerSettings);

            await context.Response.WriteAsync(serializedResponseMessage);
        }
    }
}
