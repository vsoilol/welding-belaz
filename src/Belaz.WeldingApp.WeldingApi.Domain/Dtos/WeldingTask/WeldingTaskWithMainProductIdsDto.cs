namespace Belaz.WeldingApp.WeldingApi.Domain.Dtos.WeldingTask;

public class WeldingTaskWithMainProductIdsDto
{
    public Guid WeldingTaskId { get; set; }
    
    public Guid MainProductId { get; set; }
}