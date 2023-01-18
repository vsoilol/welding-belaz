using AutoMapper;
using AutoMapper.QueryableExtensions;
using Belaz.WeldingApp.WeldingApi.Contracts.Responses;
using Belaz.WeldingApp.WeldingApi.Managers.Interfaces;
using Belaz.WeldingApp.WeldingApi.Repositories;
using Belaz.WeldingApp.WeldingApi.Repositories.Entities.WeldingEquipmentInfo;
using Microsoft.EntityFrameworkCore;

namespace Belaz.WeldingApp.WeldingApi.Managers.Implementations;

public class DowntimeReasonManager : IDowntimeReasonManager
{
    private readonly IMapper _mapper;
    private readonly EntityFrameworkRepository<DowntimeReason> _downtimeReasonRepository;

    public DowntimeReasonManager(IMapper mapper, EntityFrameworkRepository<DowntimeReason> downtimeReasonRepository)
    {
        _mapper = mapper;
        _downtimeReasonRepository = downtimeReasonRepository;
    }

    public Task<List<DowntimeReasonDto>> GetAllAsync()
    {
        return _downtimeReasonRepository
            .AsQueryable()
            .ProjectTo<DowntimeReasonDto>(_mapper.ConfigurationProvider)
            .ToListAsync();
    }
}