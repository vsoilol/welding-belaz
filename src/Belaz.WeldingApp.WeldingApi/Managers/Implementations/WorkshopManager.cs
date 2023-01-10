using AutoMapper;
using AutoMapper.QueryableExtensions;
using Belaz.WeldingApp.WeldingApi.Contracts.Requests.Workshop;
using Belaz.WeldingApp.WeldingApi.Contracts.Responses.Workshop;
using Belaz.WeldingApp.WeldingApi.Managers.Interfaces;
using Belaz.WeldingApp.WeldingApi.Repositories;
using Belaz.WeldingApp.WeldingApi.Repositories.Entities.Production;
using Microsoft.EntityFrameworkCore;

namespace Belaz.WeldingApp.WeldingApi.Managers.Implementations;

public class WorkshopManager : IWorkshopManager
{
    private readonly IMapper _mapper;
    private readonly EntityFrameworkRepository<Workshop> _workshopRepository;

    public WorkshopManager(IMapper mapper, EntityFrameworkRepository<Workshop> workshopRepository)
    {
        _mapper = mapper;
        _workshopRepository = workshopRepository;
    }

    public async Task<List<WorkshopDto>> GetAllAsync()
    {
        return await _workshopRepository
            .AsQueryable()
            .ProjectTo<WorkshopDto>(_mapper.ConfigurationProvider)
            .ToListAsync();
    }

    public async Task<WorkshopDto?> GetByIdAsync(Guid id)
    {
        return await _workshopRepository
            .AsQueryable()
            .Where(_ => _.Id == id)
            .ProjectTo<WorkshopDto>(_mapper.ConfigurationProvider)
            .FirstOrDefaultAsync();
    }

    public async Task<WorkshopDto?> CreateAsync(CreateWorkshopRequest request)
    {
        var workshop = _mapper.Map<Workshop>(request);
        
        var createdWorkshop = _workshopRepository.Add(workshop);
        await _workshopRepository.SaveAsync();

        return await _workshopRepository
            .AsQueryable()
            .Where(_ => _.Id == createdWorkshop.Id)
            .ProjectTo<WorkshopDto>(_mapper.ConfigurationProvider)
            .FirstOrDefaultAsync();
    }

    public Task<bool> UpdateAsync(UpdateWorkshopRequest request)
    {
        var workshop = _mapper.Map<Workshop>(request);
        return _workshopRepository.UpdateAsync(workshop);
    }
}