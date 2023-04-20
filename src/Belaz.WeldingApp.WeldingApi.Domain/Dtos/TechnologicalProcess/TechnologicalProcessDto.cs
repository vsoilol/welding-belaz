using Belaz.WeldingApp.WeldingApi.Domain.Dtos.Product;
using Belaz.WeldingApp.WeldingApi.Domain.Dtos.TechnologicalInstruction;
using Belaz.WeldingApp.WeldingApi.Domain.Mappings;

namespace Belaz.WeldingApp.WeldingApi.Domain.Dtos.TechnologicalProcess;

public class TechnologicalProcessDto
    : IMapFrom<Belaz.WeldingApp.Common.Entities.TechnologicalProcessInfo.TechnologicalProcess>
{
    public Guid Id { get; set; }

    public string? IdFromSystem { get; set; }

    public string Number { get; set; } = null!;

    public string Name { get; set; } = null!;

    public string? PdmSystemFileLink { get; set; }

    public List<ProductDto> Products { get; set; } = null!;
}
