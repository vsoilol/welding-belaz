using System.ComponentModel.DataAnnotations.Schema;

namespace Belaz.WeldingApp.Common.Entities.TaskInfo;

public class DefectiveReason : Entity
{
    public DateTime DetectedDefectiveDate { get; set; }

    public string Reason { get; set; } = null!;

    public string DetectedDefects { get; set; } = null!;

    public Guid WeldingTaskId { get; set; }

    [ForeignKey(nameof(WeldingTaskId))]
    public WeldingTask WeldingTask { get; set; } = null!;
}
