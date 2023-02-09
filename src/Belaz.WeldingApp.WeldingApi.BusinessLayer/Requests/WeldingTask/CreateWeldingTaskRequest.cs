﻿using AutoMapper;
using Belaz.WeldingApp.WeldingApi.Domain.Extensions;
using Belaz.WeldingApp.WeldingApi.Domain.Mappings;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.WeldingTask;

public class CreateWeldingTaskRequest : IMapTo<Domain.Entities.TaskInfo.WeldingTask>
{
    /// <summary>
    /// Дата выполнения сварки
    /// </summary>
    public string WeldingDate { get; set; } = null!;

    /// <summary>
    /// Основной материал
    /// </summary>
    public string BasicMaterial { get; set; } = null!;

    /// <summary>
    /// № сертификата (партии) основного материала
    /// </summary>
    public string MainMaterialBatchNumber { get; set; } = null!;

    /// <summary>
    /// Сварочные материалы
    /// </summary>
    public string WeldingMaterial { get; set; } = null!;

    /// <summary>
    /// № сертификата (партии) св. материала
    /// </summary>
    public string WeldingMaterialBatchNumber { get; set; } = null!;

    /// <summary>
    /// Защитный газ 
    /// </summary>
    public string? ProtectiveGas { get; set; }

    /// <summary>
    /// № сертификата (партии) на защитный газ 
    /// </summary>
    public string? ProtectiveGasBatchNumber { get; set; }

    public Guid SeamId { get; set; }

    public void Mapping(Profile profile)
    {
        profile.CreateMap<CreateWeldingTaskRequest, Domain.Entities.TaskInfo.WeldingTask>()
            .ForMember(dto => dto.WeldingDate,
                opt => opt
                    .MapFrom(x => x.WeldingDate.ToDateTime()));
    }
}