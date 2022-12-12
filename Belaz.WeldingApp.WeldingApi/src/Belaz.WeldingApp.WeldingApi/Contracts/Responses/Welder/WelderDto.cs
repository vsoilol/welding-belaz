using Belaz.WeldingApp.WeldingApi.Contracts.Responses.WeldingEquipment;

namespace Belaz.WeldingApp.WeldingApi.Contracts.Responses.Welder;

public class WelderDto
{
    public Guid Id { get; set; }

    public string RfidTag { get; set; }

    public string FirstName { get; set; }

    public string LastName { get; set; }

    public string MiddleName { get; set; }

    public string WorkshopName { get; set; }

    public string ProductionAreaName { get; set; }

    public WeldingEquipmentBriefDto WeldingEquipment { get; set; }

    public int? WorkplaceNumber { get; set; }
}
