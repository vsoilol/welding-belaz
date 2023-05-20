using AutoMapper;
using AutoMapper.QueryableExtensions;
using Belaz.WeldingApp.Common.Entities.Users;
using Belaz.WeldingApp.FileApi.DataLayer.Repositories.Interfaces;
using Belaz.WeldingApp.FileApi.Domain.Dtos;
using Microsoft.EntityFrameworkCore;

namespace Belaz.WeldingApp.FileApi.DataLayer.Repositories.Implementations;

public class InspectorRepository : IInspectorRepository
{
    private readonly ApplicationContext _context;
    private readonly IMapper _mapper;

    public InspectorRepository(ApplicationContext context, IMapper mapper)
    {
        _context = context;
        _mapper = mapper;
    }
    
    public Task<InspectorBriefDto?> GetByServiceNumberOrDefaultAsync(string serviceNumber)
    {
        return _context.Inspectors
            .Where(_ => _.UserInfo.ServiceNumber == serviceNumber)
            .ProjectTo<InspectorBriefDto>(_mapper.ConfigurationProvider)
            .FirstOrDefaultAsync();
    }

    public Task AddAsync(Inspector inspector)
    {
        _context.Inspectors.Add(inspector);
        return _context.SaveChangesAsync();
    }

    public async Task UpdateAsync(Inspector inspector)
    {
        var updatedInspector = (await _context.Inspectors
            .Include(_ => _.UserInfo)
            .FirstOrDefaultAsync(_ => _.Id == inspector.Id))!;

        updatedInspector.UserInfo.FirstName = inspector.UserInfo.FirstName;
        updatedInspector.UserInfo.LastName = inspector.UserInfo.LastName;
        updatedInspector.UserInfo.MiddleName = inspector.UserInfo.MiddleName;
        updatedInspector.UserInfo.Role = inspector.UserInfo.Role;
        updatedInspector.UserInfo.Position = inspector.UserInfo.Position;
        updatedInspector.UserInfo.ServiceNumber = inspector.UserInfo.ServiceNumber;
        updatedInspector.UserInfo.ProductionAreaId = inspector.UserInfo.ProductionAreaId;

        await _context.SaveChangesAsync();
    }
}