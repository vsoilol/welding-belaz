using System.Net;
using Belaz.WeldingApp.FileApi.Domain.Dtos;
using Belaz.WeldingApp.FileApi.Domain.Exceptions;
using LanguageExt.Common;
using Microsoft.AspNetCore.Mvc;
using BadRequestResult = WeldingApp.Common.Models.BadRequestResult;

namespace Belaz.WeldingApp.FileApi.Extensions;

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

    public static IActionResult ToFile(
        this Result<DocumentDto> result)
    {
        return result.Match<IActionResult>(obj => new FileContentResult(obj.Bytes, obj.FileType)
        {
            FileDownloadName = obj.FileName
        },
            exception =>
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