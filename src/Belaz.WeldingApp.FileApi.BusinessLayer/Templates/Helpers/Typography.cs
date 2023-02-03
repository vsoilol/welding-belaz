using QuestPDF.Fluent;
using QuestPDF.Infrastructure;

namespace Belaz.WeldingApp.FileApi.BusinessLayer.Templates.Helpers;

public static class Typography
{
    public static TextStyle Normal => TextStyle
        .Default
        .FontFamily("Times New Roman")
        .FontColor("#000000")
        .FontSize(10);
    
    public static TextStyle Bold => TextStyle
        .Default
        .FontFamily("Times New Roman")
        .FontColor("#000000")
        .FontSize(10)
        .Bold();
    
    public static TextStyle Italic => TextStyle
        .Default
        .FontFamily("Times New Roman")
        .FontColor("#000000")
        .FontSize(10)
        .Italic();
    
    public static TextStyle ItalicBold => TextStyle
        .Default
        .FontFamily("Times New Roman")
        .FontColor("#000000")
        .FontSize(10)
        .Italic()
        .Bold();
}