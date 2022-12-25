using Belaz.WeldingApp.IntegrationApi.Exception;

namespace Belaz.WeldingApp.IntegrationApi.Extensions;

public static class HttpResponseMessageExtensions
{
    public static async Task EnsureSuccessStatusCodeAsync(this HttpResponseMessage response)
    {
        if (response.IsSuccessStatusCode)
        {
            return;
        }

        var content = await response.Content.ReadAsStringAsync();

        if (response.Content is not null)
        {
            response.Content.Dispose();
        }

        throw new SimpleHttpResponseException(response.StatusCode, content);
    }
}
