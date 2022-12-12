using AutoMapper;
using AutoMapper.QueryableExtensions;
using Belaz.WeldingApp.WeldingApi.Contracts.Responses.Welder;
using Belaz.WeldingApp.WeldingApi.Managers.Interfaces;
using Belaz.WeldingApp.WeldingApi.Repositories;
using Belaz.WeldingApp.WeldingApi.Repositories.Entities.Users;
using Microsoft.EntityFrameworkCore;

namespace Belaz.WeldingApp.WeldingApi.Managers.Implementations;

public class WelderManager : IWelderManager
{
    private readonly IMapper _mapper;
    private readonly EntityFrameworkRepository<Welder> _welderRepository;

    public WelderManager(IMapper mapper, EntityFrameworkRepository<Welder> welderRepository)
    {
        _mapper = mapper;
        _welderRepository = welderRepository;
    }

    public Task<List<WelderDto>> GetAllAsync()
    {
        var welders = _welderRepository
            .AsQueryable()
            .ProjectTo<WelderDto>(_mapper.ConfigurationProvider)
            .ToListAsync();

        return welders;
    }
}
