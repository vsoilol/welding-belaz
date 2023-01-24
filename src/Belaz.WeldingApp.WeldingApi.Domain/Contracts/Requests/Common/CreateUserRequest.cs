namespace Belaz.WeldingApp.WeldingApi.Domain.Contracts.Requests.Common;

public class CreateUserRequest
{
    public string RfidTag { get; set; } = null!;

    public string FirstName { get; set; } = null!;

    public string LastName { get; set; } = null!;

    public string MiddleName { get; set; } = null!;

    public Guid ProductionAreaId { get; set; }
}