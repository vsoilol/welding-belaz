namespace Belaz.WeldingApp.FileApi.Domain.Dtos;

public class DocumentDto
{
    public byte[] Bytes { get; set; } = null!;
    
    public string FileName { get; set; } = null!;
    
    public string FileType { get; set; } = null!;
}