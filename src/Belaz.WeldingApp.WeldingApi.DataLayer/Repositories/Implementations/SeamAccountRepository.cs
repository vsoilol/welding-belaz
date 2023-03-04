using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using AutoMapper;
using AutoMapper.QueryableExtensions;
using Belaz.WeldingApp.WeldingApi.DataLayer.Repositories.Interfaces;
using Belaz.WeldingApp.WeldingApi.Domain.Dtos;
using Microsoft.EntityFrameworkCore;

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
}
