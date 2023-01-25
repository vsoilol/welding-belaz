using AutoMapper;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Services.Interfaces;
using Belaz.WeldingApp.WeldingApi.DataLayer.Repositories.Interfaces;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.Chief;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.Services;
using Belaz.WeldingApp.WeldingApi.Domain.Dtos;
using Belaz.WeldingApp.WeldingApi.Domain.Entities.Users;
using FluentValidation;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Services.Implementations;

public class ChiefService : IChiefService
{
    private readonly IChiefRepository _chiefRepository;
    private readonly IMapper _mapper;
    private readonly IValidationService _validationService;
    
    public ChiefService(IChiefRepository chiefRepository, IMapper mapper, IValidationService validationService)
    {
        _chiefRepository = chiefRepository;
        _mapper = mapper;
        _validationService = validationService;
    }

    public async Task<ChiefDto> CreateAsync(CreateChiefRequest request)
    {
        await _validationService.ValidateAsync(request);

        var chief = _mapper.Map<Chief>(request);

        return await _chiefRepository.CreateAsync(chief);
    }
}