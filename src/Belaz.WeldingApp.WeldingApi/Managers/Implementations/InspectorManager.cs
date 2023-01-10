using AutoMapper;
using AutoMapper.QueryableExtensions;
using Belaz.WeldingApp.WeldingApi.Contracts.Responses.Inspector;
using Belaz.WeldingApp.WeldingApi.Managers.Interfaces;
using Belaz.WeldingApp.WeldingApi.Repositories;
using Belaz.WeldingApp.WeldingApi.Repositories.Entities.Users;
using Microsoft.EntityFrameworkCore;

namespace Belaz.WeldingApp.WeldingApi.Managers.Implementations
{
    public class InspectorManager : IInspectorManager
    {
        private readonly IMapper _mapper;
        private readonly EntityFrameworkRepository<Inspector> _inspectorRepository;

        public InspectorManager(IMapper mapper, EntityFrameworkRepository<Inspector> chiefRepository)
        {
            _mapper = mapper;
            _inspectorRepository = chiefRepository;
        }

        public Task<List<InspectorDto>> GetAllAsync()
        {
            var inspectors = _inspectorRepository
                .AsQueryable()
                .ProjectTo<InspectorDto>(_mapper.ConfigurationProvider)
                .ToListAsync();

            return inspectors;
        }
    }
}
