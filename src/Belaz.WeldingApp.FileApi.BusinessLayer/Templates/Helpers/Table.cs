using QuestPDF.Elements.Table;
using QuestPDF.Fluent;
using QuestPDF.Infrastructure;

namespace Belaz.WeldingApp.FileApi.BusinessLayer.Templates.Helpers;

public static class Table
{
    public static IContainer BlockCenter(IContainer container)
    {
        return container
            .Border(1)
            .ShowOnce()
            .AlignCenter()
            .AlignTop();
    }
    
    public static IContainer BlockLeft(IContainer container)
    {
        return container
            .Border(1)
            .PaddingLeft(5)
            .PaddingRight(5)
            .ShowOnce()
            .AlignLeft()
            .AlignTop();
    }
}