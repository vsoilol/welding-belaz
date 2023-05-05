namespace Belaz.WeldingApp.FileApi.BusinessLayer.Models;

public class DocumentInfo<T> where T : class
{
    public string[] TitleText { get; set; } = null!;

    public T Data { get; set; } = null!;
}