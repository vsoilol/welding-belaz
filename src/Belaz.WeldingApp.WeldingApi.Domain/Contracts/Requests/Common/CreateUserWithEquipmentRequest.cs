namespace Belaz.WeldingApp.WeldingApi.Domain.Contracts.Requests.Common;

public class CreateUserWithEquipmentRequest : CreateUserRequest
{
    public Guid? WeldingEquipmentId { get; set; }
}