using AutoMapper;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Extensions;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.Inspector;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Services.Interfaces;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.Services;
using Belaz.WeldingApp.WeldingApi.DataLayer.Repositories.Interfaces;
using Belaz.WeldingApp.WeldingApi.Domain.Dtos;
using Belaz.WeldingApp.WeldingApi.Domain.Entities.Users;
using LanguageExt.Common;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Services.Implementations;

public class InspectorService : IInspectorService
{
    private readonly IValidationService _validationService;
    private readonly IMapper _mapper;
    private readonly IInspectorRepository _inspectorRepository;

    public InspectorService(IValidationService validationService, IMapper mapper,
        IInspectorRepository inspectorRepository)
    {
        _validationService = validationService;
        _mapper = mapper;
        _inspectorRepository = inspectorRepository;
    }

    public Task<List<InspectorDto>> GetAllAsync()
    {
        return _inspectorRepository.GetAllAsync();
    }

    public async Task<Result<InspectorDto>> CreateAsync(CreateInspectorRequest request)
    {
        var validationResult = await _validationService.ValidateAsync(request);
        
        return await validationResult.ToDataResult(() =>
        {
            var inspector = _mapper.Map<Inspector>(request);

            return _inspectorRepository.CreateAsync(inspector);
        });
    }

    public async Task<Result<InspectorDto>> UpdateAsync(UpdateInspectorRequest request)
    {
        var validationResult = await _validationService.ValidateAsync(request);
        
        return await validationResult.ToDataResult(() =>
        {
            var inspector = _mapper.Map<Inspector>(request);

            return _inspectorRepository.UpdateAsync(inspector);
        });
    }
}