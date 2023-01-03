using AutoMapper;
using Belaz.WeldingApp.WeldingApi.Contracts.Responses;
using Belaz.WeldingApp.WeldingApi.Repositories.Entities.ProductInfo;

namespace Belaz.WeldingApp.WeldingApi.Mapping;

public class WeldPassageProfile : Profile
{
    public WeldPassageProfile()
    {
        CreateMap<WeldPassage, WeldPassageDto>()
            .ForMember(dto => dto.WeldingCurrentMin,
                opt => opt
                    .MapFrom(x => x.LayerInstruction.WeldingCurrentMin))
            .ForMember(dto => dto.WeldingCurrentMax,
                opt => opt
                    .MapFrom(x => x.LayerInstruction.WeldingCurrentMax))
            .ForMember(dto => dto.ArcVoltageMin,
                opt => opt
                    .MapFrom(x => x.LayerInstruction.ArcVoltageMin))
            .ForMember(dto => dto.ArcVoltageMax,
                opt => opt
                    .MapFrom(x => x.LayerInstruction.ArcVoltageMax))
            .ForMember(dto => dto.PreheatingTemperatureMin,
                opt => opt
                    .MapFrom(x => x.LayerInstruction.PreheatingTemperatureMin))
            .ForMember(dto => dto.PreheatingTemperatureMax,
                opt => opt
                    .MapFrom(x => x.LayerInstruction.PreheatingTemperatureMax));
    }
}