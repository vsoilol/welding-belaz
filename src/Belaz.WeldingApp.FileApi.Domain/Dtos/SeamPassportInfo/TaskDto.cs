using AutoMapper;
using Belaz.WeldingApp.Common.Entities.Production;
using Belaz.WeldingApp.Common.Entities.TaskInfo;
using Belaz.WeldingApp.Common.Enums;
using Belaz.WeldingApp.FileApi.Domain.Extensions;
using Belaz.WeldingApp.FileApi.Domain.Mappings;

namespace Belaz.WeldingApp.FileApi.Domain.Dtos.SeamPassportInfo;

public class TaskDto : IMapFrom<WeldingTask>
{
    public int Number { get; set; }

    /// <summary>
    /// Дата выполнения сварки
    /// </summary>
    public string WeldingDate { get; set; } = null!;

    public SeamDto Seam { get; set; } = null!;

    public UserBriefDto Master { get; set; } = null!;

    public UserBriefDto Welder { get; set; } = null!;

    public UserBriefDto Inspector { get; set; } = null!;

    public WeldingEquipmentBriefDto WeldingEquipment { get; set; } = null!;

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

    public List<WeldPassageDto> WeldPassages { get; set; } = null!;

    public List<Workplace> Workplaces { get; set; } = null!;

    public string? DefectiveReason { get; set; }

    public void Mapping(Profile profile)
    {
        profile
            .CreateMap<WeldingTask, TaskDto>()
            .ForMember(
                dto => dto.WeldingDate,
                opt => opt.MapFrom(x => x.WeldingDate.ToDayInfoString())
            )
            .ForMember(dto => dto.Welder, opt => opt.MapFrom(x => x.Welder!.UserInfo))
            .ForMember(dto => dto.Seam, opt => opt.MapFrom(x => x.SeamAccount.Seam))
            .ForMember(dto => dto.Inspector, opt => opt.MapFrom(x => x.Inspector!.UserInfo))
            .ForMember(dto => dto.Master,
                opt =>
                    opt.MapFrom(x => x.Master!.UserInfo))
            .ForMember(
                dto => dto.WeldingEquipment,
                opt =>
                    opt.MapFrom(x => x.WeldPassages.First().WeldingRecord.WeldingEquipment)
            )
            .ForMember(
                dto => dto.Workplaces,
                opt =>
                    opt.MapFrom(x => x.WeldPassages.Any()
                        ? x.WeldPassages.First()
                            .WeldingRecord.WeldingEquipment.Workplaces
                        : new List<Workplace>())
            )
            .ForMember(
                dto => dto.DefectiveReason,
                opt =>
                    opt.MapFrom(x => x.SeamAccount
                        .ProductAccount.ProductResults
                        .First(_ => _.Status == ResultProductStatus.Defective)
                        .Reason)
            )
            .ForMember(
                dto => dto.WeldPassages,
                opt =>
                    opt.MapFrom(
                        x =>
                            x.WeldPassages
                                .OrderBy(_ => _.WeldingRecord.Date.Date)
                                .ThenBy(_ => _.WeldingRecord.WeldingStartTime.TotalSeconds)
                    )
            );
    }
}