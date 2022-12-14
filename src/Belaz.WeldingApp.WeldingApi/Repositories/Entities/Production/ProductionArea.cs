using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Belaz.WeldingApp.WeldingApi.Repositories.Entities.Production
{
    /// <summary>
    /// Производственный участок
    /// </summary>
    public class ProductionArea : Entity
    {
        [Required]
        [MaxLength(100)]
        public string Name { get; set; }

        [Required]
        public Guid WorkshopId { get; set; }
        
        [ForeignKey(nameof(WorkshopId))]
        public Workshop Workshop { get; set; }

        public List<Post> Posts { get; set; }
        
        public List<Workplace> Workplaces { get; set; }
    }
}