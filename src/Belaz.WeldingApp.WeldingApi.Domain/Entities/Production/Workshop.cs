using System.ComponentModel.DataAnnotations;
using Belaz.WeldingApp.WeldingApi.Domain.Entities.ProductInfo;

namespace Belaz.WeldingApp.WeldingApi.Domain.Entities.Production
{
    /// <summary>
    /// Цех
    /// </summary>
    public class Workshop : Entity
    {
        public string Name { get; set; } = null!;

        public int Number { get; set; }

        public List<ProductionArea> ProductionAreas { get; set; } = null!;
    }
}