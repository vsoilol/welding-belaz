using AutoMapper;
using Belaz.WeldingApp.WeldingApi.Contracts.Responses.Seam;
using Belaz.WeldingApp.WeldingApi.Repositories.Entities.ProductInfo;

namespace Belaz.WeldingApp.WeldingApi.Mapping;

public class SeamProfile : Profile
{
    public SeamProfile()
    {
        CreateMap<Seam, SeamDto>()
            .ForMember(dto => dto.DetailId,
                opt => opt
                    .MapFrom(x => x.ProductBridges.FirstOrDefault(_ => _.Detail != null).DetailId ?? null))
            .ForMember(dto => dto.KnotId,
                opt => opt
                    .MapFrom(x => x.ProductBridges.FirstOrDefault(_ => _.Knot != null).KnotId ?? null))
            .ForMember(dto => dto.ProductId,
                opt => opt
                    .MapFrom(x => x.ProductBridges.FirstOrDefault(_ => _.Product != null).ProductId ?? null))
            .ForMember(dto => dto.WorkplaceNumber,
                opt => opt
                    .MapFrom(x => x.WeldingTask.Welder.Workplace.Number))
            .ForMember(dto => dto.WorkshopNumber,
                opt => opt
                    .MapFrom(x => x.WeldingTask.Welder.Workplace.ProductionArea.Workshop.Number))
            .ForMember(dto => dto.ProductionAreaNumber,
                opt => opt
                    .MapFrom(x => x.WeldingTask.Welder.Workplace.ProductionArea.Number))
            .ForMember(dto => dto.TechnologicalProcessName,
                opt => opt
                    .MapFrom(x => x.ProductBridges
                        .FirstOrDefault(_ => _.Product != null).Product.TechnologicalProcess.Name))
            .ForMember(dto => dto.TechnologicalProcessNumber,
                opt => opt
                    .MapFrom(x => x.ProductBridges
                        .FirstOrDefault(_ => _.Product != null).Product.TechnologicalProcess.Number))
            .ForMember(dto => dto.TechnologicalProcessId,
                opt => opt
                    .MapFrom(x => x.ProductBridges
                        .FirstOrDefault(_ => _.Product != null).Product.TechnologicalProcess.Id))
            .ForMember(dto => dto.TechnologicalInstructionName,
                opt => opt
                    .MapFrom(x => x.WeldingTask.TechnologicalInstruction.Name))
            .ForMember(dto => dto.TechnologicalProcessNumber,
                opt => opt
                    .MapFrom(x => x.WeldingTask.TechnologicalInstruction.Number));
    }
}