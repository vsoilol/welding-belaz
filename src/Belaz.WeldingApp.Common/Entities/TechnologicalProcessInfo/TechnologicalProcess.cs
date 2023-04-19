using Belaz.WeldingApp.Common.Entities.ProductInfo;

namespace Belaz.WeldingApp.Common.Entities.TechnologicalProcessInfo;

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
