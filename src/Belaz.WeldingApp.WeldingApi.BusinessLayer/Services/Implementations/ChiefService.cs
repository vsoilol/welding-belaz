using AutoMapper;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Extensions;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.Chief;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Services.Interfaces;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.Services;
using Belaz.WeldingApp.WeldingApi.DataLayer.Repositories.Interfaces;
using Belaz.WeldingApp.WeldingApi.Domain.Dtos;
using Belaz.WeldingApp.Common.Entities.Users;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests;
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

    public async Task<BaseRequest<List<ChiefDto>>> GetAllAsync()
    {
        var chiefs = await _chiefRepository.GetAllAsync();
        var message = "Получение всех начальников цехов";

        return new BaseRequest<List<ChiefDto>>(chiefs, message);
    }

    public async Task<BaseResultRequest<ChiefDto>> CreateAsync(CreateChiefRequest request)
    {
        var validationResult = await _validationService.ValidateAsync(request);

        if (!validationResult.IsValid)
        {
            var result = new Result<ChiefDto>(validationResult.Exception);
            return new BaseResultRequest<ChiefDto>(result);
        }

        var chief = _mapper.Map<Chief>(request);

        var data = await _chiefRepository.CreateAsync(chief);
        var message = $"Добавление нового начальника цеха: {data.MiddleName} {data.FirstName} {data.LastName}";

        return new BaseResultRequest<ChiefDto>(data, message);
    }

    public async Task<BaseResultRequest<ChiefDto>> UpdateAsync(UpdateChiefRequest request)
    {
        var validationResult = await _validationService.ValidateAsync(request);

        if (!validationResult.IsValid)
        {
            var result = new Result<ChiefDto>(validationResult.Exception);
            return new BaseResultRequest<ChiefDto>(result);
        }

        var chief = _mapper.Map<Chief>(request);

        var data = await _chiefRepository.UpdateAsync(chief);
        var message = $"Изменение информации о начальнике цеха: {data.MiddleName} {data.FirstName} {data.LastName}";

        return new BaseResultRequest<ChiefDto>(data, message);
    }
}