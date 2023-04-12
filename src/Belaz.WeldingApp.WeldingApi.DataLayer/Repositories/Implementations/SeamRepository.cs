using System.Linq.Expressions;
using AutoMapper;
using AutoMapper.QueryableExtensions;
using Belaz.WeldingApp.WeldingApi.DataLayer.Repositories.Interfaces;
using Belaz.WeldingApp.WeldingApi.Domain.Dtos.Seam;
using Belaz.WeldingApp.WeldingApi.Domain.Entities.ProductInfo;
using Belaz.WeldingApp.WeldingApi.Domain.Entities.TaskInfo;
using Microsoft.EntityFrameworkCore;

namespace Belaz.WeldingApp.WeldingApi.DataLayer.Repositories.Implementations;

public class SeamRepository : ISeamRepository
{
    private readonly ApplicationContext _context;
    private readonly IMapper _mapper;

    public SeamRepository(ApplicationContext context, IMapper mapper)
    {
        _context = context;
        _mapper = mapper;
    }

    public async Task<List<SeamDto>> GetAllAsync()
    {
        var seams = await GetSeamsWithIncludesByFilter().ToListAsync();

        var seamDtos = _mapper.Map<List<SeamDto>>(seams);

        return seamDtos;
    }

    public async Task<SeamDto> GetByIdAsync(Guid id)
    {
        var seam = await GetSeamsWithIncludesByFilter(_ => _.Id == id).FirstOrDefaultAsync();

        var seamDto = _mapper.Map<SeamDto>(seam);

        return seamDto;
    }

    public async Task<List<SeamDto>> GetAllByControlSubjectAsync(bool isControlSubject)
    {
        var seams = await GetSeamsWithIncludesByFilter(_ => _.IsControlSubject == isControlSubject)
            .ToListAsync();

        var seamDtos = _mapper.Map<List<SeamDto>>(seams);

        return seamDtos;
    }

    public async Task<SeamDto> CreateAsync(Seam entity)
    {
        var newSeam = _context.Seams.Add(entity).Entity;
        await _context.SaveChangesAsync();

        return await GetByIdAsync(newSeam.Id);
    }

    public async Task<SeamDto> UpdateAsync(Seam entity)
    {
        var updatedSeam = (await _context.Seams.FindAsync(entity.Id))!;

        updatedSeam.Number = entity.Number;
        updatedSeam.Length = entity.Length;
        updatedSeam.IsControlSubject = entity.IsControlSubject;
        updatedSeam.ProductionAreaId = entity.ProductionAreaId;
        updatedSeam.IsPerformed = entity.IsPerformed;
        updatedSeam.TechnologicalInstructionId = entity.TechnologicalInstructionId;
        updatedSeam.ProductId = entity.ProductId;

        await _context.SaveChangesAsync();

        return await GetByIdAsync(entity.Id);
    }

    public async Task<List<SeamDto>> GetAllByInspectorIdAsync(Guid inspectorId)
    {
        var seams = await GetSeamsWithIncludesByFilter(_ => _.InspectorId == inspectorId)
            .ToListAsync();

        var mapSeams = _mapper.Map<List<SeamDto>>(seams);

        return mapSeams;
    }

    public async Task AssignSeamToInspectorAsync(Guid seamId, Guid inspectorId)
    {
        var seam = (await _context.Seams.FirstOrDefaultAsync(_ => _.Id == seamId))!;

        seam.InspectorId = inspectorId;

        await _context.SaveChangesAsync();
    }

    public async Task AssignSeamsToInspectorAsync(List<Guid> seamIds, Guid inspectorId)
    {
        var inspector = (await _context.Inspectors.FirstOrDefaultAsync(_ => _.Id == inspectorId))!;
        var seams = await _context.Seams
            .Where(_ => seamIds.Any(seamId => seamId == _.Id) || _.InspectorId == inspector.Id)
            .ToListAsync();

        inspector.Seams = seams;

        await _context.SaveChangesAsync();
    }

    public Task<List<DefectiveSeamDto>> GetAllDefectiveSeamsAsync()
    {
        return _context.DefectiveReasons
            .ProjectTo<DefectiveSeamDto>(_mapper.ConfigurationProvider)
            .ToListAsync();
    }

    public Task<DefectiveSeamDto> GetDefectiveReasonByIdAsync(Guid id)
    {
        return _context.DefectiveReasons
            .Where(_ => _.Id == id)
            .ProjectTo<DefectiveSeamDto>(_mapper.ConfigurationProvider)
            .FirstOrDefaultAsync()!;
    }

    public async Task<DefectiveSeamDto> AddDefectiveReasonToSeamAsync(DefectiveReason entity)
    {
        var newStatusReason = _context.DefectiveReasons.Add(entity).Entity;
        await _context.SaveChangesAsync();

        return await GetDefectiveReasonByIdAsync(newStatusReason.Id);
    }

    public async Task<DefectiveSeamDto> UpdateDefectiveReasonSeamAsync(DefectiveReason entity)
    {
        var updatedStatusReason = (
            await _context.DefectiveReasons.FirstOrDefaultAsync(_ => _.Id == entity.Id)
        )!;

        updatedStatusReason.DetectedDefectiveDate = entity.DetectedDefectiveDate;
        updatedStatusReason.Reason = entity.Reason;
        updatedStatusReason.DetectedDefects = entity.DetectedDefects;

        await _context.SaveChangesAsync();

        return await GetDefectiveReasonByIdAsync(entity.Id);
    }

    public async Task DeleteAsync(Guid id)
    {
        var deletedSeam = (await _context.Seams.FirstOrDefaultAsync(_ => _.Id == id))!;

        _context.Seams.Remove(deletedSeam);
        await _context.SaveChangesAsync();
    }

    private IQueryable<Seam> GetSeamsWithIncludesByFilter(
        Expression<Func<Seam, bool>>? filter = null
    )
    {
        IQueryable<Seam> seams = _context.Seams
            .Include(
                s =>
                    s.Product
                        .ProductMain!
                        .MainProduct
                        .ProductMain!
                        .MainProduct
                        .ProductMain!
                        .MainProduct
            )
            .Include(s => s.ProductionArea!.Workshop)
            .Include(s => s.TechnologicalInstruction)
            .Include(s => s.Product.TechnologicalProcess);

        if (filter != null)
        {
            seams = seams.Where(filter);
        }

        return seams;
    }
}
