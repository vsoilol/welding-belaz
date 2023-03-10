using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Belaz.WeldingApp.RegistarApi.DataLayer.Repositories.Interfaces;
using Belaz.WeldingApp.RegistarApi.Domain.Entities.TaskInfo;
using Microsoft.EntityFrameworkCore;

namespace Belaz.WeldingApp.RegistarApi.DataLayer.Repositories.Implementations;

public class WeldPassageRepository : IWeldPassageRepository
{
    private readonly ApplicationContext _context;

    public WeldPassageRepository(ApplicationContext context)
    {
        _context = context;
    }

    public async Task CreateAsync(WeldPassage weldPassage)
    {
        // var existWeldPassage = await _context.WeldPassages.FirstOrDefaultAsync(
        //     _ => _.WeldingTaskId == weldPassage.WeldingTaskId && _.Number == weldPassage.Number
        // );

        // if (existWeldPassage is not null)
        // {
        //     _context.WeldPassages.Remove(existWeldPassage);
        // }

        _context.WeldPassages.Add(weldPassage);
        await _context.SaveChangesAsync();
    }
}
