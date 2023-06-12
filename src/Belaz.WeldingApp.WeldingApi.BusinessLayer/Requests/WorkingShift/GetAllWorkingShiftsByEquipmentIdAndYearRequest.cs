namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.WorkingShift;

public class GetAllWorkingShiftsByEquipmentIdAndYearRequest
{
    public int Year { get; set; }

    public Guid EquipmentId { get; set; }
}