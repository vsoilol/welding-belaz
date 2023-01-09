using AutoMapper;
using AutoMapper.QueryableExtensions;
using Belaz.WeldingApp.WeldingApi.Contracts.Responses.Master;
using Belaz.WeldingApp.WeldingApi.Managers.Interfaces;
using Belaz.WeldingApp.WeldingApi.Repositories;
using Belaz.WeldingApp.WeldingApi.Repositories.Entities.Users;
using Microsoft.EntityFrameworkCore;

namespace Belaz.WeldingApp.WeldingApi.Managers.Implementations
{
    public class MasterManager : IMasterManager
    {
        private readonly IMapper _mapper;
        private readonly EntityFrameworkRepository<Master> _masterRepository;

        public MasterManager(IMapper mapper, EntityFrameworkRepository<Master> chiefRepository)
        {
            _mapper = mapper;
            _masterRepository = chiefRepository;
        }

        public Task<List<MasterDto>> GetAllAsync()
        {
            var inspectors = _masterRepository
                .AsQueryable()
                .ProjectTo<MasterDto>(_mapper.ConfigurationProvider)
                .ToListAsync();

            return inspectors;
        }
    }
}
