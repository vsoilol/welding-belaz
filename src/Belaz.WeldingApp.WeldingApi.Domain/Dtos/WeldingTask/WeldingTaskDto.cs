using AutoMapper;
using Belaz.WeldingApp.WeldingApi.Domain.Dtos.Seam;
using Belaz.WeldingApp.WeldingApi.Domain.Dtos.WeldingEquipment;
using Belaz.WeldingApp.WeldingApi.Domain.Extensions;
using Belaz.WeldingApp.WeldingApi.Domain.Mappings;
using WeldingApp.Common.Enums;

namespace Belaz.WeldingApp.WeldingApi.Domain.Dtos.WeldingTask;

public class WeldingTaskDto : IMapFrom<Entities.TaskInfo.WeldingTask>
{
    public Guid Id { get; set; }

    public int Number { get; set; }

    public string? WeldingDate { get; set; }

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

    public WeldingTaskStatus Status { get; set; }

    public SeamDto Seam { get; set; } = null!;

    public UserFullNameDto? Welder { get; set; }

    public UserFullNameDto? Master { get; set; }

    public UserFullNameDto? Inspector { get; set; }

    public WeldingEquipmentDto? WeldingEquipment { get; set; }

    public void Mapping(Profile profile)
    {
        profile
            .CreateMap<Entities.TaskInfo.WeldingTask, WeldingTaskDto>()
            .ForMember(
                dto => dto.WeldingDate,
                opt => opt.MapFrom(x => x.WeldingDate.ToDayInfoString())
            )
            .ForMember(dto => dto.Inspector, opt => opt.MapFrom(x => x.Inspector!.UserInfo))
            .ForMember(dto => dto.Welder, opt => opt.MapFrom(x => x.Welder!.UserInfo))
            .ForMember(dto => dto.Master, opt => opt.MapFrom(x => x.Master.UserInfo))
            .ForMember(
                dto => dto.WeldingEquipment,
                opt => opt.MapFrom(x => x.WeldPassages.First().WeldingRecord.WeldingEquipment)
            );
    }
}
