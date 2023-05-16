using Belaz.WeldingApp.Common.Entities.IdentityUser;
using Belaz.WeldingApp.Common.Entities.Users;
using Belaz.WeldingApp.Common.Enums;

namespace Belaz.WeldingApp.WeldingApi.DataLayer.Helpers;

public class InspectorGenerator
{
    public static List<Inspector> GenerateInspectors()
    {
        var inspectors = new List<Inspector>
        {
            new Inspector
            {
                Id = Guid.Parse("4e51bb84-8080-487e-8fc5-65fb26793774"),
                IdFromSystem = "249550",
                UserInfo = new UserData
                {
                    Id = Guid.Parse("e1d1df32-89c6-4f53-97af-12a16dee378d"),
                    ServiceNumber = "49550",
                    MiddleName = "Грук",
                    FirstName = "Екатерина",
                    LastName = "Сергеевна",
                    Position = "Контролер сварочных работ",
                    ProductionAreaId = Guid.Parse("57f33be5-0220-4e06-b57c-b674c26ff068"),
                    Role = Role.Inspector
                }
            },
            new Inspector
            {
                Id = Guid.Parse("ceed41bb-9a39-465f-b196-fe2ccb266393"),
                IdFromSystem = "219379",
                UserInfo = new UserData
                {
                    Id = Guid.Parse("5b812036-9e0f-4376-a2ae-2854d7cce5be"),
                    ServiceNumber = "19379",
                    MiddleName = "Шабалинская",
                    FirstName = "Мария",
                    LastName = "Николаевна",
                    Position = "Контролер сварочных работ",
                    ProductionAreaId = Guid.Parse("57f33be5-0220-4e06-b57c-b674c26ff068"),
                    Role = Role.Inspector
                }
            }
        };

        return inspectors;
    }
}