namespace Belaz.WeldingApp.WeldingApi.Contracts.Requests.Common;

public class UpdateUserRequest : CreateUserRequest
{
    public Guid Id { get; set; }
}