using System.Net;
using FluentValidation.Results;
using WeldingApp.Common.Models;

namespace Belaz.WeldingApp.IdentityApi.Extensions
{
    public static class ValidationResultExtensions
    {
        public static BadRequestResult ToProblemDetails(this IEnumerable<ValidationFailure> validationFailures)
        {
            var errors = validationFailures.ToDictionary(x => x.PropertyName, x => x.ErrorMessage);

            var problemDetails = new BadRequestResult
            {
                Title = "validation error, please check the error list for more details",
                StatusCode = (int) (HttpStatusCode.BadRequest),
                Errors = errors,
            };

            return problemDetails;
        }
    }
}
