using System.Data;
using System.Text;
using Belaz.WeldingApp.FileApi.BusinessLayer.Models;
using Belaz.WeldingApp.FileApi.BusinessLayer.Requests;
using Belaz.WeldingApp.FileApi.BusinessLayer.Services.Interfaces;
using Belaz.WeldingApp.FileApi.BusinessLayer.Validations.Services;
using Belaz.WeldingApp.FileApi.DataLayer.Repositories.Interfaces;
using Belaz.WeldingApp.FileApi.Domain.Constants;
using Belaz.WeldingApp.FileApi.Domain.Dtos;
using Belaz.WeldingApp.FileApi.Domain.Dtos.ProductInfo;
using Belaz.WeldingApp.FileApi.Domain.Exceptions;
using Belaz.WeldingApp.FileApi.Domain.Extensions;
using DbfDataReader;
using LanguageExt;
using LanguageExt.Common;
using Microsoft.AspNetCore.Http;

namespace Belaz.WeldingApp.FileApi.BusinessLayer.Services.Implementations;

public class UploadProductAccountFileService : IUploadProductAccountFileService
{
    private readonly IProductRepository _productRepository;
    private readonly IProductAccountRepository _productAccountRepository;
    private readonly IValidationService _validationService;

    public UploadProductAccountFileService(IProductRepository productRepository,
        IProductAccountRepository productAccountRepository, IValidationService validationService)
    {
        _productRepository = productRepository;
        _productAccountRepository = productAccountRepository;
        _validationService = validationService;
    }

    public async Task<Result<Unit>> UploadProductAccountDataDbfAsync(UploadProductAccountDataRequest request)
    {
        var validationResult = await _validationService.ValidateAsync(request);

        if (!validationResult.IsValid)
        {
            return new Result<Unit>(validationResult.Exception);
        }

        var formFile = request.File;
        var fileExtension = Path.GetExtension(formFile.FileName);
        var isFileCorrect = CheckThatDbfFileCorrect(formFile, fileExtension);

        if (!isFileCorrect)
        {
            var exception = new IncorrectFileExtensionException(fileExtension, FileExtensions.Dbf);
            return new Result<Unit>(exception);
        }

        var date = request.Date.ToDateTime();

        var productAccountDbfModels = await GetProductAccountInfoFromFileAsync(formFile, date);
        var existedProducts = await _productRepository.GetAllProductsAsync();
        var needToUpdateProductAccounts =
            GetUpdatedProductAccounts(productAccountDbfModels, existedProducts);

        await UpdateProductAccountsAsync(needToUpdateProductAccounts);

        var productionAreaIds = needToUpdateProductAccounts
            .Select(_ => _.ProductionAreaId)
            .Distinct();

        foreach (var productionAreaId in productionAreaIds)
        {
            await _productAccountRepository.GenerateEmptyIfNotExistAsync(date, productionAreaId);
        }

        return Unit.Default;
    }

    private bool CheckThatDbfFileCorrect(IFormFile formFile, string fileExtension)
    {
        var isFileExtensionCorrect = fileExtension.Equals(FileExtensions.Dbf, StringComparison.OrdinalIgnoreCase);
        return formFile.Length > 0 && isFileExtensionCorrect;
    }

    private async Task<List<ProductAccountDbfModel>> GetProductAccountInfoFromFileAsync(IFormFile formFile,
        DateTime date)
    {
        var tempFilePath = Path.GetTempFileName();
        using (var stream = new FileStream(tempFilePath, FileMode.Create))
        {
            await formFile.CopyToAsync(stream);
        }

        var result = new List<ProductAccountDbfModel>();

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
                var model = MapDbfDataReaderToProductAccountDbfModel(dbfDataReader, date);

                result.Add(model);
            }
        }

        File.Delete(tempFilePath);

        return result;
    }

    private ProductAccountDbfModel MapDbfDataReaderToProductAccountDbfModel(IDataRecord dbfDataReader, DateTime date)
    {
        //var date = dbfDataReader.GetDateTime(130);
        var productIndex = ReturnNullIfStringEmpty(dbfDataReader.GetString(8));
        var detailNumber = ReturnNullIfStringEmpty(dbfDataReader.GetString(9));
        var suffix = ReturnNullIfStringEmpty(dbfDataReader.GetString(10));

        var amountFromPlan = dbfDataReader.GetInt32(28);

        var result = new ProductAccountDbfModel
        {
            ProductIndex = productIndex,
            DetailNumber = detailNumber,
            Suffix = suffix,
            Date = date.Date,
            AmountFromPlan = amountFromPlan,
        };

        return result;
    }

    private string? ReturnNullIfStringEmpty(string text)
    {
        return string.IsNullOrEmpty(text) ? null : text;
    }

    private IReadOnlyCollection<ProductAccountUpdateInfo> GetUpdatedProductAccounts(
        IReadOnlyCollection<ProductAccountDbfModel> productAccountDbfModels,
        IReadOnlyCollection<ProductBriefDto> products)
    {
        var data = new List<ProductAccountUpdateInfo>();

        foreach (var productAccountDbfModel in productAccountDbfModels)
        {
            var index = productAccountDbfModel.ProductIndex;
            var detailNumber = productAccountDbfModel.DetailNumber;
            var suffix = productAccountDbfModel.Suffix;

            var productFullNumber =
                $"{(index is null ? "" : $"{index}-")}{detailNumber}{(suffix is null ? "" : $"-{suffix}")}";

            var product = products.FirstOrDefault(_ => _.Number == productFullNumber);

            if (product is not null)
            {
                var updateProductAccount = new ProductAccountUpdateInfo
                {
                    ProductId = product.Id,
                    AmountFromPlan = productAccountDbfModel.AmountFromPlan,
                    Date = productAccountDbfModel.Date,
                    ProductionAreaId = product.ProductionAreaId
                };

                data.Add(updateProductAccount);
            }
        }

        return data;
    }

    private async Task UpdateProductAccountsAsync(
        IReadOnlyCollection<ProductAccountUpdateInfo> needToUpdateProductAccount)
    {
        foreach (var newProductAccount in needToUpdateProductAccount)
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
}