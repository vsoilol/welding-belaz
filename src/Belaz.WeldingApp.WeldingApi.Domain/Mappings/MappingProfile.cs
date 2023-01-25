using System.Reflection;
using AutoMapper;
using Belaz.WeldingApp.WeldingApi.Domain.Extensions;

namespace Belaz.WeldingApp.WeldingApi.Domain.Mappings;

public class MappingProfile : Profile
{
    public MappingProfile()
    {
        this.ApplyMappingsFromAssembly(Assembly.GetExecutingAssembly());
    }
}