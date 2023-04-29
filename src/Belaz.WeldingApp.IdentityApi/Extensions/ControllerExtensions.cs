using System.Net;
using Belaz.WeldingApp.IdentityApi.BusinessLayer.Exceptions;
using Belaz.WeldingApp.IdentityApi.Domain.Exceptions;
using LanguageExt.Common;
using Microsoft.AspNetCore.Mvc;
using BadRequestResult = Belaz.WeldingApp.Common.Models.BadRequestResult;

namespace Belaz.WeldingApp.IdentityApi.Extensions;

public static class ControllerExtensions
{
    public static ActionResult<TResult> ToOk<TResult>(this Result<TResult> result,
        Action<TResult>? afterGetResult = null)
    {
        return result.Match<ActionResult<TResult>>(
            obj => CreateOkResult(obj, afterGetResult),
            CreateErrorResult<TResult>
        );
    }

    private static ActionResult<TResult> CreateOkResult<TResult>(TResult obj, Action<TResult>? afterGetResult)
    {
        afterGetResult?.Invoke(obj);
        return new OkObjectResult(obj);
    }

    private static ActionResult<TResult> CreateErrorResult<TResult>(Exception exception)
    {
        var statusCode = (int)HttpStatusCode.InternalServerError;
        var errorTitle = "Internal Server Error";

        switch (exception)
        {
            case ValidationException validationException:
                var validationErrors = validationException.Errors
                    .ToDictionary(x => x.PropertyName, x => x.ErrorMessage);
                return new BadRequestObjectResult(new BadRequestResult
                {
                    StatusCode = (int)HttpStatusCode.BadRequest,
                    Title = "Validation Error",
                    Errors = validationErrors
                });
            case LoginFailedException _:
                errorTitle = "Login Error";
                break;
            case RegisterFailedException _:
                errorTitle = "Register Error";
                break;
        }

        return new BadRequestObjectResult(new BadRequestResult
        {
            StatusCode = statusCode, Title = errorTitle, Errors = exception.Message
        });
    }
}
