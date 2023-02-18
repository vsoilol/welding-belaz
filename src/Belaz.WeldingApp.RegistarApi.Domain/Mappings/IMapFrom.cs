using AutoMapper;

namespace Belaz.WeldingApp.RegistarApi.Domain.Mappings;

public interface IMapFrom<T>
{
    void Mapping(Profile profile) => profile.CreateMap(typeof(T), GetType());
}