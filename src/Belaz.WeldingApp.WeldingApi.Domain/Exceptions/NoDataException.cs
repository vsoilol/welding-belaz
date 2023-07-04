namespace Belaz.WeldingApp.WeldingApi.Domain.Exceptions;

public class NoDataException : Exception
{
    public NoDataException() : base("Data is empty")
    {
        
    }
}