﻿using AutoMapper;
using Belaz.WeldingApp.WeldingApi.Domain.Mappings;

namespace Belaz.WeldingApp.WeldingApi.Domain.Dtos.Master;

public class MasterBriefDto : IMapFrom<Entities.Users.Master>
{
    public Guid Id { get; set; }

    public string? IdFromSystem { get; set; }

    public string RfidTag { get; set; } = null!;

    public string FirstName { get; set; } = null!;

    public string LastName { get; set; } = null!;

    public string MiddleName { get; set; } = null!;

    public string? Position { get; set; }

    /// <summary>
    /// Табельный номер 
    /// </summary>
    public string? ServiceNumber { get; set; }
    
    public void Mapping(Profile profile)
    {
        profile.CreateMap<Entities.Users.Master, MasterBriefDto>()
            .ForMember(dto => dto.RfidTag,
                opt => opt
                    .MapFrom(x => x.UserInfo.RfidTag))
            .ForMember(dto => dto.FirstName,
                opt => opt
                    .MapFrom(x => x.UserInfo.FirstName))
            .ForMember(dto => dto.MiddleName,
                opt => opt
                    .MapFrom(x => x.UserInfo.MiddleName))
            .ForMember(dto => dto.Position,
                opt => opt
                    .MapFrom(x => x.UserInfo.Position))
            .ForMember(dto => dto.LastName,
                opt => opt
                    .MapFrom(x => x.UserInfo.LastName))
            .ForMember(dto => dto.ServiceNumber,
                opt => opt
                    .MapFrom(x => x.UserInfo.ServiceNumber));
    }
}