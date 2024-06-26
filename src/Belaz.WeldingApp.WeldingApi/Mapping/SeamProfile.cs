﻿using AutoMapper;
using Belaz.WeldingApp.WeldingApi.Contracts.Requests.Seam;
using Belaz.WeldingApp.WeldingApi.Contracts.Responses;
using Belaz.WeldingApp.WeldingApi.Extensions;
using Belaz.WeldingApp.WeldingApi.Repositories.Entities.ProductInfo;
using WeldingApp.Common.Enums;

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
            .ForMember(dto => dto.ProductionArea,
                opt => opt
                    .MapFrom(x => x.ProductionArea))
            .ForMember(dto => dto.Workshop,
                opt => opt
                    .MapFrom(x => x.ProductionArea.Workshop))
            .ForMember(dto => dto.Workplace,
                opt => opt
                    .MapFrom(x => x.Workplace));

        CreateMap<Seam, SeamBriefDto>();
        CreateMap<CreateSeamRequest, Seam>();
        CreateMapStatusReasonToDefectiveSeamDto();
        CreateMapAddDefectiveReasonToSeamRequestToStatusReason();
        CreateMapUpdateDefectiveReasonToSeamRequestToStatusReason();
    }

    private void CreateMapStatusReasonToDefectiveSeamDto()
    {
        CreateMap<StatusReason, DefectiveSeamDto>()
            .ForMember(dto => dto.Date,
                opt => opt
                    .MapFrom(x => x.Date.ToDayInfoString()));
    }
    
    private void CreateMapAddDefectiveReasonToSeamRequestToStatusReason()
    {
        CreateMap<AddDefectiveReasonToSeamRequest, StatusReason>()
            .ForMember(dto => dto.Date,
                opt => opt
                    .MapFrom(x => x.Date.ToDateTime()))
            .ForMember(dto => dto.Status,
                opt => opt
                    .MapFrom(x => Status.Defective));
    }
    
    private void CreateMapUpdateDefectiveReasonToSeamRequestToStatusReason()
    {
        CreateMap<UpdateDefectiveReasonToSeamRequest, StatusReason>()
            .ForMember(dto => dto.Date,
                opt => opt
                    .MapFrom(x => x.Date.ToDateTime()))
            .ForMember(dto => dto.Status,
                opt => opt
                    .MapFrom(x => Status.Defective));
    }
}