namespace Belaz.WeldingApp.IdentityApi.Domain.Exceptions;

public class ListIsEmptyException : Exception
{
    public ListIsEmptyException()
        : base($"Data is empty") { }
}
