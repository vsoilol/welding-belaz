using Belaz.WeldingApp.Common.Models;
using FluentValidation.Results;
using System.Net;

namespace Belaz.WeldingApp.Common.Extensions;

public static class ValidationResultExtensions
{
    public static BadRequestResult ToProblemDetails(this IEnumerable<ValidationFailure> validationFailures)
    {
        var errors = validationFailures.ToDictionary(x => x.PropertyName, x => x.ErrorMessage);

        var problemDetails = new BadRequestResult
        {
            Title = "Validation error, please check the error list for more details",
            StatusCode = (int)HttpStatusCode.BadRequest,
            Errors = errors,
        };

        return problemDetails;
    }
}