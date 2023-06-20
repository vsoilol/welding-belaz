using AutoMapper;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.WeldPassageInstruction;
using Belaz.WeldingApp.WeldingApi.Domain.Mappings;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.TechnologicalInstruction;

public class UpdateInstructionRequest
    : IMapTo<Belaz.WeldingApp.Common.Entities.TechnologicalProcessInfo.TechnologicalInstruction>
{
    public Guid Id { get; set; }

    public string Number { get; set; } = null!;

    public string Name { get; set; } = null!;

    public List<UpdateWeldPassageInstructionRequest> WeldPassages { get; set; } = null!;
}
