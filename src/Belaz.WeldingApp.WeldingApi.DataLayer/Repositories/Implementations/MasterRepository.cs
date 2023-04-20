using AutoMapper;
using AutoMapper.QueryableExtensions;
using Belaz.WeldingApp.WeldingApi.DataLayer.Repositories.Interfaces;
using Belaz.WeldingApp.WeldingApi.Domain.Dtos;
using Belaz.WeldingApp.WeldingApi.Domain.Dtos.Master;
using Belaz.WeldingApp.Common.Entities.Users;
using Belaz.WeldingApp.Common.Entities.WeldingEquipmentInfo;
using Microsoft.EntityFrameworkCore;

namespace Belaz.WeldingApp.WeldingApi.DataLayer.Repositories.Implementations;

public class MasterRepository : IMasterRepository
{
    private readonly IMapper _mapper;
    private readonly ApplicationContext _context;

    public MasterRepository(IMapper mapper, ApplicationContext context)
    {
        _mapper = mapper;
        _context = context;
    }

    public Task<List<MasterDto>> GetAllAsync()
    {
        return _context.Masters.ProjectTo<MasterDto>(_mapper.ConfigurationProvider).ToListAsync();
    }

    public Task<MasterDto> GetByIdAsync(Guid id)
    {
        return _context.Masters
            .Where(_ => _.Id == id)
            .ProjectTo<MasterDto>(_mapper.ConfigurationProvider)
            .FirstOrDefaultAsync()!;
    }

    public async Task<MasterDto> CreateAsync(Master entity)
    {
        var newMaster = _context.Masters.Add(entity).Entity;
        await _context.SaveChangesAsync();

        return await GetByIdAsync(newMaster.Id);
    }

    public async Task<MasterDto> UpdateAsync(Master entity)
    {
        var updatedMaster = (
            await _context.Masters
                .Include(_ => _.UserInfo)
                .FirstOrDefaultAsync(_ => _.Id == entity.Id)
        )!;

        updatedMaster.UserInfo.RfidTag = entity.UserInfo.RfidTag;
        updatedMaster.UserInfo.FirstName = entity.UserInfo.FirstName;
        updatedMaster.UserInfo.MiddleName = entity.UserInfo.MiddleName;
        updatedMaster.UserInfo.LastName = entity.UserInfo.LastName;
        updatedMaster.UserInfo.ProductionAreaId = entity.UserInfo.ProductionAreaId;
        updatedMaster.UserInfo.Position = entity.UserInfo.Position;
        updatedMaster.UserInfo.ServiceNumber = entity.UserInfo.ServiceNumber;

        await _context.SaveChangesAsync();

        return await GetByIdAsync(entity.Id);
    }

    private Task<List<WeldingEquipment>> GetWeldingEquipmentsByIds(
        IReadOnlyList<Guid> weldingEquipmentIds
    )
    {
        return _context.WeldingEquipments
            .Where(_ => weldingEquipmentIds.Any(equipmentId => equipmentId == _.Id))
            .ToListAsync();
    }

    public async Task DeleteAsync(Guid id)
    {
        var deletedUser = (
            await _context.Users
                .Include(p => p.Masters)
                .ThenInclude(_ => _.WeldingEquipments)
                .Include(p => p.Masters)
                .ThenInclude(_ => _.WeldingRecords)
                .Include(p => p.Masters)
                .ThenInclude(_ => _.WeldingTasks)
                .FirstOrDefaultAsync(_ => _.Masters.Any(master => master.Id == id))
        )!;

        _context.Users.Remove(deletedUser);

        await _context.SaveChangesAsync();
    }
}
