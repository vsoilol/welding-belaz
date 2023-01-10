namespace Belaz.WeldingApp.WeldingApi.Contracts.Requests.Seam;

public class CreateSeamRequest
{
    public int Number { get; set; }
    
    /// <summary>
    /// Подлежит ли контролю
    /// </summary>
    public bool IsControlSubject { get; set; }
    
    public Guid ProductionAreaId { get; set; }

    public Guid? WorkplaceId { get; set; }
}