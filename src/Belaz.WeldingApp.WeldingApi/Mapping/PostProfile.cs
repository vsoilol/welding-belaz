using AutoMapper;
using Belaz.WeldingApp.WeldingApi.Contracts.Requests.Post;
using Belaz.WeldingApp.WeldingApi.Contracts.Responses.Post;
using Belaz.WeldingApp.WeldingApi.Repositories.Entities.Production;

namespace Belaz.WeldingApp.WeldingApi.Mapping;

public class PostProfile : Profile
{
    public PostProfile()
    {
        CreateMap<Post, PostDto>()
            .ForMember(dto => dto.ProductionArea,
            opt => opt
                .MapFrom(x => x.ProductionArea));
        
        CreateMap<CreatePostRequest, Post>();
        CreateMap<UpdatePostRequest, Post>();
    }
}