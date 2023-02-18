using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.Product;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.Seam;
using Belaz.WeldingApp.WeldingApi.Domain.Dtos.Seam;
using LanguageExt;
using LanguageExt.Common;
using WeldingApp.Common.Enums;
using GetAllByInspectorIdRequest = Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.Seam.GetAllByInspectorIdRequest;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Services.Interfaces;

public interface ISeamService
{
    Task<List<SeamDto>> GetAllAsync();

    Task<Result<SeamDto>> GetByIdAsync(GetSeamByIdRequest request);

    Task<List<SeamDto>> GetAllByControlSubjectAsync(bool isControlSubject);

    Task<Result<SeamDto>> CreateAsync(CreateSeamRequest request);

    Task<Result<SeamDto>> UpdateAsync(UpdateSeamRequest request);

    Task<Result<List<SeamDto>>> GetAllByInspectorIdAsync(GetAllByInspectorIdRequest request);

    Task<Result<Unit>> AssignSeamToInspectorAsync(AssignSeamToInspectorRequest request);

    Task<Result<Unit>> AssignSeamsToInspectorAsync(AssignSeamsToInspectorRequest request);

    Task<List<DefectiveSeamDto>> GetAllDefectiveSeamsAsync();

    Task<Result<DefectiveSeamDto>> AddDefectiveReasonToSeamAsync(AddDefectiveReasonToSeamRequest request);

    Task<Result<DefectiveSeamDto>> UpdateDefectiveReasonSeamAsync(UpdateDefectiveReasonToSeamRequest request);
}