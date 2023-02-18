using Belaz.WeldingApp.RegistarApi.Domain.Entities.WeldingEquipmentInfo;
using Belaz.WeldingApp.RegistarApi.Domain.Mappings;

namespace Belaz.WeldingApp.RegistarApi.Domain.Dtos;

public class WeldingEquipmentDto : IMapFrom<WeldingEquipment>
{
    public Guid Id { get; set; }
    
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