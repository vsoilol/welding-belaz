using Belaz.WeldingApp.Common.Entities.WeldingEquipmentInfo;
using Belaz.WeldingApp.WeldingApi.Domain.Mappings;

namespace Belaz.WeldingApp.WeldingApi.Domain.Dtos;

public class DowntimeReasonDto : IMapFrom<DowntimeReason>
{
    public Guid Id { get; set; }

    public string Reason { get; set; } = null!;
}
