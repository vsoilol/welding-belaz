namespace Belaz.WeldingApp.WeldingApi.Contracts.Requests.Post;

public class CreatePostRequest
{
    public int Number { get; set; }

    public Guid ProductionAreaId { get; set; }
}