using AutoMapper;
using Belaz.WeldingApp.Common.Entities;
using Belaz.WeldingApp.Common.Entities.CalendarInfo;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Extensions;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests;
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

    public async Task<BaseRequest<List<EventLogDto>>> GetAllAsync()
    {
        var data = await _eventLogRepository.GetAllAsync();

        var message = "Получение всех записей в журнале";

        return new BaseRequest<List<EventLogDto>>(data, message);
    }

    public async Task<BaseResultRequest<EventLogDto>> AddAsync(AddEventLogRequest request, Guid userId)
    {
        var validationResult = await _validationService.ValidateAsync(request);

        if (!validationResult.IsValid)
        {
            var result = new Result<EventLogDto>(validationResult.Exception);
            return new BaseResultRequest<EventLogDto>(result);
        }

        var eventLog = _mapper.Map<EventLog>(request);

        eventLog.UserId = userId;

        var data = await _eventLogRepository.AddAsync(eventLog);
        var message = $"Добавление записи \"{data.Information}\" в журнал";

        return new BaseResultRequest<EventLogDto>(data, message);
    }
}