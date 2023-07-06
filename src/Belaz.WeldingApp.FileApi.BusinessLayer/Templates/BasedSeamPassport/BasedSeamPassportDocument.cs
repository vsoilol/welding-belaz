﻿using Belaz.WeldingApp.FileApi.BusinessLayer.Templates.Helpers;
using Belaz.WeldingApp.FileApi.Domain.Dtos.ProductInfo;
using Belaz.WeldingApp.FileApi.Domain.Dtos.SeamPassportInfo;
using Belaz.WeldingApp.FileApi.Domain.Extensions;
using QuestPDF.Drawing;
using QuestPDF.Fluent;
using QuestPDF.Helpers;
using QuestPDF.Infrastructure;

namespace Belaz.WeldingApp.FileApi.BusinessLayer.Templates.BasedSeamPassport;

public class BasedSeamPassportDocument : IDocument
{
    private readonly string _fontsPath;
    private readonly int? _sequenceNumber;
    private readonly double? _averageIntervalSeconds;
    private readonly double? _secondsToIgnoreBetweenGraphs;

    public BasedSeamPassportDocument(TaskDto task, string fontsPath, int? sequenceNumber,
        double? averageIntervalSeconds, double? secondsToIgnoreBetweenGraphs)
    {
        Task = task;
        _fontsPath = fontsPath;
        _sequenceNumber = sequenceNumber;
        _secondsToIgnoreBetweenGraphs = secondsToIgnoreBetweenGraphs;
        _averageIntervalSeconds = _averageIntervalSeconds;
    }

    public TaskDto Task { get; }

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
            column.Item().Element(ComposeMasterAndWelderTable);
            column.Item().Element(ComposeWeldingEquipmentTable);
            column.Item().Element(ComposeTechnologicalInstructionTable);
            column.Item().Element(ComposeWeldPassageInstructionsTable);
            column.Item().Element(ComposeAdditionalInfoTable);
            column.Item().Element(ComposeInspectorTable);


            IEnumerable<WeldPassageDto> weldPassages = Task.WeldPassages
                .OrderBy(_ => _.Number);

            if (_sequenceNumber.HasValue)
            {
                weldPassages = weldPassages
                    .Where(_ => _.SequenceNumber == _sequenceNumber.Value);
            }

            var weldPassageDtos = weldPassages as WeldPassageDto[] ?? weldPassages.ToArray();
            if (weldPassageDtos.Any())
            {
                column.Item().Element(_ => ComposeWeldPassageInfoTables(_, weldPassageDtos.ToList()));

                column.Item()
                    .Component(
                        new BasedWeldPassageComponent(weldPassageDtos.ToList(),
                            _averageIntervalSeconds,
                            _secondsToIgnoreBetweenGraphs,
                            Task.Seam.TechnologicalInstruction.WeldPassageInstructions,
                            null)
                    );
            }

            // var weldPassagesByNumber = weldPassages.GroupBy(_ => _.Number);
            //
            // foreach (var group in weldPassagesByNumber)
            // {
            //     var number = group.Key; // The common number for the group
            //     var values = group.ToList();
            //
            //     var weldPassageInstruction =
            //         Task.Seam.TechnologicalInstruction.WeldPassageInstructions.FirstOrDefault(
            //             _ => _.Number == number
            //         )!;
            //
            //     column.Item()
            //         .Component(
            //             new BasedWeldPassageComponent(values,
            //                 _averageIntervalSeconds,
            //                 _secondsToIgnoreBetweenGraphs,
            //                 weldPassageInstruction,
            //                 number)
            //         );
            // }
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
                .Text($"{Task.Seam.Workshop.Name} №{Task.Seam.Workshop.Number}")
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
                .Text($"{Task.Seam.ProductionArea.Name} №{Task.Seam.ProductionArea.Number}")
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
            var productInfo = GetProductInfo(Task.Seam.Product);
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
                .Text(_sequenceNumber.HasValue ? _sequenceNumber.Value.ToString() : "-")
                .Style(Typography.Italic);

            table
                .Cell()
                .Row(3)
                .Column(1)
                .Element(BlockLeft)
                .Text("Наименование узла")
                .Style(Typography.Normal);
            var knotInfo = GetProductInfo(Task.Seam.Knot);
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
            var detailInfo = GetProductInfo(Task.Seam.Detail);
            table
                .Cell()
                .Row(4)
                .Column(2)
                .Element(BlockLeft)
                .Text(detailInfo)
                .Style(Typography.Italic);

            table
                .Cell()
                .Row(5)
                .Column(1)
                .Element(BlockLeft)
                .Text("Номер сварного шва")
                .Style(Typography.Normal);
            table
                .Cell()
                .Row(5)
                .Column(2)
                .Element(BlockLeft)
                .Text($"№{Task.Seam.Number}")
                .Style(Typography.Italic);

            static IContainer BlockLeft(IContainer container) => Table.BlockLeft(container);
        });
    }

    private void ComposeMasterAndWelderTable(IContainer container)
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

            table
                .Cell()
                .Row(3)
                .Column(1)
                .Element(BlockLeft)
                .Text("Сварщик")
                .Style(Typography.Normal);
            table
                .Cell()
                .Row(3)
                .Column(2)
                .Element(BlockLeft)
                .Text(
                    Task.Welder is null
                        ? "-"
                        : $"{Task.Welder.MiddleName} {Task.Welder.FirstName} {Task.Welder.LastName}"
                )
                .Style(Typography.Italic);

            static IContainer BlockLeft(IContainer container) => Table.BlockLeft(container);
        });
    }

    private void ComposeWeldingEquipmentTable(IContainer container)
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
                .Text("Наименование оборудования")
                .Style(Typography.Normal);
            table
                .Cell()
                .Column(2)
                .Element(BlockLeft)
                .Text(Task.WeldingEquipment is null ? "-" : $"{Task.WeldingEquipment.Name}")
                .Style(Typography.Italic);

            table
                .Cell()
                .Row(2)
                .Column(1)
                .Element(BlockLeft)
                .Text("Инвентарный номер оборудования")
                .Style(Typography.Normal);
            table
                .Cell()
                .Row(2)
                .Column(2)
                .Element(BlockLeft)
                .Text(
                    Task.WeldingEquipment is null ? "-" : $"№{Task.WeldingEquipment.FactoryNumber}"
                )
                .Style(Typography.Italic);

            table
                .Cell()
                .Row(3)
                .Column(1)
                .Element(BlockLeft)
                .Text("Дата очередной аттестации (ППР)")
                .Style(Typography.Normal);
            table
                .Cell()
                .Row(3)
                .Column(2)
                .Element(BlockLeft)
                .Text(
                    Task.WeldingEquipment?.NextAttestationDate is null
                        ? "-"
                        : $"{Task.WeldingEquipment.NextAttestationDate}"
                )
                .Style(Typography.Italic);

            static IContainer BlockLeft(IContainer container) => Table.BlockLeft(container);
        });
    }

    private void ComposeTechnologicalInstructionTable(IContainer container)
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
                .Row(1)
                .Element(BlockLeft)
                .Text("Инструкция на технологический процесс сварки")
                .Style(Typography.Normal);
            table
                .Cell()
                .Column(2)
                .Row(1)
                .Element(BlockLeft)
                .Text(
                    $"{Task.Seam.TechnologicalInstruction.Name} №{Task.Seam.TechnologicalInstruction.Number}"
                )
                .Style(Typography.Italic);

            table
                .Cell()
                .Column(1)
                .Row(2)
                .Element(BlockLeft)
                .Text("Технологический процесс")
                .Style(Typography.Normal);
            table
                .Cell()
                .Column(2)
                .Row(2)
                .Element(BlockLeft)
                .Text(
                    $"{Task.Seam.TechnologicalProcess.Name} №{Task.Seam.TechnologicalProcess.Number}"
                )
                .Style(Typography.Italic);

            static IContainer BlockLeft(IContainer container) => Table.BlockLeft(container);
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
                        var weldPassageInstructions in Task.Seam.TechnologicalInstruction.WeldPassageInstructions
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
                .Text(Task.Seam.DetectedDefects ?? "-")
                .Style(Typography.Italic);

            table.Cell().Element(BlockLeft).Text("Причины брака").Style(Typography.Normal);
            table
                .Cell()
                .Element(BlockLeft)
                .Text(Task.DefectiveReason ?? "-")
                .Style(Typography.Italic);

            static IContainer BlockLeft(IContainer container) => Table.BlockLeft(container);
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

    private string GetProductInfo(ProductBriefDto? product)
    {
        return product is not null ? $"{product.Name} №{product.Number}" : "-";
    }
}