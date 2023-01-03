using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Belaz.WeldingApp.WeldingApi.Repositories.Entities.TaskInfo;
using WeldingApp.Common.Enums;

namespace Belaz.WeldingApp.WeldingApi.Repositories.Entities.ProductInfo
{
    /// <summary>
    /// Изделие
    /// </summary>
    public class Product : Entity
    {
        public string? Name { get; set; }
        
        public int Number { get; set; }
        
        /// <summary>
        /// Подлежит ли контролю
        /// </summary>
        public bool IsControlSubject { get; set; }

        public ProductType ProductType { get; set; }

        public WeldingTask? WeldingTask { get; set; }
        
        public TechnologicalProcess? TechnologicalProcess { get; set; }

        public List<Seam> Seams { get; set; } = null!;

        public List<ProductInside> ProductInsides { get; set; } = null!;
    }
}