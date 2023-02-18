using System.Text.Json.Serialization;

namespace Belaz.WeldingApp.RegistarApi.BusinessLayer.Responses;

public class WelderWithEquipmentResponse
{
    [JsonPropertyName("EplID")]
    public Guid WelderId { get; set; }
    
    [JsonPropertyName("FirstN")]
    public string FirstName { get; set; } = null!;

    [JsonPropertyName("LastN")]
    public string LastName { get; set; } = null!;

    [JsonPropertyName("SecN")]
    public string MiddleName { get; set; } = null!;
    
    [JsonPropertyName("Pos")]
    public string? Position { get; set; }

    /// <summary>
    /// Табельный номер 
    /// </summary>
    [JsonPropertyName("PersN")]
    public string? ServiceNumber { get; set; }
    
    [JsonPropertyName("EqpID")]
    public Guid EquipmentId { get; set; }
    
    [JsonPropertyName("EqpT")]
    public string EquipmentName { get; set; } = null!;
    
    /// <summary>
    /// Маркировка
    /// </summary>
    [JsonPropertyName("EqpM")]
    public string EquipmentMarking { get; set; } = null!;

    /// <summary>
    /// Заводской (инвентарный) номер
    /// </summary>
    [JsonPropertyName("InvN")]
    public string EquipmentFactoryNumber { get; set; } = null!;
    
    [JsonPropertyName("WSID")]
    public Guid WorkshopId { get; set; }
    
    [JsonPropertyName("WST")]
    public string WorkshopName { get; set; } = null!;

    [JsonPropertyName("WSN")]
    public int WorkshopNumber { get; set; }
    
    [JsonPropertyName("ProdArID")]
    public Guid ProductionAreaId { get; set; }
    
    [JsonPropertyName("ProdArT")]
    public string ProductionAreaName { get; set; } = null!;

    [JsonPropertyName("ProdArN")]
    public int ProductionAreaNumber { get; set; }
    
    [JsonPropertyName("PostID")]
    public Guid? PostId { get; set; }

    [JsonPropertyName("PostN")]
    public int? PostNumber { get; set; }
    
    [JsonPropertyName("WorkPlID")]
    public Guid? WorkplaceId { get; set; }

    [JsonPropertyName("WorkPlN")]
    public int? WorkplaceNumber { get; set; }
}