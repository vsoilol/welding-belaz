using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Belaz.WeldingApp.WeldingApi.Domain.Dtos;

namespace Belaz.WeldingApp.WeldingApi.DataLayer.Repositories.Interfaces;

public interface ISeamAccountRepository
{
    Task<List<SeamAccountDto>> GetAllByProductAccountIdAsync(Guid productAccountId);
}
