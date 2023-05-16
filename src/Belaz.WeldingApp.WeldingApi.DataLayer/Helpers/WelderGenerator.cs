using Belaz.WeldingApp.Common.Entities.IdentityUser;
using Belaz.WeldingApp.Common.Entities.Users;
using Belaz.WeldingApp.Common.Entities.WeldingEquipmentInfo;
using Belaz.WeldingApp.Common.Enums;

namespace Belaz.WeldingApp.WeldingApi.DataLayer.Helpers;

public class WelderGenerator
{
    public static List<Welder> GenerateWelders(List<WeldingEquipment> weldingEquipments)
    {
        var weldingEquipment49141 = weldingEquipments.FirstOrDefault(_ => _.IdFromSystem == "49141")!;
        var weldingEquipment49283 = weldingEquipments.FirstOrDefault(_ => _.IdFromSystem == "49283")!;
        var weldingEquipment49286 = weldingEquipments.FirstOrDefault(_ => _.IdFromSystem == "49286")!;
        var weldingEquipment49232 = weldingEquipments.FirstOrDefault(_ => _.IdFromSystem == "49232")!;
        
        var welders = new List<Welder>
        {
            new Welder
            {
                Id = Guid.Parse("285c7225-d2cb-487f-b8b7-a5205e3dd41b"),
                IdFromSystem = "150882",
                WeldingEquipments = new List<WeldingEquipment>
                {
                    weldingEquipment49141,
                    weldingEquipment49283
                },
                UserInfo = new UserData
                {
                    Id = Guid.Parse("29a5eb5c-478d-4156-ad77-46cdb5779b61"),
                    RfidTag = "17:CD:7F:5A",
                    ServiceNumber = "50882",
                    MiddleName = "Буландо",
                    FirstName = "Юрий",
                    LastName = "Сергеевич",
                    Position = "Электросварщик на автоматических и полуавтоматических машинах",
                    ProductionAreaId = Guid.Parse("57f33be5-0220-4e06-b57c-b674c26ff068"),
                    Role = Role.Welder
                }
            },
            new Welder
            {
                Id = Guid.Parse("7e0519ae-a0cf-4fba-b678-359b93ee3642"),
                IdFromSystem = "146164",
                WeldingEquipments = new List<WeldingEquipment>
                {
                    weldingEquipment49141,
                    weldingEquipment49283
                },
                UserInfo = new UserData
                {
                    Id = Guid.Parse("a056ae81-9750-46e8-a1f0-6f85e6845015"),
                    RfidTag = "27:45:7E:B4",
                    ServiceNumber = "46164",
                    MiddleName = "Михейчик",
                    FirstName = "Александр",
                    LastName = "Васильевич",
                    Position = "Электросварщик на автоматических и полуавтоматических машинах",
                    ProductionAreaId = Guid.Parse("57f33be5-0220-4e06-b57c-b674c26ff068"),
                    Role = Role.Welder
                }
            },
            new Welder
            {
                Id = Guid.Parse("2881ef4f-7783-4d22-8ff4-847d9bf70b13"),
                IdFromSystem = "121267",
                WeldingEquipments = new List<WeldingEquipment> { weldingEquipment49232 },
                UserInfo = new UserData
                {
                    Id = Guid.Parse("4de2c415-5229-442a-bf81-62c543f67446"),
                    RfidTag = "B7:5A:79:B5",
                    ServiceNumber = "21267",
                    MiddleName = "Казинец",
                    FirstName = "Василий",
                    LastName = "Владимирович",
                    Position = "Электросварщик на автоматических и полуавтоматических машинах",
                    ProductionAreaId = Guid.Parse("57f33be5-0220-4e06-b57c-b674c26ff068"),
                    Role = Role.Welder
                }
            },
            new Welder
            {
                Id = Guid.Parse("63d79615-e349-4cf0-8f38-816277172795"),
                IdFromSystem = "117390",
                WeldingEquipments = new List<WeldingEquipment> { weldingEquipment49232 },
                UserInfo = new UserData
                {
                    Id = Guid.Parse("5e9706ed-9a44-455b-b599-230e5822df9f"),
                    RfidTag = "67:5A:70:B4",
                    ServiceNumber = "17390",
                    MiddleName = "Казачёнок",
                    FirstName = "Сергей",
                    LastName = "Анатольевич",
                    Position = "Электросварщик на автоматических и полуавтоматических машинах",
                    ProductionAreaId = Guid.Parse("57f33be5-0220-4e06-b57c-b674c26ff068"),
                    Role = Role.Welder
                }
            },
            new Welder
            {
                Id = Guid.Parse("120b75d9-39ca-4280-bd39-abf3edfdc577"),
                IdFromSystem = "132695",
                WeldingEquipments = new List<WeldingEquipment> { weldingEquipment49286 },
                UserInfo = new UserData
                {
                    Id = Guid.Parse("9b5f302b-f6ce-40e6-a294-5cef58bef456"),
                    RfidTag = "D7:95:55:B4",
                    ServiceNumber = "32695",
                    MiddleName = "Виторский",
                    FirstName = "Владимир",
                    LastName = "Францевич",
                    Position = "Электросварщик на автоматических и полуавтоматических машинах",
                    ProductionAreaId = Guid.Parse("57f33be5-0220-4e06-b57c-b674c26ff068"),
                    Role = Role.Welder
                }
            },
            new Welder
            {
                Id = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
                IdFromSystem = "122575",
                WeldingEquipments = new List<WeldingEquipment> { weldingEquipment49286 },
                UserInfo = new UserData
                {
                    Id = Guid.Parse("4aae0c43-0edf-4e49-87db-043bbec1ebc5"),
                    ServiceNumber = "22575",
                    RfidTag = "67:CD:7E:5A",
                    MiddleName = "Костюкевич",
                    FirstName = "Максим",
                    LastName = "Александрович",
                    Position = "Электросварщик на автоматических и полуавтоматических машинах",
                    ProductionAreaId = Guid.Parse("57f33be5-0220-4e06-b57c-b674c26ff068"),
                    Role = Role.Welder
                }
            },
            new Welder
            {
                Id = Guid.Parse("04ad8b7d-7c32-432e-95b2-df9291291d66"),
                IdFromSystem = "114729",
                WeldingEquipments = new List<WeldingEquipment>
                {
                    weldingEquipment49141,
                    weldingEquipment49283
                },
                UserInfo = new UserData
                {
                    Id = Guid.Parse("028b5ac3-8122-41fe-bbbc-36b056ca9fd8"),
                    ServiceNumber = "14729",
                    RfidTag = "D7:F1:7D:5A",
                    MiddleName = "Казинец",
                    FirstName = "Виталий",
                    LastName = "Владимирович",
                    Position = "Электросварщик на автоматических и полуавтоматических машинах",
                    ProductionAreaId = Guid.Parse("57f33be5-0220-4e06-b57c-b674c26ff068"),
                    Role = Role.Welder
                }
            },
            new Welder
            {
                Id = Guid.Parse("19e2fbf9-e0dd-4d50-90fa-dff60ebbaf6e"),
                IdFromSystem = "150838",
                WeldingEquipments = new List<WeldingEquipment>
                {
                    weldingEquipment49141,
                    weldingEquipment49283
                },
                UserInfo = new UserData
                {
                    Id = Guid.Parse("90c5adb1-c374-4a62-ac69-5e37fd2bb06a"),
                    ServiceNumber = "50838",
                    RfidTag = "97:17:60:B4",
                    MiddleName = "Зубковский",
                    FirstName = "Валерий",
                    LastName = "Сергеевич",
                    Position = "Электросварщик на автоматических и полуавтоматических машинах",
                    ProductionAreaId = Guid.Parse("57f33be5-0220-4e06-b57c-b674c26ff068"),
                    Role = Role.Welder
                }
            }
        };

        return welders;
    }
}