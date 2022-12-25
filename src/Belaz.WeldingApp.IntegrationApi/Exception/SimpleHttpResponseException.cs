using System.Net;

namespace Belaz.WeldingApp.IntegrationApi.Exception;

public class SimpleHttpResponseException : System.Exception
{
    public HttpStatusCode StatusCode { get; private set; }

    public SimpleHttpResponseException(HttpStatusCode statusCode, string content) : base(content)
    {
        StatusCode = statusCode;
    }
}
