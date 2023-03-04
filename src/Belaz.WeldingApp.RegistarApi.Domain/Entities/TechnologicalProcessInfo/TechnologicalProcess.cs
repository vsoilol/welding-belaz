using Belaz.WeldingApp.RegistarApi.Domain.Entities.ProductInfo;

namespace Belaz.WeldingApp.RegistarApi.Domain.Entities.TechnologicalProcessInfo;

public class TechnologicalProcess : Entity
{
    public string Number { get; set; } = null!;

    public string Name { get; set; } = null!;

    /// <summary>
    /// Ссылка на PDF-файл в PDM-системе
    /// </summary>
    public string? PdmSystemFileLink { get; set; }

    public List<Product> Products { get; set; } = null!;
}
