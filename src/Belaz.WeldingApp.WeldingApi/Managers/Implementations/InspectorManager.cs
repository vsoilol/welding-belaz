using AutoMapper;
using AutoMapper.QueryableExtensions;
using Belaz.WeldingApp.WeldingApi.Contracts.Requests.Common;
using Belaz.WeldingApp.WeldingApi.Contracts.Responses.Inspector;
using Belaz.WeldingApp.WeldingApi.Exceptions;
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

        public async Task<InspectorDto?> CreateAsync(CreateUserRequest request)
        {
            var inspector = _mapper.Map<Inspector>(request);
        
            var createdInspector = _inspectorRepository.Add(inspector);
            await _inspectorRepository.SaveAsync();

            return await _inspectorRepository
                .AsQueryable()
                .Where(_ => _.Id == createdInspector.Id)
                .ProjectTo<InspectorDto>(_mapper.ConfigurationProvider)
                .FirstOrDefaultAsync();
        }

        public async Task UpdateAsync(UpdateUserRequest request)
        {
            var inspector = _mapper.Map<Inspector>(request);
            var isUpdate = await _inspectorRepository.UpdateAsync(inspector);

            if (!isUpdate)
            {
                throw new UpdateFailedException(typeof(Inspector), request.Id);
            }
        }
    }
}
