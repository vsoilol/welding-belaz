using System.Net;
using Belaz.WeldingApp.FileApi.Domain.Dtos;
using Belaz.WeldingApp.FileApi.Domain.Exceptions;
using LanguageExt.Common;
using Microsoft.AspNetCore.Mvc;
using BadRequestResult = Belaz.WeldingApp.Common.Models.BadRequestResult;

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
    
    public static ActionResult ToEmptyOk<TResult>(this Result<TResult> result)
    {
        return result.Match<ActionResult>(
            obj => new NoContentResult(),
            ex => CreateErrorResult(ex)
        );
    }
    
    public static ActionResult<TResult> ToOk<TResult>(this Result<TResult> result)
    {
        return result.Match<ActionResult<TResult>>(
            obj => CreateOkResult(obj),
            ex => CreateErrorResult(ex)
        );
    }
    
    private static ActionResult CreateOkResult<TResult>(TResult obj)
    {
        return new OkObjectResult(obj);
    }
    
    private static FileContentResult CreateFileContentResult(DocumentDto document)
    {
        return new FileContentResult(document.Bytes, document.FileType)
        {
            FileDownloadName = document.FileName
        };
    }

    private static ActionResult CreateErrorResult(Exception exception)
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

        if (exception is UploadFileException or IncorrectFileExtensionException)
        {
            var badRequestResult = new BadRequestResult
            {
                Errors = exception.Message,
                StatusCode = (int)HttpStatusCode.BadRequest,
                Title = "Upload file exception"
            };

            return new BadRequestObjectResult(badRequestResult);
        }

        return new StatusCodeResult(500);
    }
}
