namespace Belaz.WeldingApp.WeldingApi.Contracts.Requests.Common;

public class UpdateUserWithEquipmentRequest : CreateUserWithEquipmentRequest
{
    public Guid Id { get; set; }
}