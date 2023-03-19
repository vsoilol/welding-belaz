namespace Belaz.WeldingApp.FileApi.Domain.Exceptions;

public class ListIsEmptyException : Exception
{
    public ListIsEmptyException()
        : base($"Data is empty") { }
}
