using AutoMapper;
using AutoMapper.QueryableExtensions;
using Belaz.WeldingApp.WeldingApi.Contracts.Requests.Welder;
using Belaz.WeldingApp.WeldingApi.Contracts.Responses.Welder;
using Belaz.WeldingApp.WeldingApi.Exceptions;
using Belaz.WeldingApp.WeldingApi.Managers.Interfaces;
using Belaz.WeldingApp.WeldingApi.Repositories;
using Belaz.WeldingApp.WeldingApi.Repositories.Entities.Users;
using Belaz.WeldingApp.WeldingApi.Repositories.Entities.WeldingEquipmentInfo;
using Microsoft.EntityFrameworkCore;

namespace Belaz.WeldingApp.WeldingApi.Managers.Implementations;

public class WelderManager : IWelderManager
{
    private readonly IMapper _mapper;
    private readonly EntityFrameworkRepository<Welder> _welderRepository;
    private readonly EntityFrameworkRepository<WeldingEquipment> _weldingEquipmentRepository;

    public WelderManager(IMapper mapper, EntityFrameworkRepository<Welder> welderRepository,
        EntityFrameworkRepository<WeldingEquipment> weldingEquipmentRepository)
    {
        _mapper = mapper;
        _welderRepository = welderRepository;
        _weldingEquipmentRepository = weldingEquipmentRepository;
    }

    public Task<List<WelderDto>> GetAllAsync()
    {
        var welders = _welderRepository
            .AsQueryable()
            .ProjectTo<WelderDto>(_mapper.ConfigurationProvider)
            .ToListAsync();

        return welders;
    }

    public async Task<WelderDto?> CreateAsync(CreateWelderRequest request)
    {
        var welder = _mapper.Map<Welder>(request);
        
        var weldingEquipments = await _weldingEquipmentRepository
            .AsQueryableByFilter(_ => welder.WeldingEquipments
                .Select(equipment => equipment.Id)
                .Any(equipmentId => equipmentId == _.Id))
            .ToListAsync();

        welder.WeldingEquipments = weldingEquipments;
        
        if (weldingEquipments.Any(_ => _.WelderId is not null))
        {
            throw new CreateFailedException(typeof(Welder));
        }

        var createdWelder = _welderRepository.Add(welder);
        await _welderRepository.SaveAsync();

        return await _welderRepository
            .AsQueryable()
            .Where(_ => _.Id == createdWelder.Id)
            .ProjectTo<WelderDto>(_mapper.ConfigurationProvider)
            .FirstOrDefaultAsync();
    }

    public async Task UpdateAsync(UpdateWelderRequest request)
    {
        var welder = _mapper.Map<Welder>(request);
        var isUpdate = await _welderRepository.UpdateAsync(welder);

        if (!isUpdate)
        {
            throw new UpdateFailedException(typeof(Welder), request.Id);
        }
    }
}