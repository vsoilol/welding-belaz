using Belaz.WeldingApp.WeldingApi.Contracts.Responses.UserData;

namespace Belaz.WeldingApp.WeldingApi.Contracts.Responses.WeldingEquipment;

public class WeldingEquipmentDto
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

    public int Height { get; set; }

    public int Width { get; set; }

    public int Lenght { get; set; }

    /// <summary>
    /// Номер группы оборудования
    /// </summary>
    public int GroupNumber { get; set; }

    /// <summary>
    /// Наименование изготовителя
    /// </summary>
    public string ManufacturerName { get; set; }

    /// <summary>
    /// Дата очередной аттестации
    /// </summary>
    public string NextAttestationDate { get; set; }

    /// <summary>
    /// Ответственный за сварочное оборудование
    /// </summary>
    public UserFullName ResponsiblePerson { get; set; }

    /// <summary>
    /// Процесс (способ) сварки
    /// </summary>
    public string WeldingProcess { get; set; }

    /// <summary>
    /// Напряжение холостого хода
    /// </summary>
    public double IdleVoltage { get; set; }

    /// <summary>
    /// Сварочный ток min
    /// </summary>
    public double WeldingCurrentMin { get; set; }

    /// <summary>
    /// Сварочный ток max
    /// </summary>
    public double WeldingCurrentMax { get; set; }

    /// <summary>
    /// Напряжения на дуге min
    /// </summary>
    public double ArcVoltageMin { get; set; }

    /// <summary>
    /// Напряжения на дуге max
    /// </summary>
    public double ArcVoltageMax { get; set; }

    public int? PostNumber { get; set; }

    /// <summary>
    /// Продолжительность включения (нагрузки), в минутах
    /// </summary>
    public int ActivationDuration { get; set; }
}
