using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Belaz.WeldingApp.WeldingApi.Repositories.Entities.ProductInfo;
using Belaz.WeldingApp.WeldingApi.Repositories.Entities.Users;
using WeldingApp.Common.Enums;

namespace Belaz.WeldingApp.WeldingApi.Repositories.Entities.TaskInfo
{
    public class WeldingTask : Entity
    {
        public int Number { get; set; }
        
        [Required]
        public Guid WelderId { get; set; }
        
        [ForeignKey(nameof(WelderId))]
        public Welder Welder { get; set; }
        
        [Required]
        public Guid MasterId { get; set; }
        
        [ForeignKey(nameof(MasterId))]
        public Master Master { get; set; }
        
        [Required]
        public Guid InspectorId { get; set; }
        
        [ForeignKey(nameof(InspectorId))]
        public Inspector Inspector { get; set; }

        /// <summary>
        /// Дата выполнения сварки
        /// </summary>
        [Required]
        public DateTime WeldingDate { get; set; }

        /// <summary>
        /// Время начала сварки
        /// </summary>
        public DateTime? WeldingStartTime { get; set; }
        
        /// <summary>
        /// Время окончания сварки
        /// </summary>
        public DateTime? WeldingEndTime { get; set; }

        /// <summary>
        /// Температура окружающей среды
        /// </summary>
        [Required]
        public int AmbientTemperature { get; set; }

        /// <summary>
        /// Влажность воздуха
        /// </summary>
        [Required]
        public int AirHumidity { get; set; }
        
        /// <summary>
        /// Межслойная температура
        /// </summary>
        [Required]
        public int InterlayerTemperature { get; set; }

        /// <summary>
        /// Номер текущего слоя
        /// </summary>
        [Required]
        public int CurrentLayerNumber { get; set; }

        /// <summary>
        /// Температура предварительного нагрева
        /// </summary>
        [Required]
        public int PreheatingTemperature { get; set; }

        [Required] 
        public Status Status { get; set; } = Status.NotStarted;

        /// <summary>
        /// Причины брака
        /// </summary>
        public string? DefectReasons { get; set; }
        
        /// <summary>
        /// Обнаруженные дефекты (брак)
        /// </summary>
        public string? DefectsDetected { get; set; }
        
        /// <summary>
        /// Значения сварочного тока
        /// </summary>
        public double[]? WeldingCurrentValues { get; set; }
        
        /// <summary>
        /// Значения напряжения на дуге
        /// </summary>
        public double[]? ArcVoltageValues { get; set; }
        
        /// <summary>
        /// Отклонение кратковременные, до 1 секунды
        /// </summary>
        public double? ShortTermDeviation { get; set; }
        
        /// <summary>
        /// Отклонения длительные, более 1 секунды
        /// </summary>
        public double? LongTermDeviation { get; set; }

        /// <summary>
        /// Основной материал
        /// </summary>
        [Required]
        [MaxLength(50)]
        public string BasicMaterial { get; set; }

        /// <summary>
        /// № сертификата (партии) основного материала
        /// </summary>
        [Required]
        [MaxLength(50)]
        public string MainMaterialBatchNumber  { get; set; }

        /// <summary>
        /// Сварочные материалы
        /// </summary>
        [Required]
        [MaxLength(50)]
        public string WeldingMaterial { get; set; }
        
        /// <summary>
        /// № сертификата (партии) св. материала
        /// </summary>
        [Required]
        [MaxLength(50)]
        public string WeldingMaterialBatchNumber { get; set; }

        /// <summary>
        /// Защитный газ 
        /// </summary>
        [MaxLength(50)]
        public string? ProtectiveGas { get; set; }
        
        /// <summary>
        /// № сертификата (партии) на защитный газ 
        /// </summary>
        [MaxLength(50)]
        public string? ProtectiveGasBatchNumber { get; set; }
        
        [Required]
        public Guid SeamId { get; set; }
        
        [ForeignKey(nameof(SeamId))]
        public Seam Seam { get; set; }
        
        public Guid? ProductId { get; set; }
        
        [ForeignKey(nameof(ProductId))]
        public Product? Product { get; set; }
        
        public Guid? KnotId { get; set; }
        
        [ForeignKey(nameof(KnotId))]
        public Knot? Knot { get; set; }
        
        public Guid? DetailId { get; set; }
        
        [ForeignKey(nameof(DetailId))]
        public Detail? Detail { get; set; }
        
        public Guid TechnologicalProcessInstructionId { get; set; }
        
        [ForeignKey(nameof(TechnologicalProcessInstructionId))]
        public TechnologicalProcessInstruction TechnologicalProcessInstruction { get; set; }
    }
}