using AutoMapper;
using AutoMapper.QueryableExtensions;
using Belaz.WeldingApp.WeldingApi.Contracts.Requests.Welder;
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

    public async Task<WelderDto?> CreateAsync(CreateWelderRequest request)
    {
        var welder = _mapper.Map<Welder>(request);
        
        var createdWelder = _welderRepository.Add(welder);
        await _welderRepository.SaveAsync();

        return await _welderRepository
            .AsQueryable()
            .Where(_ => _.Id == createdWelder.Id)
            .ProjectTo<WelderDto>(_mapper.ConfigurationProvider)
            .FirstOrDefaultAsync();
    }

    public Task UpdateAsync(UpdateWelderRequest request)
    {
        /*if (!result)
        {
            var problemDetails = new BadRequestResult
            {
                Title = "Update Error",
                StatusCode = (int) (HttpStatusCode.BadRequest),
                Errors = $"Error when update Welding Equipment with id {request.Id}",
            };

            return BadRequest(problemDetails);
        }*/
        
        throw new NotImplementedException();
    }
}
