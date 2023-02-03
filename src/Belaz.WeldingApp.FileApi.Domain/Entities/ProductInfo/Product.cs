using System.ComponentModel.DataAnnotations.Schema;
using Belaz.WeldingApp.FileApi.Domain.Entities.Production;
using Belaz.WeldingApp.FileApi.Domain.Entities.TaskInfo;
using Belaz.WeldingApp.FileApi.Domain.Entities.TechnologicalProcessInfo;
using Belaz.WeldingApp.FileApi.Domain.Entities.Users;
using WeldingApp.Common.Enums;

namespace Belaz.WeldingApp.FileApi.Domain.Entities.ProductInfo
{
    /// <summary>
    /// Изделие
    /// </summary>
    public class Product : Entity
    {
        public string? Name { get; set; }

        public string Number { get; set; } = null!;

        public ProductStatus Status { get; set; } = ProductStatus.NotManufactured;

        /// <summary>
        /// Подлежит ли контролю
        /// </summary>
        public bool IsControlSubject { get; set; }

        /// <summary>
        /// Добавлен ли вручную
        /// </summary>
        public bool IsAddManually { get; set; }

        public ProductType ProductType { get; set; }

        public WeldingTask? WeldingTask { get; set; }

        public Guid? TechnologicalProcessId { get; set; }

        [ForeignKey(nameof(TechnologicalProcessId))]
        public TechnologicalProcess? TechnologicalProcess { get; set; }

        public List<Seam> Seams { get; set; } = null!;

        public List<ProductInside> ProductInsides { get; set; } = null!;

        public ProductInside? ProductMain { get; set; }

        public Guid? ProductionAreaId { get; set; }

        [ForeignKey(nameof(ProductionAreaId))] public ProductionArea? ProductionArea { get; set; }

        public Guid? WorkplaceId { get; set; }

        [ForeignKey(nameof(WorkplaceId))] public Workplace? Workplace { get; set; }

        public List<StatusReason> StatusReasons { get; set; } = null!;

        public Guid? MasterId { get; set; }

        [ForeignKey(nameof(MasterId))] public Master? Master { get; set; }

        public Guid? InspectorId { get; set; }

        [ForeignKey(nameof(InspectorId))] public Inspector? Inspector { get; set; }
    }
}