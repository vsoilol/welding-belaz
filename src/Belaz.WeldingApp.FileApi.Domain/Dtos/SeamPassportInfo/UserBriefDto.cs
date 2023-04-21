using AutoMapper;
using Belaz.WeldingApp.Common.Entities.IdentityUser;
using Belaz.WeldingApp.FileApi.Domain.Extensions;
using Belaz.WeldingApp.FileApi.Domain.Mappings;

namespace Belaz.WeldingApp.FileApi.Domain.Dtos.SeamPassportInfo;

public class UserBriefDto : IMapFrom<UserData>
{
    public Guid Id { get; set; }

    public string FirstName { get; set; } = null!;

    public string LastName { get; set; } = null!;

    public string MiddleName { get; set; } = null!;

    /// <summary>
    /// Срок действия удостоверения
    /// </summary>
    public string? CertificateValidityPeriod { get; set; }

    public void Mapping(Profile profile)
    {
        profile
            .CreateMap<UserData, UserBriefDto>()
            .ForMember(
                dto => dto.CertificateValidityPeriod,
                opt => opt.MapFrom(x => x.CertificateValidityPeriod.ToDayInfoString())
            );
    }
}
