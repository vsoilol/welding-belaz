namespace Belaz.WeldingApp.WeldingApi.Domain.Contracts.Requests.Common;

public class UpdateUserWithEquipmentRequest : CreateUserWithEquipmentRequest
{
    public Guid Id { get; set; }
}