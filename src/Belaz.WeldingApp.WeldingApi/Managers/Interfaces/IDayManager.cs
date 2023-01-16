﻿using Belaz.WeldingApp.WeldingApi.Contracts.Requests.Day;
using Belaz.WeldingApp.WeldingApi.Contracts.Responses;

namespace Belaz.WeldingApp.WeldingApi.Managers.Interfaces;

public interface IDayManager
{
    Task<DayDto?> CreateAsync(CreateDayRequest request);
    
    Task CreateRangeAsync(List<CreateDayRequest> values, Guid calendarId);
}