using Belaz.WeldingApp.Common.Enums;

namespace Belaz.WeldingApp.FileApi.BusinessLayer.Models;

public class UserModel
{
    public string PersonNumber { get; set; } = null!;

    public string FirstName { get; set; } = null!;
    
    public string SecondName { get; set; } = null!;
    
    public string LastName { get; set; } = null!;
    
    public string Position { get; set; } = null!;

    public int Workshop { get; set; }
    
    public int ProductionArea { get; set; }
    
    public int Workplace { get; set; }
    
    public Role Role { get; set; }

    public List<WeldingEquipmentBriefModel> WeldingEquipments { get; set; }

    public UserModel()
    {
        WeldingEquipments = new List<WeldingEquipmentBriefModel>();
    }
}