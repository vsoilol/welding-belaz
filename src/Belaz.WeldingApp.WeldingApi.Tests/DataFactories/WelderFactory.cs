using Belaz.WeldingApp.Common.Entities.IdentityUser;
using Belaz.WeldingApp.Common.Entities.Users;
using Belaz.WeldingApp.Common.Enums;

namespace Belaz.WeldingApp.WeldingApi.Tests.DataFactories;

public static class WelderFactory
{
    public static List<Welder> GetWelderList()
    {
        var welders = new List<Welder>()
        {
            new Welder
            {
                Id = Guid.NewGuid(),
                IdFromSystem = "150882",
                UserInfo = new UserData
                {
                    Id = Guid.NewGuid(),
                    RfidTag = "17:CD:7F:5A",
                    ServiceNumber = "50882",
                    MiddleName = "Буландо",
                    FirstName = "Юрий",
                    LastName = "Сергеевич",
                    Position = "Электросварщик на автоматических и полуавтоматических машинах",
                    Role = Role.Welder
                }
            },
            new Welder
            {
                Id = Guid.NewGuid(),
                IdFromSystem = "146164",
                UserInfo = new UserData
                {
                    Id = Guid.NewGuid(),
                    RfidTag = "27:45:7E:B4",
                    ServiceNumber = "46164",
                    MiddleName = "Михейчик",
                    FirstName = "Александр",
                    LastName = "Васильевич",
                    Position = "Электросварщик на автоматических и полуавтоматических машинах",
                    Role = Role.Welder
                }
            },
            new Welder
            {
                Id = Guid.NewGuid(),
                IdFromSystem = "121267",
                UserInfo = new UserData
                {
                    Id = Guid.NewGuid(),
                    RfidTag = "B7:5A:79:B5",
                    ServiceNumber = "21267",
                    MiddleName = "Казинец",
                    FirstName = "Василий",
                    LastName = "Владимирович",
                    Position = "Электросварщик на автоматических и полуавтоматических машинах",
                    Role = Role.Welder
                }
            },
        };

        return welders;
    }
}