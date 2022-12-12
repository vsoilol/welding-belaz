using AutoMapper;
using Belaz.WeldingApp.IdentityApi.Data.Repositories.Entities;
using Belaz.WeldingApp.IdentityApi.Managers.Models;
using Belaz.WeldingApp.IdentityApi.Presenters.Models;

namespace Belaz.WeldingApp.IdentityApi.Presenters.Mapping
{
    public class UserModelProfile : Profile
    {
        public UserModelProfile()
        {
            CreateMap<UserContract, User>()
                .ForMember(x => x.Roles, opt => opt.Ignore())
                .ForMember(x => x.PasswordHash, opt => opt.Ignore());
            CreateMap<User, UserContract>()
                .ForMember(x => x.Role,
                    opt =>
                        opt.MapFrom(x => x.Roles.First().Name));

            CreateMap<User, UserData>()
                .ForMember(x => x.UserRoles,
                    opt =>
                        opt.MapFrom(x => x.Roles.Select(_ => new UserRole { Role = _ })));
            CreateMap<UserData, User>()
                .ForMember(x => x.Roles,
                    opt =>
                        opt.MapFrom(x => x.UserRoles.Select(_ => _.Role)));
        }
    }
}
