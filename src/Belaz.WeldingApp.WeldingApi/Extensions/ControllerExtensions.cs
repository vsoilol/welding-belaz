using System.Net;
using Belaz.WeldingApp.WeldingApi.Domain.Exceptions;
using LanguageExt.Common;
using Microsoft.AspNetCore.Mvc;
using BadRequestResult = WeldingApp.Common.Models.BadRequestResult;

namespace Belaz.WeldingApp.WeldingApi.Extensions;

public static class ControllerExtensions
{
    public static ActionResult<TResult> ToOk<TResult>(
        this Result<TResult> result)
    {
        return result.Match<ActionResult<TResult>>(obj => new OkObjectResult(obj), exception =>
        {
            if (exception is ValidationException validationException)
            {
                var errors = validationException.Errors.ToDictionary(x => x.PropertyName, x => x.ErrorMessage);
                
                var badRequestResult = new BadRequestResult
                {
                    Errors = errors,
                    StatusCode = (int)HttpStatusCode.BadRequest,
                    Title = "Validation Error"
                };

                return new BadRequestObjectResult(badRequestResult);
            }

            return new StatusCodeResult(500);
        });
    }
}