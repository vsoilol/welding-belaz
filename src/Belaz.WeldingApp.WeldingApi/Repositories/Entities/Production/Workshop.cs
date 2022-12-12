using System.ComponentModel.DataAnnotations;

namespace Belaz.WeldingApp.WeldingApi.Repositories.Entities.Production
{
    /// <summary>
    /// Цех
    /// </summary>
    public class Workshop : Entity
    {
        [Required]
        [MaxLength(100)]
        public string Name { get; set; }

        public List<ProductionArea> ProductionAreas { get; set; }
    }
}
