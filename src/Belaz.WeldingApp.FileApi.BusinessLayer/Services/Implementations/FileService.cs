using Belaz.WeldingApp.FileApi.BusinessLayer.Services.Interfaces;
using Belaz.WeldingApp.FileApi.Domain.Contants;
using Belaz.WeldingApp.FileApi.Domain.Dtos;
using QuestPDF.Fluent;
using QuestPDF.Helpers;
using QuestPDF.Infrastructure;

namespace Belaz.WeldingApp.FileApi.BusinessLayer.Services.Implementations;

public class FileService : IFileService
{
    public async Task<DocumentDto> GenerateSeamPassportAsync()
    {
        var myReport = Document.Create(container =>
            {
                container.Page(page =>
                {
                    page.Size(PageSizes.A4);
                    page.PageColor(Colors.White);
                    page.DefaultTextStyle(x => x.FontSize(20));
                    page.Content()
                        .Column(column =>
                        {
                            var titleStyle = TextStyle
                                .Default
                                .FontSize(20)
                                .SemiBold()
                                .FontColor(Colors.Blue.Medium);

                            column
                                .Item()
                                .PaddingBottom(10)
                                .Text("Chart example")
                                .Style(titleStyle);
                        });
            
                    page.Footer().AlignCenter().Text(text =>
                    {
                        text.DefaultTextStyle(x => x.Size(16));
        
                        text.CurrentPageNumber();
                        text.Span(" / ");
                        text.TotalPages();
                    });
                });
            });

        byte[] bytes;
        using (var stream = new MemoryStream())
        {
            myReport.GeneratePdf(stream);
            bytes = stream.ToArray();
        }

        var result = new DocumentDto
        {
            FileName = "Паспорт Шва 1.pdf",
            FileType = FileTypes.PdfType,
            Bytes = bytes
        };

        return result;
    }
}