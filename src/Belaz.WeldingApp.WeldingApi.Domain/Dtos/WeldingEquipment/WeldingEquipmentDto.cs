﻿using AutoMapper;
using Belaz.WeldingApp.WeldingApi.Domain.Dtos.Post;
using Belaz.WeldingApp.WeldingApi.Domain.Extensions;
using Belaz.WeldingApp.WeldingApi.Domain.Mappings;
using WeldingApp.Common.Enums;

namespace Belaz.WeldingApp.WeldingApi.Domain.Dtos.WeldingEquipment;

public class WeldingEquipmentDto : IMapFrom<Domain.Entities.WeldingEquipmentInfo.WeldingEquipment>
{
    public Guid Id { get; set; }

    /// <summary>
    /// RFID-метка
    /// </summary>
    public string RfidTag { get; set; } = null!;

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

    public int Height { get; set; }

    public int Width { get; set; }

    public int Lenght { get; set; }

    /// <summary>
    /// Номер группы оборудования
    /// </summary>
    public int GroupNumber { get; set; }

    /// <summary>
    /// Наименование изготовителя
    /// </summary>
    public string ManufacturerName { get; set; } = null!;

    /// <summary>
    /// Дата очередной аттестации
    /// </summary>
    public string NextAttestationDate { get; set; } = null!;

    /// <summary>
    /// Ответственный за сварочное оборудование
    /// </summary>
    public UserFullNameDto? ResponsiblePerson { get; set; }

    /// <summary>
    /// Процесс (способ) сварки
    /// </summary>
    public string WeldingProcess { get; set; } = null!;

    /// <summary>
    /// Напряжение холостого хода
    /// </summary>
    public double IdleVoltage { get; set; }

    /// <summary>
    /// Сварочный ток min
    /// </summary>
    public double WeldingCurrentMin { get; set; }

    /// <summary>
    /// Сварочный ток max
    /// </summary>
    public double WeldingCurrentMax { get; set; }

    /// <summary>
    /// Напряжения на дуге min
    /// </summary>
    public double ArcVoltageMin { get; set; }

    /// <summary>
    /// Напряжения на дуге max
    /// </summary>
    public double ArcVoltageMax { get; set; }

    public PostBriefDto? Post { get; set; }

    /// <summary>
    /// Продолжительность включения (нагрузки), в минутах
    /// </summary>
    public int ActivationDuration { get; set; }

    public void Mapping(Profile profile)
    {
        profile.CreateMap<Domain.Entities.WeldingEquipmentInfo.WeldingEquipment, WeldingEquipmentDto>()
            .ForMember(dto => dto.CommissioningDate,
                opt => opt
                    .MapFrom(x => x.CommissioningDate.ToDayInfoString()))
            .ForMember(dto => dto.Post,
                opt => opt
                    .MapFrom(x => x.Post))
            .ForMember(dto => dto.NextAttestationDate,
                opt => opt
                    .MapFrom(x => x.NextAttestationDate.ToDayInfoString()))
            .ForMember(dto => dto.ResponsiblePerson,
                opt => opt
                    .MapFrom(x => x.Welder == null ? null : x.Welder.UserInfo))
            .ForMember(dto => dto.ActivationDuration,
                opt => opt
                    .MapFrom(x => x.WeldingEquipmentConditionTime
                        .Where(_ => _.Condition == Condition.AtWork)
                        .Sum(_ => _.Time)));
    }
}