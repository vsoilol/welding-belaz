using Belaz.WeldingApp.WeldingApi.Domain.Contracts.Responses.Production;
using Belaz.WeldingApp.WeldingApi.Domain.Contracts.Responses.WeldingEquipment;

namespace Belaz.WeldingApp.WeldingApi.Domain.Contracts.Responses.Welder;

public class WelderDto
{
    public Guid Id { get; set; }

    public string RfidTag { get; set; } = null!;

    public string FirstName { get; set; } = null!;

    public string LastName { get; set; } = null!;

    public string MiddleName { get; set; } = null!;

    public ProductionWithNameDto Workshop { get; set; } = null!;

    public ProductionWithNameDto ProductionArea { get; set; } = null!;

    public IReadOnlyList<WeldingEquipmentBriefDto>? WeldingEquipments { get; set; }

    public ProductionBriefDto? Workplace { get; set; }
}