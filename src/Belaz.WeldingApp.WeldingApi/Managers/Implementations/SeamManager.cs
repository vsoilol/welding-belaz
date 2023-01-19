using AutoMapper;
using AutoMapper.QueryableExtensions;
using Belaz.WeldingApp.WeldingApi.Contracts.Requests.Seam;
using Belaz.WeldingApp.WeldingApi.Contracts.Responses;
using Belaz.WeldingApp.WeldingApi.Contracts.Responses.WeldingEquipment;
using Belaz.WeldingApp.WeldingApi.Exceptions;
using Belaz.WeldingApp.WeldingApi.Managers.Interfaces;
using Belaz.WeldingApp.WeldingApi.Repositories;
using Belaz.WeldingApp.WeldingApi.Repositories.Entities.ProductInfo;
using Microsoft.EntityFrameworkCore;
using WeldingApp.Common.Enums;

namespace Belaz.WeldingApp.WeldingApi.Managers.Implementations;

public class SeamManager : ISeamManager
{
    private readonly IMapper _mapper;
    private readonly EntityFrameworkRepository<Seam> _seamRepository;
    private readonly EntityFrameworkRepository<StatusReason> _statusReasonRepository;

    public SeamManager(EntityFrameworkRepository<Seam> seamRepository, IMapper mapper,
        EntityFrameworkRepository<StatusReason> statusReasonRepository)
    {
        _seamRepository = seamRepository;
        _mapper = mapper;
        _statusReasonRepository = statusReasonRepository;
    }

    public async Task<List<SeamDto>> GetAllByWeldingTaskStatus(Status status)
    {
        return await _seamRepository
            .AsQueryable()
            .Where(_ => _.Status == status)
            .ProjectTo<SeamDto>(_mapper.ConfigurationProvider)
            .ToListAsync();
    }

    public async Task<SeamDto?> GetByIdAsync(Guid id)
    {
        return await _seamRepository
            .AsQueryable()
            .Where(_ => _.Id == id)
            .ProjectTo<SeamDto>(_mapper.ConfigurationProvider)
            .FirstOrDefaultAsync();
    }

    public async Task<List<SeamDto>> GetAllByControlSubject(bool isControlSubject)
    {
        return await _seamRepository
            .AsQueryable()
            .Where(_ => _.IsControlSubject == isControlSubject)
            .ProjectTo<SeamDto>(_mapper.ConfigurationProvider)
            .ToListAsync();
    }

    public async Task<SeamDto?> CreateAsync(CreateSeamRequest request)
    {
        var seam = _mapper.Map<Seam>(request);

        var createdSeam = _seamRepository.Add(seam);
        await _seamRepository.SaveAsync();

        return await _seamRepository
            .AsQueryable()
            .Where(_ => _.Id == createdSeam.Id)
            .ProjectTo<SeamDto>(_mapper.ConfigurationProvider)
            .FirstOrDefaultAsync();
    }

    public async Task<SeamDto?> UpdateAsync(UpdateSeamRequest request)
    {
        var updatedSeam = await _seamRepository.GetByIdAsync(request.Id);

        updatedSeam.Number = request.Number ?? updatedSeam.Number;
        updatedSeam.IsControlSubject = request.IsControlSubject ?? updatedSeam.IsControlSubject;
        updatedSeam.ProductionAreaId = request.ProductionAreaId ?? updatedSeam.ProductionAreaId;
        updatedSeam.WorkplaceId = request.WorkplaceId ?? updatedSeam.WorkplaceId;

        await _seamRepository.SaveAsync();

        return await _seamRepository
            .GetByIdAsQueryable(request.Id)
            .ProjectTo<SeamDto>(_mapper.ConfigurationProvider)
            .FirstOrDefaultAsync();
    }

    public Task<List<SeamDto>> GetAllByInspectorIdAsync(Guid inspectorId)
    {
        return _seamRepository
            .AsQueryable()
            .Where(_ => _.InspectorId == inspectorId)
            .ProjectTo<SeamDto>(_mapper.ConfigurationProvider)
            .ToListAsync();
    }

    public Task<List<SeamDto>> GetAllByWelderIdAsync(Guid welderId)
    {
        return _seamRepository
            .AsQueryable()
            .Where(_ => _.WelderId == welderId)
            .ProjectTo<SeamDto>(_mapper.ConfigurationProvider)
            .ToListAsync();
    }

    public async Task AssignSeamToWelderAsync(AssignSeamToWelderRequest request)
    {
        var seam = await _seamRepository.GetByIdAsync(request.SeamId);

        seam.WelderId = request.WelderId;

        await _seamRepository.SaveAsync();
    }

    public async Task AssignSeamToInspectorAsync(AssignSeamToInspectorRequest request)
    {
        var seam = await _seamRepository.GetByIdAsync(request.SeamId);

        seam.InspectorId = request.InspectorId;

        await _seamRepository.SaveAsync();
    }

    public Task<List<DefectiveSeamDto>> GetAllDefectiveSeamsAsync()
    {
        return _statusReasonRepository
            .AsQueryable()
            .Where(_ => _.Status == Status.Defective && _.Seam != null)
            .ProjectTo<DefectiveSeamDto>(_mapper.ConfigurationProvider)
            .ToListAsync();
    }

    public async Task<DefectiveSeamDto?> AddDefectiveReasonToSeamAsync(AddDefectiveReasonToSeamRequest request)
    {
        var statusReason = _mapper.Map<StatusReason>(request);

        var createdStatusReason = _statusReasonRepository.Add(statusReason);
        await _statusReasonRepository.SaveAsync();

        return await _statusReasonRepository
            .AsQueryable()
            .Where(_ => _.Id == createdStatusReason.Id)
            .ProjectTo<DefectiveSeamDto>(_mapper.ConfigurationProvider)
            .FirstOrDefaultAsync();
    }

    public async Task<DefectiveSeamDto?> UpdateDefectiveReasonSeamAsync(UpdateDefectiveReasonToSeamRequest request)
    {
        var statusReason = _mapper.Map<StatusReason>(request);
        var isUpdate = await _statusReasonRepository.UpdateAsync(statusReason);

        if (!isUpdate)
        {
            throw new UpdateFailedException(typeof(StatusReason), request.Id);
        }

        return await _statusReasonRepository
            .GetByIdAsQueryable(request.Id)
            .ProjectTo<DefectiveSeamDto>(_mapper.ConfigurationProvider)
            .FirstOrDefaultAsync();
    }
}