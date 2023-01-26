using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.WorkingShift;
using Belaz.WeldingApp.WeldingApi.Domain.Dtos;
using LanguageExt.Common;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Services.Interfaces;

public interface IWorkingShiftService
{
    Task<Result<WorkingShiftDto>> CreateAsync(CreateWorkingShiftWithYearRequest request);
    
    Task<Result<WorkingShiftDto>> UpdateAsync(UpdateWorkingShiftRequest request);
}