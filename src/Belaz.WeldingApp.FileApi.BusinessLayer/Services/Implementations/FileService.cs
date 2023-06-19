using Belaz.WeldingApp.FileApi.BusinessLayer.ExcelFileServices.Interfaces;
using Belaz.WeldingApp.FileApi.BusinessLayer.Models;
using Belaz.WeldingApp.FileApi.BusinessLayer.Requests;
using Belaz.WeldingApp.FileApi.BusinessLayer.Services.Interfaces;
using Belaz.WeldingApp.FileApi.BusinessLayer.Templates.SeamPassport;
using Belaz.WeldingApp.FileApi.BusinessLayer.Validations.Services;
using Belaz.WeldingApp.FileApi.DataLayer.Repositories.Interfaces;
using Belaz.WeldingApp.FileApi.Domain.Constants;
using Belaz.WeldingApp.FileApi.Domain.Dtos;
using LanguageExt.Common;
using Microsoft.AspNetCore.Hosting;
using QuestPDF.Fluent;

namespace Belaz.WeldingApp.FileApi.BusinessLayer.Services.Implementations;

public class FileService : IFileService
{
    private readonly ITaskRepository _taskRepository;
    private readonly IWebHostEnvironment _environment;
    private readonly IValidationService _validationService;
    private readonly IProductAccountRepository _productAccountRepository;
    private readonly IExcelFileService<List<ProductAccountInfoExcelModel>> _productAccountInfoExcelFileService;

    public FileService(
        ITaskRepository taskRepository,
        IWebHostEnvironment environment,
        IValidationService validationService,
        IProductAccountRepository productAccountRepository,
        IExcelFileService<List<ProductAccountInfoExcelModel>> productAccountInfoExcelFileService)
    {
        _taskRepository = taskRepository;
        _environment = environment;
        _validationService = validationService;
        _productAccountRepository = productAccountRepository;
        _productAccountInfoExcelFileService = productAccountInfoExcelFileService;
    }

    public async Task<Result<DocumentDto>> GenerateSeamPassportByTaskIdAsync(
        GenerateSeamPassportByTaskIdRequest request
    )
    {
        var validationResult = await _validationService.ValidateAsync(request);

        if (!validationResult.IsValid)
        {
            return new Result<DocumentDto>(validationResult.Exception);
        }

        var task = await _taskRepository.GetByIdAsync(request.TaskId);

        var fontsPath = Path.Combine(_environment.WebRootPath, $"fonts");
        var document = new SeamPassportDocument(task, fontsPath);

        byte[] bytes;
        using (var stream = new MemoryStream())
        {
            document.GeneratePdf(stream);
            bytes = stream.ToArray();
        }

        var result = new DocumentDto
        {
            FileName = $"Паспорт Шва №{task.Seam.Number}.pdf",
            FileType = FileTypes.PdfType,
            Bytes = bytes
        };

        return result;
    }

    public async Task<Result<DocumentDto>> GenerateProductAccountInfoExcelFileAsync()
    {
        var data = await _productAccountRepository.GetAllProductAccountsAsync();
        
        var excelDataModel = new List<ProductAccountInfoExcelModel>();

        foreach (var productAccount in data)
        {
            string[] parts = productAccount.Product.Number.Split(new[] { '-' }, 3);
            
            excelDataModel.Add(new ProductAccountInfoExcelModel
            {
                ProductIndex = parts.ElementAtOrDefault(0) ?? "-",
                DetailNumber = parts.ElementAtOrDefault(1) ?? "-",
                Suffix = parts.ElementAtOrDefault(2) ?? "-",
                Date = productAccount.DateFromPlan,
                AmountFromPlan = productAccount.AmountFromPlan,
                AmountAccept = productAccount.AmountAccept,
                AmountDefective = productAccount.AmountDefective,
                AmountManufactured = productAccount.AmountManufactured,
                Workshop = productAccount.Workshop.Number.ToString(),
                ProductionArea = productAccount.ProductionArea.Number.ToString()
            });
        }

        return await _productAccountInfoExcelFileService.GenerateReportAsync(excelDataModel);
    }
}