using System.Collections.Concurrent;
using Belaz.WeldingApp.FileApi.BusinessLayer.Models;
using Belaz.WeldingApp.FileApi.BusinessLayer.Templates.ChartsGenerators;
using Belaz.WeldingApp.FileApi.BusinessLayer.Templates.Helpers;
using Belaz.WeldingApp.FileApi.Domain.Dtos.SeamPassportInfo;
using QuestPDF.Fluent;
using QuestPDF.Infrastructure;

namespace Belaz.WeldingApp.FileApi.BusinessLayer.Templates.ProductAccountTaskPassport;

public class SeamTaskComponent : IComponent
{
    public SeamTaskComponent(TaskBriefDto seamTask)
    {
        SeamTask = seamTask;
    }

    public TaskBriefDto SeamTask { get; }

    public void Compose(IContainer container)
    {
        container.Column(column =>
        {
            column.Item().PaddingTop(10);
            column.Spacing(10);

            column.Item().Element(ComposeBaseInfo);
            column.Item().Element(ComposeWeldPassageInstructionsTable);
            
            var weldPassages = SeamTask.WeldPassages;

            var weldPassagesInfoWithChart = new ConcurrentBag<WeldPassageInfoWithChart>();
            
            Parallel.ForEach(weldPassages, weldPassage =>
            {
                var weldPassageInstruction =
                    SeamTask.Seam.TechnologicalInstruction.WeldPassageInstructions.FirstOrDefault(
                        _ => _.Number == weldPassage.Number
                    )!;
                
                var weldingCurrentChartImageBytes = ChartGenerator.GetArcVoltageChartImageByte(
                    weldPassage,
                    "А",
                    $"Показания сварочного тока по слою №{weldPassage.Number}",
                    "Показания силы тока",
                    weldPassage.WeldingCurrentValues,
                    weldPassageInstruction.WeldingCurrentMin,
                    weldPassageInstruction.WeldingCurrentMax
                );

                var arcVoltageChartImageBytes = ChartGenerator.GetArcVoltageChartImageByte(
                    weldPassage,
                    "В",
                    $"Показания напряжения на дуге по слою №{weldPassage.Number}",
                    "Показания напряжения",
                    weldPassage.ArcVoltageValues,
                    weldPassageInstruction.ArcVoltageMin,
                    weldPassageInstruction.ArcVoltageMax
                );
                
                weldPassagesInfoWithChart.Add(
                new WeldPassageInfoWithChart
                {
                    WeldPassageInfo = weldPassage,
                    WeldPassageInstructionInfo = weldPassageInstruction,
                    ArcVoltageChartImageBytes = arcVoltageChartImageBytes,
                    WeldingCurrentChartImageBytes = weldingCurrentChartImageBytes
                });
            });

            var weldPassagesInfoWithChartOrdered = weldPassagesInfoWithChart.OrderBy(_ => _.WeldPassageInfo.Number);

            column
                .Item()
                .Column(row =>
                {
                    foreach (var weldPassagesInfoWithChart in weldPassagesInfoWithChartOrdered)
                    {
                        row.Item()
                            .Component(
                                new WeldPassageComponent(weldPassagesInfoWithChart)
                            );
                    }
                });
        });
    }

    private void ComposeBaseInfo(IContainer container)
    {
        container.Column(column =>
        {
            column.Spacing(2);

            column
                .Item()
                .Text($"Шов №{SeamTask.Seam.Number}.")
                .Style(Typography.Bold);

            column
                .Item()
                .Table(table =>
                {
                    table.ColumnsDefinition(columns =>
                    {
                        columns.RelativeColumn();
                        columns.RelativeColumn();
                    });

                    table
                        .Cell()
                        .Element(BlockLeft)
                        .Text("Инструкция на технологический процесс сварки")
                        .Style(Typography.Normal);
                    table
                        .Cell()
                        .Element(BlockLeft)
                        .Text(
                            $"{SeamTask.Seam.TechnologicalInstruction.Name} №{SeamTask.Seam.TechnologicalInstruction.Number}"
                        )
                        .Style(Typography.Italic);

                    table
                        .Cell()
                        .Element(BlockLeft)
                        .Text("Технологический процесс")
                        .Style(Typography.Normal);
                    table
                        .Cell()
                        .Element(BlockLeft)
                        .Text(
                            $"{SeamTask.Seam.TechnologicalProcess.Name} №{SeamTask.Seam.TechnologicalProcess.Number}"
                        )
                        .Style(Typography.Italic);

                    static IContainer BlockCenter(IContainer container) =>
                        Table.BlockCenter(container);

                    static IContainer BlockLeft(IContainer container) => Table.BlockLeft(container);
                });
        });
    }

    private void ComposeWeldPassageInstructionsTable(IContainer container)
    {
        container.Column(column =>
        {
            column.Spacing(2);

            column.Item().Text("Допуски на контролируемые параметры:").Style(Typography.Normal);
            column
                .Item()
                .Table(table =>
                {
                    table.ColumnsDefinition(columns =>
                    {
                        columns.RelativeColumn(0.7F);
                        columns.RelativeColumn(3);
                        columns.RelativeColumn();
                        columns.RelativeColumn();
                        columns.RelativeColumn();
                        columns.RelativeColumn();
                        columns.RelativeColumn();
                        columns.RelativeColumn();
                    });

                    table.Header(header =>
                    {
                        table
                            .Cell()
                            .RowSpan(2)
                            .Element(BlockLeft)
                            .Text("№ п/п")
                            .Style(Typography.Normal);
                        table
                            .Cell()
                            .RowSpan(2)
                            .Element(BlockLeft)
                            .Text("Наименование слоя")
                            .Style(Typography.Normal);
                        table
                            .Cell()
                            .ColumnSpan(2)
                            .Element(BlockLeft)
                            .Text($"Температура предварительного нагрева, °С")
                            .Style(Typography.Normal);
                        table
                            .Cell()
                            .ColumnSpan(2)
                            .Element(BlockLeft)
                            .Text($"Сварочный ток, А")
                            .Style(Typography.Normal);
                        table
                            .Cell()
                            .ColumnSpan(2)
                            .Element(BlockLeft)
                            .Text($"Напряжение на дуге, В")
                            .Style(Typography.Normal);

                        table.Cell().Element(BlockLeft).Text($"Min").Style(Typography.Normal);
                        table.Cell().Element(BlockLeft).Text($"Max").Style(Typography.Normal);
                        table.Cell().Element(BlockLeft).Text($"Min").Style(Typography.Normal);
                        table.Cell().Element(BlockLeft).Text($"Max").Style(Typography.Normal);
                        table.Cell().Element(BlockLeft).Text($"Min").Style(Typography.Normal);
                        table.Cell().Element(BlockLeft).Text($"Max").Style(Typography.Normal);
                    });

                    foreach (
                        var weldPassageInstructions in SeamTask.Seam.TechnologicalInstruction.WeldPassageInstructions
                            .OrderBy(
                                _ => _.Number
                            )
                    )
                    {
                        table
                            .Cell()
                            .Element(BlockLeft)
                            .Text(weldPassageInstructions.Number.ToString())
                            .Style(Typography.Normal);

                        table
                            .Cell()
                            .Element(BlockLeft)
                            .Text(weldPassageInstructions.Name)
                            .Style(Typography.Normal);

                        table
                            .Cell()
                            .Element(BlockLeft)
                            .Text(
                                CheckValueForNull(weldPassageInstructions.PreheatingTemperatureMin)
                            )
                            .Style(Typography.Normal);

                        table
                            .Cell()
                            .Element(BlockLeft)
                            .Text(
                                CheckValueForNull(weldPassageInstructions.PreheatingTemperatureMax)
                            )
                            .Style(Typography.Normal);

                        table
                            .Cell()
                            .Element(BlockLeft)
                            .Text(CheckValueForNull(weldPassageInstructions.WeldingCurrentMin))
                            .Style(Typography.Normal);

                        table
                            .Cell()
                            .Element(BlockLeft)
                            .Text(CheckValueForNull(weldPassageInstructions.WeldingCurrentMax))
                            .Style(Typography.Normal);

                        var arcVoltageMinText = weldPassageInstructions.ArcVoltageMin is not null
                            ? weldPassageInstructions.ArcVoltageMin.ToString()
                            : "-";

                        table
                            .Cell()
                            .Element(BlockLeft)
                            .Text(arcVoltageMinText)
                            .Style(Typography.Normal);

                        var arcVoltageMaxText = weldPassageInstructions.ArcVoltageMax is not null
                            ? weldPassageInstructions.ArcVoltageMax.ToString()
                            : "-";

                        table
                            .Cell()
                            .Element(BlockLeft)
                            .Text(arcVoltageMaxText)
                            .Style(Typography.Normal);
                    }

                    static IContainer BlockLeft(IContainer container) => Table.BlockLeft(container);
                });
        });
    }

    private string CheckValueForNull<T>(T value)
    {
        return (value is not null ? value.ToString() : "-")!;
    }
}