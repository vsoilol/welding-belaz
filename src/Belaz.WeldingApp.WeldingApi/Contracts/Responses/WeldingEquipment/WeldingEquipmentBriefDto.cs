using Belaz.WeldingApp.WeldingApi.Repositories.Entities.Enums;
using WeldingApp.Common.Enums;

namespace Belaz.WeldingApp.WeldingApi.Contracts.Responses.WeldingEquipment;

public class WeldingEquipmentBriefDto
{
    public Guid Id { get; set; }

    /// <summary>
    /// RFID-метка
    /// </summary>
    public string RfidTag { get; set; }

    public string Name { get; set; }

    /// <summary>
    /// Маркировка
    /// </summary>
    public string Marking { get; set; }

    /// <summary>
    /// Заводской (инвентарный) номер
    /// </summary>
    public string FactoryNumber { get; set; }

    /// <summary>
    /// Дата ввода в эксплуатацию
    /// </summary>
    public string CommissioningDate { get; set; }

    /// <summary>
    /// Текущее состояние
    /// </summary>
    public Condition CurrentCondition { get; set; }
}
