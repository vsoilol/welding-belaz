using AutoMapper;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.WeldPassageInstruction;
using Belaz.WeldingApp.WeldingApi.Domain.Mappings;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.TechnologicalInstruction;

public class CreateInstructionRequest
    : IMapTo<Belaz.WeldingApp.Common.Entities.TechnologicalProcessInfo.TechnologicalInstruction>
{
    public string Number { get; set; } = null!;

    public string Name { get; set; } = null!;

    public List<CreateWeldPassageInstructionRequest> WeldPassages { get; set; } = null!;
}
