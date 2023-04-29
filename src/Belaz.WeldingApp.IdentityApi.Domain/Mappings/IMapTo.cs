using AutoMapper;

namespace Belaz.WeldingApp.IdentityApi.Domain.Mappings;

public interface IMapTo<T>
{
    void Mapping(Profile profile) => profile.CreateMap(GetType(), typeof(T));
}