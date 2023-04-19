﻿using AutoMapper;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Extensions;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.Welder;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Services.Interfaces;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.Services;
using Belaz.WeldingApp.WeldingApi.DataLayer.Repositories.Interfaces;
using Belaz.WeldingApp.WeldingApi.Domain.Dtos;
using Belaz.WeldingApp.WeldingApi.Domain.Dtos.Welder;
using Belaz.WeldingApp.Common.Entities.Users;
using LanguageExt;
using LanguageExt.Common;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Services.Implementations;

public class WelderService : IWelderService
{
    private readonly IValidationService _validationService;
    private readonly IMapper _mapper;
    private readonly IWelderRepository _welderRepository;

    public WelderService(
        IValidationService validationService,
        IMapper mapper,
        IWelderRepository welderRepository
    )
    {
        _validationService = validationService;
        _mapper = mapper;
        _welderRepository = welderRepository;
    }

    public Task<List<WelderDto>> GetAllAsync()
    {
        return _welderRepository.GetAllAsync();
    }

    public async Task<Result<WelderDto>> CreateAsync(CreateWelderRequest request)
    {
        var validationResult = await _validationService.ValidateAsync(request);

        return await validationResult.ToDataResult(() =>
        {
            var welder = _mapper.Map<Welder>(request);

            return _welderRepository.CreateAsync(welder);
        });
    }

    public async Task<Result<WelderDto>> UpdateAsync(UpdateWelderRequest request)
    {
        var validationResult = await _validationService.ValidateAsync(request);

        return await validationResult.ToDataResult(() =>
        {
            var welder = _mapper.Map<Welder>(request);

            return _welderRepository.UpdateAsync(welder);
        });
    }

    public async Task<Result<Unit>> DeleteAsync(DeleteWelderRequest request)
    {
        var validationResult = await _validationService.ValidateAsync(request);

        return await validationResult.ToDataResult(async () =>
        {
            await _welderRepository.DeleteAsync(request.Id);
            return Unit.Default;
        });
    }
}
