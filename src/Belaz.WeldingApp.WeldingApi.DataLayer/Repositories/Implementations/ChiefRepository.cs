using AutoMapper;
using AutoMapper.QueryableExtensions;
using Belaz.WeldingApp.WeldingApi.DataLayer.Repositories.Interfaces;
using Belaz.WeldingApp.WeldingApi.Domain.Dtos;
using Belaz.WeldingApp.WeldingApi.Domain.Entities.Users;
using Belaz.WeldingApp.WeldingApi.Domain.Entities.WeldingEquipmentInfo;
using Microsoft.EntityFrameworkCore;

namespace Belaz.WeldingApp.WeldingApi.DataLayer.Repositories.Implementations;

public class ChiefRepository : IChiefRepository
{
    private readonly ApplicationContext _context;
    private readonly IMapper _mapper;

    public ChiefRepository(ApplicationContext context, IMapper mapper)
    {
        _context = context;
        _mapper = mapper;
    }

    public Task<List<ChiefDto>> GetAllAsync()
    {
        return _context.Chiefs
            .ProjectTo<ChiefDto>(_mapper.ConfigurationProvider)
            .ToListAsync();
    }

    public Task<ChiefDto> GetByIdAsync(Guid id)
    {
        return _context.Chiefs
            .Where(_ => _.Id == id)
            .ProjectTo<ChiefDto>(_mapper.ConfigurationProvider)
            .FirstOrDefaultAsync()!;
    }

    public async Task<ChiefDto> CreateAsync(Chief entity, IReadOnlyList<Guid>? weldingEquipmentIds)
    {
        entity.WeldingEquipments = weldingEquipmentIds is not null
            ? await GetWeldingEquipmentsByIds(weldingEquipmentIds)
            : new List<WeldingEquipment>();
        
        var newChief = _context.Chiefs.Add(entity).Entity;
        await _context.SaveChangesAsync();

        return await GetByIdAsync(newChief.Id);
    }

    public async Task<ChiefDto> UpdateAsync(Chief entity, IReadOnlyList<Guid>? weldingEquipmentIds)
    {
        var updatedChief = (await _context.Chiefs
            .Include(_ => _.UserInfo)
            .Include(_ => _.WeldingEquipments)
            .FirstOrDefaultAsync(_ => _.Id == entity.Id))!;
        
        updatedChief.WeldingEquipments = weldingEquipmentIds is not null
            ? await GetWeldingEquipmentsByIds(weldingEquipmentIds)
            : new List<WeldingEquipment>();
        
        updatedChief.UserInfo.RfidTag = entity.UserInfo.RfidTag;
        updatedChief.UserInfo.FirstName = entity.UserInfo.FirstName;
        updatedChief.UserInfo.MiddleName = entity.UserInfo.MiddleName;
        updatedChief.UserInfo.LastName = entity.UserInfo.LastName;
        updatedChief.UserInfo.ProductionAreaId = entity.UserInfo.ProductionAreaId;

        await _context.SaveChangesAsync();

        return await GetByIdAsync(entity.Id);
    }
    
    private Task<List<WeldingEquipment>> GetWeldingEquipmentsByIds(IReadOnlyList<Guid> weldingEquipmentIds)
    {
        return _context.WeldingEquipments
            .Where(_ => weldingEquipmentIds.Any(equipmentId => equipmentId == _.Id))
            .ToListAsync();
    }
}