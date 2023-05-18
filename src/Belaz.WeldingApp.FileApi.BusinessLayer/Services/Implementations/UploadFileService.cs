using Belaz.WeldingApp.FileApi.BusinessLayer.Models;
using Belaz.WeldingApp.FileApi.BusinessLayer.Services.Interfaces;
using Belaz.WeldingApp.FileApi.DataLayer.Repositories.Interfaces;
using Belaz.WeldingApp.FileApi.Domain.Dtos.ProductInfo;
using Belaz.WeldingApp.FileApi.Domain.Dtos.SeamPassportInfo;
using Belaz.WeldingApp.FileApi.Domain.Exceptions;
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

    public UploadFileService(IProductRepository productRepository, IProductAccountRepository productAccountRepository)
    {
        _productRepository = productRepository;
        _productAccountRepository = productAccountRepository;
    }

    public async Task<Result<Unit>> UploadProductAccountDataAsync(IFormFile formFile)
    {
        if (formFile.Length <= 0 ||
            !Path.GetExtension(formFile.FileName).Equals(".xlsx", StringComparison.OrdinalIgnoreCase))
        {
            var exception = new UploadFileException();
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