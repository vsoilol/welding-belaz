using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Belaz.WeldingApp.RegistarApi.Domain.Entities.TaskInfo;

namespace Belaz.WeldingApp.RegistarApi.DataLayer.Repositories.Interfaces;

public interface IWeldPassageRepository
{
    Task CreateAsync(WeldPassage weldPassage);
}
