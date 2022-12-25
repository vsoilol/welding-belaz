using System.Net;
using WeldingApp.Common.Models;

namespace Belaz.WeldingApp.IntegrationApi.Exception;

public class SimpleHttpResponseException : System.Exception
{
    public HttpStatusCode StatusCode { get; private set; }

    public BadRequestResult ProblemDetails { get; }

    public SimpleHttpResponseException(BadRequestResult problemDetails, string content) : base(content)
    {
        ProblemDetails = problemDetails;
    }
}
