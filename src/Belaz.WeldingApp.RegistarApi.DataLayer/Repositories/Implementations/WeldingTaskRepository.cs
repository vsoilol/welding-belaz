using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using AutoMapper;
using Belaz.WeldingApp.RegistarApi.DataLayer.Repositories.Interfaces;
using Belaz.WeldingApp.RegistarApi.Domain.Dtos;
using Microsoft.EntityFrameworkCore;

namespace Belaz.WeldingApp.RegistarApi.DataLayer.Repositories.Implementations;

public class WeldingTaskRepository : IWeldingTaskRepository
{
    private readonly ApplicationContext _context;
    private readonly IMapper _mapper;

    public WeldingTaskRepository(ApplicationContext context, IMapper mapper)
    {
        _context = context;
        _mapper = mapper;
    }

    public async Task<List<WeldingTaskDto>> GetAllTasksByDateAndEquipmentRfidTagAsync(
        DateTime date,
        string equipmentRfidTag
    )
    {
        var weldingTasks = await _context.ProductAccounts
            .OrderBy(_ => _.Number)
            .Where(_ => _.WeldingEquipments.Any(equipment => equipment.RfidTag == equipmentRfidTag))
            .SelectMany(_ => _.Product.Seams)
            .SelectMany(_ => _.WeldingTasks)
            .Include(_ => _.Seam)
            .ThenInclude(_ => _.Product)
            .ThenInclude(_ => _!.ProductMain)
            .ThenInclude(_ => _!.MainProduct)
            .ThenInclude(_ => _.ProductMain)
            .ThenInclude(_ => _!.MainProduct)
            .ThenInclude(_ => _.ProductMain)
            .ThenInclude(_ => _!.MainProduct)
            .Include(_ => _.Seam)
            .ThenInclude(_ => _.ProductionArea)
            .ThenInclude(_ => _!.Workshop)
            .Include(_ => _.Seam)
            .ThenInclude(_ => _.TechnologicalInstruction)
            .ThenInclude(_ => _!.WeldPassageInstructions)
            .Include(_ => _.Seam)
            .ThenInclude(_ => _.Product)
            .ThenInclude(_ => _!.TechnologicalProcess)
            .ToListAsync();

        // var weldingTasks = await _context.WeldingTasks
        //     .OrderBy(_ => _.Seam.Product.ProductAccounts[0].Number)
        //     .Where(
        //         _ =>
        //             _.Seam.Product.ProductAccounts[0].WeldingEquipments.Any(
        //                 equipment => equipment.RfidTag == equipmentRfidTag
        //             ) && _.WeldingDate.Date.Equals(date.Date)
        //     )
        //     .ToListAsync();

        return _mapper.Map<List<WeldingTaskDto>>(weldingTasks);
    }
}
