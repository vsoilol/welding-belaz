namespace Belaz.WeldingApp.WeldingApi.Domain.Contracts.Requests.Common;

public class UpdateUserRequest : CreateUserRequest
{
    public Guid Id { get; set; }
}