using AutoMapper;
using AutoMapper.QueryableExtensions;
using Belaz.WeldingApp.WeldingApi.Contracts.Responses.WeldingEquipment;
using Belaz.WeldingApp.WeldingApi.Managers.Interfaces;
using Belaz.WeldingApp.WeldingApi.Repositories;
using Belaz.WeldingApp.WeldingApi.Repositories.Entities.Enums;
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
}
