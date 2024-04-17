using AutoMapper;
using Belaz.WeldingApp.Common.Entities.TaskInfo;
using Belaz.WeldingApp.Common.Enums;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.WeldingRecord;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Services.Interfaces;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.Services;
using Belaz.WeldingApp.WeldingApi.DataLayer.Repositories.Interfaces;
using Belaz.WeldingApp.WeldingApi.Domain.Dtos;
using Belaz.WeldingApp.WeldingApi.Domain.Exceptions;
using Belaz.WeldingApp.WeldingApi.Domain.Extensions;
using LanguageExt;
using LanguageExt.Common;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Services.Implementations;

public class WeldingRecordService : IWeldingRecordService
{
    private readonly IWeldingRecordRepository _weldingRecordRepository;
    private readonly IValidationService _validationService;
    private readonly IMapper _mapper;

    public WeldingRecordService(
        IWeldingRecordRepository weldingRecordRepository,
        IValidationService validationService, IMapper mapper)
    {
        _weldingRecordRepository = weldingRecordRepository;
        _validationService = validationService;
        _mapper = mapper;
    }

    public async Task<Result<List<RecordDto>>> GetRecordsByDatePeriodAsync(GetRecordsByDatePeriodRequest request)
    {
        var validationResult = await _validationService.ValidateAsync(request);

        if (!validationResult.IsValid)
        {
            return new Result<List<RecordDto>>(validationResult.Exception);
        }

        var startDate = request.StartDate.ToDateTime();
        var endDate = request.EndDate.ToDateTime();

        var result = await _weldingRecordRepository
            .GetRecordsByDatePeriodAsync(startDate, endDate, request.SeamNumber,
                request.WeldingTaskNumber,
                request.WelderId,
                request.MasterId,
                request.EquipmentId);
        return result;
    }

    public Task<List<RecordDto>> GetAllWithDeviationsAsync()
    {
        return _weldingRecordRepository.GetAllWithDeviationsAsync();
    }

    public async Task<Result<Unit>> DeleteAsync(DeleteWeldingRecordRequest request)
    {
        var validationResult = await _validationService.ValidateAsync(request);

        if (!validationResult.IsValid)
        {
            return new Result<Unit>(validationResult.Exception);
        }

        await _weldingRecordRepository.DeleteAsync(request.Id);
        return Unit.Default;
    }

    public async Task<Result<WeldingRecordLimitDto>> UpdateWeldingRecordLimitAsync(
        UpdateWeldingRecordLimitRequest request)
    {
        var validationResult = await _validationService.ValidateAsync(request);

        if (!validationResult.IsValid)
        {
            return new Result<WeldingRecordLimitDto>(validationResult.Exception);
        }

        var entity = _mapper.Map<WeldingRecordLimit>(request);

        var result = await _weldingRecordRepository.UpdateWeldingRecordLimitAsync(entity);
        return result;
    }

    public Task<WeldingRecordLimitDto> GetWeldingRecordLimitAsync()
    {
        return _weldingRecordRepository.GetWeldingRecordLimitAsync();
    }

    public async Task<Result<Unit>> SetSequenceNumberToWeldingRecordsAsync(
        SetSequenceNumberToWeldingRecordsRequest request)
    {
        var validationResult = await _validationService.ValidateAsync(request);

        if (!validationResult.IsValid)
        {
            return new Result<Unit>(validationResult.Exception);
        }

        await _weldingRecordRepository.SetSequenceNumberToWeldingRecordsAsync(request.WeldingRecordIds,
            request.SequenceNumber);
        return Unit.Default;
    }

    public async Task<Result<RecordBriefDto>> GetRecordValuesByDateAsync(GetRecordValuesByDateRequest request)
    {
        var validationResult = await _validationService.ValidateAsync(request);

        if (!validationResult.IsValid)
        {
            return new Result<RecordBriefDto>(validationResult.Exception);
        }

        var date = request.Date.ToDateTime();
        var startTime = request.StartTime.ToTimeSpan();
        var endTime = request.EndTime.ToTimeSpan();

        var records = await _weldingRecordRepository
            .GetRecordsByDateAsync(date, startTime, endTime, request.WelderId, request.EquipmentId);

        if (!records.Any())
        {
            return new Result<RecordBriefDto>(new NoDataException());
        }

        var recordValues = GetAllRecordsInOne(records);

        var voltageParameterResult = GetParametersResult(records
            .SelectMany(_ => _.ArcVoltageValues)
            .ToArray());

        var currencyParameterResult = GetParametersResult(records
            .SelectMany(_ => _.WeldingCurrentValues)
            .ToArray());

        var weldingEndTime = records.Last(_ => _.WeldingEndTime.Days == 0).WeldingEndTime;

        return new Result<RecordBriefDto>(new RecordBriefDto
        {
            WeldingStartTime = records.First().WeldingStartTime.ToHoursMinutesString(),
            WeldingEndTime = weldingEndTime.ToHoursMinutesString(),
            ArcVoltageValues = recordValues.ArcVoltageValues,
            WeldingCurrentValues = recordValues.WeldingCurrentValues,
            WeldingCurrentMin = currencyParameterResult.Min,
            WeldingCurrentMax = currencyParameterResult.Max,
            WeldingCurrentAverage = currencyParameterResult.Average,
            ArcVoltageMin = voltageParameterResult.Min,
            ArcVoltageMax = voltageParameterResult.Max,
            ArcVoltageAverage = voltageParameterResult.Average
        });
    }

    public Task<List<RecordDto>> GetAllAsync()
    {
        return _weldingRecordRepository.GetAllAsync();
    }

    private Values GetAllRecordsInOne(List<WeldingRecord> records)
    {
        var valuesLenght = records.Count;

        var resultAmperages = new List<double>();
        var resultVoltages = new List<double>();

        for (var i = 0; i < valuesLenght; i++)
        {
            var amperages = records[i].WeldingCurrentValues;
            var voltages = records[i].ArcVoltageValues;

            resultAmperages.AddRange(amperages);
            resultVoltages.AddRange(voltages);

            if (i >= valuesLenght - 2)
            {
                continue;
            }

            var endTime = records[i].WeldingEndTime;
            var nextStartTime = records[i + 1].WeldingStartTime;

            var totalSeconds = (nextStartTime - endTime).TotalSeconds;

            var valuesAmount = (int) (totalSeconds * 10);

            if (valuesAmount > 0)
            {
                var zeroValues = Enumerable.Repeat(0.0, valuesAmount).ToArray();

                resultAmperages.AddRange(zeroValues);
                resultVoltages.AddRange(zeroValues);
            }
        }

        return new Values
        {
            ArcVoltageValues = resultVoltages.ToArray(),
            WeldingCurrentValues = resultAmperages.ToArray(),
        };
    }

    private ParametersResult GetParametersResult(double[] values)
    {
        var valueMin = Math.Round(values.Min(), 2);
        var valueMax = Math.Round(values.Max(), 2);
        var valueAverage = Math.Round(values.Average(), 2);

        return new ParametersResult
        {
            Average = valueAverage,
            Min = valueMin,
            Max = valueMax,
        };
    }

    public async Task<Result<PaginatedList<RecordDto>>> GetFilteredRecordsAsync(GetFilteredWeldingRecordsRequest request)
    {
        var validationResult = await _validationService.ValidateAsync(request);

        if (!validationResult.IsValid)
        {
            return new Result<PaginatedList<RecordDto>>(validationResult.Exception);
        }
        
        var isAscending = string.Equals(request.SortOrder, "asc", StringComparison.OrdinalIgnoreCase);

        var sortOrderValue = isAscending ? SortOrder.Ascending : SortOrder.Descending;

        var dateStart = request.DateStart?.ToDateTime();
        var dateEnd = request.DateEnd?.ToDateTime();

        var paginationResult = await _weldingRecordRepository.GetFilteredRecordsAsync(request.SearchTerm,
            request.SortColumn,
            sortOrderValue, request.PageSize, request.PageNumber,
            request.IncludeDeviations, request.SequenceNumber,
            dateStart, dateEnd);

        foreach (var item in paginationResult.Items)
        {
            ProcessWeldingRecord(item, request.DesiredArrayLength);
        }

        return paginationResult;
    }

    private void ProcessWeldingRecord(RecordDto record, int desiredArrayLength)
    {
        var weldingDuration = Math.Round(record.WeldingDuration, 2);
        var originalArrayLength = record.WeldingCurrentValues.Length;

        if (desiredArrayLength > 0 && originalArrayLength > desiredArrayLength)
        {
            record.WeldingCurrentValues = CalculateAverageArray(record.WeldingCurrentValues, desiredArrayLength);
            record.ArcVoltageValues = CalculateAverageArray(record.ArcVoltageValues, desiredArrayLength);
            record.SecondsPerPoint = CalculateSecondsPerPoint(weldingDuration, desiredArrayLength);
        }
        else
        {
            record.SecondsPerPoint = CalculateSecondsPerPoint(weldingDuration, originalArrayLength);
        }
    }

    private double CalculateSecondsPerPoint(double weldingDuration, int arrayLength)
    {
        return Math.Round(weldingDuration / arrayLength, 2);
    }

    private double[] CalculateAverageArray(double[] inputArray, int desiredArrayLength)
    {
        int chunkSize = inputArray.Length / desiredArrayLength;

        var averagedArray = new double[desiredArrayLength];

        for (int i = 0; i < desiredArrayLength; i++)
        {
            int startIndex = i * chunkSize;

            double average = inputArray.Skip(startIndex).Take(chunkSize).Average();
            averagedArray[i] = Math.Round(average, 2);
        }

        return averagedArray;
    }
}

internal class Values
{
    public double[] WeldingCurrentValues { get; set; } = null!;

    public double[] ArcVoltageValues { get; set; } = null!;
}

internal class ParametersResult
{
    public double Min { get; set; }

    public double Max { get; set; }

    public double Average { get; set; }
}