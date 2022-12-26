using System.ComponentModel.DataAnnotations;

namespace Belaz.WeldingApp.WeldingApi.Repositories.Entities.Production
{
    /// <summary>
    /// Цех
    /// </summary>
    public class Workshop : Entity
    {
        public string Name { get; set; }

        public int Number { get; set; }
        
        public List<ProductionArea> ProductionAreas { get; set; }
    }
}