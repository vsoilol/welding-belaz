using AutoMapper;
using Belaz.WeldingApp.WeldingApi.Domain.Mappings;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.EventLog;

public class AddEventLogRequest : IMapTo<WeldingApp.Common.Entities.EventLog>
{
    public string Information { get; set; } = null!;

    public void Mapping(Profile profile)
    {
        profile.CreateMap<AddEventLogRequest, WeldingApp.Common.Entities.EventLog>()
            .ForMember(dest => dest.DateTime,
                opt => opt.MapFrom(src => DateTime.UtcNow));
    }
}