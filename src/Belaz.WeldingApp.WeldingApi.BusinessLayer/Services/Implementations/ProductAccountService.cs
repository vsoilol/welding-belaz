using AutoMapper;
using Belaz.WeldingApp.Common.Entities.ProductInfo;
using Belaz.WeldingApp.Common.Entities.TaskInfo;
using Belaz.WeldingApp.Common.Enums;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.Common;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.ProductAccount;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Services.Interfaces;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.Services;
using Belaz.WeldingApp.WeldingApi.DataLayer.Repositories.Interfaces;
using Belaz.WeldingApp.WeldingApi.Domain.Dtos.Product;
using Belaz.WeldingApp.WeldingApi.Domain.Dtos.ProductAccount;
using Belaz.WeldingApp.WeldingApi.Domain.Dtos.WeldingEquipment;
using Belaz.WeldingApp.WeldingApi.Domain.Extensions;
using LanguageExt;
using LanguageExt.Common;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Services.Implementations;

public class ProductAccountService : IProductAccountService
{
    private readonly IValidationService _validationService;

    private readonly IProductAccountRepository _productAccountRepository;
    private readonly IWeldingTaskRepository _weldingTaskRepository;
    private readonly IProductRepository _productRepository;
    private readonly IMapper _mapper;

    public ProductAccountService(
        IValidationService validationService,
        IProductAccountRepository productAccountRepository,
        IWeldingTaskRepository weldingTaskRepository,
        IProductRepository productRepository,
        IMapper mapper)
    {
        _validationService = validationService;
        _productAccountRepository = productAccountRepository;
        _weldingTaskRepository = weldingTaskRepository;
        _productRepository = productRepository;
        _mapper = mapper;
    }

    public async Task<Result<Unit>> AssignProductAccountToWeldingEquipmentsAsync(
        AssignProductAccountToWeldingEquipmentsRequest request
    )
    {
        var validationResult = await _validationService.ValidateAsync(request);

        if (!validationResult.IsValid)
        {
            return new Result<Unit>(validationResult.Exception);
        }

        await _productAccountRepository.AssignProductAccountToWeldingEquipmentsAsync(
            request.ProductAccountId,
            request.WeldingEquipmentIds
        );
        return Unit.Default;
    }

    public async Task<Result<ProductAccountDto>> ChangAcceptedAmountAsync(
        ChangeProductAccountAcceptedAmountRequest request
    )
    {
        var validationResult = await _validationService.ValidateAsync(request);

        if (!validationResult.IsValid)
        {
            return new Result<ProductAccountDto>(validationResult.Exception);
        }

        return await _productAccountRepository.ChangAcceptedAmountAsync(
            request.Id,
            request.InspectorId,
            request.Amount
        );
    }

    public async Task<Result<ProductAccountDto>> ChangAmountFromPlanAsync(
        ChangeProductAccountAmountRequest request
    )
    {
        var validationResult = await _validationService.ValidateAsync(request);

        if (!validationResult.IsValid)
        {
            return new Result<ProductAccountDto>(validationResult.Exception);
        }

        return await _productAccountRepository.ChangAmountFromPlanAsync(request.Id, request.Amount);
    }

    public async Task<Result<ProductAccountDto>> ChangeManufacturedAmountAsync(
        ChangeProductAccountAmountRequest request
    )
    {
        var validationResult = await _validationService.ValidateAsync(request);

        if (!validationResult.IsValid)
        {
            return new Result<ProductAccountDto>(validationResult.Exception);
        }

        return await _productAccountRepository.ChangeManufacturedAmountAsync(request.Id, request.Amount);
    }

    public async Task<Result<List<ProductAccountDto>>> ChangeOrderAsync(ChangeOrderRequest request)
    {
        var validationResult = await _validationService.ValidateAsync(request);

        if (!validationResult.IsValid)
        {
            return new Result<List<ProductAccountDto>>(validationResult.Exception);
        }

        return await _productAccountRepository.ChangeOrderAsync(request.FirstId, request.SecondId);
    }

    public async Task<Result<List<ProductAccountDto>>> GenerateByDateAsync(
        GenerateProductAccountsByDateRequest request
    )
    {
        var validationResult = await _validationService.ValidateAsync(request);

        if (!validationResult.IsValid)
        {
            return new Result<List<ProductAccountDto>>(validationResult.Exception);
        }

        var date = request.Date.ToDateTime();
        var newDate = request.NewDate.ToDateTime();

        return await _productAccountRepository.GenerateByDateAsync(
            date,
            newDate,
            request.ProductionAreaId
        );
    }

    public async Task<Result<List<ProductAccountDto>>> GenerateEmptyAsync(
        GenerateProductAccountsEmptyRequest request
    )
    {
        var validationResult = await _validationService.ValidateAsync(request);

        if (!validationResult.IsValid)
        {
            return new Result<List<ProductAccountDto>>(validationResult.Exception);
        }

        var newDate = request.NewDate.ToDateTime();

        return await _productAccountRepository.GenerateEmptyAsync(newDate, request.ProductionAreaId);
    }

    public async Task<Result<Unit>> GenerateTasksAsync(GenerateTasksRequest request)
    {
        var validationResult = await _validationService.ValidateAsync(request);

        if (!validationResult.IsValid)
        {
            return new Result<Unit>(validationResult.Exception);
        }

        var date = request.Date.ToDateTime();

        await _productAccountRepository.GenerateTasksAsync(
            date,
            request.ProductionAreaId,
            request.MasterId
        );
        return Unit.Default;
    }

    public async Task<Result<List<ProductAccountDto>>> GetAllByDateAsync(
        GetAllProductAccountsByDateRequest request
    )
    {
        var validationResult = await _validationService.ValidateAsync(request);

        if (!validationResult.IsValid)
        {
            return new Result<List<ProductAccountDto>>(validationResult.Exception);
        }

        var date = request.Date.ToDateTime();

        return await _productAccountRepository.GetAllByDateAsync(date, request.ProductionAreaId);
    }

    public async Task<Result<List<string>>> GetAllDatesByProductionAreaAsync(
        ProductionAreaIdRequest request
    )
    {
        var validationResult = await _validationService.ValidateAsync(request);

        if (!validationResult.IsValid)
        {
            return new Result<List<string>>(validationResult.Exception);
        }

        return await _productAccountRepository.GetAllDatesByProductionAreaAsync(request.ProductionAreaId);
    }

    public async Task<Result<ProductAccountDto>> SetProductAccountDefectiveReasonAsync(
        SetProductAccountDefectiveReasonRequest request
    )
    {
        var validationResult = await _validationService.ValidateAsync(request);

        if (!validationResult.IsValid)
        {
            return new Result<ProductAccountDto>(validationResult.Exception);
        }

        return await _productAccountRepository.SetProductAccountDefectiveReasonAsync(
            request.ProductAccountId,
            request.DefectiveReason
        );
    }

    public async Task<Result<ProductAccountDto>> AddProductAccountAsync(AddProductAccountRequest request)
    {
        var validationResult = await _validationService.ValidateAsync(request);

        if (!validationResult.IsValid)
        {
            return new Result<ProductAccountDto>(validationResult.Exception);
        }

        var date = request.Date.ToDateTime();

        return await _productAccountRepository.AddProductAccountAsync(request.ProductId, date, request.UniqueNumber);
    }

    public async Task<Result<ProductAccountDto>> SetUniqueNumberAsync(SetUniqueNumberForProductRequest request)
    {
        var validationResult = await _validationService.ValidateAsync(request);

        if (!validationResult.IsValid)
        {
            return new Result<ProductAccountDto>(validationResult.Exception);
        }

        return await _productAccountRepository.SetUniqueNumberAsync(
            request.ProductAccountId,
            request.UniqueNumber
        );
    }

    public async Task<Result<Unit>> RemoveProductAccountAsync(RemoveProductAccountRequest request)
    {
        var validationResult = await _validationService.ValidateAsync(request);

        if (!validationResult.IsValid)
        {
            return new Result<Unit>(validationResult.Exception);
        }

        await _productAccountRepository.RemoveProductAccountAsync(request.Id);
        return Unit.Default;
    }

    public async Task<Result<ProductAccountDto>> EditProductAccountAsync(EditProductAccountRequest request)
    {
        var validationResult = await _validationService.ValidateAsync(request);

        if (!validationResult.IsValid)
        {
            return new Result<ProductAccountDto>(validationResult.Exception);
        }

        return await _productAccountRepository
            .EditProductAccountAsync(request.ProductAccountId,
                request.SequenceNumbers, request.AmountFromPlan);
    }

    public async Task<Result<ProductAccountDto>> ChangeEndWeldingDateAsync(ChangeEndWeldingDateRequest request)
    {
        var validationResult = await _validationService.ValidateAsync(request);

        if (!validationResult.IsValid)
        {
            return new Result<ProductAccountDto>(validationResult.Exception);
        }

        return await _productAccountRepository
            .ChangeEndWeldingDateAsync(request.ProductAccountId,
                request.WeldingEndDate?.ToDateTime() ?? null);
    }

    public async Task<Result<ProductAccountDto>> ChangeDefectiveAmountAsync(ChangeDefectiveAmountRequest request)
    {
        var validationResult = await _validationService.ValidateAsync(request);

        if (!validationResult.IsValid)
        {
            return new Result<ProductAccountDto>(validationResult.Exception);
        }

        return await _productAccountRepository
            .ChangeDefectiveAmountAsync(request.ProductAccountId,
                request.InspectorId, request.DefectiveAmount, request.DefectiveReason);
    }

    public async Task<Result<List<ProductTaskDto>>> GetAllProductAccountTasksAsync()
    {
        var weldingTasks = await _weldingTaskRepository.GetAllWeldingTasksWithRelatedEntitiesAsync();

        var groupedWeldingTasks = weldingTasks.GroupBy(task => new
        {
            task.SequenceNumber, task.SeamAccount.ProductAccountId
        }).ToList();

        var productTasks = new List<ProductTaskDto>();

        for (var i = 0; i < groupedWeldingTasks.Count; i++)
        {
            var group = groupedWeldingTasks[i];
            var firstTaskInGroup = group.First();
            var productAccount = firstTaskInGroup.SeamAccount.ProductAccount;
            var seamNumbers = group.Select(task => task.SeamAccount.Seam.Number);

            var productStructure = await _productRepository.FetchProductStructureAsync(productAccount.ProductId);

            var productTask = MapToProductTaskDto(group, productAccount, productStructure, seamNumbers, i + 1);
            productTasks.Add(productTask);
        }

        return productTasks.OrderByDescending(task => task.TaskNumber).ToList();
    }
    
    private ProductTaskDto MapToProductTaskDto(
        IGrouping<dynamic, WeldingTask> group, 
        ProductAccount productAccount, 
        ProductStructureDto productStructure, 
        IEnumerable<string> seamNumbers,
        int taskNumber)
    {
        return new ProductTaskDto
        {
            TaskNumber = taskNumber,
            PlannedQuantity = productAccount.AmountFromPlan,
            ProductAccountId = productAccount.Id,
            IsComplete = group.All(task => task.TaskStatus == WeldingTaskStatus.Completed),
            SequenceNumbers = group.Key.SequenceNumber,
            Product = productStructure.Product,
            Knot = productStructure.Knot,
            Detail = productStructure.Detail,
            PlannedStartDate = productAccount.DateFromPlan.ToDayInfoString(),
            PlannedEndDate = productAccount.EndDateFromPlan?.ToDayInfoString(),
            SeamNumbers = seamNumbers.ToList(),
            WeldingEquipments = _mapper.Map<List<WeldingEquipmentBriefDto>>(productAccount.WeldingEquipments),
            AcceptedAmount = CalculateResultAmount(productAccount, ResultProductStatus.Accept),
            ManufacturedAmount = CalculateResultAmount(productAccount, ResultProductStatus.Manufactured),
            DefectiveAmount = CalculateResultAmount(productAccount, ResultProductStatus.Defective),
            DefectiveReason = GetDefectiveReason(productAccount),
            HasDeviations = group.Any(task => HasDeviation(task))
        };
    }
    
    private int CalculateResultAmount(ProductAccount account, ResultProductStatus status)
    {
        return account.ProductResults.Where(result => result.Status == status).Sum(result => result.Amount);
    }

    private string? GetDefectiveReason(ProductAccount account)
    {
        return account.ProductResults.FirstOrDefault(result => result.Status == ResultProductStatus.Defective)?.Reason;
    }

    private bool HasDeviation(WeldingTask task)
    {
        return task.WeldPassages.Any(passage =>
            (!passage.IsEnsuringCurrentAllowance.HasValue || !passage.IsEnsuringCurrentAllowance.Value)
            || passage.IsEnsuringTemperatureAllowance.HasValue && passage.IsEnsuringTemperatureAllowance.Value
            || passage.IsEnsuringVoltageAllowance.HasValue && passage.IsEnsuringVoltageAllowance.Value);
    }
}