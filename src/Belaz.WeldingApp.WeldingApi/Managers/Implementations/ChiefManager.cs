using AutoMapper;
using AutoMapper.QueryableExtensions;
using Belaz.WeldingApp.WeldingApi.Contracts.Responses.Chief;
using Belaz.WeldingApp.WeldingApi.Managers.Interfaces;
using Belaz.WeldingApp.WeldingApi.Repositories;
using Belaz.WeldingApp.WeldingApi.Repositories.Entities.Users;
using Microsoft.EntityFrameworkCore;

namespace Belaz.WeldingApp.WeldingApi.Managers.Implementations
{
    public class ChiefManager : IChiefManager
    {
        private readonly IMapper _mapper;
        private readonly EntityFrameworkRepository<Chief> _chiefRepository;

        public ChiefManager(IMapper mapper, EntityFrameworkRepository<Chief> chiefRepository)
        {
            _mapper = mapper;
            _chiefRepository = chiefRepository;
        }

        public Task<List<ChiefDto>> GetAllAsync()
        {
            var chiefs = _chiefRepository
                .AsQueryable()
                .ProjectTo<ChiefDto>(_mapper.ConfigurationProvider)
                .ToListAsync();

            return chiefs;
        }
    }
}
