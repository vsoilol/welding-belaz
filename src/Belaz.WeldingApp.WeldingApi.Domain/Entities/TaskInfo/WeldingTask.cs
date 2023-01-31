using System.ComponentModel.DataAnnotations.Schema;
using Belaz.WeldingApp.WeldingApi.Domain.Entities.ProductInfo;
using Belaz.WeldingApp.WeldingApi.Domain.Entities.WeldingEquipmentInfo;

namespace Belaz.WeldingApp.WeldingApi.Domain.Entities.TaskInfo
{
    public class WeldingTask : Entity
    {
        public int Number { get; set; }

        /// <summary>
        /// Дата выполнения сварки
        /// </summary>
        public DateTime? WeldingDate { get; set; }

        /// <summary>
        /// Основной материал
        /// </summary>
        public string BasicMaterial { get; set; } = null!;

        /// <summary>
        /// № сертификата (партии) основного материала
        /// </summary>
        public string MainMaterialBatchNumber { get; set; } = null!;

        /// <summary>
        /// Сварочные материалы
        /// </summary>
        public string WeldingMaterial { get; set; } = null!;

        /// <summary>
        /// № сертификата (партии) св. материала
        /// </summary>
        public string WeldingMaterialBatchNumber { get; set; } = null!;

        /// <summary>
        /// Защитный газ 
        /// </summary>
        public string? ProtectiveGas { get; set; }

        /// <summary>
        /// № сертификата (партии) на защитный газ 
        /// </summary>
        public string? ProtectiveGasBatchNumber { get; set; }

        public Guid SeamId { get; set; }

        [ForeignKey(nameof(SeamId))] 
        public Seam Seam { get; set; } = null!;

        public Guid? WeldingEquipmentId { get; set; }
        
        [ForeignKey(nameof(WeldingEquipmentId))] 
        public WeldingEquipment? WeldingEquipment { get; set; }
    }
}