using AutoMapper;
using Belaz.WeldingApp.WeldingApi.Domain.Entities.ProductInfo;
using Belaz.WeldingApp.WeldingApi.Domain.Extensions;
using Belaz.WeldingApp.WeldingApi.Domain.Mappings;
using WeldingApp.Common.Enums;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.Seam;

public class AddDefectiveReasonToSeamRequest : IMapTo<StatusReason>
{
    public Guid SeamId { get; set; }

    public string Date { get; set; } = null!;

    public string Reason { get; set; } = null!;

    public void Mapping(Profile profile)
    {
        profile.CreateMap<AddDefectiveReasonToSeamRequest, StatusReason>()
            .ForMember(dto => dto.Date,
                opt => opt
                    .MapFrom(x => x.Date.ToDateTime()))
            .ForMember(dto => dto.Status,
                opt => opt
                    .MapFrom(x => Status.Defective));
    }
}