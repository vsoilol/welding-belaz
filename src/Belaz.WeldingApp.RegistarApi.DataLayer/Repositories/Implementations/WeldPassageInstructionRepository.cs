using AutoMapper;
using AutoMapper.QueryableExtensions;
using Belaz.WeldingApp.RegistarApi.DataLayer.Repositories.Interfaces;
using Belaz.WeldingApp.RegistarApi.Domain.Dtos;
using Microsoft.EntityFrameworkCore;

namespace Belaz.WeldingApp.RegistarApi.DataLayer.Repositories.Implementations;

public class WeldPassageInstructionRepository : IWeldPassageInstructionRepository
{
    private readonly ApplicationContext _context;
    private readonly IMapper _mapper;

    public WeldPassageInstructionRepository(ApplicationContext context, IMapper mapper)
    {
        _context = context;
        _mapper = mapper;
    }

    public async Task<WeldPassageInstructionDto> GetByTaskIdAndNumber(Guid taskId, int number)
    {
        var weldPassages = _context.WeldingTasks
            .Where(_ => _.Id == taskId)
            .SelectMany(_ => _.SeamAccount.Seam.TechnologicalInstruction!.WeldPassageInstructions);

        return (
            await weldPassages
                .ProjectTo<WeldPassageInstructionDto>(_mapper.ConfigurationProvider)
                .FirstOrDefaultAsync(_ => _.Number == number)
        )!;
    }
}
