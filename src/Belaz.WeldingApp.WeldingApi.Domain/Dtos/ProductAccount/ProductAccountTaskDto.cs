using Belaz.WeldingApp.WeldingApi.Domain.Mappings;
using System.Text.Json.Serialization;
using AutoMapper;
using Belaz.WeldingApp.Common.Enums;
using Belaz.WeldingApp.WeldingApi.Domain.Dtos.Product;
using Belaz.WeldingApp.WeldingApi.Domain.Dtos.Welder;
using Belaz.WeldingApp.WeldingApi.Domain.Dtos.WeldingEquipment;
using Belaz.WeldingApp.WeldingApi.Domain.Extensions;

namespace Belaz.WeldingApp.WeldingApi.Domain.Dtos.ProductAccount;

public class ProductAccountTaskDto : IMapFrom<Belaz.WeldingApp.Common.Entities.ProductInfo.ProductAccountTask>
{
    public Guid Id { get; set; }

    public int Number { get; set; }
    
    /// <summary>
    /// Сварочные материалы
    /// </summary>
    public string? WeldingMaterial { get; set; }

    /// <summary>
    /// № сертификата (партии) св. материала
    /// </summary>
    public string? WeldingMaterialBatchNumber { get; set; }

    public string SequenceNumber { get; set; } = null!;

    public string DateFromPlan { get; set; } = null!;

    public string? EndDateFromPlan { get; set; }

    public string? Reason { get; set; }

    public string? DetectedDefects { get; set; }

    public int ManufacturedAmount { get; set; }
    
    public int AcceptedAmount { get; set; }
    
    public int DefectiveAmount { get; set; }

    public bool IsDone { get; set; }

    [JsonIgnore] public Guid MainProductId { get; set; }

    public ProductBriefDto Product { get; set; } = null!;

    public ProductBriefDto? Knot { get; set; }

    public ProductBriefDto? Detail { get; set; }

    public UserFullNameDto? Master { get; set; }

    public UserFullNameDto? Inspector { get; set; }

    public List<WeldingEquipmentBriefDto>? WeldingEquipments { get; set; }

    public List<string> Seams { get; set; } = null!;

    public List<WelderBriefDto> Welders { get; set; } = null!;

    /// <summary>
    /// Есть ли отклонения
    /// </summary>
    public bool AreDeviations { get; set; }

    public void Mapping(Profile profile)
    {
        profile
            .CreateMap<Belaz.WeldingApp.Common.Entities.ProductInfo.ProductAccountTask, ProductAccountTaskDto>()
            .ForMember(
                dto => dto.DateFromPlan,
                opt => opt.MapFrom(x => x.DateFromPlan.ToDayInfoString())
            )
            .ForMember(
                dto => dto.EndDateFromPlan,
                opt => opt
                    .MapFrom(x => x.EndDateFromPlan.ToDayInfoString())
            )
            .ForMember(
                dto => dto.Welders,
                opt => opt
                    .MapFrom(x => x.WeldingTasks
                        .Where(wt => wt.Welder != null)
                        .Select(_ => _.Welder))
            )
            .ForMember(
                dto => dto.Seams,
                opt => opt
                    .MapFrom(x => x.WeldingTasks.Select(_ => _.SeamAccount.Seam.Number))
            )
            .ForMember(dto => dto.IsDone,
                opt =>
                    opt.MapFrom(x => x.WeldingTasks.All(_ =>
                        _.TaskStatus == WeldingTaskStatus.Completed)))
            .ForMember(dto => dto.MainProductId,
                opt =>
                    opt.MapFrom(x => x.ProductAccount.ProductId))
            .ForMember(dto => dto.Product,
                opt => opt.Ignore())
            .ForMember(dto => dto.Number,
                opt => opt.Ignore())
            .ForMember(dto => dto.Detail,
                opt => opt.Ignore())
            .ForMember(dto => dto.Knot,
                opt => opt.Ignore())
            .ForMember(dto => dto.Inspector, opt => opt
                .MapFrom(x => x.Inspector!.UserInfo))
            .ForMember(dto => dto.Master, opt =>
                opt.MapFrom(x => x.Master!.UserInfo))
            .ForMember(
                dto => dto.WeldingEquipments,
                opt => opt
                    .MapFrom(x => x.WeldingEquipments)
            )
            .ForMember(
                dto => dto.AreDeviations,
                opt =>
                    opt.MapFrom(
                        x =>
                            x.WeldingTasks.Any(task => task.WeldPassages.Any(
                                _ =>
                                    (
                                        _.IsEnsuringCurrentAllowance != null
                                        && !(bool) _.IsEnsuringCurrentAllowance
                                    )
                                    || (
                                        _.IsEnsuringTemperatureAllowance != null
                                        && !(bool) _.IsEnsuringTemperatureAllowance
                                    )
                                    || (
                                        _.IsEnsuringVoltageAllowance != null
                                        && !(bool) _.IsEnsuringVoltageAllowance
                                    )
                            ))
                    )
            );
        ;
    }
}