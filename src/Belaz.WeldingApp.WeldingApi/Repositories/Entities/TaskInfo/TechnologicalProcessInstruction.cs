namespace Belaz.WeldingApp.WeldingApi.Repositories.Entities.TaskInfo
{
    public class TechnologicalProcessInstruction : Entity
    {
        public int Number { get; set; }

        public string Name { get; set; }
        
        /// <summary>
        /// Ссылка на PDF-файл в PDM-системе
        /// </summary>
        public string Link { get; set; }

        public List<Layer> Layers { get; set; }

        public List<WeldingTask> WeldingTasks { get; set; }
    }
}