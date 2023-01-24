using Belaz.WeldingApp.WeldingApi.Domain.Contracts.Responses.UserData;

namespace Belaz.WeldingApp.WeldingApi.Domain.Contracts.Responses.WeldingTask;

public class WeldingTaskFullNamesDto
{
    public int Number { get; set; }

    public UserFullName? Welder { get; set; }

    public UserFullName? Master { get; set; }

    public UserFullName? Inspector { get; set; }
}