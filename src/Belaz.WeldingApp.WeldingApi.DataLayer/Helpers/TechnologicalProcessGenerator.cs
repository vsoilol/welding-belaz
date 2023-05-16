using Belaz.WeldingApp.Common.Entities.TechnologicalProcessInfo;

namespace Belaz.WeldingApp.WeldingApi.DataLayer.Helpers;

public class TechnologicalProcessGenerator
{
    public static List<TechnologicalProcess> GenerateTechnologicalProcesses()
    {
        var technologicalProcesses = new List<TechnologicalProcess>
        {
            new TechnologicalProcess
            {
                Id = Guid.Parse("05fb5b9e-115d-4afd-be72-ddc178b0194c"),
                IdFromSystem = "2868425",
                Name = "Поперечина рамы задняя",
                Number = "75131-2801300-20",
                PdmSystemFileLink = "ims://docid/1333514/view"
            },
            new TechnologicalProcess
            {
                Id = Guid.Parse("99fc55a8-e7f7-4d70-9772-f4b205503134"),
                IdFromSystem = "3330041",
                Name = "Рама",
                Number = "7513D-2800010-20",
                PdmSystemFileLink = "ims://docid/2440459/view"
            },
            new TechnologicalProcess
            {
                Id = Guid.Parse("ce4d451a-35de-4a97-99c9-185b56d09d85"),
                IdFromSystem = "3291137",
                Name = "Рама",
                Number = "75131-2800010-70"
            }
        };

        return technologicalProcesses;
    }
}