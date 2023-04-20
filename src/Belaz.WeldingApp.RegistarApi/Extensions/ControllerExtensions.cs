using System.Net;
using Belaz.WeldingApp.RegistarApi.Domain.Exceptions;
using LanguageExt.Common;
using Microsoft.AspNetCore.Mvc;
using BadRequestResult = Belaz.WeldingApp.Common.Models.BadRequestResult;

namespace Belaz.WeldingApp.RegistarApi.Extensions;

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