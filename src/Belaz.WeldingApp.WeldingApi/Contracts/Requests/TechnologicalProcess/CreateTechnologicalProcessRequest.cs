namespace Belaz.WeldingApp.WeldingApi.Contracts.Requests.TechnologicalProcess;

public class CreateTechnologicalProcessRequest
{
    public int Number { get; set; }

    public string Name { get; set; } = null!;

    /// <summary>
    /// Ссылка на PDF-файл в PDM-системе
    /// </summary>
    public string PdmSystemFileLink { get; set; } = null!;
}