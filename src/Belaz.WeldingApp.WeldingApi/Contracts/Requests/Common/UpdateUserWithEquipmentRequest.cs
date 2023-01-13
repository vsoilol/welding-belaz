namespace Belaz.WeldingApp.WeldingApi.Contracts.Requests.Common;

public class UpdateUserWithEquipmentRequest : UpdateUserRequest
{
    public Guid WeldingEquipmentId { get; set; }
}