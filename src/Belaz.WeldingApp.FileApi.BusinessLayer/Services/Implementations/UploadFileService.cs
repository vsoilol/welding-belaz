using System.Data;
using System.Text;
using Belaz.WeldingApp.Common.Entities.IdentityUser;
using Belaz.WeldingApp.Common.Entities.Users;
using Belaz.WeldingApp.Common.Enums;
using Belaz.WeldingApp.FileApi.BusinessLayer.Models;
using Belaz.WeldingApp.FileApi.BusinessLayer.Services.Interfaces;
using Belaz.WeldingApp.FileApi.DataLayer.Repositories.Interfaces;
using Belaz.WeldingApp.FileApi.Domain.Constants;
using Belaz.WeldingApp.FileApi.Domain.Dtos.ProductInfo;
using Belaz.WeldingApp.FileApi.Domain.Dtos.SeamPassportInfo;
using Belaz.WeldingApp.FileApi.Domain.Exceptions;
using DbfDataReader;
using LanguageExt;
using LanguageExt.Common;
using Microsoft.AspNetCore.Http;
using OfficeOpenXml;

namespace Belaz.WeldingApp.FileApi.BusinessLayer.Services.Implementations;

public class UploadFileService : IUploadFileService
{
    private const int IndexColumn = 1;
    private const int DetailColumn = 2;
    private const int SuffixColumn = 3;
    private const int AmountFromPlanColumn = 5;
    private const int DateColumn = 6;

    private const int RowDataStart = 2;

    private readonly IProductRepository _productRepository;
    private readonly IProductAccountRepository _productAccountRepository;
    private readonly IProductionAreaRepository _productionAreaRepository;
    private readonly IMasterRepository _masterRepository;
    private readonly IWelderRepository _welderRepository;
    private readonly IInspectorRepository _inspectorRepository;
    private readonly IWorkplaceRepository _workplaceRepository;

    public UploadFileService(IProductRepository productRepository,
        IProductAccountRepository productAccountRepository,
        IProductionAreaRepository productionAreaRepository, 
        IInspectorRepository inspectorRepository,
        IWelderRepository welderRepository, 
        IMasterRepository masterRepository, 
        IWorkplaceRepository workplaceRepository)
    {
        _productRepository = productRepository;
        _productAccountRepository = productAccountRepository;
        _productionAreaRepository = productionAreaRepository;
        _inspectorRepository = inspectorRepository;
        _welderRepository = welderRepository;
        _masterRepository = masterRepository;
        _workplaceRepository = workplaceRepository;
    }

    public async Task<Result<Unit>> UploadProductAccountDataAsync(IFormFile formFile)
    {
        var fileExtension = Path.GetExtension(formFile.FileName);
        var isFileExtensionCorrect = fileExtension.Equals(FileExtensions.Xlsx, StringComparison.OrdinalIgnoreCase);

        if (formFile.Length <= 0 || !isFileExtensionCorrect)
        {
            var exception = new IncorrectFileExtensionException(fileExtension,
                FileExtensions.Xlsx);
            return new Result<Unit>(exception);
        }

        try
        {
            using (var stream = new MemoryStream())
            {
                await formFile.CopyToAsync(stream);
                using (var package = new ExcelPackage(stream))
                {
                    var worksheet = package.Workbook.Worksheets.FirstOrDefault()!;

                    var products = await _productRepository.GetAllProductsAsync();

                    var productAccounts =
                        GetProductAccountExcelModelFromExcelWorksheet(worksheet, products)
                            .ToList();

                    await UpdateProductAccountsAsync(productAccounts);
                }
            }
        }
        catch (Exception e)
        {
            var exception = new UploadFileException();
            return new Result<Unit>(exception);
        }

        return Unit.Default;
    }

    public async Task<Result<Unit>> UploadUsersDataAsync(IFormFile formFile)
    {
        var fileExtension = Path.GetExtension(formFile.FileName);
        var isFileExtensionCorrect = fileExtension.Equals(FileExtensions.Dbf, StringComparison.OrdinalIgnoreCase);

        if (formFile.Length <= 0 || !isFileExtensionCorrect)
        {
            var exception = new IncorrectFileExtensionException(fileExtension, FileExtensions.Dbf);
            return new Result<Unit>(exception);
        }

        try
        {
            var usersExcelModel = await GetUserDataFromFileAsync(formFile);

            var usersModel = MapUserExcelModelsToUserModels(usersExcelModel);

            foreach (var user in usersModel)
            {
                var productionArea = await _productionAreaRepository
                    .GetBriefInfoByNumberAndWorkshopNumberAsync(user.ProductionArea, user.Workshop);

                if (productionArea is null)
                {
                    continue;
                }
                
                switch (user.Role)
                {
                    case Role.Master:
                        await AddOrUpdateMasterAsync(user, productionArea.Id);
                        break;
                    case Role.Welder:
                        await AddOrUpdateWelderAsync(user, productionArea.Id);
                        break;
                    case Role.Inspector:
                        await AddOrUpdateInspectorAsync(user, productionArea.Id);
                        break;
                }
            }
        }
        catch (Exception e)
        {
            var exception = new UploadFileException();
            return new Result<Unit>(exception);
        }

        return Unit.Default;
    }

    private async Task AddOrUpdateInspectorAsync(UserModel user, Guid productionAreaId)
    {
        var existedInspector = await _inspectorRepository.GetByServiceNumberOrDefaultAsync(user.PersonNumber);
        var inspector = new Inspector
        {
            UserInfo = new UserData
            {
                FirstName = user.SecondName,
                MiddleName = user.FirstName,
                LastName = user.LastName,
                Position = user.Position,
                ServiceNumber = user.PersonNumber,
                ProductionAreaId = productionAreaId,
                Role = user.Role
            }
        };

        if (existedInspector is null)
        {
            await _inspectorRepository.AddAsync(inspector);
            return;
        }

        inspector.Id = existedInspector.Id;
        await _inspectorRepository.UpdateAsync(inspector);
    }

    private async Task AddOrUpdateWelderAsync(UserModel user, Guid productionAreaId)
    {
        var existedWelder = await _welderRepository.GetByServiceNumberOrDefaultAsync(user.PersonNumber);
        var welder = new Welder
        {
            UserInfo = new UserData
            {
                FirstName = user.SecondName,
                MiddleName = user.FirstName,
                LastName = user.LastName,
                Position = user.Position,
                ServiceNumber = user.PersonNumber,
                ProductionAreaId = productionAreaId,
                Role = user.Role
            }
        };

        if (existedWelder is null)
        {
            await _welderRepository.AddAsync(welder);
            return;
        }

        welder.Id = existedWelder.Id;
        await _welderRepository.UpdateAsync(welder);
    }

    private async Task AddOrUpdateMasterAsync(UserModel user, Guid productionAreaId)
    {
        var existedMaster = await _masterRepository.GetByServiceNumberOrDefaultAsync(user.PersonNumber);
        var master = new Master
        {
            UserInfo = new UserData
            {
                FirstName = user.SecondName,
                MiddleName = user.FirstName,
                LastName = user.LastName,
                Position = user.Position,
                ServiceNumber = user.PersonNumber,
                ProductionAreaId = productionAreaId,
                Role = user.Role
            }
        };

        if (existedMaster is null)
        {
            await _masterRepository.AddAsync(master);
            return;
        }

        master.Id = existedMaster.Id;
        await _masterRepository.UpdateAsync(master);
    }

    private string MakeNormalFromUppercaseString(string input)
    {
        string result = input.ToLower();
        result = char.ToUpper(result[0]) + result.Substring(1);
        return result;
    }

    private async Task<List<UserExcelModel>> GetUserDataFromFileAsync(IFormFile formFile)
    {
        var tempFilePath = Path.GetTempFileName();
        using (var stream = new FileStream(tempFilePath, FileMode.Create))
        {
            await formFile.CopyToAsync(stream);
        }

        var result = new List<UserExcelModel>();

        var encoding = CodePagesEncodingProvider.Instance.GetEncoding(866);

        var options = new DbfDataReaderOptions
        {
            SkipDeletedRecords = true,
            Encoding = encoding
        };

        using (var dbfDataReader = new DbfDataReader.DbfDataReader(tempFilePath, options))
        {
            while (await dbfDataReader.ReadAsync())
            {
                var model = MapDbfDataReaderToUserExcelModel(dbfDataReader);

                result.Add(model);
            }
        }

        File.Delete(tempFilePath);

        return result;
    }

    private List<UserModel> MapUserExcelModelsToUserModels(List<UserExcelModel> userExcelModels)
    {
        var result = userExcelModels
            .GroupBy(_ => _.PersonNumber)
            .Select(_ => new UserModel
            {
                PersonNumber = _.First().PersonNumber,
                FirstName = _.First().FirstName,
                SecondName = _.First().SecondName,
                LastName = _.First().LastName,
                Position = _.First().Position,
                Workshop = _.First().Workshop,
                ProductionArea = _.First().ProductionArea,
                Workplace = _.First().Workplace,
                Role = PositionRoles.GetRoleByPosition(_.First().Position),
                WeldingEquipments = _.Where(_ => _.Equipment is not null)
                    .Select(equipment => new WeldingEquipmentBriefModel
                    {
                        Equipment = equipment.Equipment,
                        EquipmentTitle = equipment.EquipmentTitle
                    }).ToList()
            }).ToList();

        return result;
    }

    private UserExcelModel MapDbfDataReaderToUserExcelModel(IDataRecord dbfDataReader)
    {
        var position = dbfDataReader.GetString(4);

        var result = new UserExcelModel
        {
            PersonNumber = dbfDataReader.GetString(0),
            FirstName = MakeNormalFromUppercaseString(dbfDataReader.GetString(1)),
            SecondName = MakeNormalFromUppercaseString(dbfDataReader.GetString(2)),
            LastName = MakeNormalFromUppercaseString(dbfDataReader.GetString(3)),
            Position = PositionRoles.PositionsMappingToDisplayName[position],
            Workshop = GetIntFromDbfString(dbfDataReader.GetString(5)),
            ProductionArea = GetIntFromDbfString(dbfDataReader.GetString(6)),
            Workplace = GetIntFromDbfString(dbfDataReader.GetString(7)),
            Equipment = ReturnNullIfStringEmpty(dbfDataReader.GetString(8)),
            EquipmentTitle = ReturnNullIfStringEmpty(dbfDataReader.GetString(9)),
        };

        return result;
    }

    private string? ReturnNullIfStringEmpty(string text)
    {
        return string.IsNullOrEmpty(text) ? null : text;
    }

    private int GetIntFromDbfString(string text)
    {
        var trimmed = text.TrimStart('0');
        return int.Parse(trimmed);
    }

    private async Task UpdateProductAccountsAsync(IReadOnlyCollection<ProductAccountExcelModel> newProductAccounts)
    {
        foreach (var newProductAccount in newProductAccounts)
        {
            var productAccount = await _productAccountRepository
                .GetByProductIdAndDateAsync(newProductAccount.ProductId, newProductAccount.Date);

            if (productAccount is not null)
            {
                await _productAccountRepository.UpdateAmountFromPlanAsync(productAccount.Id,
                    newProductAccount.AmountFromPlan);
                return;
            }

            await _productAccountRepository.AddOnlyByProductAndAmountFromPlanAsync(newProductAccount.ProductId,
                newProductAccount.Date, newProductAccount.AmountFromPlan);
        }
    }

    private IEnumerable<ProductAccountExcelModel> GetProductAccountExcelModelFromExcelWorksheet(
        ExcelWorksheet worksheet,
        IReadOnlyCollection<ProductBriefDto> products)
    {
        var rowCount = worksheet.Dimension.End.Row; //get row count

        var data = new List<ProductAccountExcelModel>();

        for (var row = RowDataStart; row <= rowCount; row++)
        {
            var dateString = worksheet.Cells[row, DateColumn].Value.ToString()!.Trim();
            var date = DateTime.Parse(dateString);

            var index = worksheet.Cells[row, IndexColumn].Value?.ToString()?.Trim();
            var detailNumber = worksheet.Cells[row, DetailColumn].Value.ToString()!.Trim();
            var suffix = worksheet.Cells[row, SuffixColumn].Value?.ToString()?.Trim();

            var productFullNumber =
                $"{(index is null ? "" : $"{index}-")}{detailNumber}{(suffix is null ? "" : $"-{suffix}")}";

            var product = products.FirstOrDefault(_ => _.Number == productFullNumber);

            if (product is not null)
            {
                var excelModel = new ProductAccountExcelModel
                {
                    ProductId = product.Id,
                    AmountFromPlan = int.Parse(worksheet.Cells[row, AmountFromPlanColumn].Value
                        .ToString()!.Trim()),
                    Date = date
                };

                data.Add(excelModel);
            }
        }

        return data;
    }
}