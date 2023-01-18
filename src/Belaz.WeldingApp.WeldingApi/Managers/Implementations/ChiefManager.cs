using AutoMapper;
using AutoMapper.QueryableExtensions;
using Belaz.WeldingApp.WeldingApi.Contracts.Requests.Common;
using Belaz.WeldingApp.WeldingApi.Contracts.Responses.Chief;
using Belaz.WeldingApp.WeldingApi.Contracts.Responses.Master;
using Belaz.WeldingApp.WeldingApi.Exceptions;
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

        public async Task<ChiefDto?> CreateAsync(CreateUserWithEquipmentRequest request)
        {
            var chief = _mapper.Map<Chief>(request);
        
            var createdChief = _chiefRepository.Add(chief);
            await _chiefRepository.SaveAsync();

            return await _chiefRepository
                .AsQueryable()
                .Where(_ => _.Id == createdChief.Id)
                .ProjectTo<ChiefDto>(_mapper.ConfigurationProvider)
                .FirstOrDefaultAsync();
        }

        public async Task<ChiefDto?> UpdateAsync(UpdateUserWithEquipmentRequest request)
        {
            var chief = _mapper.Map<Chief>(request);
            var isUpdate = await _chiefRepository.UpdateAsync(chief);

            if (!isUpdate)
            {
                throw new UpdateFailedException(typeof(Inspector), request.Id);
            }
            
            return await _chiefRepository
                .AsQueryable()
                .Where(_ => _.Id == request.Id)
                .ProjectTo<ChiefDto>(_mapper.ConfigurationProvider)
                .FirstOrDefaultAsync();
        }
    }
}