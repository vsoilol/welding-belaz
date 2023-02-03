﻿using AutoMapper;
using Belaz.WeldingApp.WeldingApi.Domain.Dtos.Seam;
using Belaz.WeldingApp.WeldingApi.Domain.Mappings;
using WeldingApp.Common.Enums;

namespace Belaz.WeldingApp.WeldingApi.Domain.Dtos.WeldingTask;

public class WeldingTaskDto : IMapFrom<Entities.TaskInfo.WeldingTask>
{
    public Guid Id { get; set; }
    
    public int Number { get; set; }
    
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

    public ProductStatus Status { get; set; }

    public SeamBriefDto Seam { get; set; } = null!;
    
    public void Mapping(Profile profile)
    {
        profile.CreateMap<Entities.TaskInfo.WeldingTask, WeldingTaskDto>()
            .ForMember(dto => dto.Status,
                opt => opt
                    .MapFrom(x => x.Seam.Status));
    }
}