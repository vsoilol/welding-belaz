using AutoMapper;
using Belaz.WeldingApp.WeldingApi.Contracts.Responses.TechnologicalProcess;
using Belaz.WeldingApp.WeldingApi.Repositories.Entities.TaskInfo;

namespace Belaz.WeldingApp.WeldingApi.Mapping;

public class TechnologicalProcessProfile : Profile
{
    public TechnologicalProcessProfile()
    {
        CreateMap<TechnologicalProcess, TechnologicalProcessDto>()
            .ForMember(dto => dto.ArcVoltageMax,
                opt => opt
                    .MapFrom(x => x.LayerInstruction.ArcVoltageMax))
            .ForMember(dto => dto.ArcVoltageMin,
                opt => opt
                    .MapFrom(x => x.LayerInstruction.ArcVoltageMin))
            .ForMember(dto => dto.PreheatingTemperatureMax,
                opt => opt
                    .MapFrom(x => x.LayerInstruction.PreheatingTemperatureMax))
            .ForMember(dto => dto.PreheatingTemperatureMin,
                opt => opt
                    .MapFrom(x => x.LayerInstruction.PreheatingTemperatureMin))
            .ForMember(dto => dto.WeldingCurrentMax,
                opt => opt
                    .MapFrom(x => x.LayerInstruction.WeldingCurrentMax))
            .ForMember(dto => dto.WeldingCurrentMin,
                opt => opt
                    .MapFrom(x => x.LayerInstruction.WeldingCurrentMin));
    }
}