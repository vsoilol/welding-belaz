using Belaz.WeldingApp.WeldingApi.Domain.Mappings;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.Day;

public class UpdateDayRequest : IMapTo<Domain.Entities.CalendarInfo.Day>
{
    public Guid Id { get; set; }

    public int MonthNumber { get; set; }

    public int Number { get; set; }

    public bool IsWorkingDay { get; set; }
}