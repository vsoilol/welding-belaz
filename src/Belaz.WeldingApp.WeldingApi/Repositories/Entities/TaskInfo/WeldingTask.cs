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
        
        public Guid WelderId { get; set; }
        
        [ForeignKey(nameof(WelderId))]
        public Welder Welder { get; set; }
        
        public Guid MasterId { get; set; }
        
        [ForeignKey(nameof(MasterId))]
        public Master Master { get; set; }
        
        public Guid InspectorId { get; set; }
        
        [ForeignKey(nameof(InspectorId))]
        public Inspector Inspector { get; set; }

        /// <summary>
        /// Дата выполнения сварки
        /// </summary>
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
        public int AmbientTemperature { get; set; }

        /// <summary>
        /// Влажность воздуха
        /// </summary>
        public int AirHumidity { get; set; }
        
        /// <summary>
        /// Межслойная температура
        /// </summary>
        public int InterlayerTemperature { get; set; }

        /// <summary>
        /// Номер текущего слоя
        /// </summary>
        public int CurrentLayerNumber { get; set; }

        /// <summary>
        /// Температура предварительного нагрева
        /// </summary>
        public int PreheatingTemperature { get; set; }
        
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
        public string BasicMaterial { get; set; }

        /// <summary>
        /// № сертификата (партии) основного материала
        /// </summary>
        public string MainMaterialBatchNumber  { get; set; }

        /// <summary>
        /// Сварочные материалы
        /// </summary>
        public string WeldingMaterial { get; set; }
        
        /// <summary>
        /// № сертификата (партии) св. материала
        /// </summary>
        public string WeldingMaterialBatchNumber { get; set; }

        /// <summary>
        /// Защитный газ 
        /// </summary>
        public string? ProtectiveGas { get; set; }
        
        /// <summary>
        /// № сертификата (партии) на защитный газ 
        /// </summary>
        public string? ProtectiveGasBatchNumber { get; set; }

        public Guid? ProductId { get; set; }
        
        [ForeignKey(nameof(ProductId))]
        public Product? Product { get; set; }
        
        public Guid? SeamId { get; set; }
        
        [ForeignKey(nameof(SeamId))]
        public Seam? Seam { get; set; }
    }
}