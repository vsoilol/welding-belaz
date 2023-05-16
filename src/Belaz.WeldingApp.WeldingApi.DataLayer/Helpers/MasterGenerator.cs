using Belaz.WeldingApp.Common.Entities.IdentityUser;
using Belaz.WeldingApp.Common.Entities.Users;
using Belaz.WeldingApp.Common.Entities.WeldingEquipmentInfo;
using Belaz.WeldingApp.Common.Enums;

namespace Belaz.WeldingApp.WeldingApi.DataLayer.Helpers;

public class MasterGenerator
{
    public static List<Master> GenerateMasters(List<WeldingEquipment> weldingEquipments)
    {
        var masters = new List<Master>
        {
            new Master
            {
                Id = Guid.Parse("41858470-6bbf-47f1-9a37-6a071033cf38"),
                IdFromSystem = "614962",
                UserInfo = new UserData
                {
                    Id = Guid.Parse("fdc99a67-e252-48dc-ab43-07fdc94fedda"),
                    ServiceNumber = "14962",
                    MiddleName = "Алёксов",
                    FirstName = "Геннадий",
                    LastName = "Александрович",
                    Position = "Мастер производственного участка",
                    ProductionAreaId = Guid.Parse("57f33be5-0220-4e06-b57c-b674c26ff068"),
                    Role = Role.Master
                },
            },
            new Master
            {
                Id = Guid.Parse("d2fa10a5-7f35-47d3-82e1-708e9ca42ab3"),
                IdFromSystem = "610422",
                WeldingEquipments = weldingEquipments,
                UserInfo = new UserData
                {
                    Id = Guid.Parse("7f1d8dd5-6649-48da-8657-87fb2cde3739"),
                    ServiceNumber = "10422",
                    MiddleName = "Беляцкий",
                    FirstName = "Сергей",
                    LastName = "Николаевич",
                    Position = "Мастер производственного участка",
                    ProductionAreaId = Guid.Parse("57f33be5-0220-4e06-b57c-b674c26ff068"),
                    Role = Role.Master
                },
            }
        };

        return masters;
    }
}