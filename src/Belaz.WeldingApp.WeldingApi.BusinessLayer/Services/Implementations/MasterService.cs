using AutoMapper;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Extensions;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.Master;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Services.Interfaces;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.Services;
using Belaz.WeldingApp.WeldingApi.DataLayer.Repositories.Interfaces;
using Belaz.WeldingApp.WeldingApi.Domain.Dtos;
using Belaz.WeldingApp.WeldingApi.Domain.Dtos.Master;
using Belaz.WeldingApp.Common.Entities.Users;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests;
using LanguageExt;
using LanguageExt.Common;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Services.Implementations;

public class MasterService : IMasterService
{
    private readonly IValidationService _validationService;
    private readonly IMapper _mapper;
    private readonly IMasterRepository _masterRepository;

    public MasterService(
        IValidationService validationService,
        IMapper mapper,
        IMasterRepository masterRepository
    )
    {
        _validationService = validationService;
        _mapper = mapper;
        _masterRepository = masterRepository;
    }

    public async Task<BaseRequest<List<MasterDto>>> GetAllAsync()
    {
        var data = await _masterRepository.GetAllAsync();
        var message = "Получение всех мастеров";
        return new BaseRequest<List<MasterDto>>(data, message);
    }

    public async Task<BaseResultRequest<MasterDto>> CreateAsync(CreateMasterRequest request)
    {
        var validationResult = await _validationService.ValidateAsync(request);

        if (!validationResult.IsValid)
        {
            var result = new Result<MasterDto>(validationResult.Exception);
            return new BaseResultRequest<MasterDto>(result);
        }

        var master = _mapper.Map<Master>(request);

        var data = await _masterRepository.CreateAsync(master);
        var message = $"Добавление нового мастера: {data.MiddleName} {data.FirstName} {data.LastName}";

        return new BaseResultRequest<MasterDto>(data, message);
    }

    public async Task<BaseResultRequest<MasterDto>> UpdateAsync(UpdateMasterRequest request)
    {
        var validationResult = await _validationService.ValidateAsync(request);

        if (!validationResult.IsValid)
        {
            var result = new Result<MasterDto>(validationResult.Exception);
            return new BaseResultRequest<MasterDto>(result);
        }

        var master = _mapper.Map<Master>(request);

        var data = await _masterRepository.UpdateAsync(master);
        var message = $"Обновление информации мастера: {data.MiddleName} {data.FirstName} {data.LastName}";

        return new BaseResultRequest<MasterDto>(data, message);
    }

    public async Task<BaseResultRequest<Unit>> DeleteAsync(DeleteMasterRequest request)
    {
        var validationResult = await _validationService.ValidateAsync(request);

        if (!validationResult.IsValid)
        {
            var result = new Result<Unit>(validationResult.Exception);
            return new BaseResultRequest<Unit>(result);
        }

        var master = await _masterRepository.GetUserFullNameByIdAsync(request.Id);
        await _masterRepository.DeleteAsync(request.Id);
        
        var message = $"Удаление мастера: {master.MiddleName} {master.FirstName} {master.LastName}";

        return new BaseResultRequest<Unit>(Unit.Default, message);
    }
}
