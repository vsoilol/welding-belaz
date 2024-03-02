using Belaz.WeldingApp.Common.Entities.WeldingEquipmentInfo;
using Belaz.WeldingApp.Common.Enums;
using Belaz.WeldingApp.FileApi.Domain.Mappings;

namespace Belaz.WeldingApp.FileApi.Domain.Dtos.ConditionTimeInfo;

public class ConditionTimeDto : IMapFrom<WeldingEquipmentConditionTime>
{
    public Guid WeldingEquipmentId { get; set; }
    
    public Condition Condition { get; set; }

    public DateTime Date { get; set; }

    public TimeSpan StartConditionTime { get; set; }

    /// <summary>
    /// Сколько оборудование находиться в данном состоянии в минутах
    /// </summary>
    public double Time { get; set; }
}
