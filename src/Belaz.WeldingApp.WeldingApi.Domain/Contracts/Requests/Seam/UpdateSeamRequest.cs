namespace Belaz.WeldingApp.WeldingApi.Domain.Contracts.Requests.Seam;

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