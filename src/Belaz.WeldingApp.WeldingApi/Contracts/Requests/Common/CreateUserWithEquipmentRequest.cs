namespace Belaz.WeldingApp.WeldingApi.Contracts.Requests.Common;

public class CreateUserWithEquipmentRequest : CreateUserRequest
{
    public Guid WeldingEquipmentId { get; set; }
}