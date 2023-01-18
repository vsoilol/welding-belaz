using AutoMapper;
using Belaz.WeldingApp.WeldingApi.Contracts.Responses;
using Belaz.WeldingApp.WeldingApi.Repositories.Entities.WeldingEquipmentInfo;

namespace Belaz.WeldingApp.WeldingApi.Mapping;

public class DowntimeReasonProfile : Profile
{
    public DowntimeReasonProfile()
    {
        CreateMap<DowntimeReason, DowntimeReasonDto>();
    }
}