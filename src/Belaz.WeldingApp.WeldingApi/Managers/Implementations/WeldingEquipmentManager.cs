using AutoMapper;
using AutoMapper.QueryableExtensions;
using Belaz.WeldingApp.WeldingApi.Contracts.Requests.WeldingEquipment;
using Belaz.WeldingApp.WeldingApi.Contracts.Responses.Welder;
using Belaz.WeldingApp.WeldingApi.Contracts.Responses.WeldingEquipment;
using Belaz.WeldingApp.WeldingApi.Exceptions;
using Belaz.WeldingApp.WeldingApi.Managers.Interfaces;
using Belaz.WeldingApp.WeldingApi.Repositories;
using Belaz.WeldingApp.WeldingApi.Repositories.Entities.Users;
using Belaz.WeldingApp.WeldingApi.Repositories.Entities.WeldingEquipmentInfo;
using Microsoft.EntityFrameworkCore;
using WeldingApp.Common.Enums;

namespace Belaz.WeldingApp.WeldingApi.Managers.Implementations;

public class WeldingEquipmentManager : IWeldingEquipmentManager
{
    private readonly IMapper _mapper;
    private readonly EntityFrameworkRepository<WeldingEquipment> _weldingEquipmentRepository;
    private readonly EntityFrameworkRepository<WeldingEquipmentConditionTime> _weldingEquipmentConditionTimeRepository;

    public WeldingEquipmentManager(IMapper mapper,
        EntityFrameworkRepository<WeldingEquipment> weldingEquipmentRepository,
        EntityFrameworkRepository<WeldingEquipmentConditionTime> weldingEquipmentConditionTimeRepository)
    {
        _mapper = mapper;
        _weldingEquipmentRepository = weldingEquipmentRepository;
        _weldingEquipmentConditionTimeRepository = weldingEquipmentConditionTimeRepository;
    }

    public Task<List<WeldingEquipmentDto>> GetAllAsync()
    {
        var weldingEquipments = _weldingEquipmentRepository
            .AsQueryable()
            .ProjectTo<WeldingEquipmentDto>(_mapper.ConfigurationProvider)
            .ToListAsync();

        return weldingEquipments;
    }

    public Task<List<WeldingEquipmentDowntimeDto>> GetAllWeldingEquipmentDowntimesAsync()
    {
        var weldingEquipmentDowntimes = _weldingEquipmentConditionTimeRepository
            .AsQueryableByFilter(_ => _.Condition == Condition.ForcedDowntime)
            .ProjectTo<WeldingEquipmentDowntimeDto>(_mapper.ConfigurationProvider)
            .ToListAsync();

        return weldingEquipmentDowntimes;
    }

    public async Task<WeldingEquipmentDto?> CreateAsync(CreateEquipmentRequest request)
    {
        var weldingEquipment = _mapper.Map<WeldingEquipment>(request);

        var createdWeldingEquipment = _weldingEquipmentRepository.Add(weldingEquipment);
        await _weldingEquipmentRepository.SaveAsync();

        return await _weldingEquipmentRepository
            .AsQueryable()
            .Where(_ => _.Id == createdWeldingEquipment.Id)
            .ProjectTo<WeldingEquipmentDto>(_mapper.ConfigurationProvider)
            .FirstOrDefaultAsync();
    }

    public async Task<WeldingEquipmentDto?> UpdateAsync(UpdateEquipmentRequest request)
    {
        var workplace = _mapper.Map<WeldingEquipment>(request);
        var isUpdate = await _weldingEquipmentRepository.UpdateAsync(workplace);

        if (!isUpdate)
        {
            throw new UpdateFailedException(typeof(WeldingEquipment), request.Id);
        }

        return await _weldingEquipmentRepository
            .GetByIdAsQueryable(request.Id)
            .ProjectTo<WeldingEquipmentDto>(_mapper.ConfigurationProvider)
            .FirstOrDefaultAsync();
    }

    public async Task<WeldingEquipmentDowntimeDto?> AddWeldingEquipmentDowntimeAsync(
        CreateWeldingEquipmentDowntimeRequest request)
    {
        var weldingEquipmentConditionTime = _mapper.Map<WeldingEquipmentConditionTime>(request);

        var createdWeldingEquipmentConditionTime = _weldingEquipmentConditionTimeRepository
            .Add(weldingEquipmentConditionTime);
        await _weldingEquipmentConditionTimeRepository.SaveAsync();

        return await _weldingEquipmentConditionTimeRepository
            .GetByIdAsQueryable(createdWeldingEquipmentConditionTime.Id)
            .ProjectTo<WeldingEquipmentDowntimeDto>(_mapper.ConfigurationProvider)
            .FirstOrDefaultAsync();
    }

    public async Task<WeldingEquipmentDowntimeDto?> UpdateWeldingEquipmentDowntimeAsync(UpdateWeldingEquipmentDowntimeRequest request)
    {
        var weldingEquipmentConditionTime = _mapper.Map<WeldingEquipmentConditionTime>(request);
        var isUpdate = await _weldingEquipmentConditionTimeRepository.UpdateAsync(weldingEquipmentConditionTime);

        if (!isUpdate)
        {
            throw new UpdateFailedException(typeof(WeldingEquipmentConditionTime), request.Id);
        }
        
        return await _weldingEquipmentConditionTimeRepository
            .GetByIdAsQueryable(request.Id)
            .ProjectTo<WeldingEquipmentDowntimeDto>(_mapper.ConfigurationProvider)
            .FirstOrDefaultAsync();
    }
}