using Belaz.WeldingApp.Common.Entities.Production;

namespace Belaz.WeldingApp.WeldingApi.Tests.DataFactories;

public static class ProductionAreaFactory
{
    public static List<ProductionArea> GetProductionAreaList()
    {
        var productionAreas = new List<ProductionArea>
        {
            new()
            {
                Id = Guid.NewGuid(),
                Number = 1,
                Name = "Производственный участок 1",
            },
            new()
            {
                Id = Guid.NewGuid(),
                Number = 2,
                Name = "Производственный участок 2"
            },
            new()
            {
                Id = Guid.NewGuid(),
                Number = 3,
                Name = "Производственный участок 3"
            }
        };

        return productionAreas;
    }
}