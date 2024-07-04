using Belaz.WeldingApp.FileApi.BusinessLayer.Templates.Helpers;
using Belaz.WeldingApp.FileApi.Domain.Dtos.ProductInfo;
using Belaz.WeldingApp.FileApi.Domain.Dtos.SeamPassportInfo;
using QuestPDF.Drawing;
using QuestPDF.Fluent;
using QuestPDF.Helpers;
using QuestPDF.Infrastructure;

namespace Belaz.WeldingApp.FileApi.BusinessLayer.Templates.BasedProductAccountTaskPassport;

public class BasedProductAccountTaskPassportDocument : IDocument
{
    private readonly string _fontsPath;
    private readonly double? _averageIntervalSeconds;
    private readonly double? _secondsToIgnoreBetweenGraphs;

    public BasedProductAccountTaskPassportDocument(ProductAccountTaskDto task, string fontsPath,
        double? averageIntervalSeconds, double? secondsToIgnoreBetweenGraphs)
    {
        Task = task;
        _fontsPath = fontsPath;
        _secondsToIgnoreBetweenGraphs = secondsToIgnoreBetweenGraphs;
        _averageIntervalSeconds = _averageIntervalSeconds;
    }

    public ProductAccountTaskDto Task { get; }

    public DocumentMetadata GetMetadata() => DocumentMetadata.Default;

    public void Compose(IDocumentContainer container)
    {
        var timeNewRomanFontPath = Path.Combine(_fontsPath, "times-new-roman.ttf");
        var timeNewRomanBoldFontPath = Path.Combine(_fontsPath, "times-new-roman-bold.ttf");
        var timeNewRomanItalicFontPath = Path.Combine(_fontsPath, "times-new-roman-italic.ttf");
        var timeNewRomanItalicBoldFontPath = Path.Combine(
            _fontsPath,
            "times-new-roman-italic-bold.ttf"
        );

        FontManager.RegisterFont(File.OpenRead(timeNewRomanFontPath));
        FontManager.RegisterFont(File.OpenRead(timeNewRomanBoldFontPath));
        FontManager.RegisterFont(File.OpenRead(timeNewRomanItalicFontPath));
        FontManager.RegisterFont(File.OpenRead(timeNewRomanItalicBoldFontPath));

        container.Page(page =>
        {
            page.Size(PageSizes.A4);
            page.Margin(20);

            page.Content().Element(ComposeContent);

            page.Footer()
                .AlignCenter()
                .Text(x =>
                {
                    x.CurrentPageNumber();
                    x.Span(" / ");
                    x.TotalPages();
                });
        });
    }

    private void ComposeContent(IContainer container)
    {
        container.Column(column =>
        {
            column.Spacing(10);

            column.Item().Element(ComposeProductionTable);
            column.Item().Element(ComposeDataWeldingTaskTable);
            column.Item().Element(ComposeProductsInfoTable);
            column.Item().Element(ComposeMasterTable);
            column.Item().Element(ComposeAdditionalInfoTable);
            column.Item().Element(ComposeInspectorTable);

            var seamTasks = Task.WeldingTasks.Where(_ => _.WeldPassages.Any());

            column
                .Item()
                .Column(row =>
                {
                    foreach (var seamTask in seamTasks)
                    {
                        row.Item().Component(new BasedSeamTaskComponent(seamTask, _averageIntervalSeconds,
                            _secondsToIgnoreBetweenGraphs));
                    }
                });
        });
    }

    private void ComposeProductionTable(IContainer container)
    {
        container.Table(table =>
        {
            table.ColumnsDefinition(columns =>
            {
                columns.RelativeColumn();
                columns.RelativeColumn();
            });

            table
                .Cell()
                .ColumnSpan(2)
                .Element(BlockCenter)
                .Text("Паспорт сварного шва")
                .Style(Typography.Bold);

            table
                .Cell()
                .Row(2)
                .Column(1)
                .Element(BlockLeft)
                .Text("Наименование предприятия / организации")
                .Style(Typography.Normal);

            table.Cell().Row(2).Column(2).Element(BlockLeft)
                .Text("ОАО «БЕЛАЗ» - управляющая компания холдинга «БЕЛАЗ-ХОЛДИНГ»")
                .Style(Typography.Italic);

            table
                .Cell()
                .Row(3)
                .Column(1)
                .Element(BlockLeft)
                .Text("Наименование цеха")
                .Style(Typography.Normal);
            table
                .Cell()
                .Row(3)
                .Column(2)
                .Element(BlockLeft)
                .Text($"{Task.Workshop.Name} №{Task.Workshop.Number}")
                .Style(Typography.Italic);

            table
                .Cell()
                .Row(4)
                .Column(1)
                .Element(BlockLeft)
                .Text("Наименование участка")
                .Style(Typography.Normal);
            table
                .Cell()
                .Row(4)
                .Column(2)
                .Element(BlockLeft)
                .Text($"{Task.ProductionArea.Name} №{Task.ProductionArea.Number}")
                .Style(Typography.Italic);

            var workplaceText = Task.Workplace is not null
                ? $"№ {Task.Workplace.Number}"
                : "-";

            table
                .Cell()
                .Row(5)
                .Column(1)
                .Element(BlockLeft)
                .Text("Номер рабочего места")
                .Style(Typography.Normal);
            table
                .Cell()
                .Row(5)
                .Column(2)
                .Element(BlockLeft)
                .Text(workplaceText)
                .Style(Typography.Italic);

            static IContainer BlockCenter(IContainer container) => Table.BlockCenter(container);
            static IContainer BlockLeft(IContainer container) => Table.BlockLeft(container);
        });
    }

    private void ComposeDataWeldingTaskTable(IContainer container)
    {
        container.Table(table =>
        {
            table.ColumnsDefinition(columns =>
            {
                columns.RelativeColumn();
                columns.RelativeColumn();
            });

            table
                .Cell()
                .Column(1)
                .Element(BlockLeft)
                .Text("Дата выполнения сварки")
                .Style(Typography.Normal);
            table
                .Cell()
                .Column(2)
                .Element(BlockLeft)
                .Text(Task.WeldingDate)
                .Style(Typography.Italic);

            static IContainer BlockLeft(IContainer container) => Table.BlockLeft(container);
        });
    }

    private void ComposeProductsInfoTable(IContainer container)
    {
        container.Table(table =>
        {
            table.ColumnsDefinition(columns =>
            {
                columns.RelativeColumn();
                columns.RelativeColumn();
            });

            table
                .Cell()
                .Column(1)
                .Element(BlockLeft)
                .Text("Наименование изделия")
                .Style(Typography.Normal);

            var productInfo = GetProductInfo(Task.Product);
            table.Cell().Column(2).Element(BlockLeft).Text(productInfo).Style(Typography.Italic);

            table
                .Cell()
                .Row(2)
                .Column(1)
                .Element(BlockLeft)
                .Text("Порядковый номер изделия")
                .Style(Typography.Normal);
            table
                .Cell()
                .Row(2)
                .Column(2)
                .Element(BlockLeft)
                .Text(Task.SequenceNumber)
                .Style(Typography.Italic);

            table
                .Cell()
                .Row(3)
                .Column(1)
                .Element(BlockLeft)
                .Text("Наименование узла")
                .Style(Typography.Normal);
            var knotInfo = GetProductInfo(Task.Knot);
            table
                .Cell()
                .Row(3)
                .Column(2)
                .Element(BlockLeft)
                .Text(knotInfo)
                .Style(Typography.Italic);

            table
                .Cell()
                .Row(4)
                .Column(1)
                .Element(BlockLeft)
                .Text("Наименование детали")
                .Style(Typography.Normal);
            var detailInfo = GetProductInfo(Task.Detail);
            table
                .Cell()
                .Row(4)
                .Column(2)
                .Element(BlockLeft)
                .Text(detailInfo)
                .Style(Typography.Italic);

            static IContainer BlockLeft(IContainer container) => Table.BlockLeft(container);
        });
    }

    private void ComposeMasterTable(IContainer container)
    {
        container.Table(table =>
        {
            table.ColumnsDefinition(columns =>
            {
                columns.RelativeColumn();
                columns.RelativeColumn();
            });

            table
                .Cell()
                .Column(1)
                .Element(BlockLeft)
                .Text("Руководитель сварочных работ (мастер)")
                .Style(Typography.Normal);
            table
                .Cell()
                .Column(2)
                .Element(BlockLeft)
                .Text($"{Task.Master.MiddleName} {Task.Master.FirstName} {Task.Master.LastName}")
                .Style(Typography.Italic);

            static IContainer BlockLeft(IContainer container) => Table.BlockLeft(container);
        });
    }

    private void ComposeAdditionalInfoTable(IContainer container)
    {
        container.Table(table =>
        {
            table.ColumnsDefinition(columns =>
            {
                columns.RelativeColumn();
                columns.RelativeColumn();
            });

            table.Cell().Element(BlockLeft)
                .Text("Наименование сварочного материала")
                .Style(Typography.Normal);

            table
                .Cell()
                .Element(BlockLeft)
                .Text(Task.WeldingMaterial ?? "-")
                .Style(Typography.Italic);

            table.Cell().Element(BlockLeft)
                .Text("Номер партии сварочного материала")
                .Style(Typography.Normal);

            table
                .Cell()
                .Element(BlockLeft)
                .Text(Task.WeldingMaterialBatchNumber ?? "-")
                .Style(Typography.ItalicBold);

            static IContainer BlockLeft(IContainer container) => Table.BlockLeft(container);
        });
    }

    private void ComposeInspectorTable(IContainer container)
    {
        container.Table(table =>
        {
            table.ColumnsDefinition(columns =>
            {
                columns.RelativeColumn();
                columns.RelativeColumn();
            });

            table.Cell().Element(BlockLeft).Text("Контролёр").Style(Typography.Normal);
            table
                .Cell()
                .Element(BlockLeft)
                .Text(
                    Task.Inspector is null
                        ? "-"
                        : $"{Task.Inspector.MiddleName} {Task.Inspector.FirstName} {Task.Inspector.LastName}"
                )
                .Style(Typography.Italic);

            table
                .Cell()
                .Element(BlockLeft)
                .Text("Обнаруженные дефекты (брак)")
                .Style(Typography.Normal);
            table
                .Cell()
                .Element(BlockLeft)
                .Text(Task.DetectedDefects ?? "-")
                .Style(Typography.Italic);

            table.Cell().Element(BlockLeft).Text("Причины брака").Style(Typography.Normal);
            table
                .Cell()
                .Element(BlockLeft)
                .Text(Task.Reason ?? "-")
                .Style(Typography.Italic);

            static IContainer BlockLeft(IContainer container) => Table.BlockLeft(container);
        });
    }

    private string GetProductInfo(ProductBriefDto? product)
    {
        return product is not null ? $"{product.Name} №{product.Number}" : "-";
    }
}