using System.ComponentModel.DataAnnotations.Schema;
using Belaz.WeldingApp.WeldingApi.Domain.Entities.Production;
using Belaz.WeldingApp.WeldingApi.Domain.Entities.TaskInfo;
using Belaz.WeldingApp.WeldingApi.Domain.Entities.Users;
using WeldingApp.Common.Enums;

namespace Belaz.WeldingApp.WeldingApi.Domain.Entities.ProductInfo;

public class ManufacturedSeam : Entity
{
    public Guid SeamId { get; set; }

    [ForeignKey(nameof(SeamId))] 
    public Seam Seam { get; set; } = null!;

    public SeamStatus Status { get; set; } = SeamStatus.Accept;
    
    public string? Reason { get; set; }

    public string? DetectedDefects { get; set; }

    /// <summary>
    /// Добавлен ли вручную
    /// </summary>
    public bool IsAddManually { get; set; }

    public WeldingTask? WeldingTask { get; set; }

    public Guid? InspectorId { get; set; }

    [ForeignKey(nameof(InspectorId))] public Inspector? Inspector { get; set; }
}