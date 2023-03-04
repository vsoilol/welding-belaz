using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using AutoMapper;
using AutoMapper.QueryableExtensions;
using Belaz.WeldingApp.WeldingApi.DataLayer.Repositories.Interfaces;
using Belaz.WeldingApp.WeldingApi.Domain.Dtos;
using Microsoft.EntityFrameworkCore;
using WeldingApp.Common.Enums;

namespace Belaz.WeldingApp.WeldingApi.DataLayer.Repositories.Implementations;

public class SeamAccountRepository : ISeamAccountRepository
{
    private readonly ApplicationContext _context;
    private readonly IMapper _mapper;

    public SeamAccountRepository(ApplicationContext context, IMapper mapper)
    {
        _context = context;
        _mapper = mapper;
    }

    public async Task<SeamAccountDto> ChangeDefectiveAmountAsync(Guid seamAccountId, int amount)
    {
        var seamAccount = (
            await _context.SeamAccounts
                .Include(_ => _.SeamResults)
                .FirstOrDefaultAsync(_ => _.Id == seamAccountId)
        )!;

        var seamResultDefective = seamAccount.SeamResults.FirstOrDefault(
            _ => _.Status == ResultProductStatus.Defective
        )!;

        var seamResultAccept = seamAccount.SeamResults.FirstOrDefault(
            _ => _.Status == ResultProductStatus.Accept
        )!;

        var newAcceptedAmount = seamResultAccept.Amount + seamResultDefective.Amount - amount;

        seamResultAccept.Amount = newAcceptedAmount;
        seamResultDefective.Amount = amount;

        await _context.SaveChangesAsync();

        return (
            await _context.SeamAccounts
                .ProjectTo<SeamAccountDto>(_mapper.ConfigurationProvider)
                .FirstOrDefaultAsync(_ => _.Id == seamAccountId)
        )!;
    }

    public async Task<List<SeamAccountDto>> GetAllByProductAccountIdAsync(Guid productAccountId)
    {
        var productAccount = (
            await _context.ProductAccounts.FirstOrDefaultAsync(_ => _.Id == productAccountId)
        )!;

        var seamsAccount = _context.SeamAccounts.Where(
            _ =>
                _.Seam.ProductId == productAccount.ProductId
                && _.DateFromPlan.Date.Equals(productAccount.DateFromPlan.Date)
        );

        return await seamsAccount
            .ProjectTo<SeamAccountDto>(_mapper.ConfigurationProvider)
            .ToListAsync();
    }

    public async Task<SeamAccountDto> SetSeamAccountDefectiveReasonAsync(
        Guid seamAccountId,
        string defectiveReason
    )
    {
        var productAccountDefectiveResult = (
            await _context.SeamResults.FirstOrDefaultAsync(_ => _.SeamAccountId == seamAccountId)
        )!;

        productAccountDefectiveResult.Reason = defectiveReason;
        await _context.SaveChangesAsync();

        return (
            await _context.SeamAccounts
                .ProjectTo<SeamAccountDto>(_mapper.ConfigurationProvider)
                .FirstOrDefaultAsync(_ => _.Id == seamAccountId)
        )!;
    }
}
