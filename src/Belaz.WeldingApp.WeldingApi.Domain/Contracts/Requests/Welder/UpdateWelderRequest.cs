namespace Belaz.WeldingApp.WeldingApi.Domain.Contracts.Requests.Welder;

public class UpdateWelderRequest
{
    public Guid Id { get; set; }
    
    public string RfidTag { get; set; } = null!;

    public string FirstName { get; set; } = null!;

    public string LastName { get; set; } = null!;

    public string MiddleName { get; set; } = null!;

    public Guid ProductionAreaId { get; set; }
    
    public Guid? WorkplaceId { get; set; }

    public IReadOnlyList<Guid>? WeldingEquipmentIds { get; set; }
}