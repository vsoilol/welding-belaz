namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.WeldingRecord;

public class SetSequenceNumberToWeldingRecordsRequest
{
    public List<Guid> WeldingRecordIds { get; set; } = null!;

    public string SequenceNumber { get; set; } = null!;
}