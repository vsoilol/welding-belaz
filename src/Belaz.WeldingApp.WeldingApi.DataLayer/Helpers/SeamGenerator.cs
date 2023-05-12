using Belaz.WeldingApp.Common.Entities.ProductInfo;

namespace Belaz.WeldingApp.WeldingApi.DataLayer.Helpers;

public class SeamGenerator
{
    public static List<Seam> GenerateSeams()
    {
        var seams = new List<Seam>
        {
            new Seam
            {
                Id = Guid.Parse("03876726-8de8-486d-a01b-50b644cc76f1"),
                Number = 18,
                Length = 4000,
                ProductId = Guid.Parse("645e14f9-fa85-4f89-b5bc-bea4bc2936f2"),
                ProductionAreaId = Guid.Parse("57f33be5-0220-4e06-b57c-b674c26ff068"),
                TechnologicalInstructionId = Guid.Parse("8fd0d98d-6868-4412-9a66-78839fa644f1"),
            },
            new Seam
            {
                Id = Guid.Parse("05d627b6-e193-4251-88b9-635cba1b9370"),
                Number = 57,
                Length = 400,
                ProductId = Guid.Parse("c7ef9959-c91c-4d0f-ac3b-2a2a000a6e46"),
                ProductionAreaId = Guid.Parse("57f33be5-0220-4e06-b57c-b674c26ff068"),
                TechnologicalInstructionId = Guid.Parse("ff0d2b37-9a2c-4e85-993c-7979aab5aa0f"),
            },
            new Seam
            {
                Id = Guid.Parse("1b6a85ad-6da0-4269-a86f-180ec363cb9e"),
                Number = 54,
                Length = 400,
                ProductId = Guid.Parse("c7ef9959-c91c-4d0f-ac3b-2a2a000a6e46"),
                ProductionAreaId = Guid.Parse("57f33be5-0220-4e06-b57c-b674c26ff068"),
                TechnologicalInstructionId = Guid.Parse("3fb871cf-9101-4eee-8ee8-cb1c6c03978c"),
            },
            new Seam
            {
                Id = Guid.Parse("3af46b20-224a-4f72-97b6-5297d2b75bf5"),
                Number = 55,
                Length = 400,
                ProductId = Guid.Parse("645e14f9-fa85-4f89-b5bc-bea4bc2936f2"),
                ProductionAreaId = Guid.Parse("57f33be5-0220-4e06-b57c-b674c26ff068"),
                TechnologicalInstructionId = Guid.Parse("aff9dccb-145d-4e42-8c34-8bb5579f522b"),
            },
            new Seam
            {
                Id = Guid.Parse("3e55080c-fc22-4c5a-ac4e-a0dc4cbb67e1"),
                Number = 52,
                Length = 1200,
                ProductId = Guid.Parse("7e8c5fe8-431e-497b-9b13-2da25d6e5158"),
                ProductionAreaId = Guid.Parse("57f33be5-0220-4e06-b57c-b674c26ff068"),
                TechnologicalInstructionId = Guid.Parse("9398fa25-e906-406e-8e09-beb60975f75b"),
            },
            new Seam
            {
                Id = Guid.Parse("6eb38dfc-df1a-42c4-8b12-f9956cad632e"),
                Number = 52,
                Length = 1200,
                ProductId = Guid.Parse("6fb8852a-a4cd-4df7-8f9d-2294ae6990cb"),
                ProductionAreaId = Guid.Parse("57f33be5-0220-4e06-b57c-b674c26ff068"),
                TechnologicalInstructionId = Guid.Parse("9398fa25-e906-406e-8e09-beb60975f75b"),
            },
            new Seam
            {
                Id = Guid.Parse("7d83ba4e-5b00-4935-baf1-df3ad86b15c8"),
                Number = 57,
                Length = 400,
                ProductId = Guid.Parse("645e14f9-fa85-4f89-b5bc-bea4bc2936f2"),
                ProductionAreaId = Guid.Parse("57f33be5-0220-4e06-b57c-b674c26ff068"),
                TechnologicalInstructionId = Guid.Parse("ff0d2b37-9a2c-4e85-993c-7979aab5aa0f"),
            },
            new Seam
            {
                Id = Guid.Parse("a3b759d7-555a-41ea-93bf-2d9c7ce48371"),
                Number = 58,
                Length = 900,
                ProductId = Guid.Parse("c7ef9959-c91c-4d0f-ac3b-2a2a000a6e46"),
                ProductionAreaId = Guid.Parse("57f33be5-0220-4e06-b57c-b674c26ff068"),
                TechnologicalInstructionId = Guid.Parse("d6068081-5eac-49bb-b6be-30f3aa5febf4"),
            },
            new Seam
            {
                Id = Guid.Parse("ace294ec-b133-4fcb-aca8-7bdefef745f1"),
                Number = 54,
                Length = 400,
                ProductId = Guid.Parse("645e14f9-fa85-4f89-b5bc-bea4bc2936f2"),
                ProductionAreaId = Guid.Parse("57f33be5-0220-4e06-b57c-b674c26ff068"),
                TechnologicalInstructionId = Guid.Parse("3fb871cf-9101-4eee-8ee8-cb1c6c03978c"),
            },
            new Seam
            {
                Id = Guid.Parse("b04049d0-5026-4014-bd26-e61dbd0bda14"),
                Number = 58,
                Length = 900,
                ProductId = Guid.Parse("645e14f9-fa85-4f89-b5bc-bea4bc2936f2"),
                ProductionAreaId = Guid.Parse("57f33be5-0220-4e06-b57c-b674c26ff068"),
                TechnologicalInstructionId = Guid.Parse("d6068081-5eac-49bb-b6be-30f3aa5febf4"),
            },
            new Seam
            {
                Id = Guid.Parse("b275eb65-ca76-4272-9662-d9b92e109177"),
                Number = 39,
                Length = 280,
                ProductId = Guid.Parse("645e14f9-fa85-4f89-b5bc-bea4bc2936f2"),
                ProductionAreaId = Guid.Parse("57f33be5-0220-4e06-b57c-b674c26ff068"),
                TechnologicalInstructionId = Guid.Parse("4b73a99f-0fb7-49fc-b930-521e67691895"),
            },
            new Seam
            {
                Id = Guid.Parse("b7703aeb-535a-4be2-a171-b71fbe3cec42"),
                Number = 39,
                Length = 280,
                ProductId = Guid.Parse("c7ef9959-c91c-4d0f-ac3b-2a2a000a6e46"),
                ProductionAreaId = Guid.Parse("57f33be5-0220-4e06-b57c-b674c26ff068"),
                TechnologicalInstructionId = Guid.Parse("4b73a99f-0fb7-49fc-b930-521e67691895"),
            },
            new Seam
            {
                Id = Guid.Parse("c07e6c99-6ab0-4e57-8ea3-53bb68ffa507"),
                Number = 1,
                Length = 1900,
                ProductId = Guid.Parse("6fb8852a-a4cd-4df7-8f9d-2294ae6990cb"),
                ProductionAreaId = Guid.Parse("57f33be5-0220-4e06-b57c-b674c26ff068"),
                TechnologicalInstructionId = Guid.Parse("7ea73afd-78ac-4b39-ba12-a6816a764ec8"),
            },
            new Seam
            {
                Id = Guid.Parse("c4309e97-a1e8-49de-b124-c1aa1e89de8a"),
                Number = 1,
                Length = 1900,
                ProductId = Guid.Parse("7e8c5fe8-431e-497b-9b13-2da25d6e5158"),
                ProductionAreaId = Guid.Parse("57f33be5-0220-4e06-b57c-b674c26ff068"),
                TechnologicalInstructionId = Guid.Parse("7ea73afd-78ac-4b39-ba12-a6816a764ec8"),
            },
            new Seam
            {
                Id = Guid.Parse("d8955c29-4257-4705-afc3-552316d0e8bf"),
                Number = 55,
                Length = 400,
                ProductId = Guid.Parse("c7ef9959-c91c-4d0f-ac3b-2a2a000a6e46"),
                ProductionAreaId = Guid.Parse("57f33be5-0220-4e06-b57c-b674c26ff068"),
                TechnologicalInstructionId = Guid.Parse("aff9dccb-145d-4e42-8c34-8bb5579f522b"),
            },
            new Seam
            {
                Id = Guid.Parse("dc631901-db09-4add-9e04-3e5e006c2271"),
                Number = 2,
                Length = 1880,
                ProductId = Guid.Parse("6fb8852a-a4cd-4df7-8f9d-2294ae6990cb"),
                ProductionAreaId = Guid.Parse("57f33be5-0220-4e06-b57c-b674c26ff068"),
                TechnologicalInstructionId = Guid.Parse("09c84b21-5f0c-4fae-9dac-ceb5abc1917e"),
            },
            new Seam
            {
                Id = Guid.Parse("dfbf3824-def3-485b-b5af-66c0fcd1adca"),
                Number = 2,
                Length = 1880,
                ProductId = Guid.Parse("7e8c5fe8-431e-497b-9b13-2da25d6e5158"),
                ProductionAreaId = Guid.Parse("57f33be5-0220-4e06-b57c-b674c26ff068"),
                TechnologicalInstructionId = Guid.Parse("09c84b21-5f0c-4fae-9dac-ceb5abc1917e"),
            },
            new Seam
            {
                Id = Guid.Parse("f43dc5cf-191d-4ba5-ab5f-5865f73589e0"),
                Number = 18,
                Length = 4000,
                ProductId = Guid.Parse("c7ef9959-c91c-4d0f-ac3b-2a2a000a6e46"),
                ProductionAreaId = Guid.Parse("57f33be5-0220-4e06-b57c-b674c26ff068"),
                TechnologicalInstructionId = Guid.Parse("8fd0d98d-6868-4412-9a66-78839fa644f1"),
            },
        };

        return seams;
    }
}