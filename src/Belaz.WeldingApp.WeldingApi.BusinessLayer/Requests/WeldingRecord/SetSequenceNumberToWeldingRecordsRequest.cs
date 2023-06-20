namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.WeldingRecord;

public class SetSequenceNumberToWeldingRecordsRequest
{
    public List<Guid> WeldingRecordIds { get; set; } = null!;

    public int SequenceNumber { get; set; }
}