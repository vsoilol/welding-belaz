namespace Belaz.WeldingApp.FileApi.BusinessLayer.Extensions;

public static class DocumentExtensions
{
    public static string CheckValueForNull<T>(T value)
    {
        return (value is not null ? value.ToString() : "-")!;
    }
    
    public static string CheckValueForEmpty<T>(T value) where T : notnull
    {
        return (!value.Equals(0) ? value.ToString() : "-")!;
    }
    
    public static string CheckValueForEmptyOrNull(double? value)
    {
        return (value is not null && !((double)value).Equals(0) ? value.ToString() : "-")!;
    }
    
    public static string GetYesOrNoByCondition(bool condition)
    {
        return condition ? "Да" : "Нет";
    }
}