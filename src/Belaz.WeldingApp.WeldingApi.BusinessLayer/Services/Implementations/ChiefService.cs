using AutoMapper;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Services.Interfaces;
using Belaz.WeldingApp.WeldingApi.DataLayer.Repositories.Interfaces;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.Chief;
using Belaz.WeldingApp.WeldingApi.Domain.Dtos;
using Belaz.WeldingApp.WeldingApi.Domain.Entities.Users;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Services.Implementations;

public class ChiefService : IChiefService
{
    private readonly IChiefRepository _chiefRepository;
    private readonly IMapper _mapper;

    public ChiefService(IChiefRepository chiefRepository, IMapper mapper)
    {
        _chiefRepository = chiefRepository;
        _mapper = mapper;
    }

    public async Task<ChiefDto> CreateAsync(CreateChiefRequest request)
    {
        var chief = _mapper.Map<Chief>(request);

        return await _chiefRepository.CreateAsync(chief);
    }
}