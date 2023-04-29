using System.Reflection;
using AutoMapper;
using Belaz.WeldingApp.IdentityApi.Domain.Extensions;

namespace Belaz.WeldingApp.IdentityApi.Domain.Mappings;

public class MappingProfile : Profile
{
    public MappingProfile()
    {
        this.ApplyMappingsFromAssembly(Assembly.GetExecutingAssembly());
    }
}