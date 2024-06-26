﻿using Belaz.WeldingApp.WeldingApi.Contracts.Requests.Day;
using Belaz.WeldingApp.WeldingApi.Contracts.Requests.WorkingShift;
using Belaz.WeldingApp.WeldingApi.Contracts.Responses;

namespace Belaz.WeldingApp.WeldingApi.Managers.Interfaces;

public interface IWorkingShiftManager
{
    Task<WorkingShiftDto?> CreateAsync(CreateWorkingShiftWithIdRequest request);
    
    Task<WorkingShiftDto?> UpdateAsync(UpdateWorkingShiftRequest request);
    
    Task CreateRangeAsync(List<CreateWorkingShiftRequest> values, Guid calendarId);
}