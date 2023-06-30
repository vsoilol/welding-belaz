using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.Day;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.WorkingShift;
using Belaz.WeldingApp.WeldingApi.Domain.Dtos;
using LanguageExt;
using LanguageExt.Common;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Services.Interfaces;

public interface IWorkingShiftService
{
    Task<Result<WorkingShiftDto>> CreateAsync(CreateWorkingShiftWithYearRequest request);

    Task<Result<WorkingShiftDto>> UpdateAsync(UpdateWorkingShiftRequest request);

    Task<Result<List<WorkingShiftDto>>>
        GetAllMainWorkingShiftsByYearAsync(GetAllMainWorkingShiftsByYearRequest request);

    Task<Result<List<WorkingShiftDto>>>
        GetAllWorkingShiftsByEquipmentIdAndYearAsync(GetAllWorkingShiftsByEquipmentIdAndYearRequest request);

    Task<Result<List<WorkingShiftDto>>>
        GetAllWorkingShiftsByWelderIdAndYearAsync(GetAllWorkingShiftsByWelderIdAndYearRequest request);
    
    Task<Result<Unit>> DeleteWorkingShiftAsync(DeleteWorkingShiftRequest request);
}