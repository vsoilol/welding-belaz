using Belaz.WeldingApp.WeldingApi.Repositories.Entities.TaskInfo;

namespace Belaz.WeldingApp.WeldingApi.Repositories.Implementations;

public class TechnologicalInstructionRepository : EntityFrameworkRepository<TechnologicalInstruction>
{
    public TechnologicalInstructionRepository(ApplicationContext context, ILogger<EntityFrameworkRepository<TechnologicalInstruction>> logger) : base(context, logger)
    {
    }
}