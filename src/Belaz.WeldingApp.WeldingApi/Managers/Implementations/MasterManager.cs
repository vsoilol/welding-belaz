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
        
        public async Task<MasterDto?> CreateAsync(CreateUserWithEquipmentRequest request)
        {
            var master = _mapper.Map<Master>(request);
        
            var createdMaster = _masterRepository.Add(master);
            await _masterRepository.SaveAsync();

            return await _masterRepository
                .AsQueryable()
                .Where(_ => _.Id == createdMaster.Id)
                .ProjectTo<MasterDto>(_mapper.ConfigurationProvider)
                .FirstOrDefaultAsync();
        }

        public async Task UpdateAsync(UpdateUserWithEquipmentRequest request)
        {
            var master = _mapper.Map<Master>(request);
            var isUpdate = await _masterRepository.UpdateAsync(master);

            if (!isUpdate)
            {
                throw new UpdateFailedException(typeof(Inspector), request.Id);
            }
        }
    }
}
