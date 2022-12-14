using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Belaz.WeldingApp.WeldingApi.Repositories.Entities.CalendarInfo;
using Belaz.WeldingApp.WeldingApi.Repositories.Entities.Production;
using Belaz.WeldingApp.WeldingApi.Repositories.Entities.Users;
using WeldingApp.Common.Enums;

namespace Belaz.WeldingApp.WeldingApi.Repositories.Entities.WeldingEquipmentInfo
{
    /// <summary>
    /// Сварочное оборудование
    /// </summary>
    public class WeldingEquipment : Entity
    {
        /// <summary>
        /// RFID-метка
        /// </summary>
        [Required]
        [MaxLength(100)]
        public string RfidTag { get; set; }

        [Required]
        [MaxLength(100)]
        public string Name { get; set; }

        /// <summary>
        /// Маркировка
        /// </summary>
        [Required]
        [MaxLength(50)]
        public string Marking { get; set; }

        /// <summary>
        /// Заводской (инвентарный) номер
        /// </summary>
        [Required]
        [MaxLength(50)]
        public string FactoryNumber { get; set; }

        /// <summary>
        /// Дата ввода в эксплуатацию
        /// </summary>
        [Required]
        public DateTime CommissioningDate { get; set; }

        /// <summary>
        /// Текущее состояние
        /// </summary>
        [Required]
        public Condition CurrentCondition { get; set; } = Condition.Off;

        [Required]
        public int Height { get; set; }

        [Required]
        public int Width { get; set; }

        [Required]
        public int Lenght { get; set; }

        /// <summary>
        /// Номер группы оборудования
        /// </summary>
        [Required]
        public int GroupNumber { get; set; }

        /// <summary>
        /// Наименование изготовителя
        /// </summary>
        [Required]
        [MaxLength(100)]
        public string ManufacturerName { get; set; }

        /// <summary>
        /// Дата очередной аттестации
        /// </summary>
        [Required]
        public DateTime NextAttestationDate { get; set; }

        /// <summary>
        /// Процесс (способ) сварки
        /// </summary>
        [Required]
        [MaxLength(100)]
        public string WeldingProcess { get; set; }

        /// <summary>
        /// Напряжение холостого хода
        /// </summary>
        [Required]
        public double IdleVoltage { get; set; }
        
        /// <summary>
        /// Сварочный ток min
        /// </summary>
        [Required]
        public double WeldingCurrentMin { get; set; }
        
        /// <summary>
        /// Сварочный ток max
        /// </summary>
        [Required]
        public double WeldingCurrentMax { get; set; }

        /// <summary>
        /// Напряжения на дуге min
        /// </summary>
        [Required]
        public double ArcVoltageMin { get; set; }
        
        /// <summary>
        /// Напряжения на дуге max
        /// </summary>
        [Required]
        public double ArcVoltageMax { get; set; }
        
        public Guid? PostId { get; set; }
        
        [ForeignKey(nameof(PostId))]
        public Post? Post { get; set; }
        
        public Guid? CalendarId { get; set; }
        
        [ForeignKey(nameof(CalendarId))]
        public Calendar? Calendar { get; set; }
        
        public Guid? MasterId { get; set; }
        
        [ForeignKey(nameof(MasterId))]
        public Master? Master { get; set; }
        
        public Guid? WelderId { get; set; }
        
        [ForeignKey(nameof(WelderId))]
        public Welder? Welder { get; set; }

        public List<WeldingEquipmentWorkingShift> WeldingEquipmentWorkingShifts { get; set; }
    }
}