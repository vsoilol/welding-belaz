using AutoMapper;
using Belaz.WeldingApp.Common.Enums;
using Belaz.WeldingApp.WeldingApi.Domain.Dtos.Product;
using Belaz.WeldingApp.WeldingApi.Domain.Dtos.WeldingEquipment;
using Belaz.WeldingApp.WeldingApi.Domain.Mappings;

namespace Belaz.WeldingApp.WeldingApi.Domain.Dtos.ProductAccount;

public class ProductAccountDto
    : IMapFrom<Belaz.WeldingApp.Common.Entities.ProductInfo.ProductAccount>
{
    public Guid Id { get; set; }

    public int Number { get; set; }

    public int AmountFromPlan { get; set; }

    public ProductForProductAccountDto Product { get; set; } = null!;
    
    public int? UniqueNumber { get; set; }

    public int AmountManufactured { get; set; }

    public int AmountAccept { get; set; }

    public int AmountDefective { get; set; }

    /// <summary>
    /// Есть ли отклонения
    /// </summary>
    public bool AreDeviations { get; set; } = false;

    public string? DefectiveReason { get; set; }

    public List<WeldingEquipmentBriefDto> WeldingEquipments { get; set; } = null!;

    public void Mapping(Profile profile)
    {
        profile
            .CreateMap<
                Belaz.WeldingApp.Common.Entities.ProductInfo.ProductAccount,
                ProductAccountDto
            >()
            .ForMember(
                dto => dto.AmountManufactured,
                opt =>
                    opt.MapFrom(
                        x =>
                            x.ProductResults
                                .Where(_ => _.Status == ResultProductStatus.Manufactured)
                                .Sum(_ => _.Amount)
                    )
            )
            .ForMember(
                dto => dto.DefectiveReason,
                opt =>
                    opt.MapFrom(
                        x =>
                            x.ProductResults
                                .FirstOrDefault(_ => _.Status == ResultProductStatus.Defective)!
                                .Reason
                    )
            )
            .ForMember(
                dto => dto.AmountAccept,
                opt =>
                    opt.MapFrom(
                        x =>
                            x.ProductResults
                                .Where(_ => _.Status == ResultProductStatus.Accept)
                                .Sum(_ => _.Amount)
                    )
            )
            .ForMember(
                dto => dto.AmountDefective,
                opt =>
                    opt.MapFrom(
                        x =>
                            x.ProductResults
                                .Where(_ => _.Status == ResultProductStatus.Defective)
                                .Sum(_ => _.Amount)
                    )
            )
            .ForMember(
                dto => dto.AreDeviations,
                opt =>
                    opt.MapFrom(
                        x =>
                            x.SeamAccounts
                                .SelectMany(_ => _.WeldingTasks)
                                .SelectMany(_ => _.WeldPassages)
                                .Any(
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
    }
}
