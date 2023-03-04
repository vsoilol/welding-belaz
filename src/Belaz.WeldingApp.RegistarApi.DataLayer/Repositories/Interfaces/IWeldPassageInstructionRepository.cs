using Belaz.WeldingApp.RegistarApi.Domain.Dtos;

namespace Belaz.WeldingApp.RegistarApi.DataLayer.Repositories.Interfaces;

public interface IWeldPassageInstructionRepository
{
    Task<WeldPassageInstructionDto> GetByTaskIdAndNumber(Guid taskId, int number);
}
