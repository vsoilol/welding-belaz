namespace Belaz.WeldingApp.WeldingApi.Repositories.Entities.TaskInfo;

public class TechnologicalInstruction : Entity
{
    public int Number { get; set; }

    public string Name { get; set; }
    
    public List<WeldingTask> WeldingTasks { get; set; }
}