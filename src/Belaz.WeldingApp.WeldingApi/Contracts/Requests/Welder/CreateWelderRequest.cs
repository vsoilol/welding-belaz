namespace Belaz.WeldingApp.WeldingApi.Contracts.Requests.Welder;

public class CreateWelderRequest
{
    public string RfidTag { get; set; } = null!;

    public string FirstName { get; set; } = null!;

    public string LastName { get; set; } = null!;

    public string MiddleName { get; set; } = null!;

    public Guid ProductionAreaId { get; set; }
    
    public Guid? WorkplaceId { get; set; }

    public Guid? WeldingEquipmentId { get; set; }
}