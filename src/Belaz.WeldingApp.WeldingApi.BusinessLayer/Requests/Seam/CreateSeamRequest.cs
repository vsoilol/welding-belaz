using Belaz.WeldingApp.WeldingApi.Domain.Mappings;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.Seam;

public class CreateSeamRequest : IMapTo<Domain.Entities.ProductInfo.Seam>
{
    public int Number { get; set; }

    /// <summary>
    /// Подлежит ли контролю
    /// </summary>
    public bool IsControlSubject { get; set; }

    /// <summary>
    /// Поддлежит ли исполнению на регистраторе
    /// </summary>
    public bool IsPerformed { get; set; } = false;

    public int Length { get; set; }

    public Guid ProductionAreaId { get; set; }

    public Guid? TechnologicalInstructionId { get; set; }

    public Guid ProductId { get; set; }
}
