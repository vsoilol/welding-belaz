using AutoMapper;
using AutoMapper.QueryableExtensions;
using Belaz.WeldingApp.WeldingApi.DataLayer.Repositories.Interfaces;
using Belaz.WeldingApp.WeldingApi.Domain.Dtos;
using Belaz.WeldingApp.WeldingApi.Domain.Entities.Users;
using Belaz.WeldingApp.WeldingApi.Domain.Entities.WeldingEquipmentInfo;
using Microsoft.EntityFrameworkCore;

namespace Belaz.WeldingApp.WeldingApi.DataLayer.Repositories.Implementations;

public class WelderRepository : IWelderRepository
{
    private readonly ApplicationContext _context;
    private readonly IMapper _mapper;

    public WelderRepository(ApplicationContext context, IMapper mapper)
    {
        _context = context;
        _mapper = mapper;
    }

    public Task<List<WelderDto>> GetAllAsync()
    {
        return _context.Welders
            .ProjectTo<WelderDto>(_mapper.ConfigurationProvider)
            .ToListAsync();
    }

    public Task<WelderDto> GetByIdAsync(Guid id)
    {
        return _context.Welders
            .Where(_ => _.Id == id)
            .ProjectTo<WelderDto>(_mapper.ConfigurationProvider)
            .FirstOrDefaultAsync()!;
    }

    public async Task<WelderDto> CreateAsync(Welder entity, IReadOnlyList<Guid>? weldingEquipmentIds)
    {
        entity.WeldingEquipments = weldingEquipmentIds is not null
            ? await GetWeldingEquipmentsByIds(weldingEquipmentIds)
            : new List<WeldingEquipment>();

        var createdWelder = _context.Welders.Add(entity).Entity;
        await _context.SaveChangesAsync();

        return await GetByIdAsync(createdWelder.Id);
    }

    public async Task<WelderDto> UpdateAsync(Welder entity, IReadOnlyList<Guid>? weldingEquipmentIds)
    {
        var updatedWelder = (await _context.Welders
            .Include(_ => _.UserInfo)
            .Include(_ => _.WeldingEquipments)
            .FirstOrDefaultAsync(_ => _.Id == entity.Id))!;

        updatedWelder.WeldingEquipments = weldingEquipmentIds is not null
            ? await GetWeldingEquipmentsByIds(weldingEquipmentIds)
            : new List<WeldingEquipment>();

        updatedWelder.WorkplaceId = entity.WorkplaceId;
        updatedWelder.UserInfo.RfidTag = entity.UserInfo.RfidTag;
        updatedWelder.UserInfo.FirstName = entity.UserInfo.FirstName;
        updatedWelder.UserInfo.MiddleName = entity.UserInfo.MiddleName;
        updatedWelder.UserInfo.LastName = entity.UserInfo.LastName;
        updatedWelder.UserInfo.ProductionAreaId = entity.UserInfo.ProductionAreaId;

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