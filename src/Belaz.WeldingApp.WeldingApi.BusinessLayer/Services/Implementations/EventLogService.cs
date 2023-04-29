using AutoMapper;
using Belaz.WeldingApp.Common.Entities;
using Belaz.WeldingApp.Common.Entities.CalendarInfo;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Extensions;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.EventLog;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Services.Interfaces;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.Services;
using Belaz.WeldingApp.WeldingApi.DataLayer.Repositories.Interfaces;
using Belaz.WeldingApp.WeldingApi.Domain.Dtos;
using LanguageExt.Common;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Services.Implementations;

internal class EventLogService : IEventLogService
{
    private readonly IValidationService _validationService;
    private readonly IEventLogRepository _eventLogRepository;
    private readonly IMapper _mapper;

    public EventLogService(IValidationService validationService, IEventLogRepository eventLogRepository, IMapper mapper)
    {
        _validationService = validationService;
        _eventLogRepository = eventLogRepository;
        _mapper = mapper;
    }

    public Task<List<EventLogDto>> GetAllAsync()
    {
        return _eventLogRepository.GetAllAsync();
    }

    public async Task<Result<EventLogDto>> AddAsync(AddEventLogRequest request, Guid userId)
    {
        var validationResult = await _validationService.ValidateAsync(request);

        return await validationResult.ToDataResult(() =>
        {
            var eventLog = _mapper.Map<EventLog>(request);

            eventLog.UserId = userId;

            return _eventLogRepository.AddAsync(eventLog);
        });
    }
}