using AutoMapper;
using Belaz.WeldingApp.FileApi.Domain.Entities.WeldingEquipmentInfo;
using Belaz.WeldingApp.FileApi.Domain.Extensions;
using Belaz.WeldingApp.FileApi.Domain.Mappings;

namespace Belaz.WeldingApp.FileApi.Domain.Dtos.SeamPassportInfo;

public class WeldingEquipmentBriefDto : IMapFrom<WeldingEquipment>
{
    public string Name { get; set; } = null!;
    
    /// <summary>
    /// Заводской (инвентарный) номер
    /// </summary>
    public string FactoryNumber { get; set; } = null!;

    /// <summary>
    /// Дата очередной аттестации
    /// </summary>
    public string NextAttestationDate { get; set; } = null!;
    
    public void Mapping(Profile profile)
    {
        profile.CreateMap<WeldingEquipment, WeldingEquipmentBriefDto>()
            .ForMember(dto => dto.NextAttestationDate,
                opt => opt
                    .MapFrom(x => x.NextAttestationDate.ToDayInfoString()));
    }
}