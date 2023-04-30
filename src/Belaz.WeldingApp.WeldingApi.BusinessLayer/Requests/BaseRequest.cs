namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests;

public class BaseRequest<TRequest> where TRequest : class
{
    public string LogMessage { get; set; } = null!;

    public TRequest Result { get; set; } = null!;

    public BaseRequest(TRequest result, string message)
    {
        LogMessage = message;
        Result = result;
    }
}