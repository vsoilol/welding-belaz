using Belaz.WeldingApp.Common.Entities.ProductInfo;
using Belaz.WeldingApp.Common.Entities.WeldingEquipmentInfo;
using Belaz.WeldingApp.Common.Enums;

namespace Belaz.WeldingApp.WeldingApi.DataLayer.Helpers;

public class ProductAccountGenerator
{
    public static List<ProductAccount> GenerateProductAccounts()
    {
        var productAccounts = new List<ProductAccount>
        {
            new ProductAccount
            {
                Id = Guid.Parse("007c0696-7942-48dd-b487-8a27ec1a2205"),
                Number = 1,
                AmountFromPlan = 1,
                DateFromPlan = new DateTime(638186688000000000),
                ProductId = Guid.Parse("645e14f9-fa85-4f89-b5bc-bea4bc2936f2"),
                WeldingEquipments = new List<WeldingEquipment>
                {
                    new WeldingEquipment
                    {
                        Id = Guid.Parse("7895122d-186d-47ea-9a69-463515f335d6"),
                    },
                    new WeldingEquipment
                    {
                        Id = Guid.Parse("a623d6e5-7a95-4c22-addb-35ec1a76e606"),
                    },
                    new WeldingEquipment
                    {
                        Id = Guid.Parse("a8cfb5f9-0d7e-402e-a4aa-b618088d1d7a"),
                    },
                }
            },
            new ProductAccount
            {
                Id = Guid.Parse("15f17c40-c7b8-48cf-95cc-e691b6765e10"),
                Number = 2,
                AmountFromPlan = 1,
                DateFromPlan = new DateTime(638188416000000000),
                ProductId = Guid.Parse("6fb8852a-a4cd-4df7-8f9d-2294ae6990cb"),
                WeldingEquipments = new List<WeldingEquipment>
                {
                    new WeldingEquipment
                    {
                        Id = Guid.Parse("7895122d-186d-47ea-9a69-463515f335d6"),
                    },
                    new WeldingEquipment
                    {
                        Id = Guid.Parse("a623d6e5-7a95-4c22-addb-35ec1a76e606"),
                    },
                    new WeldingEquipment
                    {
                        Id = Guid.Parse("a8cfb5f9-0d7e-402e-a4aa-b618088d1d7a"),
                    },
                }
            },
            new ProductAccount
            {
                Id = Guid.Parse("1e91f7ef-29df-4a0b-90c5-0f35800b5fda"),
                Number = 2,
                AmountFromPlan = 2,
                DateFromPlan = new DateTime(638141760000000000),
                ProductId = Guid.Parse("6fb8852a-a4cd-4df7-8f9d-2294ae6990cb"),
                WeldingEquipments = new List<WeldingEquipment>
                {
                    new WeldingEquipment
                    {
                        Id = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                    },
                }
            },
            new ProductAccount
            {
                Id = Guid.Parse("20af1dc0-ed6e-4ab3-9199-92650a60da89"),
                Number = 4,
                AmountFromPlan = 0,
                DateFromPlan = new DateTime(638187552000000000),
                ProductId = Guid.Parse("c7ef9959-c91c-4d0f-ac3b-2a2a000a6e46"),
                WeldingEquipments = new List<WeldingEquipment>
                {
                }
            },
            new ProductAccount
            {
                Id = Guid.Parse("23949c10-258c-4603-8369-ba77fa1660f9"),
                Number = 1,
                AmountFromPlan = 1,
                DateFromPlan = new DateTime(638192736000000000),
                ProductId = Guid.Parse("645e14f9-fa85-4f89-b5bc-bea4bc2936f2"),
                WeldingEquipments = new List<WeldingEquipment>
                {
                    new WeldingEquipment
                    {
                        Id = Guid.Parse("7895122d-186d-47ea-9a69-463515f335d6"),
                    },
                    new WeldingEquipment
                    {
                        Id = Guid.Parse("a623d6e5-7a95-4c22-addb-35ec1a76e606"),
                    },
                    new WeldingEquipment
                    {
                        Id = Guid.Parse("a8cfb5f9-0d7e-402e-a4aa-b618088d1d7a"),
                    },
                }
            },
            new ProductAccount
            {
                Id = Guid.Parse("278c5233-0b66-4144-afdc-b45af2d868e5"),
                Number = 4,
                AmountFromPlan = 1,
                DateFromPlan = new DateTime(638175456000000000),
                ProductId = Guid.Parse("c7ef9959-c91c-4d0f-ac3b-2a2a000a6e46"),
                WeldingEquipments = new List<WeldingEquipment>
                {
                    new WeldingEquipment
                    {
                        Id = Guid.Parse("7895122d-186d-47ea-9a69-463515f335d6"),
                    },
                    new WeldingEquipment
                    {
                        Id = Guid.Parse("a623d6e5-7a95-4c22-addb-35ec1a76e606"),
                    },
                    new WeldingEquipment
                    {
                        Id = Guid.Parse("a8cfb5f9-0d7e-402e-a4aa-b618088d1d7a"),
                    },
                }
            },
            new ProductAccount
            {
                Id = Guid.Parse("3d5b760a-7e7e-41df-8be2-b1907d184af7"),
                Number = 2,
                AmountFromPlan = 1,
                DateFromPlan = new DateTime(638186688000000000),
                ProductId = Guid.Parse("6fb8852a-a4cd-4df7-8f9d-2294ae6990cb"),
                WeldingEquipments = new List<WeldingEquipment>
                {
                    new WeldingEquipment
                    {
                        Id = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                    },
                }
            },
            new ProductAccount
            {
                Id = Guid.Parse("433f7da5-156f-453b-af97-789fb128ca18"),
                Number = 3,
                AmountFromPlan = 0,
                DateFromPlan = new DateTime(638192736000000000),
                ProductId = Guid.Parse("7e8c5fe8-431e-497b-9b13-2da25d6e5158"),
                WeldingEquipments = new List<WeldingEquipment>
                {
                }
            },
            new ProductAccount
            {
                Id = Guid.Parse("49bdc8a7-b421-4300-82a4-c6df552860b3"),
                Number = 2,
                AmountFromPlan = 1,
                DateFromPlan = new DateTime(638185824000000000),
                ProductId = Guid.Parse("6fb8852a-a4cd-4df7-8f9d-2294ae6990cb"),
                WeldingEquipments = new List<WeldingEquipment>
                {
                    new WeldingEquipment
                    {
                        Id = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                    },
                }
            },
            new ProductAccount
            {
                Id = Guid.Parse("4aa2e100-3238-453d-ae8e-18bc77821ece"),
                Number = 3,
                AmountFromPlan = 1,
                DateFromPlan = new DateTime(638185824000000000),
                ProductId = Guid.Parse("7e8c5fe8-431e-497b-9b13-2da25d6e5158"),
                WeldingEquipments = new List<WeldingEquipment>
                {
                    new WeldingEquipment
                    {
                        Id = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                    },
                }
            },
            new ProductAccount
            {
                Id = Guid.Parse("4b5a29f7-2166-4200-961a-100d0dcc9919"),
                Number = 1,
                AmountFromPlan = 1,
                DateFromPlan = new DateTime(638187552000000000),
                ProductId = Guid.Parse("645e14f9-fa85-4f89-b5bc-bea4bc2936f2"),
                WeldingEquipments = new List<WeldingEquipment>
                {
                    new WeldingEquipment
                    {
                        Id = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                    },
                    new WeldingEquipment
                    {
                        Id = Guid.Parse("7895122d-186d-47ea-9a69-463515f335d6"),
                    },
                    new WeldingEquipment
                    {
                        Id = Guid.Parse("a623d6e5-7a95-4c22-addb-35ec1a76e606"),
                    },
                    new WeldingEquipment
                    {
                        Id = Guid.Parse("a8cfb5f9-0d7e-402e-a4aa-b618088d1d7a"),
                    },
                }
            },
            new ProductAccount
            {
                Id = Guid.Parse("58d52329-bb4d-4cca-bcf5-2b4ff8fe3b90"),
                Number = 4,
                AmountFromPlan = 0,
                DateFromPlan = new DateTime(638188416000000000),
                ProductId = Guid.Parse("c7ef9959-c91c-4d0f-ac3b-2a2a000a6e46"),
                WeldingEquipments = new List<WeldingEquipment>
                {
                }
            },
            new ProductAccount
            {
                Id = Guid.Parse("6cc80ba9-c787-4d50-9026-0bc1dc3c0544"),
                Number = 3,
                AmountFromPlan = 0,
                DateFromPlan = new DateTime(638187552000000000),
                ProductId = Guid.Parse("7e8c5fe8-431e-497b-9b13-2da25d6e5158"),
                WeldingEquipments = new List<WeldingEquipment>
                {
                }
            },
            new ProductAccount
            {
                Id = Guid.Parse("89026249-cc33-4ee3-a542-181e50e0e486"),
                Number = 3,
                AmountFromPlan = 1,
                DateFromPlan = new DateTime(638175456000000000),
                ProductId = Guid.Parse("7e8c5fe8-431e-497b-9b13-2da25d6e5158"),
                WeldingEquipments = new List<WeldingEquipment>
                {
                    new WeldingEquipment
                    {
                        Id = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                    },
                }
            },
            new ProductAccount
            {
                Id = Guid.Parse("8e56b836-6929-4ecf-b7ea-a0b7d8f9dd81"),
                Number = 2,
                AmountFromPlan = 1,
                DateFromPlan = new DateTime(638192736000000000),
                ProductId = Guid.Parse("6fb8852a-a4cd-4df7-8f9d-2294ae6990cb"),
                WeldingEquipments = new List<WeldingEquipment>
                {
                    new WeldingEquipment
                    {
                        Id = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                    },
                }
            },
            new ProductAccount
            {
                Id = Guid.Parse("90e8eaee-b343-4a1a-bf0f-80b94eeefb43"),
                Number = 4,
                AmountFromPlan = 0,
                DateFromPlan = new DateTime(638192736000000000),
                ProductId = Guid.Parse("c7ef9959-c91c-4d0f-ac3b-2a2a000a6e46"),
                WeldingEquipments = new List<WeldingEquipment>
                {
                }
            },
            new ProductAccount
            {
                Id = Guid.Parse("922415ed-0a30-4715-a1b2-c516a7306b8f"),
                Number = 3,
                AmountFromPlan = 2,
                DateFromPlan = new DateTime(638141760000000000),
                ProductId = Guid.Parse("7e8c5fe8-431e-497b-9b13-2da25d6e5158"),
                WeldingEquipments = new List<WeldingEquipment>
                {
                    new WeldingEquipment
                    {
                        Id = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                    },
                }
            },
            new ProductAccount
            {
                Id = Guid.Parse("a4767a7f-aa04-4045-85b5-7a1a2d974546"),
                Number = 3,
                AmountFromPlan = 0,
                DateFromPlan = new DateTime(638188416000000000),
                ProductId = Guid.Parse("7e8c5fe8-431e-497b-9b13-2da25d6e5158"),
                WeldingEquipments = new List<WeldingEquipment>
                {
                }
            },
            new ProductAccount
            {
                Id = Guid.Parse("a7a06d59-183f-4821-8c03-34b3507c6c9c"),
                Number = 1,
                AmountFromPlan = 1,
                DateFromPlan = new DateTime(638185824000000000),
                ProductId = Guid.Parse("645e14f9-fa85-4f89-b5bc-bea4bc2936f2"),
                WeldingEquipments = new List<WeldingEquipment>
                {
                    new WeldingEquipment
                    {
                        Id = Guid.Parse("7895122d-186d-47ea-9a69-463515f335d6"),
                    },
                    new WeldingEquipment
                    {
                        Id = Guid.Parse("a623d6e5-7a95-4c22-addb-35ec1a76e606"),
                    },
                    new WeldingEquipment
                    {
                        Id = Guid.Parse("a8cfb5f9-0d7e-402e-a4aa-b618088d1d7a"),
                    },
                }
            },
            new ProductAccount
            {
                Id = Guid.Parse("a83c8cbe-4557-4a22-bacf-a316c760e7b6"),
                Number = 4,
                AmountFromPlan = 0,
                DateFromPlan = new DateTime(638186688000000000),
                ProductId = Guid.Parse("c7ef9959-c91c-4d0f-ac3b-2a2a000a6e46"),
                WeldingEquipments = new List<WeldingEquipment>
                {
                }
            },
            new ProductAccount
            {
                Id = Guid.Parse("aed91b3d-b3d9-4340-9b6c-63a55199b0b6"),
                Number = 4,
                AmountFromPlan = 1,
                DateFromPlan = new DateTime(638185824000000000),
                ProductId = Guid.Parse("c7ef9959-c91c-4d0f-ac3b-2a2a000a6e46"),
                WeldingEquipments = new List<WeldingEquipment>
                {
                    new WeldingEquipment
                    {
                        Id = Guid.Parse("7895122d-186d-47ea-9a69-463515f335d6"),
                    },
                    new WeldingEquipment
                    {
                        Id = Guid.Parse("a623d6e5-7a95-4c22-addb-35ec1a76e606"),
                    },
                    new WeldingEquipment
                    {
                        Id = Guid.Parse("a8cfb5f9-0d7e-402e-a4aa-b618088d1d7a"),
                    },
                }
            },
            new ProductAccount
            {
                Id = Guid.Parse("b41e536d-aac0-4b63-a4e7-62498a5576b8"),
                Number = 1,
                AmountFromPlan = 1,
                DateFromPlan = new DateTime(638188416000000000),
                ProductId = Guid.Parse("645e14f9-fa85-4f89-b5bc-bea4bc2936f2"),
                WeldingEquipments = new List<WeldingEquipment>
                {
                    new WeldingEquipment
                    {
                        Id = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                    },
                }
            },
            new ProductAccount
            {
                Id = Guid.Parse("bc01e57b-b032-4f76-8f9d-9ef3f88de853"),
                Number = 2,
                AmountFromPlan = 1,
                DateFromPlan = new DateTime(638187552000000000),
                ProductId = Guid.Parse("6fb8852a-a4cd-4df7-8f9d-2294ae6990cb"),
                WeldingEquipments = new List<WeldingEquipment>
                {
                    new WeldingEquipment
                    {
                        Id = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                    },
                }
            },
            new ProductAccount
            {
                Id = Guid.Parse("bde7f54c-ad95-452c-a4e8-be272521a384"),
                Number = 3,
                AmountFromPlan = 0,
                DateFromPlan = new DateTime(638186688000000000),
                ProductId = Guid.Parse("7e8c5fe8-431e-497b-9b13-2da25d6e5158"),
                WeldingEquipments = new List<WeldingEquipment>
                {
                }
            },
            new ProductAccount
            {
                Id = Guid.Parse("c9006ce7-51a1-45d9-857f-fb00b95f98bf"),
                Number = 4,
                AmountFromPlan = 2,
                DateFromPlan = new DateTime(638141760000000000),
                ProductId = Guid.Parse("c7ef9959-c91c-4d0f-ac3b-2a2a000a6e46"),
                WeldingEquipments = new List<WeldingEquipment>
                {
                    new WeldingEquipment
                    {
                        Id = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                    },
                }
            },
            new ProductAccount
            {
                Id = Guid.Parse("e089bfca-a7b3-4631-b974-b40ee7268c7a"),
                Number = 2,
                AmountFromPlan = 1,
                DateFromPlan = new DateTime(638175456000000000),
                ProductId = Guid.Parse("6fb8852a-a4cd-4df7-8f9d-2294ae6990cb"),
                WeldingEquipments = new List<WeldingEquipment>
                {
                    new WeldingEquipment
                    {
                        Id = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                    },
                }
            },
            new ProductAccount
            {
                Id = Guid.Parse("e7fd7a7a-089e-4bbf-9018-4ffd11db0187"),
                Number = 1,
                AmountFromPlan = 2,
                DateFromPlan = new DateTime(638141760000000000),
                ProductId = Guid.Parse("645e14f9-fa85-4f89-b5bc-bea4bc2936f2"),
                WeldingEquipments = new List<WeldingEquipment>
                {
                    new WeldingEquipment
                    {
                        Id = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                    },
                }
            },
            new ProductAccount
            {
                Id = Guid.Parse("ecb64aac-a835-48f6-a785-fd38a746453a"),
                Number = 1,
                AmountFromPlan = 1,
                DateFromPlan = new DateTime(638175456000000000),
                ProductId = Guid.Parse("645e14f9-fa85-4f89-b5bc-bea4bc2936f2"),
                WeldingEquipments = new List<WeldingEquipment>
                {
                    new WeldingEquipment
                    {
                        Id = Guid.Parse("7895122d-186d-47ea-9a69-463515f335d6"),
                    },
                    new WeldingEquipment
                    {
                        Id = Guid.Parse("a623d6e5-7a95-4c22-addb-35ec1a76e606"),
                    },
                    new WeldingEquipment
                    {
                        Id = Guid.Parse("a8cfb5f9-0d7e-402e-a4aa-b618088d1d7a"),
                    },
                }
            },
        };

        return productAccounts;
    }

    public static List<ProductResult> GenerateProductResults()
    {
        var productResults = new List<ProductResult>
        {
            new ProductResult
            {
                Id = Guid.Parse("083503cd-8268-4b1c-bd67-98cf4a5176bd"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                ProductAccountId = Guid.Parse("e7fd7a7a-089e-4bbf-9018-4ffd11db0187"),
            },
            new ProductResult
            {
                Id = Guid.Parse("1c906cf5-fa31-47fc-aeb9-132b822fc4d0"),
                Amount = 0,
                Status = ResultProductStatus.Defective,
                ProductAccountId = Guid.Parse("c9006ce7-51a1-45d9-857f-fb00b95f98bf"),
            },
            new ProductResult
            {
                Id = Guid.Parse("295e812a-c0b9-4578-8cc0-37499ffee346"),
                Amount = 0,
                Status = ResultProductStatus.Defective,
                ProductAccountId = Guid.Parse("922415ed-0a30-4715-a1b2-c516a7306b8f"),
            },
            new ProductResult
            {
                Id = Guid.Parse("2ef67abc-d6f9-4f9c-b832-04f0d0d73300"),
                Amount = 0,
                Status = ResultProductStatus.Defective,
                ProductAccountId = Guid.Parse("e7fd7a7a-089e-4bbf-9018-4ffd11db0187"),
            },
            new ProductResult
            {
                Id = Guid.Parse("30a50baa-40aa-4359-bd42-5d62416ee16d"),
                Amount = 0,
                Status = ResultProductStatus.Manufactured,
                ProductAccountId = Guid.Parse("922415ed-0a30-4715-a1b2-c516a7306b8f"),
            },
            new ProductResult
            {
                Id = Guid.Parse("42502056-06e8-43e3-ad1f-4998a9a855b5"),
                Amount = 0,
                Status = ResultProductStatus.Manufactured,
                ProductAccountId = Guid.Parse("1e91f7ef-29df-4a0b-90c5-0f35800b5fda"),
            },
            new ProductResult
            {
                Id = Guid.Parse("61b9b7a7-e2be-47ba-9c47-89f494aefff3"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                ProductAccountId = Guid.Parse("1e91f7ef-29df-4a0b-90c5-0f35800b5fda"),
            },
            new ProductResult
            {
                Id = Guid.Parse("7936d091-b8c7-4d25-897a-af78012aee8d"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                ProductAccountId = Guid.Parse("922415ed-0a30-4715-a1b2-c516a7306b8f"),
            },
            new ProductResult
            {
                Id = Guid.Parse("7d70ab8f-bb3a-437f-ab46-49f5e47bc824"),
                Amount = 0,
                Status = ResultProductStatus.Defective,
                ProductAccountId = Guid.Parse("1e91f7ef-29df-4a0b-90c5-0f35800b5fda"),
            },
            new ProductResult
            {
                Id = Guid.Parse("97403853-363d-4885-a77f-d6d80c86faed"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                ProductAccountId = Guid.Parse("c9006ce7-51a1-45d9-857f-fb00b95f98bf"),
            },
            new ProductResult
            {
                Id = Guid.Parse("c03ecd79-5bba-493d-b2d4-a5670fa29141"),
                Amount = 0,
                Status = ResultProductStatus.Manufactured,
                ProductAccountId = Guid.Parse("c9006ce7-51a1-45d9-857f-fb00b95f98bf"),
            },
            new ProductResult
            {
                Id = Guid.Parse("c0dff7ba-47fb-4f8a-91ec-3fd1e5ffd7ed"),
                Amount = 0,
                Status = ResultProductStatus.Manufactured,
                ProductAccountId = Guid.Parse("e7fd7a7a-089e-4bbf-9018-4ffd11db0187"),
            },
            new ProductResult
            {
                Id = Guid.Parse("79f5861a-4f25-40a2-a467-7b4e3d5a9de7"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                ProductAccountId = Guid.Parse("ecb64aac-a835-48f6-a785-fd38a746453a"),
            },
            new ProductResult
            {
                Id = Guid.Parse("955cd361-bb4c-4992-ae07-d4bb65b423b0"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                ProductAccountId = Guid.Parse("e089bfca-a7b3-4631-b974-b40ee7268c7a"),
            },
            new ProductResult
            {
                Id = Guid.Parse("9f569d8f-d674-4d7f-95a4-09896f148410"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                ProductAccountId = Guid.Parse("278c5233-0b66-4144-afdc-b45af2d868e5"),
            },
            new ProductResult
            {
                Id = Guid.Parse("f82dca5e-4ee2-4c24-8392-40e5bff4bcfa"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                ProductAccountId = Guid.Parse("89026249-cc33-4ee3-a542-181e50e0e486"),
            },
            new ProductResult
            {
                Id = Guid.Parse("ccd1ad79-3282-437e-810c-b1c6460a53a8"),
                Amount = 1,
                Status = ResultProductStatus.Defective,
                ProductAccountId = Guid.Parse("b41e536d-aac0-4b63-a4e7-62498a5576b8"),
            },
            new ProductResult
            {
                Id = Guid.Parse("2b4c6f6d-5bd4-4381-b8cc-cbe3a6cdb6ef"),
                Amount = 1,
                Status = ResultProductStatus.Manufactured,
                ProductAccountId = Guid.Parse("15f17c40-c7b8-48cf-95cc-e691b6765e10"),
            },
            new ProductResult
            {
                Id = Guid.Parse("5af49310-7d99-47cc-9695-d7a5ee7b9c9e"),
                Amount = 1,
                Status = ResultProductStatus.Defective,
                ProductAccountId = Guid.Parse("15f17c40-c7b8-48cf-95cc-e691b6765e10"),
            },
            new ProductResult
            {
                Id = Guid.Parse("063045d7-bef8-4e5e-b609-7e17e7fb41d2"),
                Amount = 0,
                Status = ResultProductStatus.Manufactured,
                ProductAccountId = Guid.Parse("433f7da5-156f-453b-af97-789fb128ca18"),
            },
            new ProductResult
            {
                Id = Guid.Parse("3e1ec01c-6fa6-436f-a23d-5322cef2c924"),
                Amount = 1,
                Status = ResultProductStatus.Manufactured,
                ProductAccountId = Guid.Parse("ecb64aac-a835-48f6-a785-fd38a746453a"),
            },
            new ProductResult
            {
                Id = Guid.Parse("1ceaf56c-7524-43ef-b699-2d74c7d38de2"),
                Amount = 1,
                Status = ResultProductStatus.Defective,
                ProductAccountId = Guid.Parse("ecb64aac-a835-48f6-a785-fd38a746453a"),
            },
            new ProductResult
            {
                Id = Guid.Parse("7ae82754-985c-4d91-b83b-5909dc48d31c"),
                Amount = 1,
                Status = ResultProductStatus.Manufactured,
                ProductAccountId = Guid.Parse("e089bfca-a7b3-4631-b974-b40ee7268c7a"),
            },
            new ProductResult
            {
                Id = Guid.Parse("32267154-e0b0-4ec9-994a-54b8a7dbc902"),
                Amount = 1,
                Status = ResultProductStatus.Defective,
                ProductAccountId = Guid.Parse("e089bfca-a7b3-4631-b974-b40ee7268c7a"),
            },
            new ProductResult
            {
                Id = Guid.Parse("c461e919-01e5-44d0-9510-99d92ad29200"),
                Amount = 1,
                Status = ResultProductStatus.Manufactured,
                ProductAccountId = Guid.Parse("278c5233-0b66-4144-afdc-b45af2d868e5"),
            },
            new ProductResult
            {
                Id = Guid.Parse("93b0eddf-49af-4d0b-a632-382c72e7e1e0"),
                Amount = 1,
                Status = ResultProductStatus.Defective,
                ProductAccountId = Guid.Parse("278c5233-0b66-4144-afdc-b45af2d868e5"),
            },
            new ProductResult
            {
                Id = Guid.Parse("1d744e34-90f8-4529-8839-8836b1a7650e"),
                Amount = 1,
                Status = ResultProductStatus.Manufactured,
                ProductAccountId = Guid.Parse("89026249-cc33-4ee3-a542-181e50e0e486"),
            },
            new ProductResult
            {
                Id = Guid.Parse("d86755be-2f4c-4c10-89bb-1e56cb47c20d"),
                Amount = 1,
                Status = ResultProductStatus.Defective,
                ProductAccountId = Guid.Parse("89026249-cc33-4ee3-a542-181e50e0e486"),
            },
            new ProductResult
            {
                Id = Guid.Parse("15bd518c-da69-4a32-84fa-c511f962b309"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                ProductAccountId = Guid.Parse("a7a06d59-183f-4821-8c03-34b3507c6c9c"),
            },
            new ProductResult
            {
                Id = Guid.Parse("34b669cc-89b7-4ec8-b45a-b928c1b70364"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                ProductAccountId = Guid.Parse("aed91b3d-b3d9-4340-9b6c-63a55199b0b6"),
            },
            new ProductResult
            {
                Id = Guid.Parse("5b8e4104-06c5-4514-8908-ad6ae1878cee"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                ProductAccountId = Guid.Parse("4aa2e100-3238-453d-ae8e-18bc77821ece"),
            },
            new ProductResult
            {
                Id = Guid.Parse("c742be6f-54a2-4c01-aa64-890b6d963f35"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                ProductAccountId = Guid.Parse("49bdc8a7-b421-4300-82a4-c6df552860b3"),
            },
            new ProductResult
            {
                Id = Guid.Parse("1e71c232-28c5-41fa-b66b-a25b89aee1f1"),
                Amount = 1,
                Status = ResultProductStatus.Manufactured,
                ProductAccountId = Guid.Parse("a7a06d59-183f-4821-8c03-34b3507c6c9c"),
            },
            new ProductResult
            {
                Id = Guid.Parse("031949b4-c53f-4271-bc5c-f98acc1351a6"),
                Amount = 1,
                Status = ResultProductStatus.Defective,
                ProductAccountId = Guid.Parse("a7a06d59-183f-4821-8c03-34b3507c6c9c"),
            },
            new ProductResult
            {
                Id = Guid.Parse("df0d1200-5b20-4d1c-8157-b6bca019b7bc"),
                Amount = 1,
                Status = ResultProductStatus.Manufactured,
                ProductAccountId = Guid.Parse("49bdc8a7-b421-4300-82a4-c6df552860b3"),
            },
            new ProductResult
            {
                Id = Guid.Parse("e3abbc69-381e-4cdd-a920-e7594a46835e"),
                Amount = 1,
                Status = ResultProductStatus.Defective,
                ProductAccountId = Guid.Parse("49bdc8a7-b421-4300-82a4-c6df552860b3"),
            },
            new ProductResult
            {
                Id = Guid.Parse("580b71cf-e71e-4e0a-8c5c-7be60db8c02f"),
                Amount = 1,
                Status = ResultProductStatus.Manufactured,
                ProductAccountId = Guid.Parse("4aa2e100-3238-453d-ae8e-18bc77821ece"),
            },
            new ProductResult
            {
                Id = Guid.Parse("a34500c1-6a49-4f36-9e3e-59a6ac7cd98a"),
                Amount = 1,
                Status = ResultProductStatus.Defective,
                ProductAccountId = Guid.Parse("4aa2e100-3238-453d-ae8e-18bc77821ece"),
            },
            new ProductResult
            {
                Id = Guid.Parse("8695dcf3-1e0c-45d3-87a8-585aaed44421"),
                Amount = 1,
                Status = ResultProductStatus.Manufactured,
                ProductAccountId = Guid.Parse("aed91b3d-b3d9-4340-9b6c-63a55199b0b6"),
            },
            new ProductResult
            {
                Id = Guid.Parse("24e45b3e-9a07-4978-b4a2-dbdb87b96750"),
                Amount = 1,
                Status = ResultProductStatus.Defective,
                ProductAccountId = Guid.Parse("aed91b3d-b3d9-4340-9b6c-63a55199b0b6"),
            },
            new ProductResult
            {
                Id = Guid.Parse("3c7f9a03-745c-4e43-b3ff-90771c2cab56"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                ProductAccountId = Guid.Parse("a83c8cbe-4557-4a22-bacf-a316c760e7b6"),
            },
            new ProductResult
            {
                Id = Guid.Parse("815d69a4-b25f-4966-99ef-915f7a8dd646"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                ProductAccountId = Guid.Parse("bde7f54c-ad95-452c-a4e8-be272521a384"),
            },
            new ProductResult
            {
                Id = Guid.Parse("a3502e04-b61f-404b-9db4-c5267d53cde1"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                ProductAccountId = Guid.Parse("3d5b760a-7e7e-41df-8be2-b1907d184af7"),
            },
            new ProductResult
            {
                Id = Guid.Parse("c58ba1b7-de06-4d3e-ae0b-78bc95ae558b"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                ProductAccountId = Guid.Parse("007c0696-7942-48dd-b487-8a27ec1a2205"),
            },
            new ProductResult
            {
                Id = Guid.Parse("5befcba4-b7c6-4180-9859-1f3dc43722e6"),
                Amount = 1,
                Status = ResultProductStatus.Manufactured,
                ProductAccountId = Guid.Parse("007c0696-7942-48dd-b487-8a27ec1a2205"),
            },
            new ProductResult
            {
                Id = Guid.Parse("25b17fc8-3ccd-4202-b98c-8fe66bfb90a4"),
                Amount = 1,
                Status = ResultProductStatus.Defective,
                ProductAccountId = Guid.Parse("007c0696-7942-48dd-b487-8a27ec1a2205"),
            },
            new ProductResult
            {
                Id = Guid.Parse("b2fb5c6a-d05d-4eab-8835-85be37fc610e"),
                Amount = 1,
                Status = ResultProductStatus.Manufactured,
                ProductAccountId = Guid.Parse("3d5b760a-7e7e-41df-8be2-b1907d184af7"),
            },
            new ProductResult
            {
                Id = Guid.Parse("9c7a449f-df91-4a35-a832-de54af057fe1"),
                Amount = 1,
                Status = ResultProductStatus.Defective,
                ProductAccountId = Guid.Parse("3d5b760a-7e7e-41df-8be2-b1907d184af7"),
            },
            new ProductResult
            {
                Id = Guid.Parse("0ab98d47-9102-487f-b14f-8370f018849f"),
                Amount = 0,
                Status = ResultProductStatus.Defective,
                ProductAccountId = Guid.Parse("90e8eaee-b343-4a1a-bf0f-80b94eeefb43"),
            },
            new ProductResult
            {
                Id = Guid.Parse("35a2659e-e6a6-4454-a8bb-0aa0d99d9c7b"),
                Amount = 0,
                Status = ResultProductStatus.Manufactured,
                ProductAccountId = Guid.Parse("90e8eaee-b343-4a1a-bf0f-80b94eeefb43"),
            },
            new ProductResult
            {
                Id = Guid.Parse("8db9f8c6-1e46-4c14-ad4c-56ee3ca0de24"),
                Amount = 0,
                Status = ResultProductStatus.Manufactured,
                ProductAccountId = Guid.Parse("bde7f54c-ad95-452c-a4e8-be272521a384"),
            },
            new ProductResult
            {
                Id = Guid.Parse("ec1a4961-a2b5-4849-bee9-b12b54093592"),
                Amount = 0,
                Status = ResultProductStatus.Defective,
                ProductAccountId = Guid.Parse("bde7f54c-ad95-452c-a4e8-be272521a384"),
            },
            new ProductResult
            {
                Id = Guid.Parse("6721fd17-c4ec-4842-8936-0e5137e8f61f"),
                Amount = 0,
                Status = ResultProductStatus.Manufactured,
                ProductAccountId = Guid.Parse("a83c8cbe-4557-4a22-bacf-a316c760e7b6"),
            },
            new ProductResult
            {
                Id = Guid.Parse("e2496796-a5f6-4976-8797-d73afb11b861"),
                Amount = 0,
                Status = ResultProductStatus.Defective,
                ProductAccountId = Guid.Parse("a83c8cbe-4557-4a22-bacf-a316c760e7b6"),
            },
            new ProductResult
            {
                Id = Guid.Parse("2c3cd560-0ffc-4455-a97a-109d9a85aff9"),
                Amount = 0,
                Status = ResultProductStatus.Defective,
                ProductAccountId = Guid.Parse("6cc80ba9-c787-4d50-9026-0bc1dc3c0544"),
            },
            new ProductResult
            {
                Id = Guid.Parse("2e82ef62-c642-4d0f-808f-933133d0db4a"),
                Amount = 0,
                Status = ResultProductStatus.Manufactured,
                ProductAccountId = Guid.Parse("20af1dc0-ed6e-4ab3-9199-92650a60da89"),
            },
            new ProductResult
            {
                Id = Guid.Parse("4649a15f-2278-4f32-a2ce-8b8b6d55c53a"),
                Amount = 0,
                Status = ResultProductStatus.Defective,
                ProductAccountId = Guid.Parse("20af1dc0-ed6e-4ab3-9199-92650a60da89"),
            },
            new ProductResult
            {
                Id = Guid.Parse("5bc61d26-c6df-4f03-8b7d-3c5fd16d2dfb"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                ProductAccountId = Guid.Parse("4b5a29f7-2166-4200-961a-100d0dcc9919"),
            },
            new ProductResult
            {
                Id = Guid.Parse("5c975c5e-a547-4633-97ae-6265b5d0fba6"),
                Amount = 0,
                Status = ResultProductStatus.Manufactured,
                ProductAccountId = Guid.Parse("6cc80ba9-c787-4d50-9026-0bc1dc3c0544"),
            },
            new ProductResult
            {
                Id = Guid.Parse("6467103d-5800-4e81-9fb5-ae79db890877"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                ProductAccountId = Guid.Parse("bc01e57b-b032-4f76-8f9d-9ef3f88de853"),
            },
            new ProductResult
            {
                Id = Guid.Parse("6f8d7213-f81e-4b31-a679-5bc1195651ac"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                ProductAccountId = Guid.Parse("6cc80ba9-c787-4d50-9026-0bc1dc3c0544"),
            },
            new ProductResult
            {
                Id = Guid.Parse("a725051b-3c08-4a8d-b229-cc19abe7943a"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                ProductAccountId = Guid.Parse("20af1dc0-ed6e-4ab3-9199-92650a60da89"),
            },
            new ProductResult
            {
                Id = Guid.Parse("c5c39753-287e-4155-bda0-042d10f401a3"),
                Amount = 1,
                Status = ResultProductStatus.Manufactured,
                ProductAccountId = Guid.Parse("4b5a29f7-2166-4200-961a-100d0dcc9919"),
            },
            new ProductResult
            {
                Id = Guid.Parse("90a12bc9-503c-4be7-b0e5-d86f3121f83a"),
                Amount = 1,
                Status = ResultProductStatus.Defective,
                ProductAccountId = Guid.Parse("4b5a29f7-2166-4200-961a-100d0dcc9919"),
            },
            new ProductResult
            {
                Id = Guid.Parse("e8b22be6-46dc-4c85-b583-1e3b147e68c1"),
                Amount = 1,
                Status = ResultProductStatus.Manufactured,
                ProductAccountId = Guid.Parse("bc01e57b-b032-4f76-8f9d-9ef3f88de853"),
            },
            new ProductResult
            {
                Id = Guid.Parse("bd4c8c04-4ae9-417a-8496-c081b3276a3a"),
                Amount = 1,
                Status = ResultProductStatus.Defective,
                ProductAccountId = Guid.Parse("bc01e57b-b032-4f76-8f9d-9ef3f88de853"),
            },
            new ProductResult
            {
                Id = Guid.Parse("09ccb441-1c02-4697-8993-5311018bc0b0"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                ProductAccountId = Guid.Parse("58d52329-bb4d-4cca-bcf5-2b4ff8fe3b90"),
            },
            new ProductResult
            {
                Id = Guid.Parse("1321abdf-3013-4f82-ae89-c9d1a3b610d9"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                ProductAccountId = Guid.Parse("a4767a7f-aa04-4045-85b5-7a1a2d974546"),
            },
            new ProductResult
            {
                Id = Guid.Parse("20fe0bee-6e3d-4045-8812-7bbe6b315735"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                ProductAccountId = Guid.Parse("15f17c40-c7b8-48cf-95cc-e691b6765e10"),
            },
            new ProductResult
            {
                Id = Guid.Parse("2f7e0cbd-59db-4cbd-a7c0-0f0e52f06eb3"),
                Amount = 0,
                Status = ResultProductStatus.Defective,
                ProductAccountId = Guid.Parse("a4767a7f-aa04-4045-85b5-7a1a2d974546"),
            },
            new ProductResult
            {
                Id = Guid.Parse("6920935d-9f8c-49dc-ae51-e38f13b2b6c6"),
                Amount = 0,
                Status = ResultProductStatus.Defective,
                ProductAccountId = Guid.Parse("58d52329-bb4d-4cca-bcf5-2b4ff8fe3b90"),
            },
            new ProductResult
            {
                Id = Guid.Parse("70515eed-88f9-4fec-b46d-68a63366d042"),
                Amount = 0,
                Status = ResultProductStatus.Manufactured,
                ProductAccountId = Guid.Parse("a4767a7f-aa04-4045-85b5-7a1a2d974546"),
            },
            new ProductResult
            {
                Id = Guid.Parse("7541764f-60c2-48b3-8c33-003a60ed5b7a"),
                Amount = 0,
                Status = ResultProductStatus.Manufactured,
                ProductAccountId = Guid.Parse("58d52329-bb4d-4cca-bcf5-2b4ff8fe3b90"),
            },
            new ProductResult
            {
                Id = Guid.Parse("9c2ca6e4-2551-4903-81ee-31158e2d00e0"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                ProductAccountId = Guid.Parse("b41e536d-aac0-4b63-a4e7-62498a5576b8"),
            },
            new ProductResult
            {
                Id = Guid.Parse("4284c632-b607-49d5-8c4d-b39cb3250faa"),
                Amount = 1,
                Status = ResultProductStatus.Manufactured,
                ProductAccountId = Guid.Parse("b41e536d-aac0-4b63-a4e7-62498a5576b8"),
            },
            new ProductResult
            {
                Id = Guid.Parse("5fe457c4-8b8e-4873-8900-b9ee581a3fce"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                ProductAccountId = Guid.Parse("23949c10-258c-4603-8369-ba77fa1660f9"),
            },
            new ProductResult
            {
                Id = Guid.Parse("7e414c86-96da-487c-82bd-267424f94a8d"),
                Amount = 0,
                Status = ResultProductStatus.Defective,
                ProductAccountId = Guid.Parse("433f7da5-156f-453b-af97-789fb128ca18"),
            },
            new ProductResult
            {
                Id = Guid.Parse("9b3f11e7-1dbe-4bd0-9407-8ca608fee8de"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                ProductAccountId = Guid.Parse("90e8eaee-b343-4a1a-bf0f-80b94eeefb43"),
            },
            new ProductResult
            {
                Id = Guid.Parse("e3748dac-0919-4efe-8565-bd427e1a6c22"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                ProductAccountId = Guid.Parse("8e56b836-6929-4ecf-b7ea-a0b7d8f9dd81"),
            },
            new ProductResult
            {
                Id = Guid.Parse("fe3f2f71-e588-48ac-b8ae-9581f0d5db74"),
                Amount = 0,
                Status = ResultProductStatus.Accept,
                ProductAccountId = Guid.Parse("433f7da5-156f-453b-af97-789fb128ca18"),
            },
            new ProductResult
            {
                Id = Guid.Parse("33430471-95e4-4a0c-b2cd-91b9fc6106e8"),
                Amount = 1,
                Status = ResultProductStatus.Manufactured,
                ProductAccountId = Guid.Parse("23949c10-258c-4603-8369-ba77fa1660f9"),
            },
            new ProductResult
            {
                Id = Guid.Parse("b0a003af-caac-4a6f-b8d2-537f2dc70b90"),
                Amount = 1,
                Status = ResultProductStatus.Defective,
                ProductAccountId = Guid.Parse("23949c10-258c-4603-8369-ba77fa1660f9"),
            },
            new ProductResult
            {
                Id = Guid.Parse("38be528e-f9c3-4208-9a52-38d0583a3083"),
                Amount = 1,
                Status = ResultProductStatus.Manufactured,
                ProductAccountId = Guid.Parse("8e56b836-6929-4ecf-b7ea-a0b7d8f9dd81"),
            },
            new ProductResult
            {
                Id = Guid.Parse("891dc413-3bf4-4bfb-8435-95fe219a5a37"),
                Amount = 1,
                Status = ResultProductStatus.Defective,
                ProductAccountId = Guid.Parse("8e56b836-6929-4ecf-b7ea-a0b7d8f9dd81"),
            },
        };

        return productResults;
    }
}