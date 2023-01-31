using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Belaz.WeldingApp.FileApi.Domain.Entities.Production
{
    /// <summary>
    /// Пост
    /// </summary>
    public class Post : Entity
    {
        public int Number { get; set; }

        public string Name { get; set; } = null!;

        public List<Workplace> Workplaces { get; set; } = null!;

        public Guid ProductionAreaId { get; set; }

        [ForeignKey(nameof(ProductionAreaId))] 
        public ProductionArea ProductionArea { get; set; } = null!;
    }
}