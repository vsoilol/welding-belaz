using Belaz.WeldingApp.Common.Entities.TaskInfo;

namespace Belaz.WeldingApp.RegistarApi.DataLayer.Repositories.Interfaces;

public interface IWeldPassageRepository
{
    Task CreateAsync(WeldPassage weldPassage);
}
