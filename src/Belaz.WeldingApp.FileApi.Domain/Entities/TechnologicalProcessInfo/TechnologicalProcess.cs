using Belaz.WeldingApp.FileApi.Domain.Entities.ProductInfo;

namespace Belaz.WeldingApp.FileApi.Domain.Entities.TechnologicalProcessInfo
{
    public class TechnologicalProcess : Entity
    {
        public int Number { get; set; }

        public string Name { get; set; } = null!;

        /// <summary>
        /// Ссылка на PDF-файл в PDM-системе
        /// </summary>
        public string PdmSystemFileLink { get; set; } = null!;

        public List<Product> Products { get; set; } = null!;

        public List<TechnologicalInstruction> TechnologicalInstructions { get; set; } = null!;
    }
}