using AutoMapper;
using AutoMapper.QueryableExtensions;
using Belaz.WeldingApp.WeldingApi.DataLayer.Repositories.Interfaces;
using Belaz.WeldingApp.WeldingApi.Domain.Dtos.WeldingEquipment;
using Microsoft.EntityFrameworkCore;

namespace Belaz.WeldingApp.WeldingApi.DataLayer.Repositories.Implementations;

public class WeldingEquipmentRepository : IWeldingEquipmentRepository
{
    private readonly ApplicationContext _context;
    private readonly IMapper _mapper;

    public WeldingEquipmentRepository(ApplicationContext context, IMapper mapper)
    {
        _context = context;
        _mapper = mapper;
    }

    public Task<List<WeldingEquipmentDto>> GetAllAsync()
    {
        return _context.WeldingEquipments
            .ProjectTo<WeldingEquipmentDto>(_mapper.ConfigurationProvider)
            .ToListAsync();
    }
}