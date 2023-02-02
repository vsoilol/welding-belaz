using System.Text;
using Belaz.WeldingApp.FileApi.BusinessLayer.Models.Chart;
using Belaz.WeldingApp.FileApi.BusinessLayer.Templates.Helpers;
using Belaz.WeldingApp.FileApi.Domain.Dtos.SeamPassportInfo;
using Belaz.WeldingApp.FileApi.Domain.Extensions;
using Newtonsoft.Json;
using QuestPDF.Fluent;
using QuestPDF.Infrastructure;
using QuickChart;
using WeldingApp.Common.Extensions;

namespace Belaz.WeldingApp.FileApi.BusinessLayer.Templates.SeamPassport;

public class WeldPassageComponent : IComponent
{
    public WeldPassageComponent(WeldPassageInstructionDto weldPassageInstruction, WeldPassageDto weldPassage)
    {
        WeldPassageInstructionInfo = weldPassageInstruction;
        WeldPassageInfo = weldPassage;
    }

    public WeldPassageInstructionDto WeldPassageInstructionInfo { get; }

    public WeldPassageDto WeldPassageInfo { get; }

    public void Compose(IContainer container)
    {
        container.Column(column =>
        {
            column.Item().PaddingTop(20);
            column.Spacing(10);

            column.Item().Element(ComposePreheatingTemperatureTable);
            column.Item().Element(ComposeWeldInfoTable);
            column.Item().Element(ComposeCharts);
        });
    }

    private void ComposePreheatingTemperatureTable(IContainer container)
    {
        container.Column(column =>
        {
            column.Spacing(2);

            column.Item().Text($"Слой №{WeldPassageInfo.Number}. {WeldPassageInfo.Name}.").Style(Typography.Bold);

            column.Item().Table(table =>
            {
                table.ColumnsDefinition(columns =>
                {
                    columns.RelativeColumn(3);
                    columns.RelativeColumn();
                    columns.RelativeColumn();
                });

                table.Header(header =>
                {
                    table.Cell()
                        .Element(BlockLeft)
                        .Text("Наименование параметра")
                        .Style(Typography.Normal);

                    table.Cell()
                        .Element(BlockLeft)
                        .Text("Значение")
                        .Style(Typography.Normal);

                    table.Cell()
                        .Element(BlockLeft)
                        .Text("Обеспечение допуска")
                        .Style(Typography.Normal);
                });

                var ensuringAccessText = GetYesOrNoByCondition(WeldPassageInfo.PreheatingTemperature <=
                                                               WeldPassageInstructionInfo.PreheatingTemperatureMax &&
                                                               WeldPassageInfo.PreheatingTemperature >=
                                                               WeldPassageInstructionInfo.PreheatingTemperatureMin);

                table.Cell()
                    .Element(BlockLeft)
                    .Text("Температура предварительного нагрева, °С")
                    .Style(Typography.Normal);

                table.Cell()
                    .Element(BlockCenter)
                    .Text(WeldPassageInfo.PreheatingTemperature.ToString())
                    .Style(Typography.Italic);

                table.Cell()
                    .Element(BlockCenter)
                    .Text(ensuringAccessText)
                    .Style(Typography.Italic);

                static IContainer BlockCenter(IContainer container) => Table.BlockCenter(container);
                static IContainer BlockLeft(IContainer container) => Table.BlockLeft(container);
            });
        });
    }

    private void ComposeWeldInfoTable(IContainer container)
    {
        container.Table(table =>
        {
            table.ColumnsDefinition(columns =>
            {
                columns.RelativeColumn(3);
                columns.RelativeColumn();
                columns.RelativeColumn();
            });

            table.Header(header =>
            {
                table.Cell()
                    .Element(BlockLeft)
                    .Text("Наименование параметра")
                    .Style(Typography.Normal);

                table.Cell()
                    .ColumnSpan(2)
                    .Element(BlockCenter)
                    .Text("Значение")
                    .Style(Typography.Normal);
            });

            table.Cell()
                .Element(BlockLeft)
                .Text("Время начала сварки")
                .Style(Typography.Normal);

            table.Cell()
                .ColumnSpan(2)
                .Element(BlockCenter)
                .Text(WeldPassageInfo.WeldingStartTime.ToHoursMinutesSecondsString())
                .Style(Typography.Italic);

            var weldTimeString = TimeSpan
                .FromSeconds(WeldPassageInfo.WeldingEndTime.Subtract(WeldPassageInfo.WeldingStartTime).TotalSeconds)
                .ToMinutesSecondsString();

            table.Cell()
                .Element(BlockLeft)
                .Text("Время сварки, мин")
                .Style(Typography.Normal);

            table.Cell()
                .ColumnSpan(2)
                .Element(BlockCenter)
                .Text(weldTimeString)
                .Style(Typography.Italic);

            table.Cell()
                .RowSpan(2)
                .Element(BlockLeft)
                .Text("Суммарное время выхода параметров за пределы допустимых значений, мин")
                .Style(Typography.Normal);

            table.Cell()
                .Element(BlockCenter)
                .Text("Кратковременно, до 1 с.")
                .Style(Typography.Normal);

            table.Cell()
                .Element(BlockCenter)
                .Text("Длительно, свыше 1 с.")
                .Style(Typography.Normal);

            table.Cell()
                .Element(BlockCenter)
                .Text(CheckValueForNull(WeldPassageInfo.ShortTermDeviation))
                .Style(Typography.Italic);

            table.Cell()
                .Element(BlockCenter)
                .Text(CheckValueForNull(WeldPassageInfo.LongTermDeviation))
                .Style(Typography.Italic);

            static IContainer BlockCenter(IContainer container) => Table.BlockCenter(container);
            static IContainer BlockLeft(IContainer container) => Table.BlockLeft(container);
        });
    }

    private void ComposeCharts(IContainer container)
    {
        container.Column(column =>
        {
            column.Spacing(2);

            column.Item().Text("Графики").Style(Typography.Normal);

            var arcVoltageChartImageBytes = DownloadImage(GetArcVoltageChartImageUrl());

            //column.Item().Image(arcVoltageChartImageBytes, ImageScaling.FitArea);
        });
    }

    private string CheckValueForNull<T>(T value)
    {
        return (value is not null ? value.ToString() : "-")!;
    }

    private string GetYesOrNoByCondition(bool condition)
    {
        return condition ? "Да" : "Нет";
    }

    private string GetArcVoltageChartImageUrl()
    {
        var weldingStartTimeTemp = WeldPassageInfo.WeldingStartTime;
        var labels = WeldPassageInfo.ArcVoltageValues.Select(x =>
        {
            var label = weldingStartTimeTemp.ToHoursMinutesSecondsString();
            weldingStartTimeTemp = weldingStartTimeTemp.Add(TimeSpan.FromSeconds(0.1));
            return label;
        });

        var chartConfig = new ChartConfig
        {
            Type = "line",
            Data = new ChartData
            {
                Labels = labels.ToArray(),
            },
            Options = new ChartOptions
            {
                Responsive = true,
                Plugins = new ChartPlugins
                {
                    Legend = new ChartLegend
                    {
                        Position = "top",
                        Labels = new ChartLabels
                        {
                            Font = new ChartFont
                            {
                                Size = 20
                            }
                        }
                    },
                    Title = new ChartTitle
                    {
                        Display = true,
                        Text = $"Показания напряжения на дуге по слою №{WeldPassageInfo.Number}, В",
                        FullSize = true,
                        Font = new ChartFont
                        {
                            Size = 24,
                        }
                    }
                },
                Elements = new ChartElements
                {
                    Point = new ChartPoint
                    {
                        Radius = 1
                    },
                    Line = new ChartLine
                    {
                        BorderWidth = 1
                    }
                }
            }
        };
        
        

        /**/

        if (WeldPassageInstructionInfo.ArcVoltageMin is null && WeldPassageInstructionInfo.ArcVoltageMax is null)
        {
            chartConfig.Data.Datasets = new ChartDatasets[]
            {
                new()
                {
                    Data = WeldPassageInfo.ArcVoltageValues,
                    Label = "Показания напряжения, В",
                    BackgroundColor = "rgba(0, 35, 255, 1)",
                    BorderColor = "rgba(0, 35, 255, 1)",
                    Fill = false
                }
            };
        }
        else
        {
            chartConfig.Data.Datasets = new ChartDatasets[]
            {
                new()
                {
                    Data = WeldPassageInfo.ArcVoltageValues
                        .Select(_ => (double)WeldPassageInstructionInfo.ArcVoltageMax!).ToArray(),
                    Label = "Максимум, В",
                    BackgroundColor = "rgba(133, 0, 0, 1)",
                    BorderColor = "rgba(133, 0, 0, 1)",
                    Fill = false
                },
                new()
                {
                    Data = WeldPassageInfo.ArcVoltageValues,
                    Label = "Показания напряжения, В",
                    BackgroundColor = "rgba(0, 35, 255, 1)",
                    BorderColor = "rgba(0, 35, 255, 1)",
                    Fill = false
                },
                new()
                {
                    Data = WeldPassageInfo.ArcVoltageValues
                        .Select(_ => (double)WeldPassageInstructionInfo.ArcVoltageMin!).ToArray(),
                    Label = "Минимум, В",
                    BackgroundColor = "rgba(0, 18, 133, 1)",
                    BorderColor = "rgba(0, 18, 133, 1)",
                    Fill = false
                },
            };
        }

        /*chartConfig = new ChartConfig
        {
            Type = "bar",
            Data = new ChartData
            {
                Labels = new[] { "Q1", "Q2", "Q3", "Q4" },
                Datasets = new ChartDatasets[]
                {
                    new ChartDatasets
                    {
                        Label = "Users",
                        Data = new double[]{50, 60, 70, 180}
                    }
                }
            },
            Options = new ChartOptions
            {
                Title = new ChartTitle
                {
                    Text = "Basic chart title"
                }
            }
        };*/
        
        var content = JsonConvert.SerializeObject(chartConfig);

        var engine = new Jurassic.ScriptEngine();
        engine.SetGlobalValue("imgData", 0);
        engine.ExecuteFile(@"C:\Data\test.js");
        var imgData = engine.GetGlobalValue<byte[]>("imgData");

        var contentBase64 = Base64Encode(content);
        
        Chart qc = new Chart();
        /*qc.Width = 500;
        qc.Height = 300;*/
        qc.Version = "4.2.0";
        qc.Config = content;

        var url = qc.GetShortUrl();
        
        /*
        var stringContent =  new StringContent(
            JsonConvert.SerializeObject(chartConfig),
            Encoding.Ba,
            "application/json"
        )
        */
        
        using var httpClient = new HttpClient();

        /*var perfResp = AsyncHelper.RunSync(() => httpClient.PostAsync(
            "https://quickchart.io/chart/create",
           
        ));*/
        
        //var perfRespData = AsyncHelper.RunSync(() => perfResp.Content.ReadAsStringAsync());

        //var chartResponse = JsonConvert.DeserializeObject<ChartResponse>(perfRespData);
        //var perfRespData = await perfResp.Content.ReadAsStringAsync();

        return $"https://image-charts.com/chart.js/2.8.0?bkg=white&c={contentBase64}&encoding=base64";
    }
    
    public static string Base64Encode(string plainText) {
        var plainTextBytes = System.Text.Encoding.UTF8.GetBytes(plainText);
        return System.Convert.ToBase64String(plainTextBytes);
    }

    private byte[] DownloadImage(string imageUrl)
    {
        var uri = new Uri(imageUrl);

        using var httpClient = new HttpClient();

        // Get the file extension
        var uriWithoutQuery = uri.GetLeftPart(UriPartial.Path);
        var fileExtension = Path.GetExtension(uriWithoutQuery);

        // Download the image and write to the file
        // ReSharper disable once AccessToDisposedClosure
       // var bytes = AsyncHelper.RunSync(() => httpClient.GetByteArrayAsync(uri));
        return new byte[]{1};
    }
}