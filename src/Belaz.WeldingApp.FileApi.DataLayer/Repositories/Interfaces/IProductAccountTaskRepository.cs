using Belaz.WeldingApp.FileApi.Domain.Dtos.SeamPassportInfo;

namespace Belaz.WeldingApp.FileApi.DataLayer.Repositories.Interfaces;

public interface IProductAccountTaskRepository
{
    Task<ProductAccountTaskDto> GetProductAccountTaskById(Guid id);
}