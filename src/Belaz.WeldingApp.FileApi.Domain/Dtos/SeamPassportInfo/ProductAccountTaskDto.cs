using AutoMapper;
using Belaz.WeldingApp.Common.Entities.ProductInfo;
using Belaz.WeldingApp.Common.Entities.Production;
using Belaz.WeldingApp.FileApi.Domain.Mappings;
using System.Text.Json.Serialization;
using Belaz.WeldingApp.FileApi.Domain.Dtos.ProductInfo;
using Belaz.WeldingApp.FileApi.Domain.Extensions;

namespace Belaz.WeldingApp.FileApi.Domain.Dtos.SeamPassportInfo;

public class ProductAccountTaskDto : IMapFrom<ProductAccountTask>
{
    public string SequenceNumber { get; set; } = null!;
    
    /// <summary>
    /// Дата выполнения сварки
    /// </summary>
    public string WeldingDate { get; set; } = null!;

    public UserBriefDto Master { get; set; } = null!;

    public UserBriefDto Welder { get; set; } = null!;

    public UserBriefDto Inspector { get; set; } = null!;

    public WeldingEquipmentBriefDto WeldingEquipment { get; set; } = null!;

    /// <summary>
    /// Сварочные материалы
    /// </summary>
    public string? WeldingMaterial { get; set; }

    /// <summary>
    /// № сертификата (партии) св. материала
    /// </summary>
    public string? WeldingMaterialBatchNumber { get; set; }

    public string? Reason { get; set; }

    public string? DetectedDefects { get; set; }

    public Workplace? Workplace { get; set; }
    
    public ProductionAreaBriefDto ProductionArea { get; set; } = null!;

    public WorkshopBriefDto Workshop { get; set; } = null!;

    [JsonIgnore] public Guid MainProductId { get; set; }

    public ProductBriefDto Product { get; set; } = null!;

    public ProductBriefDto? Knot { get; set; }

    public ProductBriefDto? Detail { get; set; }

    public List<TaskBriefDto> WeldingTasks { get; set; } = null!;

    public void Mapping(Profile profile)
    {
        profile
            .CreateMap<ProductAccountTask, ProductAccountTaskDto>()
            .ForMember(
                dto => dto.WeldingDate,
                opt => opt
                    .MapFrom(x => x.DateFromPlan.ToDayInfoString()))
            .ForMember(dto => dto.Welder,
                opt =>
                    opt.MapFrom(x => 
                        x.WeldingTasks.First(task => task.Welder != null).Welder!.UserInfo))
            .ForMember(dto => dto.Inspector,
                opt => 
                    opt.MapFrom(x => x.Inspector!.UserInfo))
            .ForMember(dto => dto.Master,
                opt =>
                    opt.MapFrom(x => x.Master!.UserInfo))
            .ForMember(dto => dto.ProductionArea,
                opt =>
                    opt.MapFrom(x => x.ProductAccount.Product.ProductionArea))
            .ForMember(dto => dto.Workshop,
                opt =>
                    opt.MapFrom(x => x.ProductAccount.Product.ProductionArea.Workshop))
            .ForMember(
                dto => dto.WeldingEquipment,
                opt =>
                    opt.MapFrom(x =>
                        x.WeldingTasks.First(task => task.WeldPassages.Any())
                            .WeldPassages.First().WeldingRecord.WeldingEquipment))
            .ForMember(
                dto => dto.Workplace,
                opt =>
                    opt.MapFrom(x =>
                        x.WeldingTasks.First(task => task.Welder != null).Welder!.Workplace))
            .ForMember(dto => dto.MainProductId,
                opt =>
                    opt.MapFrom(x => x.ProductAccount.ProductId))
            .ForMember(dto => dto.Product,
                opt => opt.Ignore())
            .ForMember(dto => dto.Detail,
                opt => opt.Ignore())
            .ForMember(dto => dto.Knot,
                opt => opt.Ignore());
    }
}