namespace Belaz.WeldingApp.FileApi.Domain.Dtos;

public class TaskDto
{
    public int Number { get; set; }

    /// <summary>
    /// Дата выполнения сварки
    /// </summary>
    public string WeldingDate { get; set; } = null!;

    public string? DetailName { get; set; }
    
    public string? KnotName { get; set; }
    
    public string? ProductName { get; set; }
    
    public string? SeamNumber { get; set; }
}