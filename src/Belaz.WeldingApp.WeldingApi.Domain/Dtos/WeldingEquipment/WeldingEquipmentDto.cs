using AutoMapper;
using Belaz.WeldingApp.WeldingApi.Domain.Dtos.Post;
using Belaz.WeldingApp.WeldingApi.Domain.Dtos.ProductionArea;
using Belaz.WeldingApp.WeldingApi.Domain.Dtos.Workplace;
using Belaz.WeldingApp.WeldingApi.Domain.Dtos.Workshop;
using Belaz.WeldingApp.WeldingApi.Domain.Extensions;
using Belaz.WeldingApp.WeldingApi.Domain.Mappings;

namespace Belaz.WeldingApp.WeldingApi.Domain.Dtos.WeldingEquipment;

public class WeldingEquipmentDto
    : IMapFrom<Belaz.WeldingApp.Common.Entities.WeldingEquipmentInfo.WeldingEquipment>
{
    public Guid Id { get; set; }

    public string? IdFromSystem { get; set; }

    /// <summary>
    /// RFID-метка
    /// </summary>
    public string? RfidTag { get; set; }

    public string Name { get; set; } = null!;

    /// <summary>
    /// Маркировка
    /// </summary>
    public string Marking { get; set; } = null!;

    /// <summary>
    /// Заводской (инвентарный) номер
    /// </summary>
    public string FactoryNumber { get; set; } = null!;

    /// <summary>
    /// Дата ввода в эксплуатацию
    /// </summary>
    public string CommissioningDate { get; set; } = null!;

    public int? Height { get; set; }

    public int? Width { get; set; }

    public int? Lenght { get; set; }

    /// <summary>
    /// Номер группы оборудования
    /// </summary>
    public string GroupNumber { get; set; } = null!;

    /// <summary>
    /// Наименование изготовителя
    /// </summary>
    public string ManufacturerName { get; set; } = null!;

    /// <summary>
    /// Дата очередной аттестации
    /// </summary>
    public string? NextAttestationDate { get; set; }

    /// <summary>
    /// Ответственные за сварочное оборудование
    /// </summary>
    public List<UserFullNameDto> ResponsiblePersons { get; set; } = null!;

    /// <summary>
    /// Процесс (способ) сварки
    /// </summary>
    public string WeldingProcess { get; set; } = null!;

    /// <summary>
    /// Напряжение холостого хода
    /// </summary>
    public double? IdleVoltage { get; set; }

    /// <summary>
    /// Сварочный ток min
    /// </summary>
    public double? WeldingCurrentMin { get; set; }

    /// <summary>
    /// Сварочный ток max
    /// </summary>
    public double? WeldingCurrentMax { get; set; }

    /// <summary>
    /// Напряжения на дуге min
    /// </summary>
    public double? ArcVoltageMin { get; set; }

    /// <summary>
    /// Напряжения на дуге max
    /// </summary>
    public double? ArcVoltageMax { get; set; }

    /// <summary>
    /// Продолжительность нагрузки
    /// </summary>
    public double? LoadDuration { get; set; }

    public PostBriefDto? Post { get; set; }

    public WorkshopBriefDto Workshop { get; set; } = null!;

    public ProductionAreaBriefDto ProductionArea { get; set; } = null!;

    public List<WorkplaceBriefDto> Workplaces { get; set; } = null!;

    public void Mapping(Profile profile)
    {
        profile
            .CreateMap<
                Belaz.WeldingApp.Common.Entities.WeldingEquipmentInfo.WeldingEquipment,
                WeldingEquipmentDto
            >()
            .ForMember(
                dto => dto.CommissioningDate,
                opt => opt.MapFrom(x => x.CommissioningDate.ToDayInfoString())
            )
            .ForMember(
                dto => dto.NextAttestationDate,
                opt => opt.MapFrom(x => x.NextAttestationDate.ToDayInfoString())
            )
            .ForMember(
                dto => dto.ResponsiblePersons,
                opt => opt.MapFrom(x => x.Welders.Select(_ => _.UserInfo))
            )
            .ForMember(
                dto => dto.ProductionArea,
                opt =>
                    opt.MapFrom(
                        x =>
                            x.Post != null
                                ? x.Post.ProductionArea
                                : x.Workplaces.First().ProductionArea
                    )
            )
            .ForMember(
                dto => dto.Workshop,
                opt =>
                    opt.MapFrom(
                        x =>
                            x.Post != null
                                ? x.Post.ProductionArea.Workshop
                                : x.Workplaces.First().ProductionArea!.Workshop
                    )
            );
    }
}
