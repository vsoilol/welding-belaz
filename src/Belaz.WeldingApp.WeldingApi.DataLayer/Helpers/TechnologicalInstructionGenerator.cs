using Belaz.WeldingApp.Common.Entities.TechnologicalProcessInfo;

namespace Belaz.WeldingApp.WeldingApi.DataLayer.Helpers;

public class TechnologicalInstructionGenerator
{
    public static List<TechnologicalInstruction> GenerateTechnologicalInstructions()
    {
        var technologicalInstructions = new List<TechnologicalInstruction>
        {
            new TechnologicalInstruction
            {
                Id = Guid.Parse("09c84b21-5f0c-4fae-9dac-ceb5abc1917e"),
                Name = "Инструкция 2",
                IdFromSystem = "2",
                Number = 2,
                WeldPassageInstructions = new List<WeldPassageInstruction>
                {
                    new()
                    {
                        Id = Guid.Parse("26703804-4bd5-4468-ab40-2f2ed750ea5a"),
                        Name = "Заполняющий",
                        Number = 2,
                        WeldingCurrentMin = 270,
                        WeldingCurrentMax = 310,
                        ArcVoltageMin = 23,
                        ArcVoltageMax = 26,
                    },
                    new()
                    {
                        Id = Guid.Parse("2ce20312-25f8-4d36-a24b-068b2cac2313"),
                        Name = "Корневой",
                        Number = 1,
                        WeldingCurrentMin = 200,
                        WeldingCurrentMax = 270,
                        ArcVoltageMin = 23,
                        ArcVoltageMax = 26,
                    },
                }
            },
            new TechnologicalInstruction
            {
                Id = Guid.Parse("26693f0d-6c87-4210-8bb3-cee7fd394a08"),
                Name = "Инструкция 48",
                IdFromSystem = "48",
                Number = 48,
                WeldPassageInstructions = new List<WeldPassageInstruction>
                {
                    new()
                    {
                        Id = Guid.Parse("0c82e207-ec76-4040-94ed-46c6bbc2b932"),
                        Name = "Корневой",
                        Number = 1,
                        WeldingCurrentMin = 200,
                        WeldingCurrentMax = 270,
                        ArcVoltageMin = 23,
                        ArcVoltageMax = 26,
                    },
                    new()
                    {
                        Id = Guid.Parse("3d9bcfd9-c9a5-4c62-a2ac-9ee09296fa73"),
                        Name = "Заполняющий",
                        Number = 2,
                        WeldingCurrentMin = 270,
                        WeldingCurrentMax = 310,
                        ArcVoltageMin = 23,
                        ArcVoltageMax = 26,
                    },
                }
            },
            new TechnologicalInstruction
            {
                Id = Guid.Parse("3fb871cf-9101-4eee-8ee8-cb1c6c03978c"),
                Name = "Инструкция 54",
                IdFromSystem = "54",
                Number = 54,
                WeldPassageInstructions = new List<WeldPassageInstruction>
                {
                    new()
                    {
                        Id = Guid.Parse("edf1e954-4a81-403f-b289-bd5f161002d6"),
                        Name = "Заполняющий",
                        Number = 2,
                        WeldingCurrentMin = 270,
                        WeldingCurrentMax = 310,
                        ArcVoltageMin = 23,
                        ArcVoltageMax = 26,
                    },
                    new()
                    {
                        Id = Guid.Parse("88711a65-1df4-4c49-a0ab-08a91757fe76"),
                        Name = "Корневой",
                        Number = 1,
                        WeldingCurrentMin = 200,
                        WeldingCurrentMax = 270,
                        ArcVoltageMin = 23,
                        ArcVoltageMax = 26,
                    },
                }
            },
            new TechnologicalInstruction
            {
                Id = Guid.Parse("4b73a99f-0fb7-49fc-b930-521e67691895"),
                Name = "Инструкция 39",
                IdFromSystem = "39",
                Number = 39,
                WeldPassageInstructions = new List<WeldPassageInstruction>
                {
                    new()
                    {
                        Id = Guid.Parse("9df0e673-781b-42c2-a55b-ca627d4a7817"),
                        Name = "Корневой",
                        Number = 1,
                        WeldingCurrentMin = 200,
                        WeldingCurrentMax = 270,
                        ArcVoltageMin = 23,
                        ArcVoltageMax = 26,
                    },
                    new()
                    {
                        Id = Guid.Parse("9fdc57ae-25b3-4f6f-8dd5-c7278608356b"),
                        Name = "Заполняющий",
                        Number = 2,
                        WeldingCurrentMin = 270,
                        WeldingCurrentMax = 310,
                        ArcVoltageMin = 23,
                        ArcVoltageMax = 26,
                    },
                }
            },
            new TechnologicalInstruction
            {
                Id = Guid.Parse("7ea73afd-78ac-4b39-ba12-a6816a764ec8"),
                Name = "Инструкция 1",
                IdFromSystem = "1",
                Number = 1,
                WeldPassageInstructions = new List<WeldPassageInstruction>
                {
                    new()
                    {
                        Id = Guid.Parse("deab1cdf-d29a-4e2c-bfe2-109d58809b5b"),
                        Name = "Заполняющий",
                        Number = 2,
                        WeldingCurrentMin = 270,
                        WeldingCurrentMax = 310,
                        ArcVoltageMin = 23,
                        ArcVoltageMax = 26,
                    },
                    new()
                    {
                        Id = Guid.Parse("7b644a2d-a20e-46bf-b7a1-25ef68fa045d"),
                        Name = "Корневой",
                        Number = 1,
                        WeldingCurrentMin = 200,
                        WeldingCurrentMax = 270,
                        ArcVoltageMin = 23,
                        ArcVoltageMax = 26,
                    },
                }
            },
            new TechnologicalInstruction
            {
                Id = Guid.Parse("8fd0d98d-6868-4412-9a66-78839fa644f1"),
                Name = "Инструкция 18",
                IdFromSystem = "18",
                Number = 18,
                WeldPassageInstructions = new List<WeldPassageInstruction>
                {
                    new()
                    {
                        Id = Guid.Parse("fdd6d112-bb06-4cb6-8651-87c300b6aa42"),
                        Name = "Заполняющий",
                        Number = 2,
                        WeldingCurrentMin = 270,
                        WeldingCurrentMax = 310,
                        ArcVoltageMin = 23,
                        ArcVoltageMax = 26,
                    },
                    new()
                    {
                        Id = Guid.Parse("57a6ed41-80b6-4cea-b59a-0979f45b5c19"),
                        Name = "Корневой",
                        Number = 1,
                        WeldingCurrentMin = 200,
                        WeldingCurrentMax = 270,
                        ArcVoltageMin = 23,
                        ArcVoltageMax = 26,
                    },
                }
            },
            new TechnologicalInstruction
            {
                Id = Guid.Parse("9398fa25-e906-406e-8e09-beb60975f75b"),
                Name = "Инструкция 52",
                IdFromSystem = "52",
                Number = 52,
                WeldPassageInstructions = new List<WeldPassageInstruction>
                {
                    new()
                    {
                        Id = Guid.Parse("03099708-040b-4244-8f48-9ad379d62746"),
                        Name = "Корневой",
                        Number = 1,
                        WeldingCurrentMin = 200,
                        WeldingCurrentMax = 270,
                        ArcVoltageMin = 23,
                        ArcVoltageMax = 26,
                    },
                    new()
                    {
                        Id = Guid.Parse("ad8df5f0-2d0f-413c-be9b-38d23c380325"),
                        Name = "Заполняющий",
                        Number = 2,
                        WeldingCurrentMin = 270,
                        WeldingCurrentMax = 310,
                        ArcVoltageMin = 23,
                        ArcVoltageMax = 26,
                    },
                }
            },
            new TechnologicalInstruction
            {
                Id = Guid.Parse("aff9dccb-145d-4e42-8c34-8bb5579f522b"),
                Name = "Инструкция 55",
                IdFromSystem = "55",
                Number = 55,
                WeldPassageInstructions = new List<WeldPassageInstruction>
                {
                    new()
                    {
                        Id = Guid.Parse("8fd32666-98ae-4e85-992b-0db59dfceb1e"),
                        Name = "Заполняющий",
                        Number = 2,
                        WeldingCurrentMin = 270,
                        WeldingCurrentMax = 310,
                        ArcVoltageMin = 23,
                        ArcVoltageMax = 26,
                    },
                    new()
                    {
                        Id = Guid.Parse("962261ec-e72b-4d71-8f06-f9f67471c9ac"),
                        Name = "Корневой",
                        Number = 1,
                        WeldingCurrentMin = 200,
                        WeldingCurrentMax = 270,
                        ArcVoltageMin = 23,
                        ArcVoltageMax = 26,
                    },
                }
            },
            new TechnologicalInstruction
            {
                Id = Guid.Parse("c050ab9a-1195-42f5-a27d-343d2d8d8c4d"),
                Name = "Инструкция 56",
                IdFromSystem = "56",
                Number = 56,
                WeldPassageInstructions = new List<WeldPassageInstruction>
                {
                    new()
                    {
                        Id = Guid.Parse("705b0fd8-cdc7-4a6e-93bd-bf8f77ab1664"),
                        Name = "Корневой",
                        Number = 1,
                        WeldingCurrentMin = 200,
                        WeldingCurrentMax = 270,
                        ArcVoltageMin = 23,
                        ArcVoltageMax = 26,
                    },
                    new()
                    {
                        Id = Guid.Parse("3d8349dd-23de-4bfa-b654-0886ce421978"),
                        Name = "Заполняющий",
                        Number = 2,
                        WeldingCurrentMin = 270,
                        WeldingCurrentMax = 310,
                        ArcVoltageMin = 23,
                        ArcVoltageMax = 26,
                    },
                }
            },
            new TechnologicalInstruction
            {
                Id = Guid.Parse("d6068081-5eac-49bb-b6be-30f3aa5febf4"),
                Name = "Инструкция 58",
                IdFromSystem = "58",
                Number = 58,
                WeldPassageInstructions = new List<WeldPassageInstruction>
                {
                    new()
                    {
                        Id = Guid.Parse("c382a15c-23cb-4e9e-a572-ceb7132c64a0"),
                        Name = "Корневой",
                        Number = 1,
                        WeldingCurrentMin = 200,
                        WeldingCurrentMax = 270,
                        ArcVoltageMin = 23,
                        ArcVoltageMax = 26,
                    },
                    new()
                    {
                        Id = Guid.Parse("5eda9f2c-7abf-4553-882d-3bc0a1bedc0b"),
                        Name = "Заполняющий",
                        Number = 2,
                        WeldingCurrentMin = 270,
                        WeldingCurrentMax = 310,
                        ArcVoltageMin = 23,
                        ArcVoltageMax = 26,
                    },
                }
            },
            new TechnologicalInstruction
            {
                Id = Guid.Parse("ff0d2b37-9a2c-4e85-993c-7979aab5aa0f"),
                Name = "Инструкция 57",
                IdFromSystem = "57",
                Number = 57,
                WeldPassageInstructions = new List<WeldPassageInstruction>
                {
                    new()
                    {
                        Id = Guid.Parse("f82de241-4fb9-4e8a-a043-b5a354a36996"),
                        Name = "Корневой",
                        Number = 1,
                        WeldingCurrentMin = 200,
                        WeldingCurrentMax = 270,
                        ArcVoltageMin = 23,
                        ArcVoltageMax = 26,
                    },
                    new()
                    {
                        Id = Guid.Parse("9b64ea13-e089-4a52-bf04-4714e62782ae"),
                        Name = "Заполняющий",
                        Number = 2,
                        WeldingCurrentMin = 270,
                        WeldingCurrentMax = 310,
                        ArcVoltageMin = 23,
                        ArcVoltageMax = 26,
                    },
                }
            },
        };

        return technologicalInstructions;
    }
}