using System.ComponentModel.DataAnnotations.Schema;
using Belaz.WeldingApp.WeldingApi.Repositories.Entities.ProductInfo;

namespace Belaz.WeldingApp.WeldingApi.Repositories.Entities.TaskInfo
{
    public class TechnologicalProcess : Entity
    {
        public int Number { get; set; }

        public string Name { get; set; }

        /// <summary>
        /// Ссылка на PDF-файл в PDM-системе
        /// </summary>
        public string PdmSystemFileLink { get; set; }

        public Guid? ProductId { get; set; }

        [ForeignKey(nameof(ProductId))] 
        public Product? Product { get; set; }

        public List<TechnologicalInstruction> TechnologicalInstructions { get; set; } = null!;
    }
}