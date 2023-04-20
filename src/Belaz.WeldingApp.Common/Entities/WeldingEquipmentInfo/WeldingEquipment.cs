﻿using System.ComponentModel.DataAnnotations.Schema;
using Belaz.WeldingApp.Common.Enums;
using Belaz.WeldingApp.Common.Entities.CalendarInfo;
using Belaz.WeldingApp.Common.Entities.ProductInfo;
using Belaz.WeldingApp.Common.Entities.Production;
using Belaz.WeldingApp.Common.Entities.TaskInfo;
using Belaz.WeldingApp.Common.Entities.Users;
using Microsoft.EntityFrameworkCore;

namespace Belaz.WeldingApp.Common.Entities.WeldingEquipmentInfo;

/// <summary>
/// Сварочное оборудование
/// </summary>
public class WeldingEquipment : EntityWithRfidTag
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

    /// <summary>
    /// Дата ввода в эксплуатацию
    /// </summary>
    public DateTime CommissioningDate { get; set; }

    /// <summary>
    /// Текущее состояние
    /// </summary>
    public Condition CurrentCondition { get; set; } = Condition.Off;

    public int? Height { get; set; }

    public int? Width { get; set; }

    public int? Lenght { get; set; }

    /// <summary>
    /// Номер группы оборудования
    /// </summary>
    public string GroupNumber { get; set; } = null!;

    /// <summary>
    /// Наименование изготовителя
    /// </summary>
    public string ManufacturerName { get; set; } = null!;

    /// <summary>
    /// Дата очередной аттестации
    /// </summary>
    public DateTime? NextAttestationDate { get; set; }

    /// <summary>
    /// Процесс (способ) сварки
    /// </summary>
    public string WeldingProcess { get; set; } = null!;

    /// <summary>
    /// Напряжение холостого хода
    /// </summary>
    public double? IdleVoltage { get; set; }

    /// <summary>
    /// Сварочный ток min
    /// </summary>
    public double? WeldingCurrentMin { get; set; }

    /// <summary>
    /// Сварочный ток max
    /// </summary>
    public double? WeldingCurrentMax { get; set; }

    /// <summary>
    /// Напряжения на дуге min
    /// </summary>
    public double? ArcVoltageMin { get; set; }

    /// <summary>
    /// Напряжения на дуге max
    /// </summary>
    public double? ArcVoltageMax { get; set; }

    /// <summary>
    /// Продолжительность нагрузки
    /// </summary>
    public double? LoadDuration { get; set; }

    public Guid? PostId { get; set; }

    [ForeignKey(nameof(PostId))]
    public Post? Post { get; set; }

    public List<Workplace> Workplaces { get; set; } = null!;

    public List<Calendar> Calendars { get; set; } = null!;

    public Guid? MasterId { get; set; }

    [ForeignKey(nameof(MasterId))]
    public Master? Master { get; set; }

    public List<Welder> Welders { get; set; } = null!;

    public List<Chief> Chiefs { get; set; } = null!;

    public List<WeldingEquipmentConditionTime> WeldingEquipmentConditionTime { get; set; } = null!;

    public List<WeldingRecord> WeldingRecords { get; set; } = null!;

    public List<ProductAccount> ProductAccounts { get; set; } = null!;
}