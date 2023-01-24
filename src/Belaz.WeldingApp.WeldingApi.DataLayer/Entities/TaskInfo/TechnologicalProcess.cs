using System.ComponentModel.DataAnnotations.Schema;
using Belaz.WeldingApp.WeldingApi.DataLayer.Entities.ProductInfo;

namespace Belaz.WeldingApp.WeldingApi.DataLayer.Entities.TaskInfo
{
    public class TechnologicalProcess : Entity
    {
        public int Number { get; set; }

        public string Name { get; set; }

        /// <summary>
        /// Ссылка на PDF-файл в PDM-системе
        /// </summary>
        public string PdmSystemFileLink { get; set; } = null!;

        public List<Product> Products { get; set; } = null!;

        public List<TechnologicalInstruction> TechnologicalInstructions { get; set; } = null!;
    }
}