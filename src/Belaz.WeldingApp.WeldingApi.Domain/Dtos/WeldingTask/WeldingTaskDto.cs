using System.Text.Json.Serialization;
using AutoMapper;
using Belaz.WeldingApp.Common.Enums;
using Belaz.WeldingApp.WeldingApi.Domain.Dtos.Product;
using Belaz.WeldingApp.WeldingApi.Domain.Dtos.Seam;
using Belaz.WeldingApp.WeldingApi.Domain.Dtos.WeldingEquipment;
using Belaz.WeldingApp.WeldingApi.Domain.Extensions;
using Belaz.WeldingApp.WeldingApi.Domain.Mappings;

namespace Belaz.WeldingApp.WeldingApi.Domain.Dtos.WeldingTask;

public class WeldingTaskDto : IMapFrom<Belaz.WeldingApp.Common.Entities.TaskInfo.WeldingTask>
{
    public Guid Id { get; set; }

    public int Number { get; set; }
    
    public string? SequenceNumber { get; set; }

    public string? WeldingDate { get; set; }

    public int ManufacturedAmount { get; set; }

    public WeldingTaskStatus Status { get; set; }

    public string SeamNumber { get; set; } = null!;

    //public SeamDto Seam { get; set; } = null!;

    [JsonIgnore]
    public Guid MainProductId { get; set; }

    public ProductBriefDto Product { get; set; } = null!;

    public ProductBriefDto? Knot { get; set; }

    public ProductBriefDto? Detail { get; set; }

    public UserFullNameDto? Welder { get; set; }

    public UserFullNameDto? Master { get; set; }

    public UserFullNameDto? Inspector { get; set; }

    public List<WeldingEquipmentBriefDto>? WeldingEquipments { get; set; }

    public int? UniqueNumber { get; set; }

    /// <summary>
    /// Есть ли отклонения
    /// </summary>
    public bool AreDeviations { get; set; } = false;

    public void Mapping(Profile profile)
    {
        profile
            .CreateMap<Belaz.WeldingApp.Common.Entities.TaskInfo.WeldingTask, WeldingTaskDto>()
            .ForMember(
                dto => dto.WeldingDate,
                opt => opt.MapFrom(x => x.WeldingDate.ToDayInfoString())
            )
            .ForMember(dto => dto.Status,
                opt =>
                    opt.MapFrom(x => x.TaskStatus))
            .ForMember(dto => dto.SeamNumber,
                opt =>
                    opt.MapFrom(x => x.SeamAccount.Seam.Number))
            .ForMember(dto => dto.MainProductId,
                opt =>
                    opt.MapFrom(x => x.SeamAccount.Seam.ProductId))
            .ForMember(dto => dto.Product,
                opt => opt.Ignore())
            .ForMember(dto => dto.Detail,
                opt => opt.Ignore())
            .ForMember(dto => dto.Knot,
                opt => opt.Ignore())
            .ForMember(dto => dto.Inspector, opt => opt.MapFrom(x => x.Inspector!.UserInfo))
            /*.ForMember(dto => dto.Seam, opt => opt.MapFrom(x => x.SeamAccount.Seam))*/
            .ForMember(dto => dto.Welder, opt => opt.MapFrom(x => x.Welder!.UserInfo))
            .ForMember(dto => dto.Master, opt => opt.MapFrom(x => x.Master!.UserInfo))
            .ForMember(
                dto => dto.WeldingEquipments,
                opt => opt.MapFrom(x => x.SeamAccount.ProductAccount.WeldingEquipments)
            )
            .ForMember(
                dto => dto.UniqueNumber,
                opt => opt.MapFrom(x => x.SeamAccount.ProductAccount.UniqueNumber)
            )
            .ForMember(
                dto => dto.ManufacturedAmount,
                opt => opt.MapFrom(x => x.SeamAccount.ProductAccount.AmountFromPlan)
            )
            // .ForMember(
            //     dto => dto.WeldingEquipment,
            //     opt =>
            //         opt.MapFrom(
            //             x =>
            //                 x.WeldPassages.Any()
            //                     ? x.WeldPassages.First().WeldingRecord.WeldingEquipment
            //                     : null
            //         )
            // )
            .ForMember(
                dto => dto.AreDeviations,
                opt =>
                    opt.MapFrom(
                        x =>
                            x.WeldPassages.Any(
                                _ =>
                                    (
                                        _.IsEnsuringCurrentAllowance != null
                                        && !(bool)_.IsEnsuringCurrentAllowance
                                    )
                                    || (
                                        _.IsEnsuringTemperatureAllowance != null
                                        && !(bool)_.IsEnsuringTemperatureAllowance
                                    )
                                    || (
                                        _.IsEnsuringVoltageAllowance != null
                                        && !(bool)_.IsEnsuringVoltageAllowance
                                    )
                            )
                    )
            );
        ;
    }
}