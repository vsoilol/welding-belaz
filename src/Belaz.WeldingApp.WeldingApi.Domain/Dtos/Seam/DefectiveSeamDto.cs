using AutoMapper;
using Belaz.WeldingApp.WeldingApi.Domain.Extensions;
using Belaz.WeldingApp.WeldingApi.Domain.Mappings;

namespace Belaz.WeldingApp.WeldingApi.Domain.Dtos.Seam;

public class DefectiveSeamDto : IMapFrom<Belaz.WeldingApp.Common.Entities.TaskInfo.DefectiveReason>
{
    public Guid Id { get; set; }

    public SeamDto Seam { get; set; } = null!;

    public string DetectedDefectiveDate { get; set; } = null!;

    public string Reason { get; set; } = null!;

    public string DetectedDefects { get; set; } = null!;

    public void Mapping(Profile profile)
    {
        profile
            .CreateMap<
                Belaz.WeldingApp.Common.Entities.TaskInfo.DefectiveReason,
                DefectiveSeamDto
            >()
            .ForMember(dto => dto.Seam, opt => opt.MapFrom(x => x.WeldingTask.SeamAccount.Seam))
            .ForMember(
                dto => dto.DetectedDefectiveDate,
                opt => opt.MapFrom(x => x.DetectedDefectiveDate.ToDayInfoString())
            );
    }
}
