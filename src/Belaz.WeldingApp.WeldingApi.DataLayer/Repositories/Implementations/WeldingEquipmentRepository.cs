using AutoMapper;
using AutoMapper.QueryableExtensions;
using Belaz.WeldingApp.Common.Enums;
using Belaz.WeldingApp.WeldingApi.DataLayer.Repositories.Interfaces;
using Belaz.WeldingApp.WeldingApi.Domain.Dtos.WeldingEquipment;
using Belaz.WeldingApp.Common.Entities.WeldingEquipmentInfo;
using Microsoft.EntityFrameworkCore;

namespace Belaz.WeldingApp.WeldingApi.DataLayer.Repositories.Implementations;

public class WeldingEquipmentRepository : IWeldingEquipmentRepository
{
    private readonly ApplicationContext _context;
    private readonly IMapper _mapper;

    public WeldingEquipmentRepository(ApplicationContext context, IMapper mapper)
    {
        _context = context;
        _mapper = mapper;
    }

    public Task<List<WeldingEquipmentDto>> GetAllAsync()
    {
        return _context.WeldingEquipments
            .ProjectTo<WeldingEquipmentDto>(_mapper.ConfigurationProvider)
            .ToListAsync();
    }

    public Task<WeldingEquipmentDto> GetByIdAsync(Guid id)
    {
        return _context.WeldingEquipments
            .Where(_ => _.Id == id)
            .ProjectTo<WeldingEquipmentDto>(_mapper.ConfigurationProvider)
            .FirstOrDefaultAsync()!;
    }

    public Task<WeldingEquipmentBriefDto> GetBriefInfoByIdAsync(Guid id)
    {
        return _context.WeldingEquipments
            .Where(_ => _.Id == id)
            .ProjectTo<WeldingEquipmentBriefDto>(_mapper.ConfigurationProvider)
            .FirstOrDefaultAsync()!;
    }

    public Task<WeldingEquipmentDowntimeDto> GetConditionByIdAsync(Guid id)
    {
        return _context.WeldingEquipmentConditionTimes
            .Where(_ => _.Id == id)
            .ProjectTo<WeldingEquipmentDowntimeDto>(_mapper.ConfigurationProvider)
            .FirstOrDefaultAsync()!;
    }

    public Task<List<WeldingEquipmentDowntimeDto>> GetAllWeldingEquipmentDowntimesAsync()
    {
        return _context.WeldingEquipmentConditionTimes
            .Where(_ => _.Condition == Condition.ForcedDowntime)
            .ProjectTo<WeldingEquipmentDowntimeDto>(_mapper.ConfigurationProvider)
            .ToListAsync();
    }

    public async Task<WeldingEquipmentDto> CreateAsync(
        WeldingEquipment entity,
        List<Guid> workplaceIds
    )
    {
        var workplaces = await _context.Workplaces
            .Where(_ => workplaceIds.Any(workplaceId => workplaceId == _.Id))
            .ToListAsync();

        entity.Workplaces = workplaces;

        var newWeldingEquipment = _context.WeldingEquipments.Add(entity).Entity;
        await _context.SaveChangesAsync();

        return await GetByIdAsync(newWeldingEquipment.Id);
    }

    public async Task<WeldingEquipmentDto> UpdateAsync(
        WeldingEquipment entity,
        List<Guid> workplaceIds
    )
    {
        var updatedWeldingEquipment = (
            await _context.WeldingEquipments
                .Include(_ => _.Workplaces)
                .FirstOrDefaultAsync(_ => _.Id == entity.Id)
        )!;

        var workplaces = await _context.Workplaces
            .Where(_ => workplaceIds.Any(workplaceId => workplaceId == _.Id))
            .ToListAsync();

        updatedWeldingEquipment.Workplaces = workplaces;

        updatedWeldingEquipment.PostId = entity.PostId;
        updatedWeldingEquipment.ArcVoltageMax = entity.ArcVoltageMax;
        updatedWeldingEquipment.ArcVoltageMin = entity.ArcVoltageMin;
        updatedWeldingEquipment.WeldingCurrentMax = entity.WeldingCurrentMax;
        updatedWeldingEquipment.WeldingCurrentMin = entity.WeldingCurrentMin;
        updatedWeldingEquipment.IdleVoltage = entity.IdleVoltage;
        updatedWeldingEquipment.WeldingProcess = entity.WeldingProcess;
        updatedWeldingEquipment.NextAttestationDate = entity.NextAttestationDate;
        updatedWeldingEquipment.ManufacturerName = entity.ManufacturerName;
        updatedWeldingEquipment.GroupNumber = entity.GroupNumber;
        updatedWeldingEquipment.Lenght = entity.Lenght;
        updatedWeldingEquipment.Width = entity.Width;
        updatedWeldingEquipment.Height = entity.Height;
        updatedWeldingEquipment.CommissioningDate = entity.CommissioningDate;
        updatedWeldingEquipment.FactoryNumber = entity.FactoryNumber;
        updatedWeldingEquipment.Marking = entity.Marking;
        updatedWeldingEquipment.Name = entity.Name;
        updatedWeldingEquipment.RfidTag = entity.RfidTag;

        await _context.SaveChangesAsync();

        return await GetByIdAsync(entity.Id);
    }

    public async Task<WeldingEquipmentDowntimeDto> AddWeldingEquipmentDowntimeAsync(
        WeldingEquipmentConditionTime entity
    )
    {
        var newWeldingEquipmentConditionTime = _context.WeldingEquipmentConditionTimes
            .Add(entity)
            .Entity;
        await _context.SaveChangesAsync();

        return await GetConditionByIdAsync(newWeldingEquipmentConditionTime.Id);
    }

    public async Task<WeldingEquipmentDowntimeDto> UpdateWeldingEquipmentDowntimeAsync(
        WeldingEquipmentConditionTime entity
    )
    {
        var updatedWeldingEquipmentConditionTime = (
            await _context.WeldingEquipmentConditionTimes.FirstOrDefaultAsync(
                _ => _.Id == entity.Id
            )
        )!;

        updatedWeldingEquipmentConditionTime.Condition = entity.Condition;
        updatedWeldingEquipmentConditionTime.Date = entity.Date;
        updatedWeldingEquipmentConditionTime.StartConditionTime = entity.StartConditionTime;
        updatedWeldingEquipmentConditionTime.Time = entity.Time;
        updatedWeldingEquipmentConditionTime.WeldingEquipmentId = entity.WeldingEquipmentId;
        updatedWeldingEquipmentConditionTime.DowntimeReasonId = entity.DowntimeReasonId;

        await _context.SaveChangesAsync();

        return await GetConditionByIdAsync(entity.Id);
    }

    public async Task AssignEquipmentsToWeldersAsync(
        List<Guid> weldingEquipmentIds,
        List<Guid> welderIds
    )
    {
        var weldingEquipments = await _context.WeldingEquipments
            .Where(_ => weldingEquipmentIds.Any(weldingEquipmentId => weldingEquipmentId == _.Id))
            .ToListAsync();

        await _context.Welders
            .Include(_ => _.WeldingEquipments)
            .Where(_ => welderIds.Any(welderId => welderId == _.Id))
            .ForEachAsync(_ => _.WeldingEquipments = weldingEquipments);

        await _context.SaveChangesAsync();
    }

    public async Task AssignEquipmentsToMasterAsync(List<Guid> weldingEquipmentIds, Guid masterId)
    {
        var weldingEquipments = await _context.WeldingEquipments
            .Where(_ => weldingEquipmentIds.Any(weldingEquipmentId => weldingEquipmentId == _.Id))
            .ToListAsync();

        var master = (
            await _context.Masters
                .Include(_ => _.WeldingEquipments)
                .FirstOrDefaultAsync(_ => _.Id == masterId)
        )!;

        master.WeldingEquipments = weldingEquipments;

        await _context.SaveChangesAsync();
    }

    public async Task DeleteAsync(Guid id)
    {
        var deletedWeldingEquipment = (
            await _context.WeldingEquipments
                .Include(_ => _.Calendars)
                .FirstOrDefaultAsync(_ => _.Id == id)
        )!;

        _context.WeldingEquipments.Remove(deletedWeldingEquipment);
        await _context.SaveChangesAsync();
    }
}