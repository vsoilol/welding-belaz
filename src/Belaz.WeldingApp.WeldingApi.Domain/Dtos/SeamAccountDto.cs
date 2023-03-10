using AutoMapper;
using Belaz.WeldingApp.WeldingApi.Domain.Dtos.Seam;
using Belaz.WeldingApp.WeldingApi.Domain.Entities.ProductInfo;
using Belaz.WeldingApp.WeldingApi.Domain.Mappings;
using WeldingApp.Common.Enums;

namespace Belaz.WeldingApp.WeldingApi.Domain.Dtos;

public class SeamAccountDto : IMapFrom<SeamAccount>
{
    public Guid Id { get; set; }

    public SeamBriefDto Seam { get; set; } = null!;

    public int AmountAccept { get; set; }

    public int AmountDefective { get; set; }

    /// <summary>
    /// Есть ли отклонения
    /// </summary>
    public bool AreDeviations { get; set; } = false;

    public string? DefectiveReason { get; set; }

    public void Mapping(Profile profile)
    {
        profile
            .CreateMap<SeamAccount, SeamAccountDto>()
            .ForMember(
                dto => dto.AmountAccept,
                opt =>
                    opt.MapFrom(
                        x =>
                            x.SeamResults
                                .Where(_ => _.Status == ResultProductStatus.Accept)
                                .Sum(_ => _.Amount)
                    )
            )
            .ForMember(
                dto => dto.AmountDefective,
                opt =>
                    opt.MapFrom(
                        x =>
                            x.SeamResults
                                .Where(_ => _.Status == ResultProductStatus.Defective)
                                .Sum(_ => _.Amount)
                    )
            )
            .ForMember(
                dto => dto.DefectiveReason,
                opt =>
                    opt.MapFrom(
                        x =>
                            x.SeamResults
                                .FirstOrDefault(_ => _.Status == ResultProductStatus.Defective)!
                                .Reason
                    )
            )
            .ForMember(
                dto => dto.AreDeviations,
                opt =>
                    opt.MapFrom(
                        x =>
                            x.WeldingTasks
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
