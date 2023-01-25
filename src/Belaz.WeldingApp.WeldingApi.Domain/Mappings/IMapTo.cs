using AutoMapper;

namespace Belaz.WeldingApp.WeldingApi.Domain.Mappings;

public interface IMapTo<T>
{
    void Mapping(Profile profile) => profile.CreateMap(GetType(), typeof(T));
}