using AutoMapper;
using Belaz.WeldingApp.WeldingApi.Contracts.Requests.WorkingShift;
using Belaz.WeldingApp.WeldingApi.Contracts.Responses;
using Belaz.WeldingApp.WeldingApi.Extensions;
using Belaz.WeldingApp.WeldingApi.Repositories.Entities.CalendarInfo;

namespace Belaz.WeldingApp.WeldingApi.Mapping;

public class WorkingShiftProfile : Profile
{
    public WorkingShiftProfile()
    {
        CreateMapWorkingShiftToWorkingShiftDto();
        CreateMapCreateWorkingShiftRequestToWorkingShift();
        CreateMapCreateWorkingShiftWithIdRequestToWorkingShift();
        CreateMapUpdateWorkingShiftRequestToWorkingShift();
    }
    
    private void CreateMapCreateWorkingShiftWithIdRequestToWorkingShift()
    {
        CreateMap<CreateWorkingShiftWithIdRequest, WorkingShift>()
            .ForMember(dto => dto.ShiftStart,
                opt => opt
                    .MapFrom(x => x.ShiftStart.ToTimeSpan()))
            .ForMember(dto => dto.ShiftEnd,
                opt => opt
                    .MapFrom(x => x.ShiftEnd.ToTimeSpan()))
            .ForMember(dto => dto.BreakStart,
                opt => opt
                    .MapFrom(x => x.BreakStart.ToTimeSpan()))
            .ForMember(dto => dto.BreakEnd,
                opt => opt
                    .MapFrom(x => x.BreakEnd.ToTimeSpan()));
    }
    
    private void CreateMapUpdateWorkingShiftRequestToWorkingShift()
    {
        CreateMap<UpdateWorkingShiftRequest, WorkingShift>()
            .ForMember(dto => dto.ShiftStart,
                opt => opt
                    .MapFrom(x => x.ShiftStart.ToTimeSpan()))
            .ForMember(dto => dto.ShiftEnd,
                opt => opt
                    .MapFrom(x => x.ShiftEnd.ToTimeSpan()))
            .ForMember(dto => dto.BreakStart,
                opt => opt
                    .MapFrom(x => x.BreakStart.ToTimeSpan()))
            .ForMember(dto => dto.BreakEnd,
                opt => opt
                    .MapFrom(x => x.BreakEnd.ToTimeSpan()));
    }

    private void CreateMapCreateWorkingShiftRequestToWorkingShift()
    {
        CreateMap<CreateWorkingShiftRequest, WorkingShift>()
            .ForMember(dto => dto.ShiftStart,
                opt => opt
                    .MapFrom(x => x.ShiftStart.ToTimeSpan()))
            .ForMember(dto => dto.ShiftEnd,
                opt => opt
                    .MapFrom(x => x.ShiftEnd.ToTimeSpan()))
            .ForMember(dto => dto.BreakStart,
                opt => opt
                    .MapFrom(x => x.BreakStart.ToTimeSpan()))
            .ForMember(dto => dto.BreakEnd,
                opt => opt
                    .MapFrom(x => x.BreakEnd.ToTimeSpan()));
    }

    private void CreateMapWorkingShiftToWorkingShiftDto()
    {
        CreateMap<WorkingShift, WorkingShiftDto>()
            .ForMember(dto => dto.ShiftStart,
                opt => opt
                    .MapFrom(x => x.ShiftStart.ToHoursMinutesString()))
            .ForMember(dto => dto.ShiftEnd,
                opt => opt
                    .MapFrom(x => x.ShiftEnd.ToHoursMinutesString()))
            .ForMember(dto => dto.BreakStart,
                opt => opt
                    .MapFrom(x => x.BreakStart.ToHoursMinutesString()))
            .ForMember(dto => dto.BreakEnd,
                opt => opt
                    .MapFrom(x => x.BreakEnd.ToHoursMinutesString()));
    }
}