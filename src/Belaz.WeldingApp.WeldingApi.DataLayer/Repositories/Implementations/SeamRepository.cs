using AutoMapper;
using AutoMapper.QueryableExtensions;
using Belaz.WeldingApp.WeldingApi.DataLayer.Repositories.Interfaces;
using Belaz.WeldingApp.WeldingApi.Domain.Dtos.Seam;
using Belaz.WeldingApp.WeldingApi.Domain.Entities.ProductInfo;
using Belaz.WeldingApp.WeldingApi.Domain.Entities.TaskInfo;
using Microsoft.EntityFrameworkCore;
using WeldingApp.Common.Enums;

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

    public Task<List<SeamDto>> GetAllAsync()
    {
        return _context.Seams
            .ProjectTo<SeamDto>(_mapper.ConfigurationProvider)
            .ToListAsync();
    }

    public Task<SeamDto> GetByIdAsync(Guid id)
    {
        return _context.Seams
            .Where(_ => _.Id == id)
            .ProjectTo<SeamDto>(_mapper.ConfigurationProvider)
            .FirstOrDefaultAsync()!;
    }

    public Task<List<SeamDto>> GetAllByControlSubjectAsync(bool isControlSubject)
    {
        return _context.Seams
            .Where(_ => _.IsControlSubject == isControlSubject)
            .ProjectTo<SeamDto>(_mapper.ConfigurationProvider)
            .ToListAsync();
    }

    public async Task<SeamDto> CreateAsync(Seam entity)
    {
        var newSeam = _context.Seams.Add(entity).Entity;
        await _context.SaveChangesAsync();

        return await GetByIdAsync(newSeam.Id);
    }

    public async Task<SeamDto> UpdateAsync(Seam entity)
    {
        var updatedSeam = (await _context.Seams.FirstOrDefaultAsync(_ => _.Id == entity.Id))!;

        updatedSeam.Number = entity.Number;
        updatedSeam.Length = entity.Length;
        updatedSeam.IsControlSubject = entity.IsControlSubject;
        updatedSeam.ProductionAreaId = entity.ProductionAreaId;
        updatedSeam.IsPerformed = entity.IsPerformed;
        updatedSeam.TechnologicalInstructionId = entity.TechnologicalInstructionId;

        await _context.SaveChangesAsync();

        return await GetByIdAsync(entity.Id);
    }

    public Task<List<SeamDto>> GetAllByInspectorIdAsync(Guid inspectorId)
    {
        return _context.Seams
            .Where(_ => _.InspectorId == inspectorId)
            .ProjectTo<SeamDto>(_mapper.ConfigurationProvider)
            .ToListAsync();
    }

    public Task<List<SeamDto>> GetAllByWelderIdAsync(Guid welderId)
    {
        return _context.Seams
            .Where(_ => _.Welders.Any(welder => welder.Id == welderId))
            .ProjectTo<SeamDto>(_mapper.ConfigurationProvider)
            .ToListAsync();
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
        return _context.WeldingTasks
            .Where(_ => _.Status == SeamStatus.Defective)
            .ProjectTo<DefectiveSeamDto>(_mapper.ConfigurationProvider)
            .ToListAsync();
    }

    public Task<DefectiveSeamDto> GetDefectiveReasonByIdAsync(Guid id)
    {
        return _context.WeldingTasks
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
        var updatedStatusReason = (await _context.DefectiveReasons.FirstOrDefaultAsync(_ => _.Id == entity.Id))!;

        updatedStatusReason.DetectedDefectiveDate = entity.DetectedDefectiveDate;
        updatedStatusReason.Reason = entity.Reason;
        updatedStatusReason.DetectedDefects = entity.DetectedDefects;

        await _context.SaveChangesAsync();

        return await GetDefectiveReasonByIdAsync(entity.Id);
    }
}