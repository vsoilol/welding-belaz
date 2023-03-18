using System.Net;
using Belaz.WeldingApp.FileApi.Domain.Dtos;
using Belaz.WeldingApp.FileApi.Domain.Exceptions;
using LanguageExt.Common;
using Microsoft.AspNetCore.Mvc;
using BadRequestResult = WeldingApp.Common.Models.BadRequestResult;

namespace Belaz.WeldingApp.FileApi.Extensions;

public static class ControllerExtensions
{
    public static IActionResult ToFile(this Result<DocumentDto> result)
    {
        return result.Match<IActionResult>(
            obj => CreateFileContentResult(obj),
            exception => CreateErrorResult(exception)
        );
    }

    private static FileContentResult CreateFileContentResult(DocumentDto document)
    {
        return new FileContentResult(document.Bytes, document.FileType)
        {
            FileDownloadName = document.FileName
        };
    }

    private static IActionResult CreateErrorResult(Exception exception)
    {
        if (exception is ValidationException validationException)
        {
            var errors = validationException.Errors.ToDictionary(
                x => x.PropertyName,
                x => x.ErrorMessage
            );

            var badRequestResult = new BadRequestResult
            {
                Errors = errors,
                StatusCode = (int)HttpStatusCode.BadRequest,
                Title = "Validation Error"
            };

            return new BadRequestObjectResult(badRequestResult);
        }

        if (exception is ListIsEmptyException)
        {
            return new NoContentResult();
        }

        return new StatusCodeResult(500);
    }
}
