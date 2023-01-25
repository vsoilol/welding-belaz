namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.Common;

public class UpdateUserWithEquipmentRequest : CreateUserWithEquipmentRequest
{
    public Guid Id { get; set; }
}