using AutoMapper;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Extensions;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.Chief;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Services.Interfaces;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.Services;
using Belaz.WeldingApp.WeldingApi.DataLayer.Repositories.Interfaces;
using Belaz.WeldingApp.WeldingApi.Domain.Dtos;
using Belaz.WeldingApp.Common.Entities.Users;
using LanguageExt.Common;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Services.Implementations;

public class ChiefService : IChiefService
{
    private readonly IValidationService _validationService;
    private readonly IMapper _mapper;
    private readonly IChiefRepository _chiefRepository;

    public ChiefService(
        IValidationService validationService,
        IMapper mapper,
        IChiefRepository chiefRepository
    )
    {
        _validationService = validationService;
        _mapper = mapper;
        _chiefRepository = chiefRepository;
    }

    public Task<List<ChiefDto>> GetAllAsync()
    {
        return _chiefRepository.GetAllAsync();
    }

    public async Task<Result<ChiefDto>> CreateAsync(CreateChiefRequest request)
    {
        var validationResult = await _validationService.ValidateAsync(request);

        return await validationResult.ToDataResult(() =>
        {
            var chief = _mapper.Map<Chief>(request);

            return _chiefRepository.CreateAsync(chief);
        });
    }

    public async Task<Result<ChiefDto>> UpdateAsync(UpdateChiefRequest request)
    {
        var validationResult = await _validationService.ValidateAsync(request);

        return await validationResult.ToDataResult(() =>
        {
            var chief = _mapper.Map<Chief>(request);

            return _chiefRepository.UpdateAsync(chief);
        });
    }
}
