namespace WeldingApp.Common.Models;

public class BadRequestResult
{
    public int StatusCode { get; set; }

    public string Title { get; set; } = default!;

    public object Errors { get; set; } = default!;
}