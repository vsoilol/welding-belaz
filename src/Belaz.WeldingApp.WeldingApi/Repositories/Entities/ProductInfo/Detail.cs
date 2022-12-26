using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Belaz.WeldingApp.WeldingApi.Repositories.Entities.TaskInfo;

namespace Belaz.WeldingApp.WeldingApi.Repositories.Entities.ProductInfo
{
    /// <summary>
    /// Деталь
    /// </summary>
    public class Detail : Entity
    {
        public string Name { get; set; }
        
        public int Number { get; set; }
        
        public WeldingTask? WeldingTask { get; set; }

        public List<ProductBridge> ProductBridges { get; set; }
    }
}