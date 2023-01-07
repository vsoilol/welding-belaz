using AutoMapper;
using Belaz.WeldingApp.WeldingApi.Contracts.Requests.WeldPassage;
using Belaz.WeldingApp.WeldingApi.Contracts.Responses;
using Belaz.WeldingApp.WeldingApi.Repositories.Entities.ProductInfo;
using Belaz.WeldingApp.WeldingApi.Repositories.Entities.TaskInfo;

namespace Belaz.WeldingApp.WeldingApi.Mapping;

public class WeldPassageProfile : Profile
{
    public WeldPassageProfile()
    {
        CreateMap<WeldPassage, WeldPassageDto>();

        CreateMap<CreateWeldPassageRequest, LayerInstruction>();
        
        CreateMap<CreateWeldPassageRequest, WeldPassage>();
        
        CreateMap<UpdateWeldPassageRequest, LayerInstruction>();
        
        CreateMap<UpdateWeldPassageRequest, WeldPassage>();
    }
}