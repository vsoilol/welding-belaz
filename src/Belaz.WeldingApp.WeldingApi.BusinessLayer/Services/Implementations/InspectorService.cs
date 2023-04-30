using AutoMapper;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Extensions;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.Inspector;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Services.Interfaces;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.Services;
using Belaz.WeldingApp.WeldingApi.DataLayer.Repositories.Interfaces;
using Belaz.WeldingApp.WeldingApi.Domain.Dtos;
using Belaz.WeldingApp.Common.Entities.Users;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests;
using LanguageExt;
using LanguageExt.Common;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Services.Implementations;

public class InspectorService : IInspectorService
{
    private readonly IValidationService _validationService;
    private readonly IMapper _mapper;
    private readonly IInspectorRepository _inspectorRepository;

    public InspectorService(
        IValidationService validationService,
        IMapper mapper,
        IInspectorRepository inspectorRepository
    )
    {
        _validationService = validationService;
        _mapper = mapper;
        _inspectorRepository = inspectorRepository;
    }

    public async Task<BaseRequest<List<InspectorDto>>> GetAllAsync()
    {
        var data = await _inspectorRepository.GetAllAsync();

        var message = "Получение всех контролёров";

        return new BaseRequest<List<InspectorDto>>(data, message);
    }

    public async Task<BaseResultRequest<InspectorDto>> CreateAsync(CreateInspectorRequest request)
    {
        var validationResult = await _validationService.ValidateAsync(request);

        if (!validationResult.IsValid)
        {
            var result = new Result<InspectorDto>(validationResult.Exception);
            return new BaseResultRequest<InspectorDto>(result);
        }

        var inspector = _mapper.Map<Inspector>(request);

        var data = await _inspectorRepository.CreateAsync(inspector);
        var message = $"Добавление нового контролёра: {data.MiddleName} {data.FirstName} {data.LastName}";

        return new BaseResultRequest<InspectorDto>(data, message);
    }

    public async Task<BaseResultRequest<InspectorDto>> UpdateAsync(UpdateInspectorRequest request)
    {
        var validationResult = await _validationService.ValidateAsync(request);

        if (!validationResult.IsValid)
        {
            var result = new Result<InspectorDto>(validationResult.Exception);
            return new BaseResultRequest<InspectorDto>(result);
        }

        var inspector = _mapper.Map<Inspector>(request);

        var data = await _inspectorRepository.UpdateAsync(inspector);
        var message = $"Обновление информации контролёра: {data.MiddleName} {data.FirstName} {data.LastName}";

        return new BaseResultRequest<InspectorDto>(data, message);
    }

    public async Task<BaseResultRequest<Unit>> DeleteAsync(DeleteInspectorRequest request)
    {
        var validationResult = await _validationService.ValidateAsync(request);

        if (!validationResult.IsValid)
        {
            var result = new Result<Unit>(validationResult.Exception);
            return new BaseResultRequest<Unit>(result);
        }

        var inspector = await _inspectorRepository.GetUserFullNameByIdAsync(request.Id);
        await _inspectorRepository.DeleteAsync(request.Id);

        var message = $"Удаление контролёра: {inspector.MiddleName} {inspector.FirstName} {inspector.LastName}";

        return new BaseResultRequest<Unit>(Unit.Default, message);
    }
}
