using Belaz.WeldingApp.WeldingApi.Domain.Mappings;

namespace Belaz.WeldingApp.WeldingApi.Domain.Dtos.WeldingTask;

public class WeldingMaterialInfoDto : IMapFrom<Belaz.WeldingApp.Common.Entities.TaskInfo.WeldingTask>
{
    /// <summary>
    /// Сварочные материалы
    /// </summary>
    public string? WeldingMaterial { get; set; }

    /// <summary>
    /// № сертификата (партии) св. материала
    /// </summary>
    public string? WeldingMaterialBatchNumber { get; set; }
}