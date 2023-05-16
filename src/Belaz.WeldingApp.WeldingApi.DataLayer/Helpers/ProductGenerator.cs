using Belaz.WeldingApp.Common.Entities.ProductInfo;
using Belaz.WeldingApp.Common.Enums;

namespace Belaz.WeldingApp.WeldingApi.DataLayer.Helpers;

public class ProductGenerator
{
    public static List<Product> GenerateProducts()
    {
        var product = new List<Product>
        {
            new Product
            {
                Id = Guid.Parse("645e14f9-fa85-4f89-b5bc-bea4bc2936f2"),
                Name = "Рама",
                IdFromSystem = "4536492774",
                Number = "7513D-2800010-20",
                ProductType = ProductType.Product,
                ProductionAreaId = Guid.Parse("57f33be5-0220-4e06-b57c-b674c26ff068"),
                ManufacturingTime = 10,
                TechnologicalProcessId = Guid.Parse("99fc55a8-e7f7-4d70-9772-f4b205503134"),
            },
            new Product
            {
                Id = Guid.Parse("6fb8852a-a4cd-4df7-8f9d-2294ae6990cb"),
                Name = "Поперечина рамы задняя",
                IdFromSystem = null,
                Number = "75131-2801300-20",
                ProductType = ProductType.Knot,
                ProductionAreaId = Guid.Parse("57f33be5-0220-4e06-b57c-b674c26ff068"),
                ManufacturingTime = 10,
                TechnologicalProcessId = Guid.Parse("99fc55a8-e7f7-4d70-9772-f4b205503134"),
            },
            new Product
            {
                Id = Guid.Parse("7e8c5fe8-431e-497b-9b13-2da25d6e5158"),
                Name = "Поперечина рамы задняя",
                IdFromSystem = null,
                Number = "75131-2801300-20",
                ProductType = ProductType.Knot,
                ProductionAreaId = Guid.Parse("57f33be5-0220-4e06-b57c-b674c26ff068"),
                ManufacturingTime = 10,
                TechnologicalProcessId = Guid.Parse("ce4d451a-35de-4a97-99c9-185b56d09d85"),
            },
            new Product
            {
                Id = Guid.Parse("c7ef9959-c91c-4d0f-ac3b-2a2a000a6e46"),
                Name = "Рама",
                IdFromSystem = "4536479362",
                Number = "75131-2800010-70",
                ProductType = ProductType.Product,
                ProductionAreaId = Guid.Parse("57f33be5-0220-4e06-b57c-b674c26ff068"),
                ManufacturingTime = 10,
                TechnologicalProcessId = Guid.Parse("ce4d451a-35de-4a97-99c9-185b56d09d85"),
            },
        };

        return product;
    }

    public static List<ProductInside> GenerateProductInside()
    {
        var productInsides = new List<ProductInside>
        {
            new ProductInside
            {
                MainProductId = Guid.Parse("645e14f9-fa85-4f89-b5bc-bea4bc2936f2"),
                InsideProductId = Guid.Parse("6fb8852a-a4cd-4df7-8f9d-2294ae6990cb"),
            },
            new ProductInside
            {
                MainProductId = Guid.Parse("c7ef9959-c91c-4d0f-ac3b-2a2a000a6e46"),
                InsideProductId = Guid.Parse("7e8c5fe8-431e-497b-9b13-2da25d6e5158"),
            },
        };

        return productInsides;
    }
}