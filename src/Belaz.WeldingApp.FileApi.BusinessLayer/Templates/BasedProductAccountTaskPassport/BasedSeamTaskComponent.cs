using System.Collections.Concurrent;
using Belaz.WeldingApp.FileApi.BusinessLayer.Models;
using Belaz.WeldingApp.FileApi.BusinessLayer.Templates.ChartsGenerators;
using Belaz.WeldingApp.FileApi.BusinessLayer.Templates.Helpers;
using Belaz.WeldingApp.FileApi.BusinessLayer.Templates.ProductAccountTaskPassport;
using Belaz.WeldingApp.FileApi.Domain.Dtos.SeamPassportInfo;
using Belaz.WeldingApp.FileApi.Domain.Extensions;
using QuestPDF.Fluent;
using QuestPDF.Infrastructure;

namespace Belaz.WeldingApp.FileApi.BusinessLayer.Templates.BasedProductAccountTaskPassport;

public class BasedSeamTaskComponent : IComponent
{
    private readonly double? _averageIntervalSeconds;
    private readonly double? _secondsToIgnoreBetweenGraphs;

    public BasedSeamTaskComponent(TaskBriefDto seamTask, double? averageIntervalSeconds,
        double? secondsToIgnoreBetweenGraphs)
    {
        SeamTask = seamTask;
        _averageIntervalSeconds = averageIntervalSeconds;
        _secondsToIgnoreBetweenGraphs = secondsToIgnoreBetweenGraphs;
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

            IEnumerable<WeldPassageDto> weldPassages = SeamTask.WeldPassages
                .OrderBy(_ => _.Number);

            var weldPassageDtos = weldPassages as WeldPassageDto[] ?? weldPassages.ToArray();
            if (weldPassageDtos.Any())
            {
                column.Item().Element(_ => ComposeWeldPassageInfoTables(_, weldPassageDtos.ToList()));

                column.Item()
                    .Component(
                        new BasedWeldPassageComponent(weldPassageDtos.ToList(),
                            _averageIntervalSeconds,
                            _secondsToIgnoreBetweenGraphs,
                            SeamTask.Seam.TechnologicalInstruction.WeldPassageInstructions,
                            null)
                    );
            }
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
    
     private void ComposeWeldPassageInfoTables(IContainer container, IReadOnlyList<WeldPassageDto> weldPassages)
    {
        container.Table(table =>
        {
            table.ColumnsDefinition(columns =>
            {
                columns.RelativeColumn();
                columns.RelativeColumn();
            });

            var firstWeldPassage = weldPassages[0];
            var lastWeldPassage = weldPassages[^1];

            table
                .Cell()
                .Element(BlockLeft)
                .Text("Наименование параметра")
                .Style(Typography.Normal);

            table
                .Cell()
                .Element(BlockLeft)
                .Text("Значение")
                .Style(Typography.Normal);

            table
                .Cell()
                .Element(BlockLeft)
                .Text("Время начала сварки")
                .Style(Typography.Normal);

            table
                .Cell()
                .Element(BlockLeft)
                .Text(firstWeldPassage.WeldingStartTime.ToHoursMinutesSecondsString())
                .Style(Typography.Normal);

            table
                .Cell()
                .Element(BlockLeft)
                .Text("Время окончания сварки")
                .Style(Typography.Normal);

            table
                .Cell()
                .Element(BlockLeft)
                .Text(lastWeldPassage.WeldingEndTime.ToHoursMinutesSecondsString())
                .Style(Typography.Normal);

            table
                .Cell()
                .Element(BlockLeft)
                .Text("Суммарное время сварки, мин")
                .Style(Typography.Normal);

            table
                .Cell()
                .Element(BlockLeft)
                .Text($"{(lastWeldPassage.WeldingEndTime - firstWeldPassage.WeldingStartTime).TotalMinutes:0.00}")
                .Style(Typography.Normal);

            table
                .Cell()
                .Element(BlockLeft)
                .Text("Суммарное время длительного (свыше 5 с.) выхода параметров за пределы допустимых значений, мин")
                .Style(Typography.Normal);

            var sumLongTermDeviation = weldPassages.Sum(_ => _.LongTermDeviation);

            table
                .Cell()
                .Element(BlockLeft)
                .Text(sumLongTermDeviation.HasValue ? $"{sumLongTermDeviation.Value:0.00}" : "0.00")
                .Style(Typography.Normal);

            static IContainer BlockLeft(IContainer container) => Table.BlockLeft(container);
        });
    }

    private string CheckValueForNull<T>(T value)
    {
        return (value is not null ? value.ToString() : "-")!;
    }
}