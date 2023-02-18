using System.Reflection;
using AutoMapper;
using Belaz.WeldingApp.RegistarApi.Domain.Extensions;

namespace Belaz.WeldingApp.RegistarApi.Domain.Mappings;

public class MappingProfile : Profile
{
    public MappingProfile()
    {
        this.ApplyMappingsFromAssembly(Assembly.GetExecutingAssembly());
    }
}