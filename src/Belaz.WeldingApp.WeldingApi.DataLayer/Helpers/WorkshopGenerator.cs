using Belaz.WeldingApp.Common.Entities.Production;

namespace Belaz.WeldingApp.WeldingApi.DataLayer.Helpers;

public class WorkshopGenerator
{
    public static List<Workshop> GenerateWorkshops()
    {
        var workshops = new List<Workshop>
        {
            new Workshop
            {
                Id = Guid.Parse("a968ed54-a55b-4481-bda2-1a81f5909013"),
                Name = "Сварочный цех",
                IdFromSystem = "050",
                Number = 50,
                ProductionAreas = new List<ProductionArea>
                {
                    new ProductionArea
                    {
                        Id = Guid.Parse("57f33be5-0220-4e06-b57c-b674c26ff068"),
                        Name = "Сборка, сварка рам к/с г/п 120-130 т.",
                        Number = 6,
                        IdFromSystem = "06",
                        Workplaces = new List<Workplace>
                        {
                            new()
                            {
                                Id = Guid.Parse("5ddc69a5-c9d1-42fe-aaf3-f49f12a2527e"), Number = 3500,
                                IdFromSystem = "3500"
                            },
                            new()
                            {
                                Id = Guid.Parse("92d5a5ef-6961-480a-805d-af4646800c77"), Number = 3600,
                                IdFromSystem = "3600"
                            },
                            new()
                            {
                                Id = Guid.Parse("9b64e6fa-f620-423f-a9a0-6edc86fbd88c"), Number = 3510,
                                IdFromSystem = "3510"
                            },
                            new()
                            {
                                Id = Guid.Parse("ad15addb-3100-4fac-b70a-5f1db1d94893"), Number = 3550,
                                IdFromSystem = "3550"
                            },
                            new()
                            {
                                Id = Guid.Parse("d840b4bb-f8af-4568-bed6-3061267f9220"), Number = 3610,
                                IdFromSystem = "3610"
                            },
                            new()
                            {
                                Id = Guid.Parse("e9b97962-ade8-41b6-b1e9-64b830da256f"), Number = 3690,
                                IdFromSystem = "3690"
                            },
                        }
                    }
                }
            }
        };


        return workshops;
    }
}