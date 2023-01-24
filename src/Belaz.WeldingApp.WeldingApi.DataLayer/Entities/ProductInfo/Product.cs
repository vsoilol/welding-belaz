using System.ComponentModel.DataAnnotations.Schema;
using Belaz.WeldingApp.WeldingApi.DataLayer.Entities.Production;
using Belaz.WeldingApp.WeldingApi.DataLayer.Entities.TaskInfo;
using Belaz.WeldingApp.WeldingApi.DataLayer.Entities.Users;
using WeldingApp.Common.Enums;

namespace Belaz.WeldingApp.WeldingApi.DataLayer.Entities.ProductInfo
{
    /// <summary>
    /// Изделие
    /// </summary>
    public class Product : Entity
    {
        public string? Name { get; set; }
        
        public int Number { get; set; }
        
        public Status Status { get; set; } = Status.NotStarted;
        
        /// <summary>
        /// Подлежит ли контролю
        /// </summary>
        public bool IsControlSubject { get; set; }

        public ProductType ProductType { get; set; }

        public WeldingTask? WeldingTask { get; set; }
        
        public Guid? TechnologicalProcessId { get; set; }
    
        [ForeignKey(nameof(TechnologicalProcessId))]
        public TechnologicalProcess? TechnologicalProcess { get; set; }

        public List<Seam> Seams { get; set; } = null!;

        public List<ProductInside> ProductInsides { get; set; } = null!;

        public List<ProductInside> ProductMains { get; set; } = null!;
        
        public Guid? ProductionAreaId { get; set; }
    
        [ForeignKey(nameof(ProductionAreaId))]
        public ProductionArea? ProductionArea { get; set; }
        
        public Guid? WorkplaceId { get; set; }
    
        [ForeignKey(nameof(WorkplaceId))]
        public Workplace? Workplace { get; set; }

        public List<StatusReason> StatusReasons { get; set; } = null!;
        
        public Guid? MasterId { get; set; }

        [ForeignKey(nameof(MasterId))] 
        public Master? Master { get; set; }
        
        public Guid? InspectorId { get; set; }

        [ForeignKey(nameof(InspectorId))] 
        public Inspector? Inspector { get; set; }
    }
}