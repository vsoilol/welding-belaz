using AutoMapper;
using Belaz.WeldingApp.WeldingApi.Contracts.Requests.Workshop;
using Belaz.WeldingApp.WeldingApi.Contracts.Responses.Workshop;
using Belaz.WeldingApp.WeldingApi.Repositories.Entities.Production;

namespace Belaz.WeldingApp.WeldingApi.Mapping;

public class WorkshopProfile : Profile
{
    public WorkshopProfile()
    {
        CreateMap<Workshop, WorkshopDto>();
        CreateMap<CreateWorkshopRequest, Workshop>();
        CreateMap<UpdateWorkshopRequest, Workshop>();
    }
}