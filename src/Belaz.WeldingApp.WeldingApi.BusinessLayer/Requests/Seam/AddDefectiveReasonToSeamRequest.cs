using AutoMapper;
using Belaz.WeldingApp.WeldingApi.Domain.Entities.ProductInfo;
using Belaz.WeldingApp.WeldingApi.Domain.Entities.TaskInfo;
using Belaz.WeldingApp.WeldingApi.Domain.Extensions;
using Belaz.WeldingApp.WeldingApi.Domain.Mappings;
using WeldingApp.Common.Enums;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.Seam;

public class AddDefectiveReasonToSeamRequest : IMapTo<DefectiveReason>
{
    public Guid WeldingTaskId { get; set; }

    public string DetectedDefectiveDate { get; set; } = null!;
    
    public string Reason { get; set; } = null!;

    public string DetectedDefects { get; set; } = null!;

    public void Mapping(Profile profile)
    {
        profile.CreateMap<AddDefectiveReasonToSeamRequest, DefectiveReason>()
            .ForMember(dto => dto.DetectedDefectiveDate,
                opt => opt
                    .MapFrom(x => x.DetectedDefectiveDate.ToDateTime()));
    }
}