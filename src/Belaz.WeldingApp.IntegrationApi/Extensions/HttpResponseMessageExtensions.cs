using Belaz.WeldingApp.IntegrationApi.Exception;
using Newtonsoft.Json;
using WeldingApp.Common.Models;

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
        var problemDetails = JsonConvert.DeserializeObject<BadRequestResult>(content);

        if (response.Content is not null)
        {
            response.Content.Dispose();
        }

        throw new SimpleHttpResponseException(problemDetails, content);
    }
}
