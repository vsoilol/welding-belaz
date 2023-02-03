namespace Belaz.WeldingApp.FileApi.BusinessLayer.Extensions;

public static class DocumentExtensions
{
    public static string CheckValueForNull<T>(T value)
    {
        return (value is not null ? value.ToString() : "-")!;
    }
    
    public static string GetYesOrNoByCondition(bool condition)
    {
        return condition ? "Да" : "Нет";
    }
}