using LanguageExt.Common;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests;

public class BaseResultRequest<TRequest>
{
    public string? LogMessage { get; set; }

    public Result<TRequest> Result { get; set; }

    public BaseResultRequest(Result<TRequest> result, string? logMessage = null)
    {
        LogMessage = logMessage;
        Result = result;
    }
}