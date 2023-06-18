namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.WeldingTask;

public class UpdateWeldingMaterialInfoByDateRequest
{
    public string Date { get; set; } = null!;
    
    /// <summary>
    /// Сварочные материалы
    /// </summary>
    public string? WeldingMaterial { get; set; }

    /// <summary>
    /// № сертификата (партии) св. материала
    /// </summary>
    public string? WeldingMaterialBatchNumber { get; set; }
}