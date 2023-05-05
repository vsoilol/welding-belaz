using Belaz.WeldingApp.Common.Entities.WeldingEquipmentInfo;
using Belaz.WeldingApp.FileApi.Domain.Mappings;

namespace Belaz.WeldingApp.FileApi.Domain.Dtos;

public class WeldingEquipmentBriefDto : IMapFrom<WeldingEquipment>
{
    public string Name { get; set; } = null!;

    /// <summary>
    /// Маркировка
    /// </summary>
    public string Marking { get; set; } = null!;

    /// <summary>
    /// Заводской (инвентарный) номер
    /// </summary>
    public string FactoryNumber { get; set; } = null!;
}