using Belaz.WeldingApp.WeldingApi.DataLayer.Entities.TaskInfo;

namespace Belaz.WeldingApp.WeldingApi.DataLayer.Repositories.Implementations;

public class TechnologicalInstructionRepository : EntityFrameworkRepository<TechnologicalInstruction>
{
    public TechnologicalInstructionRepository(ApplicationContext context, ILogger<EntityFrameworkRepository<TechnologicalInstruction>> logger) : base(context, logger)
    {
    }
}