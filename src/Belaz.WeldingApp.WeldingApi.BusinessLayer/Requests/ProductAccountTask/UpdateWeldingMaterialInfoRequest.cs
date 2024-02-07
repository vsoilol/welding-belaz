namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.ProductAccountTask;

public class UpdateWeldingMaterialInfoRequest
{
    public Guid Id { get; set; }

    /// <summary>
    /// Сварочные материалы
    /// </summary>
    public string? WeldingMaterial { get; set; }

    /// <summary>
    /// № сертификата (партии) св. материала
    /// </summary>
    public string? WeldingMaterialBatchNumber { get; set; }
}