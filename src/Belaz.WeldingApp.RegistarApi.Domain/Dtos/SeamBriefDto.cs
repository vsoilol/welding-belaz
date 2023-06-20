using Belaz.WeldingApp.Common.Entities.ProductInfo;
using Belaz.WeldingApp.RegistarApi.Domain.Mappings;

namespace Belaz.WeldingApp.RegistarApi.Domain.Dtos;

public class SeamBriefDto : IMapFrom<Seam>
{
    public Guid Id { get; set; }

    public int Number { get; set; }

    public int Length { get; set; }
}