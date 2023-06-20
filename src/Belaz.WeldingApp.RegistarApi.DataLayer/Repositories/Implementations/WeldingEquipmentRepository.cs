using AutoMapper;
using AutoMapper.QueryableExtensions;
using Belaz.WeldingApp.RegistarApi.DataLayer.Repositories.Interfaces;
using Belaz.WeldingApp.RegistarApi.Domain.Dtos;
using Belaz.WeldingApp.Common.Entities.WeldingEquipmentInfo;
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

    public Task<WeldingEquipmentDto> GetByIdAsync(Guid id)
    {
        return _context.WeldingEquipments
            .Where(_ => _.Id == id)
            .ProjectTo<WeldingEquipmentDto>(_mapper.ConfigurationProvider)
            .FirstOrDefaultAsync()!;
    }

    public async Task AddWeldingEquipmentConditionTimeAsync(
        WeldingEquipmentConditionTime conditionTime
    )
    {
        _context.WeldingEquipmentConditionTimes.Add(conditionTime);
        await _context.SaveChangesAsync();
    }

    public async Task<WeldingEquipmentConditionTimeDto?> GetLastConditionTimeAsync(
        Guid weldingEquipmentId
    )
    {
        var conditionTime = await _context.WeldingEquipmentConditionTimes
            .Where(_ => _.WeldingEquipmentId == weldingEquipmentId)
            .OrderBy(x => x.Date)
            .ThenBy(x => x.StartConditionTime)
            .LastOrDefaultAsync();

        return _mapper.Map<WeldingEquipmentConditionTimeDto?>(conditionTime);
    }

    public async Task UpdateEquipmentConditionTimeAsync(Guid id, double time)
    {
        var updatedConditionTime = (
            await _context.WeldingEquipmentConditionTimes.FirstOrDefaultAsync(_ => _.Id == id)
        )!;

        updatedConditionTime.Time = time;

        await _context.SaveChangesAsync();
    }
}
