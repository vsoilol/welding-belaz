using Belaz.WeldingApp.Common.Entities.ProductInfo;
using Belaz.WeldingApp.FileApi.Domain.Mappings;

namespace Belaz.WeldingApp.FileApi.Domain.Dtos.ProductInfo;

public class SeamBriefDto : IMapFrom<Seam>
{
    public string Number { get; set; } = null!;
}