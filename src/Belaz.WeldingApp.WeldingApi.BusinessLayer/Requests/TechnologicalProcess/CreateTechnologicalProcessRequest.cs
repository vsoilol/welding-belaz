using Belaz.WeldingApp.WeldingApi.Domain.Mappings;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.TechnologicalProcess;

public class CreateTechnologicalProcessRequest
    : IMapTo<Belaz.WeldingApp.Common.Entities.TechnologicalProcessInfo.TechnologicalProcess>
{
    public string Number { get; set; } = null!;

    public string Name { get; set; } = null!;

    /// <summary>
    /// Ссылка на PDF-файл в PDM-системе
    /// </summary>
    public string PdmSystemFileLink { get; set; } = null!;
}
