using AutoMapper;
using Belaz.WeldingApp.WeldingApi.Domain.Extensions;
using Belaz.WeldingApp.WeldingApi.Domain.Mappings;
using WeldingApp.Common.Enums;

namespace Belaz.WeldingApp.WeldingApi.Domain.Dtos.WeldingEquipment;

public class WeldingEquipmentBriefDto : IMapFrom<Domain.Entities.WeldingEquipmentInfo.WeldingEquipment>
{
    public Guid Id { get; set; }

    /// <summary>
    /// RFID-метка
    /// </summary>
    public string RfidTag { get; set; }

    public string Name { get; set; }

    /// <summary>
    /// Маркировка
    /// </summary>
    public string Marking { get; set; }

    /// <summary>
    /// Заводской (инвентарный) номер
    /// </summary>
    public string FactoryNumber { get; set; }

    /// <summary>
    /// Дата ввода в эксплуатацию
    /// </summary>
    public string CommissioningDate { get; set; }

    /// <summary>
    /// Текущее состояние
    /// </summary>
    public Condition CurrentCondition { get; set; }

    public void Mapping(Profile profile)
    {
        profile.CreateMap<Domain.Entities.WeldingEquipmentInfo.WeldingEquipment, WeldingEquipmentBriefDto>()
            .ForMember(dto => dto.CommissioningDate,
                opt => opt
                    .MapFrom(x => x.CommissioningDate.ToDayInfoString()));
    }
}