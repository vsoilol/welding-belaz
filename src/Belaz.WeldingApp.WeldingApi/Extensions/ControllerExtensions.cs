using System.Net;
using Belaz.WeldingApp.WeldingApi.Domain.Exceptions;
using LanguageExt.Common;
using Microsoft.AspNetCore.Mvc;
using BadRequestResult = Belaz.WeldingApp.Common.Models.BadRequestResult;

namespace Belaz.WeldingApp.WeldingApi.Extensions;

public static class ControllerExtensions
{
    public static ActionResult<TResult> ToOk<TResult>(this Result<TResult> result,
        Action<TResult>? afterGetResult = null)
    {
        return result.Match<ActionResult<TResult>>(
            obj => CreateOkResult(obj, afterGetResult),
            ex => CreateErrorResult<TResult>(ex)
        );
    }

    public static ActionResult ToEmptyOk<TResult>(this Result<TResult> result,
        Action<TResult>? afterGetResult = null)
    {
        return result.Match(
            obj => CreateOkResult(obj, afterGetResult, true),
            CreateErrorResult<TResult>
        );
    }

    private static ActionResult CreateOkResult<TResult>(TResult obj, Action<TResult>? afterGetResult,
        bool isEmptyResult = false)
    {
        afterGetResult?.Invoke(obj);
        return new OkObjectResult(!isEmptyResult ? obj : null);
    }

    private static ActionResult CreateErrorResult<TResult>(Exception exception)
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
            case NoDataException noDataException:
                return new NoContentResult();
        }

        return new BadRequestObjectResult(new BadRequestResult
        {
            StatusCode = statusCode, Title = errorTitle, Errors = exception.Message
        });
    }
}