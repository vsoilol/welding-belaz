using AutoMapper;
using Belaz.WeldingApp.IdentityApi.Data.Repositories.Entities;
using Belaz.WeldingApp.IdentityApi.WebApi.Managers.Models;
using Belaz.WeldingApp.IdentityApi.WebApi.Presenters.Models;

namespace Belaz.WeldingApp.IdentityApi.WebApi.Presenters.Mapping
{
    public class UserModelProfile : Profile
    {
        public UserModelProfile()
        {
            CreateMap<UserContract, User>()
                .ForMember(x => x.UserRoles, opt => opt.Ignore())
                .ForMember(x=>x.PasswordHash, opt => opt.Ignore())
                .ForMember(x => x.PasswordSalt, opt => opt.Ignore());
            CreateMap<User, UserContract>()
                .ForMember(x => x.Role, opt => opt.MapFrom(x => x.UserRoles.First().Role.Name));

            CreateMap<User, UserData>();
            CreateMap<UserData, User>();
        }
    }
}
