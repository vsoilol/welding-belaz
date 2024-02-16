namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.WeldingRecord;

public class GetFilteredWeldingRecordsRequest
{
    private const int MaxPageSize = 50;
    
    public string? DateStart { get; set; }

    public string? DateEnd { get; set; }
    
    public bool? IncludeDeviations { get; set; }
    
    public string? SequenceNumber { get; set; }

    public string? SearchTerm { get; set; }

    public string SortColumn { get; set; } = "date";

    public string SortOrder { get; set; } = "desc";

    public int DesiredArrayLength { get; set; }

    public int PageNumber { get; set; } = 1;

    private int _pageSize = 10;

    public int PageSize
    {
        get => _pageSize;
        set => _pageSize = (value > MaxPageSize) ? MaxPageSize : value;
    }
}