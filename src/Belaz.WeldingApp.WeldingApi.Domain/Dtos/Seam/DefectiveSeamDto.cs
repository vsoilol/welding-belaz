using AutoMapper;
using Belaz.WeldingApp.WeldingApi.Domain.Entities.ProductInfo;
using Belaz.WeldingApp.WeldingApi.Domain.Extensions;
using Belaz.WeldingApp.WeldingApi.Domain.Mappings;

namespace Belaz.WeldingApp.WeldingApi.Domain.Dtos.Seam;

public class DefectiveSeamDto : IMapFrom<StatusReason>
{
    public Guid Id { get; set; }
    
    public string? IdFromSystem { get; set; }

    public SeamDto Seam { get; set; } = null!;

    public string Date { get; set; } = null!;

    public string Reason { get; set; } = null!;

    public void Mapping(Profile profile)
    {
        profile.CreateMap<StatusReason, DefectiveSeamDto>()
            .ForMember(dto => dto.Date,
                opt => opt
                    .MapFrom(x => x.Date.ToDayInfoString()));
    }
}