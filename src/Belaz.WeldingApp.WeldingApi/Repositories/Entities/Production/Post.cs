using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Belaz.WeldingApp.WeldingApi.Repositories.Entities.Production
{
    /// <summary>
    /// Пост
    /// </summary>
    public class Post : Entity
    {
        [Required]
        public int Number { get; set; }

        public List<Workplace> Workplaces { get; set; }
        
        [Required]
        public Guid ProductionAreaId { get; set; }
        
        [ForeignKey(nameof(ProductionAreaId))]
        public ProductionArea ProductionArea { get; set; }
    }
}