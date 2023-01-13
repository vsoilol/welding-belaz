using Belaz.WeldingApp.WeldingApi.Contracts.Responses.Production;
using Belaz.WeldingApp.WeldingApi.Contracts.Responses.WeldingEquipment;

namespace Belaz.WeldingApp.WeldingApi.Contracts.Responses.Chief
{
    public class ChiefDto
    {
        public Guid Id { get; set; }

        public string RfidTag { get; set; } = null!;

        public string FirstName { get; set; } = null!;

        public string LastName { get; set; } = null!;

        public string MiddleName { get; set; } = null!;

        public ProductionWithNameDto ProductionArea { get; set; } = null!;
        
        public WeldingEquipmentBriefDto? WeldingEquipment { get; set; }
    }
}
