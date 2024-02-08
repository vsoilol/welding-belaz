using AutoMapper;
using Belaz.WeldingApp.Common.Entities.ProductInfo;
using Belaz.WeldingApp.FileApi.Domain.Mappings;

namespace Belaz.WeldingApp.FileApi.Domain.Dtos.SeamPassportInfo;

public class SeamBriefDto : IMapFrom<Seam>
{
    public string Number { get; set; } = null!;

    public TechnologicalInstructionBriefDto TechnologicalInstruction { get; set; } = null!;
    
    public TechnologicalProcessBriefDto TechnologicalProcess { get; set; } = null!;

    public void Mapping(Profile profile)
    {
        profile
            .CreateMap<Seam, SeamBriefDto>()
            .ForMember(dto => dto.TechnologicalProcess, 
                opt => 
                    opt.MapFrom(x => x.Product.TechnologicalProcess));
    }
}