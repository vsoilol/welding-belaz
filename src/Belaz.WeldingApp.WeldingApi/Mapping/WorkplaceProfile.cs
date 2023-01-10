using AutoMapper;
using Belaz.WeldingApp.WeldingApi.Contracts.Requests.Workplace;
using Belaz.WeldingApp.WeldingApi.Contracts.Responses.Workplace;
using Belaz.WeldingApp.WeldingApi.Contracts.Responses.Workshop;
using Belaz.WeldingApp.WeldingApi.Repositories.Entities.Production;

namespace Belaz.WeldingApp.WeldingApi.Mapping;

public class WorkplaceProfile : Profile
{
    public WorkplaceProfile()
    {
        CreateMap<Workplace, WorkplaceDto>()
            .ForMember(dto => dto.ProductionArea,
                opt => opt
                    .MapFrom(x => x.ProductionArea))
            .ForMember(dto => dto.Post,
                opt => opt
                    .MapFrom(x => x.Post));
        
        CreateMap<CreateWorkplaceRequest, Workplace>();
        CreateMap<UpdateWorkplaceRequest, Workplace>();
    }
}