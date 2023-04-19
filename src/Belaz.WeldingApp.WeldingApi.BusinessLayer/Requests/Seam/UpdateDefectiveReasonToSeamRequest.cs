using AutoMapper;
using Belaz.WeldingApp.Common.Entities.TaskInfo;
using Belaz.WeldingApp.WeldingApi.Domain.Extensions;
using Belaz.WeldingApp.WeldingApi.Domain.Mappings;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.Seam;

public class UpdateDefectiveReasonToSeamRequest : IMapTo<DefectiveReason>
{
    public Guid Id { get; set; }

    public string DetectedDefectiveDate { get; set; } = null!;

    public string Reason { get; set; } = null!;

    public string DetectedDefects { get; set; } = null!;

    public void Mapping(Profile profile)
    {
        profile
            .CreateMap<UpdateDefectiveReasonToSeamRequest, DefectiveReason>()
            .ForMember(
                dto => dto.DetectedDefectiveDate,
                opt => opt.MapFrom(x => x.DetectedDefectiveDate.ToDateTime())
            );
    }
}
