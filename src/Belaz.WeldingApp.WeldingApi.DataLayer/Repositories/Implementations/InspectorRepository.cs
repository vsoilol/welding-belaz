using AutoMapper;
using AutoMapper.QueryableExtensions;
using Belaz.WeldingApp.WeldingApi.DataLayer.Repositories.Interfaces;
using Belaz.WeldingApp.WeldingApi.Domain.Dtos;
using Belaz.WeldingApp.WeldingApi.Domain.Entities.Users;
using Microsoft.EntityFrameworkCore;

namespace Belaz.WeldingApp.WeldingApi.DataLayer.Repositories.Implementations;

public class InspectorRepository : IInspectorRepository
{
    private readonly IMapper _mapper;
    private readonly ApplicationContext _context;

    public InspectorRepository(IMapper mapper, ApplicationContext context)
    {
        _mapper = mapper;
        _context = context;
    }

    public Task<List<InspectorDto>> GetAllAsync()
    {
        return _context.Inspectors
            .ProjectTo<InspectorDto>(_mapper.ConfigurationProvider)
            .ToListAsync();
    }

    public Task<InspectorDto> GetByIdAsync(Guid id)
    {
        return _context.Inspectors
            .Where(_ => _.Id == id)
            .ProjectTo<InspectorDto>(_mapper.ConfigurationProvider)
            .FirstOrDefaultAsync()!; 
    }

    public async Task<InspectorDto> CreateAsync(Inspector entity)
    {
        var newInspector = _context.Inspectors.Add(entity).Entity;
        await _context.SaveChangesAsync();

        return await GetByIdAsync(newInspector.Id);
    }

    public async Task<InspectorDto> UpdateAsync(Inspector entity)
    {
        var updatedInspector = (await _context.Inspectors
            .Include(_ => _.UserInfo)
            .FirstOrDefaultAsync(_ => _.Id == entity.Id))!;

        updatedInspector.UserInfo.RfidTag = entity.UserInfo.RfidTag;
        updatedInspector.UserInfo.FirstName = entity.UserInfo.FirstName;
        updatedInspector.UserInfo.MiddleName = entity.UserInfo.MiddleName;
        updatedInspector.UserInfo.LastName = entity.UserInfo.LastName;
        updatedInspector.UserInfo.ProductionAreaId = entity.UserInfo.ProductionAreaId;

        await _context.SaveChangesAsync();

        return await GetByIdAsync(entity.Id);
    }
}