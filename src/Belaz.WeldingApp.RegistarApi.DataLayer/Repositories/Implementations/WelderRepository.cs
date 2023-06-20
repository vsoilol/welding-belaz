using AutoMapper;
using AutoMapper.QueryableExtensions;
using Belaz.WeldingApp.RegistarApi.DataLayer.Repositories.Interfaces;
using Belaz.WeldingApp.RegistarApi.Domain.Dtos;
using Microsoft.EntityFrameworkCore;

namespace Belaz.WeldingApp.RegistarApi.DataLayer.Repositories.Implementations;

public class WelderRepository : IWelderRepository
{
    private readonly ApplicationContext _context;
    private readonly IMapper _mapper;

    public WelderRepository(ApplicationContext context, IMapper mapper)
    {
        _context = context;
        _mapper = mapper;
    }

    public Task<WelderDto> GetByRfidTagAsync(string rfidTag)
    {
        return _context.Welders
            .Where(_ => _.UserInfo.RfidTag == rfidTag)
            .ProjectTo<WelderDto>(_mapper.ConfigurationProvider)
            .FirstOrDefaultAsync()!;
    }

    public Task<WelderDto> GetByIdAsync(Guid id)
    {
        return _context.Welders
            .Where(_ => _.Id == id)
            .ProjectTo<WelderDto>(_mapper.ConfigurationProvider)
            .FirstOrDefaultAsync()!;
    }
}