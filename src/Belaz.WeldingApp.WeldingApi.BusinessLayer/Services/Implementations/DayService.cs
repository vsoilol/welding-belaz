using AutoMapper;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Extensions;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.Day;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Services.Interfaces;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.Services;
using Belaz.WeldingApp.WeldingApi.DataLayer.Repositories.Interfaces;
using Belaz.WeldingApp.WeldingApi.Domain.Dtos;
using Belaz.WeldingApp.WeldingApi.Domain.Entities.CalendarInfo;
using Belaz.WeldingApp.WeldingApi.Domain.Models;
using LanguageExt.Common;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Services.Implementations;

public class DayService : IDayService
{
    private readonly IValidationService _validationService;
    private readonly IMapper _mapper;
    private readonly IDayRepository _dayRepository;

    public DayService(IValidationService validationService, IMapper mapper, IDayRepository dayRepository)
    {
        _validationService = validationService;
        _mapper = mapper;
        _dayRepository = dayRepository;
    }

    public async Task<Result<DayDto>> CreateAsync(CreateDayWithYearRequest request)
    {
        var validationResult = await _validationService.ValidateAsync(request);

        return await validationResult.ToDataResult(() =>
        {
            var day = _mapper.Map<Day>(request);

            return _dayRepository
                .CreateAsync(day, request.Year, request.WeldingEquipmentId, request.WelderId);
        });
    }

    public Task<List<DayDto>> GetAllMainAsync()
    {
        return _dayRepository.GetAllMainAsync();
    }

    public async Task<Result<List<DayDto>>> GetAllByWelderIdAsync(GetDaysByWelderIdRequest request)
    {
        var validationResult = await _validationService.ValidateAsync(request);

        return await validationResult.ToDataResult(() =>
            _dayRepository.GetAllByWelderIdAsync(request.WelderId));
    }

    public async Task<Result<List<DayDto>>> GetAllByEquipmentIdAsync(GetDaysByEquipmentIdRequest request)
    {
        var validationResult = await _validationService.ValidateAsync(request);

        return await validationResult.ToDataResult(() =>
            _dayRepository.GetAllByWelderIdAsync(request.EquipmentId));
    }

    public async Task<Result<DayDto>> UpdateAsync(UpdateDayRequest request)
    {
        var validationResult = await _validationService.ValidateAsync(request);

        return await validationResult.ToDataResult(() =>
        {
            var day = _mapper.Map<Day>(request);

            return _dayRepository.UpdateAsync(day);
        });
    }
}