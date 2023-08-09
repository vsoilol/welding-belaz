using Microsoft.AspNetCore.Http;

namespace Belaz.WeldingApp.FileApi.BusinessLayer.Requests;

public class UploadProductAccountDataRequest
{
    public IFormFile File { get; set; } = null!;

    public string Date { get; set; } = null!;
}