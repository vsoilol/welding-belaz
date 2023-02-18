using AutoMapper;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Extensions;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.Master;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Services.Interfaces;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.Services;
using Belaz.WeldingApp.WeldingApi.DataLayer.Repositories.Interfaces;
using Belaz.WeldingApp.WeldingApi.Domain.Dtos;
using Belaz.WeldingApp.WeldingApi.Domain.Entities.Users;
using LanguageExt.Common;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Services.Implementations;

public class MasterService : IMasterService
{
    private readonly IValidationService _validationService;
    private readonly IMapper _mapper;
    private readonly IMasterRepository _masterRepository;

    public MasterService(IValidationService validationService, IMapper mapper, IMasterRepository masterRepository)
    {
        _validationService = validationService;
        _mapper = mapper;
        _masterRepository = masterRepository;
    }

    public Task<List<MasterDto>> GetAllAsync()
    {
        return _masterRepository.GetAllAsync();
    }

    public async Task<Result<MasterDto>> CreateAsync(CreateMasterRequest request)
    {
        var validationResult = await _validationService.ValidateAsync(request);

        return await validationResult.ToDataResult(() =>
        {
            var master = _mapper.Map<Master>(request);

            return _masterRepository.CreateAsync(master, request.WeldingEquipmentIds);
        });
    }

    public async Task<Result<MasterDto>> UpdateAsync(UpdateMasterRequest request)
    {
        var validationResult = await _validationService.ValidateAsync(request);

        return await validationResult.ToDataResult(() =>
        {
            var master = _mapper.Map<Master>(request);

            return _masterRepository.UpdateAsync(master, request.WeldingEquipmentIds);
        });
    }
}