using AutoMapper;
using AutoMapper.QueryableExtensions;
using Belaz.WeldingApp.RegistarApi.DataLayer.Repositories.Interfaces;
using Belaz.WeldingApp.RegistarApi.Domain.Dtos;
using Belaz.WeldingApp.RegistarApi.Domain.Entities.WeldingEquipmentInfo;
using Microsoft.EntityFrameworkCore;

namespace Belaz.WeldingApp.RegistarApi.DataLayer.Repositories.Implementations;

public class WeldingEquipmentRepository : IWeldingEquipmentRepository
{
    private readonly ApplicationContext _context;
    private readonly IMapper _mapper;

    public WeldingEquipmentRepository(ApplicationContext context, IMapper mapper)
    {
        _context = context;
        _mapper = mapper;
    }

    public Task<WeldingEquipmentDto> GetByRfidTagAsync(string rfidTag)
    {
        return _context.WeldingEquipments
            .Where(_ => _.RfidTag == rfidTag)
            .ProjectTo<WeldingEquipmentDto>(_mapper.ConfigurationProvider)
            .FirstOrDefaultAsync()!;
    }

    public async Task AddWeldingEquipmentConditionTimeAsync(WeldingEquipmentConditionTime conditionTime)
    {
        _context.WeldingEquipmentConditionTimes.Add(conditionTime);
        await _context.SaveChangesAsync();
    }
}