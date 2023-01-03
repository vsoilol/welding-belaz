﻿using AutoMapper;
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
            .ForMember(dto => dto.TechnologicalInstruction,
                opt => opt
                    .MapFrom(x => x.TechnologicalInstruction))
            .ForMember(dto => dto.TechnologicalProcess,
                opt => opt
                    .MapFrom(x => x.TechnologicalInstruction.TechnologicalProcess))
            .ForMember(dto => dto.ProductionInfo,
                opt => opt
                    .MapFrom(x => x.WeldingTask.Welder.Workplace));

        CreateMap<Seam, SeamBriefDto>();
    }
}