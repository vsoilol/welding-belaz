using Belaz.WeldingApp.Common.Entities.Production;
using Belaz.WeldingApp.Common.Entities.WeldingEquipmentInfo;

namespace Belaz.WeldingApp.WeldingApi.DataLayer.Helpers;

public class WeldingEquipmentGenerator
{
    public static List<WeldingEquipment> GenerateWeldingEquipments(List<Workplace> workplaces)
    {
        var workplace3610 =
            workplaces.FirstOrDefault(_ => _.IdFromSystem == "3610")!;

        var workplace3500 =
            workplaces.FirstOrDefault(_ => _.IdFromSystem == "3500")!;

        var workplace3600 =
            workplaces.FirstOrDefault(_ => _.IdFromSystem == "3600")!;

        var workplace3690 =
            workplaces.FirstOrDefault(_ => _.IdFromSystem == "3690")!;

        var workplace3550 =
            workplaces.FirstOrDefault(_ => _.IdFromSystem == "3550")!;

        var workplace3510 =
            workplaces.FirstOrDefault(_ => _.IdFromSystem == "3510")!;

        var weldingEquipments = new List<WeldingEquipment>
        {
            new WeldingEquipment
            {
                Id = Guid.Parse("7895122d-186d-47ea-9a69-463515f335d6"),
                IdFromSystem = "49141",
                Name = "Полуавтомат сварочный",
                Marking = "GLC556-C",
                FactoryNumber = "49141",
                CommissioningDate = new DateTime(2005, 1, 28),
                GroupNumber = "3.11",
                ManufacturerName = "CLOOS",
                WeldingProcess = "Полуавтоматическая сварка",
                RfidTag = "93:57:D8:0B",
                WeldingCurrentMin = 80,
                WeldingCurrentMax = 550,
                ArcVoltageMin = 18,
                ArcVoltageMax = 41.5,
                LoadDuration = 100,
                IdleVoltage = 70,
                Workplaces = new List<Workplace>
                {
                    workplace3500,
                    workplace3550,
                    workplace3690,
                    workplace3610
                }
            },
            new WeldingEquipment
            {
                Id = Guid.Parse("a8cfb5f9-0d7e-402e-a4aa-b618088d1d7a"),
                IdFromSystem = "49286",
                Name = "Полуавтомат сварочный",
                Marking = "GLC556-C",
                FactoryNumber = "49286",
                CommissioningDate = new DateTime(2010, 7, 29),
                GroupNumber = "3.11",
                ManufacturerName = "CLOOS",
                WeldingProcess = "Полуавтоматическая сварка",
                RfidTag = "35:4E:AC:A5",
                WeldingCurrentMin = 80,
                WeldingCurrentMax = 550,
                ArcVoltageMin = 18,
                ArcVoltageMax = 41.5,
                LoadDuration = 100,
                IdleVoltage = 70,
                Workplaces = new List<Workplace> { workplace3500, workplace3510 }
            },
            new WeldingEquipment
            {
                Id = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                IdFromSystem = "49232",
                Name = "Полуавтомат сварочный",
                Marking = "GLC556-C",
                FactoryNumber = "49232",
                CommissioningDate = new DateTime(2008, 10, 31),
                GroupNumber = "3.11",
                ManufacturerName = "CLOOS",
                WeldingProcess = "Полуавтоматическая сварка",
                RfidTag = "03:3D:93:0D",
                WeldingCurrentMin = 80,
                WeldingCurrentMax = 550,
                ArcVoltageMin = 18,
                ArcVoltageMax = 41.5,
                LoadDuration = 100,
                IdleVoltage = 70,
                Workplaces = new List<Workplace> { workplace3610, workplace3600 }
            },
            new WeldingEquipment
            {
                Id = Guid.Parse("a623d6e5-7a95-4c22-addb-35ec1a76e606"),
                IdFromSystem = "49283",
                Name = "Полуавтомат сварочный",
                Marking = "GLC556-C",
                FactoryNumber = "49283",
                CommissioningDate = new DateTime(2008, 10, 31),
                GroupNumber = "3.11",
                ManufacturerName = "CLOOS",
                WeldingProcess = "Полуавтоматическая сварка",
                RfidTag = "A6:F1:CF:48",
                WeldingCurrentMin = 10,
                WeldingCurrentMax = 500,
                ArcVoltageMin = 14.5,
                ArcVoltageMax = 39,
                LoadDuration = 100,
                IdleVoltage = 70,
                Workplaces = new List<Workplace>
                {
                    workplace3500,
                    workplace3550,
                    workplace3690,
                    workplace3610
                }
            }
        };

        return weldingEquipments;
    }
}