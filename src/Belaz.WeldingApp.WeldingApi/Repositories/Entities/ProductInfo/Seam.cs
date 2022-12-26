using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Belaz.WeldingApp.WeldingApi.Repositories.Entities.TaskInfo;

namespace Belaz.WeldingApp.WeldingApi.Repositories.Entities.ProductInfo
{
    /// <summary>
    /// Шов
    /// </summary>
    public class Seam : Entity
    {
        public int Number { get; set; }
        
        public WeldingTask WeldingTask { get; set; }
        
        public List<ProductBridge> ProductBridges { get; set; }
    }
}