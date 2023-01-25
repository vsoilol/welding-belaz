namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.Seam;

public class UpdateSeamRequest
{
    public Guid Id { get; set; }
    
    public int? Number { get; set; }
    
    /// <summary>
    /// Подлежит ли контролю
    /// </summary>
    public bool? IsControlSubject { get; set; }
    
    public Guid? ProductionAreaId { get; set; }

    public Guid? WorkplaceId { get; set; }
}