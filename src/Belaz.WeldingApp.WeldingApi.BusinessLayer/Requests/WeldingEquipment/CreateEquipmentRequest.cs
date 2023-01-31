﻿using AutoMapper;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.Calendar;
using Belaz.WeldingApp.WeldingApi.Domain.Extensions;
using Belaz.WeldingApp.WeldingApi.Domain.Mappings;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.WeldingEquipment;

public class CreateEquipmentRequest : IMapTo<Domain.Entities.WeldingEquipmentInfo.WeldingEquipment>
{
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
    /// Формат dd.mm.yyyy
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
    /// Формат dd.mm.yyyy
    /// </summary>
    public string NextAttestationDate { get; set; } = null!;

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

    public Guid? PostId { get; set; }

    public void Mapping(Profile profile)
    {
        profile.CreateMap<CreateEquipmentRequest, Domain.Entities.WeldingEquipmentInfo.WeldingEquipment>()
            .ForMember(dto => dto.NextAttestationDate,
                opt => opt
                    .MapFrom(x => x.NextAttestationDate.ToDateTime()))
            .ForMember(dto => dto.CommissioningDate,
                opt => opt
                    .MapFrom(x => x.CommissioningDate.ToDateTime()));
    }
}