using AutoMapper;
using AutoMapper.QueryableExtensions;
using Belaz.WeldingApp.Common.Entities.Users;
using Belaz.WeldingApp.FileApi.DataLayer.Repositories.Interfaces;
using Belaz.WeldingApp.FileApi.Domain.Dtos;
using Microsoft.EntityFrameworkCore;

namespace Belaz.WeldingApp.FileApi.DataLayer.Repositories.Implementations;

public class MasterRepository : IMasterRepository
{
    private readonly ApplicationContext _context;
    private readonly IMapper _mapper;

    public MasterRepository(ApplicationContext context, IMapper mapper)
    {
        _context = context;
        _mapper = mapper;
    }
    
    public Task<MasterBriefDto?> GetByServiceNumberOrDefaultAsync(string serviceNumber)
    {
        return _context.Masters
            .Where(_ => _.UserInfo.ServiceNumber == serviceNumber)
            .ProjectTo<MasterBriefDto>(_mapper.ConfigurationProvider)
            .FirstOrDefaultAsync();
    }

    public Task AddAsync(Master master)
    {
        _context.Masters.Add(master);
        return _context.SaveChangesAsync();
    }

    public async Task UpdateAsync(Master master)
    {
        var updatedMaster = (await _context.Masters
            .Include(_ => _.UserInfo)
            .FirstOrDefaultAsync(_ => _.Id == master.Id))!;

        updatedMaster.UserInfo.FirstName = master.UserInfo.FirstName;
        updatedMaster.UserInfo.LastName = master.UserInfo.LastName;
        updatedMaster.UserInfo.MiddleName = master.UserInfo.MiddleName;
        updatedMaster.UserInfo.Role = master.UserInfo.Role;
        updatedMaster.UserInfo.Position = master.UserInfo.Position;
        updatedMaster.UserInfo.ServiceNumber = master.UserInfo.ServiceNumber;
        updatedMaster.UserInfo.ProductionAreaId = master.UserInfo.ProductionAreaId;

        await _context.SaveChangesAsync();
    }
}