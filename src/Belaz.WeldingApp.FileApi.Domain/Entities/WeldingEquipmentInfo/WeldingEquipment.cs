﻿using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Belaz.WeldingApp.FileApi.Domain.Entities;
using Belaz.WeldingApp.FileApi.Domain.Entities.CalendarInfo;
using Belaz.WeldingApp.FileApi.Domain.Entities.Production;
using Belaz.WeldingApp.FileApi.Domain.Entities.TaskInfo;
using Belaz.WeldingApp.FileApi.Domain.Entities.Users;
using WeldingApp.Common.Enums;

namespace Belaz.WeldingApp.FileApi.Domain.Entities.WeldingEquipmentInfo
{
    /// <summary>
    /// Сварочное оборудование
    /// </summary>
    public class WeldingEquipment : Entity
    {
        /// <summary>
        /// RFID-метка
        /// </summary>
        public string? RfidTag { get; set; }

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

        [ForeignKey(nameof(PostId))] public Post? Post { get; set; }

        public List<Calendar>? Calendars { get; set; }

        public Master? Master { get; set; }

        public List<Welder> Welders { get; set; } = null!;

        public Chief? Chief { get; set; }

        public List<WeldingEquipmentConditionTime> WeldingEquipmentConditionTime { get; set; } = null!;

        public List<WeldingTask> WeldingTasks { get; set; } = null!;
    }
}