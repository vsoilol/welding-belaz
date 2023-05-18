namespace Belaz.WeldingApp.FileApi.Domain.Exceptions;

public class UploadFileException : Exception
{
    public UploadFileException()
        : base($"File is not correct") { }
}