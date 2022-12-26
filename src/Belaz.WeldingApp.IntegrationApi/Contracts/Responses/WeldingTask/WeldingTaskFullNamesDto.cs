using Belaz.WeldingApp.IntegrationApi.Contracts.Responses.User;

namespace Belaz.WeldingApp.IntegrationApi.Contracts.Responses.WeldingTask;

public class WeldingTaskFullNamesDto
{
    public int Number { get; set; }

    public UserFullName Welder { get; set; }

    public UserFullName Master { get; set; }

    public UserFullName Inspector { get; set; }
}
