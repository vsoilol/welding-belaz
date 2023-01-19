using Belaz.WeldingApp.WeldingApi.Contracts.Responses.UserData;

namespace Belaz.WeldingApp.WeldingApi.Contracts.Responses.WeldingTask;

public class WeldingTaskFullNamesDto
{
    public int Number { get; set; }

    public UserFullName? Welder { get; set; }

    public UserFullName? Master { get; set; }

    public UserFullName? Inspector { get; set; }
}