using Belaz.WeldingApp.RegistarApi.Domain.Entities.WeldingEquipmentInfo;
using Belaz.WeldingApp.RegistarApi.Domain.Mappings;
using WeldingApp.Common.Enums;

namespace Belaz.WeldingApp.RegistarApi.Domain.Dtos;

public class WeldingEquipmentConditionTimeDto : IMapFrom<WeldingEquipmentConditionTime>
{
    public Guid Id { get; set; }

    public Condition Condition { get; set; }

    public DateTime Date { get; set; }

    public TimeSpan StartConditionTime { get; set; }

    /// <summary>
    /// Сколько оборудование находиться в данном состоянии в минутах
    /// </summary>
    public double Time { get; set; } = 0;

    public Guid WeldingEquipmentId { get; set; }
}
