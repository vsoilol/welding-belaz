namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.Common;

public class UpdateUserRequest : CreateUserRequest
{
    public Guid Id { get; set; }
}