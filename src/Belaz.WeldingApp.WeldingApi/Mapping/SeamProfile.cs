using AutoMapper;
using Belaz.WeldingApp.WeldingApi.Contracts.Responses;
using Belaz.WeldingApp.WeldingApi.Repositories.Entities.ProductInfo;

namespace Belaz.WeldingApp.WeldingApi.Mapping;

public class SeamProfile : Profile
{
    public SeamProfile()
    {
        CreateMap<Seam, SeamDto>()
            .ForMember(dto => dto.Product,
            opt => opt
                .MapFrom(x => x.Product))
            .ForMember(dto => dto.TechnologicalInstructionName,
                opt => opt
                    .MapFrom(x => x.TechnologicalInstruction.Name))
            .ForMember(dto => dto.TechnologicalInstructionNumber,
                opt => opt
                    .MapFrom(x => x.TechnologicalInstruction.Number))
            .ForMember(dto => dto.TechnologicalProcessName,
                opt => opt
                    .MapFrom(x => x.TechnologicalInstruction.TechnologicalProcess.Name))
            .ForMember(dto => dto.TechnologicalProcessNumber,
                opt => opt
                    .MapFrom(x => x.TechnologicalInstruction.TechnologicalProcess.Number))
            .ForMember(dto => dto.WorkplaceNumber,
                opt => opt
                    .MapFrom(x => x.WeldingTask.Welder.Workplace.Number))
            .ForMember(dto => dto.WorkshopNumber,
                opt => opt
                    .MapFrom(x => x.WeldingTask.Welder.Workplace.ProductionArea.Workshop.Number))
            .ForMember(dto => dto.ProductionAreaNumber,
                opt => opt
                    .MapFrom(x => x.WeldingTask.Welder.Workplace.ProductionArea.Number));
    }
}