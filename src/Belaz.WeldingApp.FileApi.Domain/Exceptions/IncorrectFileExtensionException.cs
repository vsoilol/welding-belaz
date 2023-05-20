namespace Belaz.WeldingApp.FileApi.Domain.Exceptions;

public class IncorrectFileExtensionException : Exception
{
    public IncorrectFileExtensionException(string enterExtension, string correctExtension)
        : base($"File should be {correctExtension}. You enter file {enterExtension}")
    {
    }
}