﻿using AutoMapper;
using Belaz.WeldingApp.WeldingApi.Domain.Extensions;
using Belaz.WeldingApp.WeldingApi.Domain.Mappings;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.WorkingShift;

public class CreateWorkingShiftRequest
    : IMapTo<Belaz.WeldingApp.Common.Entities.CalendarInfo.WorkingShift>
{
    public int Number { get; set; }

    public string ShiftStart { get; set; } = null!;

    public string ShiftEnd { get; set; } = null!;

    public string? BreakStart { get; set; }

    public string? BreakEnd { get; set; }

    public void Mapping(Profile profile)
    {
        profile
            .CreateMap<
                CreateWorkingShiftRequest,
                Belaz.WeldingApp.Common.Entities.CalendarInfo.WorkingShift
            >()
            .ForMember(dto => dto.ShiftStart, opt => opt.MapFrom(x => x.ShiftStart.ToTimeSpan()))
            .ForMember(dto => dto.ShiftEnd, opt => opt.MapFrom(x => x.ShiftEnd.ToTimeSpan()))
            .ForMember(dto => dto.BreakStart, opt => opt.MapFrom(x => x.BreakStart.ToTimeSpan()))
            .ForMember(dto => dto.BreakEnd, opt => opt.MapFrom(x => x.BreakEnd.ToTimeSpan()));
    }
}
