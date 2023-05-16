using Belaz.WeldingApp.Common.Entities.WeldingEquipmentInfo;
using Belaz.WeldingApp.Common.Enums;

namespace Belaz.WeldingApp.WeldingApi.DataLayer.Helpers;

public class WeldingEquipmentConditionTimeGenerator
{
    public static List<WeldingEquipmentConditionTime> GenerateWeldingEquipmentConditionTimes()
    {
        var conditionTimes = new List<WeldingEquipmentConditionTime>
        {
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("e1772e77-ab47-41f4-b521-0670aad0abc7"),
                Condition = Condition.On,
                Date = new DateTime(638175456000000000),
                StartConditionTime = new TimeSpan(497210000000),
                Time = 1,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("25700a9c-cac0-4a47-9860-a1936b2f2fbd"),
                Condition = Condition.AtWork,
                Date = new DateTime(638175456000000000),
                StartConditionTime = new TimeSpan(502260000000),
                Time = 0.16666666666666666,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("14c78a38-4868-4dd6-8bef-5ab712b622af"),
                Condition = Condition.AtWork,
                Date = new DateTime(638175456000000000),
                StartConditionTime = new TimeSpan(502550000000),
                Time = 0.16666666666666666,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("7490da09-51c4-43c5-a818-525613f8a861"),
                Condition = Condition.AtWork,
                Date = new DateTime(638175456000000000),
                StartConditionTime = new TimeSpan(504020000000),
                Time = 0.45,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("9d2f37ca-656a-4c35-b62f-16d16b10c85d"),
                Condition = Condition.AtWork,
                Date = new DateTime(638175456000000000),
                StartConditionTime = new TimeSpan(504920000000),
                Time = 0.16666666666666666,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("db9af3a1-1d83-41ba-ba0f-070a5dfc7eb8"),
                Condition = Condition.AtWork,
                Date = new DateTime(638175456000000000),
                StartConditionTime = new TimeSpan(505170000000),
                Time = 0.16666666666666666,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("e9ac63ba-1a34-4c49-bc78-601a42e93374"),
                Condition = Condition.On,
                Date = new DateTime(638175456000000000),
                StartConditionTime = new TimeSpan(519450000000),
                Time = 2,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("7886fdd1-54f6-4f6f-83a5-714ee9780232"),
                Condition = Condition.AtWork,
                Date = new DateTime(638175456000000000),
                StartConditionTime = new TimeSpan(521220000000),
                Time = 0.25,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("adbf093b-85ac-4b97-906f-23673763adae"),
                Condition = Condition.AtWork,
                Date = new DateTime(638175456000000000),
                StartConditionTime = new TimeSpan(521440000000),
                Time = 1.05,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("500a4f71-8df9-481f-b379-c2c68e5d7d84"),
                Condition = Condition.On,
                Date = new DateTime(638175456000000000),
                StartConditionTime = new TimeSpan(524780000000),
                Time = 2,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("762e1367-eeb3-40d1-9235-7a10023c6de6"),
                Condition = Condition.AtWork,
                Date = new DateTime(638175456000000000),
                StartConditionTime = new TimeSpan(525120000000),
                Time = 1.1833333333333333,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("9e86ef76-c42a-4aa2-b62b-8652bef5b0c1"),
                Condition = Condition.On,
                Date = new DateTime(638175456000000000),
                StartConditionTime = new TimeSpan(529900000000),
                Time = 4,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("7edbbbaa-1bc9-435f-8d0c-4841228e3241"),
                Condition = Condition.AtWork,
                Date = new DateTime(638175456000000000),
                StartConditionTime = new TimeSpan(532450000000),
                Time = 1.0833333333333333,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("86229f93-15e3-453f-8922-424bc9edf940"),
                Condition = Condition.On,
                Date = new DateTime(638175456000000000),
                StartConditionTime = new TimeSpan(537450000000),
                Time = 2,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("96ed4c9f-c2cd-42cd-ac11-1213fed0d5a9"),
                Condition = Condition.AtWork,
                Date = new DateTime(638175456000000000),
                StartConditionTime = new TimeSpan(537800000000),
                Time = 1.0666666666666667,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("645d51cb-7b6b-48c7-8e55-375c09c1ebfa"),
                Condition = Condition.On,
                Date = new DateTime(638175456000000000),
                StartConditionTime = new TimeSpan(543280000000),
                Time = 2,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("e41f86a8-9bda-4423-a86e-f5e95c173fe7"),
                Condition = Condition.AtWork,
                Date = new DateTime(638175456000000000),
                StartConditionTime = new TimeSpan(543590000000),
                Time = 0.6166666666666667,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("11cc242d-94dd-4c67-acca-40408ea6a131"),
                Condition = Condition.AtWork,
                Date = new DateTime(638175456000000000),
                StartConditionTime = new TimeSpan(544040000000),
                Time = 0.5166666666666667,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("fc52d5b3-6321-4c9d-8a20-0e870b7ee7de"),
                Condition = Condition.AtWork,
                Date = new DateTime(638175456000000000),
                StartConditionTime = new TimeSpan(544500000000),
                Time = 0.36666666666666664,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("81e8b4f5-4cb2-4bce-8977-917261dc3de8"),
                Condition = Condition.On,
                Date = new DateTime(638175456000000000),
                StartConditionTime = new TimeSpan(548000000000),
                Time = 2,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("0d58276c-2e4e-4cff-9a63-86a5706b9c09"),
                Condition = Condition.AtWork,
                Date = new DateTime(638175456000000000),
                StartConditionTime = new TimeSpan(548790000000),
                Time = 1.1,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("0182aff3-11a1-4abf-be07-da7de1a67afe"),
                Condition = Condition.AtWork,
                Date = new DateTime(638175456000000000),
                StartConditionTime = new TimeSpan(550730000000),
                Time = 0.8666666666666667,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("1065e253-8d84-4ab9-a1c2-a82b2d9546c6"),
                Condition = Condition.On,
                Date = new DateTime(638175456000000000),
                StartConditionTime = new TimeSpan(554260000000),
                Time = 2,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("3d897b6e-2158-4e00-b286-a5c40b86a370"),
                Condition = Condition.AtWork,
                Date = new DateTime(638175456000000000),
                StartConditionTime = new TimeSpan(559620000000),
                Time = 0.6333333333333333,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("ff1363dd-778d-4466-9a08-2c26f0b1bba4"),
                Condition = Condition.On,
                Date = new DateTime(638176320000000000),
                StartConditionTime = new TimeSpan(465900000000),
                Time = 2,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("b6232de6-8f12-4c7b-8b9c-f7154c732091"),
                Condition = Condition.On,
                Date = new DateTime(638176320000000000),
                StartConditionTime = new TimeSpan(468940000000),
                Time = 2,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("f49a2866-9c8b-4ff4-a629-a524a35170af"),
                Condition = Condition.AtWork,
                Date = new DateTime(638176320000000000),
                StartConditionTime = new TimeSpan(473890000000),
                Time = 0.7,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("68cacd02-d8a7-4489-8ae3-ab8d00eac56d"),
                Condition = Condition.AtWork,
                Date = new DateTime(638176320000000000),
                StartConditionTime = new TimeSpan(479660000000),
                Time = 1.0666666666666667,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("fb12b4e8-9eb0-4872-ad19-9274acafcd69"),
                Condition = Condition.AtWork,
                Date = new DateTime(638176320000000000),
                StartConditionTime = new TimeSpan(480700000000),
                Time = 0.3,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("2ec466ce-11da-46c9-bb46-249a3b512938"),
                Condition = Condition.AtWork,
                Date = new DateTime(638176320000000000),
                StartConditionTime = new TimeSpan(482280000000),
                Time = 0.6333333333333333,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("1380472d-347b-4287-a236-5b983bf811fc"),
                Condition = Condition.AtWork,
                Date = new DateTime(638176320000000000),
                StartConditionTime = new TimeSpan(482870000000),
                Time = 0.16666666666666666,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("6b5aca67-3a30-4b19-b006-bf99cb9165fd"),
                Condition = Condition.AtWork,
                Date = new DateTime(638176320000000000),
                StartConditionTime = new TimeSpan(483480000000),
                Time = 0.2,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("32d2897d-b5fe-4fc0-a20c-7e897deeebee"),
                Condition = Condition.AtWork,
                Date = new DateTime(638176320000000000),
                StartConditionTime = new TimeSpan(483670000000),
                Time = 0.15,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("a9be6d9a-1274-43de-93e9-b8c15097389a"),
                Condition = Condition.AtWork,
                Date = new DateTime(638176320000000000),
                StartConditionTime = new TimeSpan(483970000000),
                Time = 0.21666666666666667,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("89c6822f-33a8-498b-9706-d7fed6916e75"),
                Condition = Condition.AtWork,
                Date = new DateTime(638176320000000000),
                StartConditionTime = new TimeSpan(484310000000),
                Time = 0.16666666666666666,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("847f9998-c2fc-4717-a1a1-3822834f3b5c"),
                Condition = Condition.AtWork,
                Date = new DateTime(638176320000000000),
                StartConditionTime = new TimeSpan(484550000000),
                Time = 0.18333333333333332,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("468afc8c-2fb7-4052-b443-9d4d0f70a205"),
                Condition = Condition.AtWork,
                Date = new DateTime(638176320000000000),
                StartConditionTime = new TimeSpan(484720000000),
                Time = 0.25,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("41c63da0-857a-41b6-87d5-b0a6248f96f6"),
                Condition = Condition.AtWork,
                Date = new DateTime(638176320000000000),
                StartConditionTime = new TimeSpan(485040000000),
                Time = 0.25,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("6506d3b7-cd6b-49bd-b45a-d954f3af44d5"),
                Condition = Condition.AtWork,
                Date = new DateTime(638176320000000000),
                StartConditionTime = new TimeSpan(485260000000),
                Time = 0.26666666666666666,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("afd2dd52-c1aa-47a8-a796-05f4badfba35"),
                Condition = Condition.AtWork,
                Date = new DateTime(638176320000000000),
                StartConditionTime = new TimeSpan(485490000000),
                Time = 0.16666666666666666,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("2743ee99-14d1-47af-b4c7-fdc43b1c0b2b"),
                Condition = Condition.AtWork,
                Date = new DateTime(638176320000000000),
                StartConditionTime = new TimeSpan(528030000000),
                Time = 1.15,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("f0e60341-b592-4880-9536-391d9baf3c03"),
                Condition = Condition.AtWork,
                Date = new DateTime(638176320000000000),
                StartConditionTime = new TimeSpan(528830000000),
                Time = 0.23333333333333334,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("ae4e5dde-b3b1-49c9-b775-0e378285ce24"),
                Condition = Condition.AtWork,
                Date = new DateTime(638176320000000000),
                StartConditionTime = new TimeSpan(529230000000),
                Time = 0.7666666666666667,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("ecb09b18-9697-49c4-ade6-a125b66465c0"),
                Condition = Condition.AtWork,
                Date = new DateTime(638176320000000000),
                StartConditionTime = new TimeSpan(529870000000),
                Time = 0.4,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("c896bc9d-1527-4019-ba56-75936263d616"),
                Condition = Condition.AtWork,
                Date = new DateTime(638176320000000000),
                StartConditionTime = new TimeSpan(530180000000),
                Time = 0.23333333333333334,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("26eb4833-f012-4878-9a7c-0ba617b193ae"),
                Condition = Condition.AtWork,
                Date = new DateTime(638176320000000000),
                StartConditionTime = new TimeSpan(530390000000),
                Time = 0.4,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("b2f16801-ddba-4c5a-8da2-697461cdbe84"),
                Condition = Condition.AtWork,
                Date = new DateTime(638176320000000000),
                StartConditionTime = new TimeSpan(530700000000),
                Time = 0.15,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("c5f8f1c8-ed38-4f68-bb6b-0bb31b18e7c3"),
                Condition = Condition.AtWork,
                Date = new DateTime(638176320000000000),
                StartConditionTime = new TimeSpan(530950000000),
                Time = 1.1166666666666667,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("06e18069-f684-4010-b86b-b012edb44ae3"),
                Condition = Condition.AtWork,
                Date = new DateTime(638176320000000000),
                StartConditionTime = new TimeSpan(532890000000),
                Time = 1.1333333333333333,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("4ba4d6f3-7f3e-4b1e-b6c7-f339377a29fc"),
                Condition = Condition.AtWork,
                Date = new DateTime(638176320000000000),
                StartConditionTime = new TimeSpan(537810000000),
                Time = 0.95,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("4645b9e8-8101-450e-8c5f-13231a372a5e"),
                Condition = Condition.AtWork,
                Date = new DateTime(638176320000000000),
                StartConditionTime = new TimeSpan(543170000000),
                Time = 0.6833333333333333,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("ab571ad9-7d05-47a5-afff-a49ff666c099"),
                Condition = Condition.AtWork,
                Date = new DateTime(638176320000000000),
                StartConditionTime = new TimeSpan(543660000000),
                Time = 1.0833333333333333,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("7a9d068d-5dcb-4705-a385-c6b92ae23a2a"),
                Condition = Condition.AtWork,
                Date = new DateTime(638176320000000000),
                StartConditionTime = new TimeSpan(545830000000),
                Time = 0.25,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("0cea412b-05f0-415b-8034-eb27d52cdc85"),
                Condition = Condition.AtWork,
                Date = new DateTime(638176320000000000),
                StartConditionTime = new TimeSpan(546160000000),
                Time = 0.18333333333333332,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("74a12fdf-0d26-4cb7-8c26-d746a1af8254"),
                Condition = Condition.AtWork,
                Date = new DateTime(638176320000000000),
                StartConditionTime = new TimeSpan(551780000000),
                Time = 0.55,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("4a6658aa-08e9-4787-96dd-08a9a807bffd"),
                Condition = Condition.AtWork,
                Date = new DateTime(638176320000000000),
                StartConditionTime = new TimeSpan(552200000000),
                Time = 1.1333333333333333,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("3e709596-3aba-4641-9a1b-9671b7b7be8b"),
                Condition = Condition.On,
                Date = new DateTime(638180640000000000),
                StartConditionTime = new TimeSpan(494070000000),
                Time = 2,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("366866ac-1e06-4f88-870a-00f110837a18"),
                Condition = Condition.AtWork,
                Date = new DateTime(638180640000000000),
                StartConditionTime = new TimeSpan(520850000000),
                Time = 1.1166666666666667,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("c3d1609a-1229-4e64-8808-8c9545b80db9"),
                Condition = Condition.AtWork,
                Date = new DateTime(638180640000000000),
                StartConditionTime = new TimeSpan(521630000000),
                Time = 0.26666666666666666,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("56364dfd-4331-4ad0-b3e8-cf8e484fdec0"),
                Condition = Condition.AtWork,
                Date = new DateTime(638180640000000000),
                StartConditionTime = new TimeSpan(522280000000),
                Time = 0.6,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("1b859072-f5b2-40a5-9b26-157a6d04e11a"),
                Condition = Condition.AtWork,
                Date = new DateTime(638180640000000000),
                StartConditionTime = new TimeSpan(522780000000),
                Time = 0.35,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("3c0b64ca-62bf-41db-8df7-543f1874f4cd"),
                Condition = Condition.AtWork,
                Date = new DateTime(638180640000000000),
                StartConditionTime = new TimeSpan(523060000000),
                Time = 0.25,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("4af63cd0-db5f-4dd5-b5bf-007e210bc2b2"),
                Condition = Condition.AtWork,
                Date = new DateTime(638180640000000000),
                StartConditionTime = new TimeSpan(523280000000),
                Time = 0.5,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("846774e3-abe8-4bcb-af65-9a007e732914"),
                Condition = Condition.AtWork,
                Date = new DateTime(638180640000000000),
                StartConditionTime = new TimeSpan(523930000000),
                Time = 0.23333333333333334,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("9f8ab4c2-c0fc-4434-875a-46d5d4cb7b46"),
                Condition = Condition.AtWork,
                Date = new DateTime(638180640000000000),
                StartConditionTime = new TimeSpan(525410000000),
                Time = 0.15,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("c66e75b5-19af-405a-aa43-1191e70387ed"),
                Condition = Condition.AtWork,
                Date = new DateTime(638180640000000000),
                StartConditionTime = new TimeSpan(525890000000),
                Time = 0.7666666666666667,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("129319c3-d00c-42ce-b552-84815f320067"),
                Condition = Condition.AtWork,
                Date = new DateTime(638180640000000000),
                StartConditionTime = new TimeSpan(526990000000),
                Time = 0.03333333333333333,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("57c98867-7ee6-4f8d-bcdc-fb59b95d6319"),
                Condition = Condition.AtWork,
                Date = new DateTime(638180640000000000),
                StartConditionTime = new TimeSpan(530670000000),
                Time = 1.1333333333333333,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("d21c9f83-7c96-4b95-9850-46d8791ede38"),
                Condition = Condition.AtWork,
                Date = new DateTime(638180640000000000),
                StartConditionTime = new TimeSpan(537650000000),
                Time = 1.2333333333333334,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("62e3c3e5-12dc-4de4-844e-950097ee3596"),
                Condition = Condition.AtWork,
                Date = new DateTime(638180640000000000),
                StartConditionTime = new TimeSpan(538540000000),
                Time = 0.5333333333333333,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("52b971b5-44e0-4594-821a-b2c42fe4a2e7"),
                Condition = Condition.AtWork,
                Date = new DateTime(638180640000000000),
                StartConditionTime = new TimeSpan(538940000000),
                Time = 0.6166666666666667,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("a36e0615-e95d-456e-8031-433954015423"),
                Condition = Condition.AtWork,
                Date = new DateTime(638180640000000000),
                StartConditionTime = new TimeSpan(539390000000),
                Time = 0.6166666666666667,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("717c9121-b38e-43f6-b852-d8fb3cf31acb"),
                Condition = Condition.AtWork,
                Date = new DateTime(638180640000000000),
                StartConditionTime = new TimeSpan(539840000000),
                Time = 0.8,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("7905ae81-8ff8-4a57-a990-5849b14bfbb2"),
                Condition = Condition.AtWork,
                Date = new DateTime(638180640000000000),
                StartConditionTime = new TimeSpan(550820000000),
                Time = 0.21666666666666667,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("fb1e5990-2570-474a-9274-6b8c58fbcc9f"),
                Condition = Condition.AtWork,
                Date = new DateTime(638180640000000000),
                StartConditionTime = new TimeSpan(551260000000),
                Time = 0.18333333333333332,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("74d93aa9-bc23-4b59-a2d3-a9e8b7f6d63d"),
                Condition = Condition.AtWork,
                Date = new DateTime(638180640000000000),
                StartConditionTime = new TimeSpan(552250000000),
                Time = 0.21666666666666667,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("fd01114c-bc07-40c7-ac44-47f9e014247a"),
                Condition = Condition.AtWork,
                Date = new DateTime(638180640000000000),
                StartConditionTime = new TimeSpan(552540000000),
                Time = 0.18333333333333332,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("46080408-16c5-427d-a5d4-6de0eea6ff11"),
                Condition = Condition.AtWork,
                Date = new DateTime(638180640000000000),
                StartConditionTime = new TimeSpan(584930000000),
                Time = 0.38333333333333336,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("a3fc6c32-94aa-4426-8500-a321b9656ff3"),
                Condition = Condition.AtWork,
                Date = new DateTime(638180640000000000),
                StartConditionTime = new TimeSpan(588430000000),
                Time = 0.6833333333333333,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("a5a9e33f-8943-4b8f-9099-7fdef2d5cc3a"),
                Condition = Condition.AtWork,
                Date = new DateTime(638180640000000000),
                StartConditionTime = new TimeSpan(588920000000),
                Time = 0.5333333333333333,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("167100aa-c822-4757-a76b-208eca02dcff"),
                Condition = Condition.AtWork,
                Date = new DateTime(638180640000000000),
                StartConditionTime = new TimeSpan(589320000000),
                Time = 0.5666666666666667,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("660fd93c-38cb-40c8-b81b-d575be7dae7a"),
                Condition = Condition.AtWork,
                Date = new DateTime(638180640000000000),
                StartConditionTime = new TimeSpan(589740000000),
                Time = 0.6,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("a5f636ac-3645-4639-b6d5-1bbd0f1308dd"),
                Condition = Condition.AtWork,
                Date = new DateTime(638180640000000000),
                StartConditionTime = new TimeSpan(590350000000),
                Time = 0.8833333333333333,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("defa8c7a-e357-453e-9a1d-46407c489357"),
                Condition = Condition.AtWork,
                Date = new DateTime(638180640000000000),
                StartConditionTime = new TimeSpan(590970000000),
                Time = 0.4166666666666667,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("394dfcee-11eb-460d-8713-ead636b22c96"),
                Condition = Condition.AtWork,
                Date = new DateTime(638180640000000000),
                StartConditionTime = new TimeSpan(592760000000),
                Time = 0.55,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("87a1a80f-207b-488b-9cd3-e99d0a597837"),
                Condition = Condition.AtWork,
                Date = new DateTime(638180640000000000),
                StartConditionTime = new TimeSpan(593170000000),
                Time = 0.7166666666666667,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("560bd75f-b412-4853-ba1b-4e5bda929baf"),
                Condition = Condition.AtWork,
                Date = new DateTime(638180640000000000),
                StartConditionTime = new TimeSpan(594260000000),
                Time = 0.7333333333333333,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("4a315a92-bb57-4a99-9687-679fbe3d05cd"),
                Condition = Condition.AtWork,
                Date = new DateTime(638180640000000000),
                StartConditionTime = new TimeSpan(594790000000),
                Time = 0.75,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("a180e685-5932-4714-9a1f-137db6c56f5d"),
                Condition = Condition.AtWork,
                Date = new DateTime(638180640000000000),
                StartConditionTime = new TimeSpan(595340000000),
                Time = 0.9333333333333333,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("58162756-c73c-4c8a-8887-72eb4b11cbdb"),
                Condition = Condition.AtWork,
                Date = new DateTime(638180640000000000),
                StartConditionTime = new TimeSpan(599260000000),
                Time = 0.016666666666666666,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("cce5ed07-fa7c-4cbb-8457-fce0d563a144"),
                Condition = Condition.AtWork,
                Date = new DateTime(638180640000000000),
                StartConditionTime = new TimeSpan(600980000000),
                Time = 0.4666666666666667,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("9ddc8a93-8693-4105-847a-e5016bec5268"),
                Condition = Condition.AtWork,
                Date = new DateTime(638180640000000000),
                StartConditionTime = new TimeSpan(605220000000),
                Time = 1.2166666666666666,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("51163355-30b0-4d15-9339-fdfbf9ba0a42"),
                Condition = Condition.AtWork,
                Date = new DateTime(638180640000000000),
                StartConditionTime = new TimeSpan(606180000000),
                Time = 0.5,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("ef13233f-2006-4ba0-a3a8-59a4239749c3"),
                Condition = Condition.AtWork,
                Date = new DateTime(638180640000000000),
                StartConditionTime = new TimeSpan(607780000000),
                Time = 0.6333333333333333,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("5d5d60e1-8002-43eb-98fc-370eb439f1eb"),
                Condition = Condition.AtWork,
                Date = new DateTime(638180640000000000),
                StartConditionTime = new TimeSpan(608250000000),
                Time = 0.38333333333333336,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("87489594-2621-4843-a57a-c0a68218fabe"),
                Condition = Condition.AtWork,
                Date = new DateTime(638180640000000000),
                StartConditionTime = new TimeSpan(622420000000),
                Time = 1.1,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("b8c30e33-6f46-401f-ae82-b8dc8534f5e9"),
                Condition = Condition.AtWork,
                Date = new DateTime(638180640000000000),
                StartConditionTime = new TimeSpan(623400000000),
                Time = 0.5,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("59592cb3-d26d-4c26-b7ad-43cebfc7bee9"),
                Condition = Condition.AtWork,
                Date = new DateTime(638180640000000000),
                StartConditionTime = new TimeSpan(624880000000),
                Time = 0.5333333333333333,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("f118ed78-0682-435a-8b54-94cb58db8f3b"),
                Condition = Condition.AtWork,
                Date = new DateTime(638180640000000000),
                StartConditionTime = new TimeSpan(625420000000),
                Time = 0.23333333333333334,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("01ecd2cb-8164-4ad6-a922-a8e3399799c1"),
                Condition = Condition.AtWork,
                Date = new DateTime(638180640000000000),
                StartConditionTime = new TimeSpan(644000000000),
                Time = 0.25,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("b47b8676-7f04-4783-bf82-9ea84783c68c"),
                Condition = Condition.AtWork,
                Date = new DateTime(638180640000000000),
                StartConditionTime = new TimeSpan(644210000000),
                Time = 0.21666666666666667,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("825817d0-9abf-4813-adac-4c39b83b58e2"),
                Condition = Condition.AtWork,
                Date = new DateTime(638180640000000000),
                StartConditionTime = new TimeSpan(644770000000),
                Time = 0.23333333333333334,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("65b7bb68-6fd7-48c6-9418-7802bf7836a6"),
                Condition = Condition.AtWork,
                Date = new DateTime(638180640000000000),
                StartConditionTime = new TimeSpan(644980000000),
                Time = 0.2,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("447061cf-4efb-4a17-bde4-671142b14377"),
                Condition = Condition.AtWork,
                Date = new DateTime(638180640000000000),
                StartConditionTime = new TimeSpan(645170000000),
                Time = 0.26666666666666666,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("7f4d32f9-c37e-44cd-8ac9-024e6bfaf25e"),
                Condition = Condition.On,
                Date = new DateTime(638181504000000000),
                StartConditionTime = new TimeSpan(391940000000),
                Time = 1,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("8bbc1fb8-436c-4894-bfa2-a7ebf249708b"),
                Condition = Condition.On,
                Date = new DateTime(638181504000000000),
                StartConditionTime = new TimeSpan(416710000000),
                Time = 1,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("f6668099-bc70-4028-9f18-e382082105ea"),
                Condition = Condition.On,
                Date = new DateTime(638185824000000000),
                StartConditionTime = new TimeSpan(684130000000),
                Time = 1,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("2ad72568-f8f6-4409-a056-40bf749463f6"),
                Condition = Condition.AtWork,
                Date = new DateTime(638185824000000000),
                StartConditionTime = new TimeSpan(684480000000),
                Time = 0.7833333333333333,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("299622db-856f-40f7-8777-99784e3bd46b"),
                Condition = Condition.On,
                Date = new DateTime(638186688000000000),
                StartConditionTime = new TimeSpan(350360000000),
                Time = 1,
                WeldingEquipmentId = Guid.Parse("a623d6e5-7a95-4c22-addb-35ec1a76e606"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("5e224d38-64d3-4b56-bc1f-cc2f882fd8b5"),
                Condition = Condition.On,
                Date = new DateTime(638186688000000000),
                StartConditionTime = new TimeSpan(413280000000),
                Time = 1,
                WeldingEquipmentId = Guid.Parse("a623d6e5-7a95-4c22-addb-35ec1a76e606"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("a1957cea-cfc6-481d-ad40-cd881ac67736"),
                Condition = Condition.On,
                Date = new DateTime(638186688000000000),
                StartConditionTime = new TimeSpan(428310000000),
                Time = 2,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("c9c79ec8-a568-4fda-9725-77608f4bf46f"),
                Condition = Condition.On,
                Date = new DateTime(638186688000000000),
                StartConditionTime = new TimeSpan(455290000000),
                Time = 1,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("25c18963-ac34-4b0b-bf91-776fd933d10d"),
                Condition = Condition.AtWork,
                Date = new DateTime(638186688000000000),
                StartConditionTime = new TimeSpan(465580000000),
                Time = 0.23333333333333334,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("57d6cbeb-baea-4dcf-8200-1ed7293211cf"),
                Condition = Condition.AtWork,
                Date = new DateTime(638186688000000000),
                StartConditionTime = new TimeSpan(471480000000),
                Time = 0.2833333333333333,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("32b22bbd-93f4-4067-a181-332d2d504bdb"),
                Condition = Condition.AtWork,
                Date = new DateTime(638186688000000000),
                StartConditionTime = new TimeSpan(471890000000),
                Time = 0.31666666666666665,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("311d675d-f5ec-4101-b26e-49c47840648a"),
                Condition = Condition.AtWork,
                Date = new DateTime(638186688000000000),
                StartConditionTime = new TimeSpan(472410000000),
                Time = 0.31666666666666665,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("0b0740c1-cfcc-42f1-a6cf-67ec0ac31533"),
                Condition = Condition.AtWork,
                Date = new DateTime(638186688000000000),
                StartConditionTime = new TimeSpan(472880000000),
                Time = 0.31666666666666665,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("bfbd449a-0d01-49c8-a77a-175b2e904902"),
                Condition = Condition.AtWork,
                Date = new DateTime(638186688000000000),
                StartConditionTime = new TimeSpan(473150000000),
                Time = 0.18333333333333332,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("02fe966a-4c72-44e4-876a-03733b0ca369"),
                Condition = Condition.AtWork,
                Date = new DateTime(638186688000000000),
                StartConditionTime = new TimeSpan(477970000000),
                Time = 0.2,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("e4937959-f8e3-4239-9997-87d267ca91bf"),
                Condition = Condition.AtWork,
                Date = new DateTime(638186688000000000),
                StartConditionTime = new TimeSpan(478150000000),
                Time = 0.2,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("deaf8342-c70c-4711-94bf-e7380f3709c8"),
                Condition = Condition.AtWork,
                Date = new DateTime(638186688000000000),
                StartConditionTime = new TimeSpan(478340000000),
                Time = 0.31666666666666665,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("242223f7-96ff-4284-8c4f-5a909d313a72"),
                Condition = Condition.AtWork,
                Date = new DateTime(638186688000000000),
                StartConditionTime = new TimeSpan(478750000000),
                Time = 0.31666666666666665,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("40dc607b-d3c7-466e-9384-917009be6ed3"),
                Condition = Condition.AtWork,
                Date = new DateTime(638186688000000000),
                StartConditionTime = new TimeSpan(479330000000),
                Time = 0.35,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("ab5d0c64-5b45-40eb-be28-2bbece679827"),
                Condition = Condition.AtWork,
                Date = new DateTime(638186688000000000),
                StartConditionTime = new TimeSpan(479740000000),
                Time = 0.3,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("5740b7a0-cc08-4fad-a96c-760da05dbad9"),
                Condition = Condition.AtWork,
                Date = new DateTime(638186688000000000),
                StartConditionTime = new TimeSpan(480500000000),
                Time = 0.8833333333333333,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("fa4c8a14-c726-4f4d-8e67-7da3ad0ba503"),
                Condition = Condition.AtWork,
                Date = new DateTime(638186688000000000),
                StartConditionTime = new TimeSpan(494180000000),
                Time = 0.21666666666666667,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("dd093ed1-7532-4d1a-94a0-bf176a9826e3"),
                Condition = Condition.AtWork,
                Date = new DateTime(638186688000000000),
                StartConditionTime = new TimeSpan(494490000000),
                Time = 0.25,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("0d81b305-8fc3-4541-8033-312bd7f3f456"),
                Condition = Condition.AtWork,
                Date = new DateTime(638186688000000000),
                StartConditionTime = new TimeSpan(502270000000),
                Time = 0.75,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("1359af79-5f9e-435f-8a3a-213bb8ffcf7d"),
                Condition = Condition.AtWork,
                Date = new DateTime(638186688000000000),
                StartConditionTime = new TimeSpan(502810000000),
                Time = 1.1666666666666667,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("75af6dbc-92ef-4209-ab54-39633510bcbd"),
                Condition = Condition.AtWork,
                Date = new DateTime(638186688000000000),
                StartConditionTime = new TimeSpan(503700000000),
                Time = 0.48333333333333334,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("d8bc5fb0-2fda-4e7d-a010-7b2154ee213c"),
                Condition = Condition.AtWork,
                Date = new DateTime(638186688000000000),
                StartConditionTime = new TimeSpan(504130000000),
                Time = 0.85,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("67c10364-e6af-4377-acb7-b5cd8449f21e"),
                Condition = Condition.AtWork,
                Date = new DateTime(638186688000000000),
                StartConditionTime = new TimeSpan(504730000000),
                Time = 0.8833333333333333,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("d5c9b2b5-bc7b-4d73-9a5d-bbb656e081d1"),
                Condition = Condition.AtWork,
                Date = new DateTime(638186688000000000),
                StartConditionTime = new TimeSpan(535330000000),
                Time = 0.8833333333333333,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("842e08b8-a0a9-4e42-91b9-a07b881a7f1e"),
                Condition = Condition.AtWork,
                Date = new DateTime(638186688000000000),
                StartConditionTime = new TimeSpan(555680000000),
                Time = 1.1,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("da45f041-ec6a-42fb-b80d-6b0fde508b50"),
                Condition = Condition.AtWork,
                Date = new DateTime(638186688000000000),
                StartConditionTime = new TimeSpan(556500000000),
                Time = 0.8833333333333333,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("8fae2573-de67-4dfa-b1f5-b590245edf50"),
                Condition = Condition.AtWork,
                Date = new DateTime(638186688000000000),
                StartConditionTime = new TimeSpan(609710000000),
                Time = 0.65,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("ecc99041-e4dc-48ae-b077-2725421daecd"),
                Condition = Condition.AtWork,
                Date = new DateTime(638186688000000000),
                StartConditionTime = new TimeSpan(611880000000),
                Time = 1.0666666666666667,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("4241dbbe-3c75-4442-9104-dfebd762368e"),
                Condition = Condition.On,
                Date = new DateTime(638187552000000000),
                StartConditionTime = new TimeSpan(286590000000),
                Time = 2,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("2f931dd9-59bf-49db-9846-8697fb96a5fb"),
                Condition = Condition.AtWork,
                Date = new DateTime(638187552000000000),
                StartConditionTime = new TimeSpan(296220000000),
                Time = 1.15,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("9131da24-cbfb-469d-aed7-3e645f340c1c"),
                Condition = Condition.AtWork,
                Date = new DateTime(638187552000000000),
                StartConditionTime = new TimeSpan(297010000000),
                Time = 0.35,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("52fa678f-821f-49d4-8a4c-002d9bc37c28"),
                Condition = Condition.AtWork,
                Date = new DateTime(638187552000000000),
                StartConditionTime = new TimeSpan(297470000000),
                Time = 0.8166666666666667,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("7f41b683-8233-4f9d-824a-e42d7b7c2cd1"),
                Condition = Condition.AtWork,
                Date = new DateTime(638187552000000000),
                StartConditionTime = new TimeSpan(298340000000),
                Time = 0.9166666666666666,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("c2893bd2-eb88-402a-8b12-6c93f39c44d3"),
                Condition = Condition.AtWork,
                Date = new DateTime(638187552000000000),
                StartConditionTime = new TimeSpan(298990000000),
                Time = 0.38333333333333336,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("2ffff8b9-1d61-4272-b8bd-1c86c6580e60"),
                Condition = Condition.AtWork,
                Date = new DateTime(638187552000000000),
                StartConditionTime = new TimeSpan(299300000000),
                Time = 0.21666666666666667,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("67e9dfec-d84b-4de9-be5a-5dd654a704f0"),
                Condition = Condition.AtWork,
                Date = new DateTime(638187552000000000),
                StartConditionTime = new TimeSpan(299590000000),
                Time = 0.31666666666666665,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("6d88a52c-ed09-4735-89fd-da2b15cf9854"),
                Condition = Condition.AtWork,
                Date = new DateTime(638187552000000000),
                StartConditionTime = new TimeSpan(299860000000),
                Time = 0.15,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("65feb577-3d75-4a93-b432-4b77e0c8c2dc"),
                Condition = Condition.AtWork,
                Date = new DateTime(638187552000000000),
                StartConditionTime = new TimeSpan(300020000000),
                Time = 0.8833333333333333,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("1cebdbb0-5c39-4d23-b42f-31bb5f6cc3df"),
                Condition = Condition.AtWork,
                Date = new DateTime(638187552000000000),
                StartConditionTime = new TimeSpan(311090000000),
                Time = 0.26666666666666666,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("c1ba44f2-bb1d-4d21-a6ec-edbc94fde601"),
                Condition = Condition.AtWork,
                Date = new DateTime(638187552000000000),
                StartConditionTime = new TimeSpan(311330000000),
                Time = 0.4666666666666667,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("42f2157c-381a-4a04-85d4-8061fd68b142"),
                Condition = Condition.AtWork,
                Date = new DateTime(638187552000000000),
                StartConditionTime = new TimeSpan(315870000000),
                Time = 0.9666666666666667,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("64960fb8-5be7-4bcf-93cd-e6c5b3e1a9f1"),
                Condition = Condition.AtWork,
                Date = new DateTime(638187552000000000),
                StartConditionTime = new TimeSpan(320040000000),
                Time = 0.23333333333333334,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("305f5717-0c84-43d9-a51f-c2b812addc9b"),
                Condition = Condition.AtWork,
                Date = new DateTime(638187552000000000),
                StartConditionTime = new TimeSpan(320560000000),
                Time = 0.21666666666666667,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("c9fde51b-4f93-44cc-92aa-17e6f955a322"),
                Condition = Condition.AtWork,
                Date = new DateTime(638187552000000000),
                StartConditionTime = new TimeSpan(325250000000),
                Time = 0.3,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("bdb43fa6-4455-4e24-b915-78d490ece895"),
                Condition = Condition.AtWork,
                Date = new DateTime(638187552000000000),
                StartConditionTime = new TimeSpan(325510000000),
                Time = 0.35,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("fa6f8dd9-3dc1-4af6-85f7-c243bc4a4ec8"),
                Condition = Condition.AtWork,
                Date = new DateTime(638187552000000000),
                StartConditionTime = new TimeSpan(325800000000),
                Time = 0.7333333333333333,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("2d3f055d-2bff-4d5d-98da-63c172bf744c"),
                Condition = Condition.AtWork,
                Date = new DateTime(638187552000000000),
                StartConditionTime = new TimeSpan(326410000000),
                Time = 1,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("c023b297-3126-4a88-a2f9-c2d4cc581e54"),
                Condition = Condition.AtWork,
                Date = new DateTime(638187552000000000),
                StartConditionTime = new TimeSpan(327110000000),
                Time = 0.5333333333333333,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("ace4d643-1f1d-49ae-a263-d518fefb5a95"),
                Condition = Condition.AtWork,
                Date = new DateTime(638187552000000000),
                StartConditionTime = new TimeSpan(327510000000),
                Time = 0.8333333333333334,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("71bbbb3c-5e49-49f7-b9ba-655972b58915"),
                Condition = Condition.AtWork,
                Date = new DateTime(638187552000000000),
                StartConditionTime = new TimeSpan(328210000000),
                Time = 0.7,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("b4336cfa-91ce-448a-8546-23b7a87690d5"),
                Condition = Condition.AtWork,
                Date = new DateTime(638187552000000000),
                StartConditionTime = new TimeSpan(328730000000),
                Time = 1.1166666666666667,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("e6ce9215-82f1-4239-b3c0-a0dab26f1081"),
                Condition = Condition.AtWork,
                Date = new DateTime(638187552000000000),
                StartConditionTime = new TimeSpan(329550000000),
                Time = 0.8833333333333333,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("17c49f32-91c7-49ca-9a9e-3242b9379c8c"),
                Condition = Condition.AtWork,
                Date = new DateTime(638187552000000000),
                StartConditionTime = new TimeSpan(330180000000),
                Time = 0.5666666666666667,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("10058bc4-aff7-4182-a423-1e4ce38662a4"),
                Condition = Condition.AtWork,
                Date = new DateTime(638187552000000000),
                StartConditionTime = new TimeSpan(330600000000),
                Time = 1.2166666666666666,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("8c4af1cd-f2bc-4d8b-82bb-78059022438f"),
                Condition = Condition.AtWork,
                Date = new DateTime(638187552000000000),
                StartConditionTime = new TimeSpan(369990000000),
                Time = 0.8833333333333333,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("ba912bf0-c188-476a-b210-bacf28727b93"),
                Condition = Condition.AtWork,
                Date = new DateTime(638187552000000000),
                StartConditionTime = new TimeSpan(373050000000),
                Time = 0.3333333333333333,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("53d7c9bd-26e5-4ee2-ad5e-661f2dffa7cb"),
                Condition = Condition.AtWork,
                Date = new DateTime(638187552000000000),
                StartConditionTime = new TimeSpan(373330000000),
                Time = 0.8833333333333333,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("d7f7394f-c448-4546-a010-6ba22c57e4ce"),
                Condition = Condition.AtWork,
                Date = new DateTime(638187552000000000),
                StartConditionTime = new TimeSpan(375040000000),
                Time = 0.8833333333333333,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("e74e136e-e1f7-4cb9-a5f9-a101dc10cec8"),
                Condition = Condition.AtWork,
                Date = new DateTime(638187552000000000),
                StartConditionTime = new TimeSpan(379290000000),
                Time = 0.8833333333333333,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("a5c22b1d-854b-4924-9943-9dfa3d772b9c"),
                Condition = Condition.AtWork,
                Date = new DateTime(638187552000000000),
                StartConditionTime = new TimeSpan(384950000000),
                Time = 1.2,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("7b129cd8-2cb8-4743-b45b-c3474c699515"),
                Condition = Condition.AtWork,
                Date = new DateTime(638187552000000000),
                StartConditionTime = new TimeSpan(387540000000),
                Time = 0.8833333333333333,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("39b3bf09-f04c-4310-b51d-149aba0fa009"),
                Condition = Condition.AtWork,
                Date = new DateTime(638187552000000000),
                StartConditionTime = new TimeSpan(411390000000),
                Time = 0.35,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("41e0eb2b-4233-4181-8e17-2f509b963417"),
                Condition = Condition.AtWork,
                Date = new DateTime(638187552000000000),
                StartConditionTime = new TimeSpan(411930000000),
                Time = 0.2,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("efd111fb-3140-4340-b6ca-fa7e0dd35cc9"),
                Condition = Condition.AtWork,
                Date = new DateTime(638187552000000000),
                StartConditionTime = new TimeSpan(412120000000),
                Time = 0.26666666666666666,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("ffa56dc1-2ae2-42e8-85bf-d8f175b11b02"),
                Condition = Condition.AtWork,
                Date = new DateTime(638187552000000000),
                StartConditionTime = new TimeSpan(412630000000),
                Time = 0.25,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("5804f4b6-6ba1-4854-b591-e82e86380e7f"),
                Condition = Condition.AtWork,
                Date = new DateTime(638187552000000000),
                StartConditionTime = new TimeSpan(412910000000),
                Time = 0.35,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("f0884b49-5f42-450a-a68c-ef70c621b91b"),
                Condition = Condition.AtWork,
                Date = new DateTime(638187552000000000),
                StartConditionTime = new TimeSpan(413340000000),
                Time = 0.26666666666666666,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("9e997f9b-ed43-4e65-957e-f82ca456b950"),
                Condition = Condition.AtWork,
                Date = new DateTime(638187552000000000),
                StartConditionTime = new TimeSpan(420590000000),
                Time = 1.1166666666666667,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("51c36ece-44f6-4ce8-9eda-3f8e6b8c8f0d"),
                Condition = Condition.AtWork,
                Date = new DateTime(638187552000000000),
                StartConditionTime = new TimeSpan(421360000000),
                Time = 0.3333333333333333,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("3dca3b75-71c8-4fd8-922e-6529a43738dd"),
                Condition = Condition.AtWork,
                Date = new DateTime(638187552000000000),
                StartConditionTime = new TimeSpan(421870000000),
                Time = 0.6833333333333333,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("425d3648-188d-403c-981a-76e59a3357f9"),
                Condition = Condition.AtWork,
                Date = new DateTime(638187552000000000),
                StartConditionTime = new TimeSpan(422450000000),
                Time = 0.8333333333333334,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("43935232-f2ff-4b03-adb9-e2b3c7bd87bf"),
                Condition = Condition.AtWork,
                Date = new DateTime(638187552000000000),
                StartConditionTime = new TimeSpan(423040000000),
                Time = 0.36666666666666664,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("334b4e91-d35d-4c84-89f6-ded7eb7ec1be"),
                Condition = Condition.AtWork,
                Date = new DateTime(638187552000000000),
                StartConditionTime = new TimeSpan(423350000000),
                Time = 0.15,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("b830e02c-4855-45ea-94fd-3ceef471c145"),
                Condition = Condition.AtWork,
                Date = new DateTime(638187552000000000),
                StartConditionTime = new TimeSpan(423650000000),
                Time = 0.3,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("abf5bad7-1764-45ec-b6fd-af09dd0710d8"),
                Condition = Condition.AtWork,
                Date = new DateTime(638187552000000000),
                StartConditionTime = new TimeSpan(423960000000),
                Time = 0.16666666666666666,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("d5c9a539-7cf3-4d4f-8b10-b1abb4f223ed"),
                Condition = Condition.AtWork,
                Date = new DateTime(638187552000000000),
                StartConditionTime = new TimeSpan(424400000000),
                Time = 0.8833333333333333,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("33b44ce1-a2b5-4f5f-8a43-31c733e85deb"),
                Condition = Condition.On,
                Date = new DateTime(638187552000000000),
                StartConditionTime = new TimeSpan(467390000000),
                Time = 1,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("7240d888-cdc7-4e9c-a77b-e2ab2165c02f"),
                Condition = Condition.AtWork,
                Date = new DateTime(638187552000000000),
                StartConditionTime = new TimeSpan(481080000000),
                Time = 0.5666666666666667,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("cd5e74ac-b9bb-4768-a9d7-f12ad8615581"),
                Condition = Condition.AtWork,
                Date = new DateTime(638187552000000000),
                StartConditionTime = new TimeSpan(481500000000),
                Time = 0.95,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("3f704572-d7a6-4acc-8025-dd9b27cbad3d"),
                Condition = Condition.AtWork,
                Date = new DateTime(638187552000000000),
                StartConditionTime = new TimeSpan(482530000000),
                Time = 0.95,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("0def6f27-c5b8-48a2-89c8-564be6b1cd58"),
                Condition = Condition.AtWork,
                Date = new DateTime(638187552000000000),
                StartConditionTime = new TimeSpan(483200000000),
                Time = 0.7,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("78db4560-1ec9-4790-a853-d48f49ac87a6"),
                Condition = Condition.AtWork,
                Date = new DateTime(638187552000000000),
                StartConditionTime = new TimeSpan(483710000000),
                Time = 0.8,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("375cb4e2-f7c1-4624-80b6-aef783fd6831"),
                Condition = Condition.AtWork,
                Date = new DateTime(638187552000000000),
                StartConditionTime = new TimeSpan(484280000000),
                Time = 0.9166666666666666,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("8be3d736-7fa5-49a0-b15f-9409da347d20"),
                Condition = Condition.AtWork,
                Date = new DateTime(638187552000000000),
                StartConditionTime = new TimeSpan(484930000000),
                Time = 0.4,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("d5e39443-819a-4139-9e78-967768a376b4"),
                Condition = Condition.AtWork,
                Date = new DateTime(638187552000000000),
                StartConditionTime = new TimeSpan(485250000000),
                Time = 0.8666666666666667,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("a68229a6-8528-4884-8fb2-51dbde7e8d88"),
                Condition = Condition.AtWork,
                Date = new DateTime(638187552000000000),
                StartConditionTime = new TimeSpan(485910000000),
                Time = 0.7333333333333333,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("6ec97cb6-db6b-428a-adfe-ad28940a8b37"),
                Condition = Condition.AtWork,
                Date = new DateTime(638187552000000000),
                StartConditionTime = new TimeSpan(486450000000),
                Time = 0.5333333333333333,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("44f05060-9185-4376-b19c-7da3b59902f0"),
                Condition = Condition.AtWork,
                Date = new DateTime(638187552000000000),
                StartConditionTime = new TimeSpan(486850000000),
                Time = 1.0166666666666666,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("4bd70fb2-8b5e-4b06-a4f5-54eb2afbccf6"),
                Condition = Condition.AtWork,
                Date = new DateTime(638187552000000000),
                StartConditionTime = new TimeSpan(494760000000),
                Time = 0.43333333333333335,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("64068c84-3dd4-4f59-a227-4f5011202e98"),
                Condition = Condition.AtWork,
                Date = new DateTime(638187552000000000),
                StartConditionTime = new TimeSpan(506200000000),
                Time = 0.6666666666666666,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("99f77d04-c51a-4990-ba40-820dabc6bd30"),
                Condition = Condition.AtWork,
                Date = new DateTime(638187552000000000),
                StartConditionTime = new TimeSpan(506690000000),
                Time = 0.43333333333333335,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("3ece4d9a-ff8f-40ad-a14e-dd957d279eff"),
                Condition = Condition.AtWork,
                Date = new DateTime(638187552000000000),
                StartConditionTime = new TimeSpan(531290000000),
                Time = 0.8833333333333333,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("8b58ff8e-be4f-418c-9eec-fa29327aca29"),
                Condition = Condition.AtWork,
                Date = new DateTime(638187552000000000),
                StartConditionTime = new TimeSpan(532970000000),
                Time = 0.8833333333333333,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("1fabec85-a282-4f56-bb82-9e28844d0e61"),
                Condition = Condition.AtWork,
                Date = new DateTime(638187552000000000),
                StartConditionTime = new TimeSpan(534590000000),
                Time = 0.8833333333333333,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("414fe2d8-aa32-46e5-93b8-23293be71079"),
                Condition = Condition.AtWork,
                Date = new DateTime(638187552000000000),
                StartConditionTime = new TimeSpan(543360000000),
                Time = 0.16666666666666666,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("e0fd8a28-4628-46b8-ab47-e080cc9dedc2"),
                Condition = Condition.AtWork,
                Date = new DateTime(638187552000000000),
                StartConditionTime = new TimeSpan(543640000000),
                Time = 0.5666666666666667,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("d2eb359e-1124-48da-97b9-a4f14af390a2"),
                Condition = Condition.AtWork,
                Date = new DateTime(638187552000000000),
                StartConditionTime = new TimeSpan(544120000000),
                Time = 0.4,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("1764027d-052a-42bb-b7d9-47dd7a58110d"),
                Condition = Condition.AtWork,
                Date = new DateTime(638187552000000000),
                StartConditionTime = new TimeSpan(568770000000),
                Time = 0.65,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("a60c5744-e9cd-428c-97f9-ca7681a37726"),
                Condition = Condition.AtWork,
                Date = new DateTime(638187552000000000),
                StartConditionTime = new TimeSpan(571110000000),
                Time = 0.8833333333333333,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("f184919f-e5a9-46a5-af74-84358e6a9b58"),
                Condition = Condition.AtWork,
                Date = new DateTime(638187552000000000),
                StartConditionTime = new TimeSpan(573230000000),
                Time = 0.6833333333333333,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("efe97e1c-e774-4811-9e9d-950f3f0fd4e8"),
                Condition = Condition.On,
                Date = new DateTime(638187552000000000),
                StartConditionTime = new TimeSpan(592200000000),
                Time = 1,
                WeldingEquipmentId = Guid.Parse("a623d6e5-7a95-4c22-addb-35ec1a76e606"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("687da803-44fb-454b-8c71-95d7a952a616"),
                Condition = Condition.AtWork,
                Date = new DateTime(638187552000000000),
                StartConditionTime = new TimeSpan(595840000000),
                Time = 0.15,
                WeldingEquipmentId = Guid.Parse("a623d6e5-7a95-4c22-addb-35ec1a76e606"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("f575b6a3-9967-424e-aee6-95892aa2510b"),
                Condition = Condition.AtWork,
                Date = new DateTime(638187552000000000),
                StartConditionTime = new TimeSpan(596370000000),
                Time = 0.23333333333333334,
                WeldingEquipmentId = Guid.Parse("a623d6e5-7a95-4c22-addb-35ec1a76e606"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("5a8009c1-8001-4720-ab94-c6f46ecf80df"),
                Condition = Condition.AtWork,
                Date = new DateTime(638187552000000000),
                StartConditionTime = new TimeSpan(596660000000),
                Time = 0.16666666666666666,
                WeldingEquipmentId = Guid.Parse("a623d6e5-7a95-4c22-addb-35ec1a76e606"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("a4f95794-16cf-4c0e-a1a1-62f231173a56"),
                Condition = Condition.AtWork,
                Date = new DateTime(638187552000000000),
                StartConditionTime = new TimeSpan(597520000000),
                Time = 0.2,
                WeldingEquipmentId = Guid.Parse("a623d6e5-7a95-4c22-addb-35ec1a76e606"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("362fafe3-699b-4496-8505-45726f653ebb"),
                Condition = Condition.AtWork,
                Date = new DateTime(638187552000000000),
                StartConditionTime = new TimeSpan(648870000000),
                Time = 0.36666666666666664,
                WeldingEquipmentId = Guid.Parse("a623d6e5-7a95-4c22-addb-35ec1a76e606"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("ec2f475d-5b28-418d-bdb5-fa6b20fea92b"),
                Condition = Condition.AtWork,
                Date = new DateTime(638187552000000000),
                StartConditionTime = new TimeSpan(649160000000),
                Time = 0.8666666666666667,
                WeldingEquipmentId = Guid.Parse("a623d6e5-7a95-4c22-addb-35ec1a76e606"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("3bf6cb23-16b6-4433-9833-db54b50d7375"),
                Condition = Condition.AtWork,
                Date = new DateTime(638187552000000000),
                StartConditionTime = new TimeSpan(649780000000),
                Time = 0.6,
                WeldingEquipmentId = Guid.Parse("a623d6e5-7a95-4c22-addb-35ec1a76e606"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("1089e62e-3cb4-4770-a178-a68c2fdf1cf2"),
                Condition = Condition.AtWork,
                Date = new DateTime(638187552000000000),
                StartConditionTime = new TimeSpan(650420000000),
                Time = 0.23333333333333334,
                WeldingEquipmentId = Guid.Parse("a623d6e5-7a95-4c22-addb-35ec1a76e606"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("c6918428-062f-4e9e-9862-fa6b6e305b8a"),
                Condition = Condition.AtWork,
                Date = new DateTime(638187552000000000),
                StartConditionTime = new TimeSpan(650630000000),
                Time = 0.8333333333333334,
                WeldingEquipmentId = Guid.Parse("a623d6e5-7a95-4c22-addb-35ec1a76e606"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("5f41a72e-8ef7-4c78-be63-8fe9037a7aa8"),
                Condition = Condition.AtWork,
                Date = new DateTime(638187552000000000),
                StartConditionTime = new TimeSpan(651220000000),
                Time = 0.7166666666666667,
                WeldingEquipmentId = Guid.Parse("a623d6e5-7a95-4c22-addb-35ec1a76e606"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("bcb04013-8414-4732-ba22-ae54927c613c"),
                Condition = Condition.AtWork,
                Date = new DateTime(638187552000000000),
                StartConditionTime = new TimeSpan(652710000000),
                Time = 0.4166666666666667,
                WeldingEquipmentId = Guid.Parse("a623d6e5-7a95-4c22-addb-35ec1a76e606"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("db085a66-605f-4b67-86c5-2d390c879aec"),
                Condition = Condition.AtWork,
                Date = new DateTime(638187552000000000),
                StartConditionTime = new TimeSpan(653040000000),
                Time = 0.43333333333333335,
                WeldingEquipmentId = Guid.Parse("a623d6e5-7a95-4c22-addb-35ec1a76e606"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("4aac8fe1-3970-4088-8a80-cf137f497031"),
                Condition = Condition.AtWork,
                Date = new DateTime(638187552000000000),
                StartConditionTime = new TimeSpan(653380000000),
                Time = 0.5166666666666667,
                WeldingEquipmentId = Guid.Parse("a623d6e5-7a95-4c22-addb-35ec1a76e606"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("0f9f6ad8-1fb8-4440-9f68-ca3c112220ac"),
                Condition = Condition.AtWork,
                Date = new DateTime(638187552000000000),
                StartConditionTime = new TimeSpan(654750000000),
                Time = 0.9666666666666667,
                WeldingEquipmentId = Guid.Parse("a623d6e5-7a95-4c22-addb-35ec1a76e606"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("628f5b25-c5c8-4e49-ba9b-ab25f4645a23"),
                Condition = Condition.AtWork,
                Date = new DateTime(638187552000000000),
                StartConditionTime = new TimeSpan(655820000000),
                Time = 0.35,
                WeldingEquipmentId = Guid.Parse("a623d6e5-7a95-4c22-addb-35ec1a76e606"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("bda3370e-70f6-4e5d-a6fb-ce513aae7fd3"),
                Condition = Condition.AtWork,
                Date = new DateTime(638187552000000000),
                StartConditionTime = new TimeSpan(656240000000),
                Time = 0.5666666666666667,
                WeldingEquipmentId = Guid.Parse("a623d6e5-7a95-4c22-addb-35ec1a76e606"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("8b9af665-8c59-4e6c-a1b9-257bebfae266"),
                Condition = Condition.AtWork,
                Date = new DateTime(638187552000000000),
                StartConditionTime = new TimeSpan(656710000000),
                Time = 0.5333333333333333,
                WeldingEquipmentId = Guid.Parse("a623d6e5-7a95-4c22-addb-35ec1a76e606"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("1a72abf9-4143-43bc-aadd-c93f74bbc62c"),
                Condition = Condition.AtWork,
                Date = new DateTime(638187552000000000),
                StartConditionTime = new TimeSpan(658960000000),
                Time = 0.85,
                WeldingEquipmentId = Guid.Parse("a623d6e5-7a95-4c22-addb-35ec1a76e606"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("7103f613-6b07-4aaf-ac6c-e7f422cd9f88"),
                Condition = Condition.AtWork,
                Date = new DateTime(638187552000000000),
                StartConditionTime = new TimeSpan(659620000000),
                Time = 0.45,
                WeldingEquipmentId = Guid.Parse("a623d6e5-7a95-4c22-addb-35ec1a76e606"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("6039241d-6e01-49d2-96e9-4c5cef52e10a"),
                Condition = Condition.AtWork,
                Date = new DateTime(638187552000000000),
                StartConditionTime = new TimeSpan(659970000000),
                Time = 0.7333333333333333,
                WeldingEquipmentId = Guid.Parse("a623d6e5-7a95-4c22-addb-35ec1a76e606"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("971ea96e-3676-4c25-bd99-2023e0a5bcb7"),
                Condition = Condition.AtWork,
                Date = new DateTime(638187552000000000),
                StartConditionTime = new TimeSpan(660680000000),
                Time = 0.2833333333333333,
                WeldingEquipmentId = Guid.Parse("a623d6e5-7a95-4c22-addb-35ec1a76e606"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("bb0b9862-7f26-4f61-9661-755cf78478d2"),
                Condition = Condition.AtWork,
                Date = new DateTime(638187552000000000),
                StartConditionTime = new TimeSpan(660920000000),
                Time = 0.5,
                WeldingEquipmentId = Guid.Parse("a623d6e5-7a95-4c22-addb-35ec1a76e606"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("6145fb3d-4344-4eb3-a10f-9b4ac225d0bd"),
                Condition = Condition.AtWork,
                Date = new DateTime(638187552000000000),
                StartConditionTime = new TimeSpan(661440000000),
                Time = 1.2166666666666666,
                WeldingEquipmentId = Guid.Parse("a623d6e5-7a95-4c22-addb-35ec1a76e606"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("ba3b37ca-a9ca-499a-9bb7-80e0f8e9b88f"),
                Condition = Condition.AtWork,
                Date = new DateTime(638187552000000000),
                StartConditionTime = new TimeSpan(662270000000),
                Time = 1.0833333333333333,
                WeldingEquipmentId = Guid.Parse("a623d6e5-7a95-4c22-addb-35ec1a76e606"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("2df7338b-f7d4-4707-939a-37035d977cb9"),
                Condition = Condition.AtWork,
                Date = new DateTime(638187552000000000),
                StartConditionTime = new TimeSpan(663630000000),
                Time = 0.35,
                WeldingEquipmentId = Guid.Parse("a623d6e5-7a95-4c22-addb-35ec1a76e606"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("b71cd1d1-af73-45c9-b20e-34151f8aa21e"),
                Condition = Condition.AtWork,
                Date = new DateTime(638187552000000000),
                StartConditionTime = new TimeSpan(663910000000),
                Time = 0.7666666666666667,
                WeldingEquipmentId = Guid.Parse("a623d6e5-7a95-4c22-addb-35ec1a76e606"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("01539a53-0fc8-4cd9-ba4a-39d93e95fcc4"),
                Condition = Condition.AtWork,
                Date = new DateTime(638187552000000000),
                StartConditionTime = new TimeSpan(664520000000),
                Time = 0.7166666666666667,
                WeldingEquipmentId = Guid.Parse("a623d6e5-7a95-4c22-addb-35ec1a76e606"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("59344b76-8372-4420-97cf-3553009428a6"),
                Condition = Condition.AtWork,
                Date = new DateTime(638187552000000000),
                StartConditionTime = new TimeSpan(677450000000),
                Time = 0.25,
                WeldingEquipmentId = Guid.Parse("a623d6e5-7a95-4c22-addb-35ec1a76e606"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("791ec1a8-e4b7-4538-935b-79ac24e04c96"),
                Condition = Condition.AtWork,
                Date = new DateTime(638187552000000000),
                StartConditionTime = new TimeSpan(677730000000),
                Time = 0.8666666666666667,
                WeldingEquipmentId = Guid.Parse("a623d6e5-7a95-4c22-addb-35ec1a76e606"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("989070ec-0998-4c8a-b73c-61dd1fec5f71"),
                Condition = Condition.AtWork,
                Date = new DateTime(638187552000000000),
                StartConditionTime = new TimeSpan(678480000000),
                Time = 0.6666666666666666,
                WeldingEquipmentId = Guid.Parse("a623d6e5-7a95-4c22-addb-35ec1a76e606"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("9ddde203-b641-483c-a959-0c7e02d544ae"),
                Condition = Condition.AtWork,
                Date = new DateTime(638187552000000000),
                StartConditionTime = new TimeSpan(679260000000),
                Time = 0.5,
                WeldingEquipmentId = Guid.Parse("a623d6e5-7a95-4c22-addb-35ec1a76e606"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("92f4ac58-65e2-4e84-bc8d-2ff9cf6aff45"),
                Condition = Condition.AtWork,
                Date = new DateTime(638187552000000000),
                StartConditionTime = new TimeSpan(679850000000),
                Time = 0.9166666666666666,
                WeldingEquipmentId = Guid.Parse("a623d6e5-7a95-4c22-addb-35ec1a76e606"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("a628a624-050f-44d5-bcc9-f6b28fedd1f7"),
                Condition = Condition.AtWork,
                Date = new DateTime(638187552000000000),
                StartConditionTime = new TimeSpan(680890000000),
                Time = 1.15,
                WeldingEquipmentId = Guid.Parse("a623d6e5-7a95-4c22-addb-35ec1a76e606"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("1303c225-2a0a-401e-b672-3187c71764c7"),
                Condition = Condition.AtWork,
                Date = new DateTime(638187552000000000),
                StartConditionTime = new TimeSpan(682070000000),
                Time = 0.6166666666666667,
                WeldingEquipmentId = Guid.Parse("a623d6e5-7a95-4c22-addb-35ec1a76e606"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("32e3afad-9af0-452d-adc5-abc85f277984"),
                Condition = Condition.AtWork,
                Date = new DateTime(638187552000000000),
                StartConditionTime = new TimeSpan(682580000000),
                Time = 0.9666666666666667,
                WeldingEquipmentId = Guid.Parse("a623d6e5-7a95-4c22-addb-35ec1a76e606"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("75e69667-ca08-4938-a81a-f6ee95f960b8"),
                Condition = Condition.AtWork,
                Date = new DateTime(638187552000000000),
                StartConditionTime = new TimeSpan(683640000000),
                Time = 1.1166666666666667,
                WeldingEquipmentId = Guid.Parse("a623d6e5-7a95-4c22-addb-35ec1a76e606"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("e95c4a34-8fb6-4371-92f5-e48520eb8550"),
                Condition = Condition.AtWork,
                Date = new DateTime(638187552000000000),
                StartConditionTime = new TimeSpan(684750000000),
                Time = 0.38333333333333336,
                WeldingEquipmentId = Guid.Parse("a623d6e5-7a95-4c22-addb-35ec1a76e606"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("881b28fb-284f-4821-8756-916601c34a1d"),
                Condition = Condition.AtWork,
                Date = new DateTime(638187552000000000),
                StartConditionTime = new TimeSpan(685060000000),
                Time = 0.2,
                WeldingEquipmentId = Guid.Parse("a623d6e5-7a95-4c22-addb-35ec1a76e606"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("6b84f6ac-3771-40cf-8d73-c2063df66308"),
                Condition = Condition.AtWork,
                Date = new DateTime(638187552000000000),
                StartConditionTime = new TimeSpan(685370000000),
                Time = 1.0833333333333333,
                WeldingEquipmentId = Guid.Parse("a623d6e5-7a95-4c22-addb-35ec1a76e606"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("004995ae-864e-4301-8dff-d3f12a42a817"),
                Condition = Condition.AtWork,
                Date = new DateTime(638187552000000000),
                StartConditionTime = new TimeSpan(686250000000),
                Time = 0.9166666666666666,
                WeldingEquipmentId = Guid.Parse("a623d6e5-7a95-4c22-addb-35ec1a76e606"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("07e8e4a3-6c3d-44cd-8482-ff4abea571cb"),
                Condition = Condition.AtWork,
                Date = new DateTime(638187552000000000),
                StartConditionTime = new TimeSpan(687090000000),
                Time = 1.2333333333333334,
                WeldingEquipmentId = Guid.Parse("a623d6e5-7a95-4c22-addb-35ec1a76e606"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("c07a5b20-7d71-449c-8b33-ddb0913824c4"),
                Condition = Condition.AtWork,
                Date = new DateTime(638187552000000000),
                StartConditionTime = new TimeSpan(688190000000),
                Time = 1.0666666666666667,
                WeldingEquipmentId = Guid.Parse("a623d6e5-7a95-4c22-addb-35ec1a76e606"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("66e49531-46fe-4a96-97c8-aee0f1519019"),
                Condition = Condition.AtWork,
                Date = new DateTime(638187552000000000),
                StartConditionTime = new TimeSpan(689290000000),
                Time = 0.5166666666666667,
                WeldingEquipmentId = Guid.Parse("a623d6e5-7a95-4c22-addb-35ec1a76e606"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("eb310056-5066-4ba3-af40-7b75c2fbe0db"),
                Condition = Condition.AtWork,
                Date = new DateTime(638187552000000000),
                StartConditionTime = new TimeSpan(689690000000),
                Time = 1.1333333333333333,
                WeldingEquipmentId = Guid.Parse("a623d6e5-7a95-4c22-addb-35ec1a76e606"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("71612fcb-adb8-4a5b-a775-96e584b9e64a"),
                Condition = Condition.AtWork,
                Date = new DateTime(638187552000000000),
                StartConditionTime = new TimeSpan(690600000000),
                Time = 1.15,
                WeldingEquipmentId = Guid.Parse("a623d6e5-7a95-4c22-addb-35ec1a76e606"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("80333a50-63b8-439e-b48c-ee7c7d4615ad"),
                Condition = Condition.AtWork,
                Date = new DateTime(638187552000000000),
                StartConditionTime = new TimeSpan(691990000000),
                Time = 0.2833333333333333,
                WeldingEquipmentId = Guid.Parse("a623d6e5-7a95-4c22-addb-35ec1a76e606"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("a16d500d-276d-4923-989e-ba230c6d3321"),
                Condition = Condition.AtWork,
                Date = new DateTime(638187552000000000),
                StartConditionTime = new TimeSpan(692240000000),
                Time = 0.26666666666666666,
                WeldingEquipmentId = Guid.Parse("a623d6e5-7a95-4c22-addb-35ec1a76e606"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("1560a828-8d16-4870-a6ff-59de3391374b"),
                Condition = Condition.AtWork,
                Date = new DateTime(638187552000000000),
                StartConditionTime = new TimeSpan(692470000000),
                Time = 0.8833333333333333,
                WeldingEquipmentId = Guid.Parse("a623d6e5-7a95-4c22-addb-35ec1a76e606"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("9358ec73-ed8c-49ad-b58e-79d4fefea993"),
                Condition = Condition.AtWork,
                Date = new DateTime(638187552000000000),
                StartConditionTime = new TimeSpan(697390000000),
                Time = 0.8666666666666667,
                WeldingEquipmentId = Guid.Parse("a623d6e5-7a95-4c22-addb-35ec1a76e606"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("43e07bf7-9733-49de-8ffd-3b1d199762bb"),
                Condition = Condition.AtWork,
                Date = new DateTime(638187552000000000),
                StartConditionTime = new TimeSpan(698270000000),
                Time = 0.5,
                WeldingEquipmentId = Guid.Parse("a623d6e5-7a95-4c22-addb-35ec1a76e606"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("0f07912c-094a-40a5-bf4b-0ee38f07e9bd"),
                Condition = Condition.AtWork,
                Date = new DateTime(638187552000000000),
                StartConditionTime = new TimeSpan(698800000000),
                Time = 1.0166666666666666,
                WeldingEquipmentId = Guid.Parse("a623d6e5-7a95-4c22-addb-35ec1a76e606"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("e66ad0d0-fc43-42e4-a432-37b2de433f8c"),
                Condition = Condition.On,
                Date = new DateTime(638188416000000000),
                StartConditionTime = new TimeSpan(288930000000),
                Time = 1,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("0df4200a-f9df-40a1-9cb4-8994f6296bbc"),
                Condition = Condition.On,
                Date = new DateTime(638188416000000000),
                StartConditionTime = new TimeSpan(334590000000),
                Time = 2,
                WeldingEquipmentId = Guid.Parse("a623d6e5-7a95-4c22-addb-35ec1a76e606"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("ea235e4a-64dd-4d61-ab11-a2c797f4cf9d"),
                Condition = Condition.AtWork,
                Date = new DateTime(638188416000000000),
                StartConditionTime = new TimeSpan(349850000000),
                Time = 0.25,
                WeldingEquipmentId = Guid.Parse("a623d6e5-7a95-4c22-addb-35ec1a76e606"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("6decf1e6-d04b-406f-91a9-92f0b21ef9da"),
                Condition = Condition.AtWork,
                Date = new DateTime(638188416000000000),
                StartConditionTime = new TimeSpan(352950000000),
                Time = 0.5833333333333334,
                WeldingEquipmentId = Guid.Parse("a623d6e5-7a95-4c22-addb-35ec1a76e606"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("b984890e-237a-49b5-a625-cfd0b8140d2d"),
                Condition = Condition.AtWork,
                Date = new DateTime(638188416000000000),
                StartConditionTime = new TimeSpan(353390000000),
                Time = 0.6333333333333333,
                WeldingEquipmentId = Guid.Parse("a623d6e5-7a95-4c22-addb-35ec1a76e606"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("2e850620-add3-4cca-ab38-8223a5fcd8f7"),
                Condition = Condition.AtWork,
                Date = new DateTime(638188416000000000),
                StartConditionTime = new TimeSpan(361030000000),
                Time = 0.55,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("37042b85-9004-4eed-b75e-81248f4429e2"),
                Condition = Condition.AtWork,
                Date = new DateTime(638188416000000000),
                StartConditionTime = new TimeSpan(361440000000),
                Time = 0,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("50f76bc9-9084-4ae7-8de4-d1de4f759b40"),
                Condition = Condition.AtWork,
                Date = new DateTime(638188416000000000),
                StartConditionTime = new TimeSpan(364010000000),
                Time = 0.36666666666666664,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("c917faf6-c40e-4752-9e47-c2fe8f43f0b5"),
                Condition = Condition.AtWork,
                Date = new DateTime(638188416000000000),
                StartConditionTime = new TimeSpan(365400000000),
                Time = 0.9333333333333333,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("e3a21a87-8395-4d4b-a719-92ff1e49d5c9"),
                Condition = Condition.AtWork,
                Date = new DateTime(638188416000000000),
                StartConditionTime = new TimeSpan(366060000000),
                Time = 0.5666666666666667,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("7834309c-a18a-4106-a66b-eb8b8296c3a8"),
                Condition = Condition.AtWork,
                Date = new DateTime(638188416000000000),
                StartConditionTime = new TimeSpan(366490000000),
                Time = 1.2333333333333334,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("78f9f6d4-4e1e-47ad-a690-928c05d24244"),
                Condition = Condition.AtWork,
                Date = new DateTime(638188416000000000),
                StartConditionTime = new TimeSpan(367340000000),
                Time = 0.7833333333333333,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("111ac50b-5332-45cd-87cd-14b5e6c4b43d"),
                Condition = Condition.AtWork,
                Date = new DateTime(638188416000000000),
                StartConditionTime = new TimeSpan(367960000000),
                Time = 0.7,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("417c52de-b150-49c7-9566-06778a0b4200"),
                Condition = Condition.AtWork,
                Date = new DateTime(638188416000000000),
                StartConditionTime = new TimeSpan(376210000000),
                Time = 0.18333333333333332,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("cd33989e-0f8e-4b17-9328-8f8316bbecb2"),
                Condition = Condition.AtWork,
                Date = new DateTime(638188416000000000),
                StartConditionTime = new TimeSpan(377780000000),
                Time = 0.8833333333333333,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("a9307499-2962-419d-a71a-9e843ec5d310"),
                Condition = Condition.AtWork,
                Date = new DateTime(638188416000000000),
                StartConditionTime = new TimeSpan(381630000000),
                Time = 0.43333333333333335,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("68ae44f0-ae38-4bd5-8a8b-9f91a73c15b0"),
                Condition = Condition.AtWork,
                Date = new DateTime(638188416000000000),
                StartConditionTime = new TimeSpan(383360000000),
                Time = 0.5833333333333334,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("9ee06976-c379-4882-b2be-fb9696408681"),
                Condition = Condition.AtWork,
                Date = new DateTime(638188416000000000),
                StartConditionTime = new TimeSpan(383850000000),
                Time = 0.31666666666666665,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("4871d1c0-a7aa-46f9-a017-28f624cac3a2"),
                Condition = Condition.AtWork,
                Date = new DateTime(638188416000000000),
                StartConditionTime = new TimeSpan(389610000000),
                Time = 0.8833333333333333,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("47e1a8fe-deec-4797-811b-7f70330245f9"),
                Condition = Condition.AtWork,
                Date = new DateTime(638188416000000000),
                StartConditionTime = new TimeSpan(395090000000),
                Time = 1,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("b78613a7-b1cc-48af-8615-e2b4995487c1"),
                Condition = Condition.AtWork,
                Date = new DateTime(638188416000000000),
                StartConditionTime = new TimeSpan(396070000000),
                Time = 1.05,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("701f75b1-67f2-49e7-b32d-b903aa8769d0"),
                Condition = Condition.AtWork,
                Date = new DateTime(638188416000000000),
                StartConditionTime = new TimeSpan(397040000000),
                Time = 0.16666666666666666,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("2b68d00f-d806-492a-b30d-bc7bbc29bfbf"),
                Condition = Condition.AtWork,
                Date = new DateTime(638188416000000000),
                StartConditionTime = new TimeSpan(398860000000),
                Time = 0.5666666666666667,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("fabaa11a-d3bc-45a1-bcaa-f7d1ad3f2409"),
                Condition = Condition.AtWork,
                Date = new DateTime(638188416000000000),
                StartConditionTime = new TimeSpan(399350000000),
                Time = 0.35,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("8803248d-efec-4f65-8e0d-3e9853385c57"),
                Condition = Condition.AtWork,
                Date = new DateTime(638188416000000000),
                StartConditionTime = new TimeSpan(417840000000),
                Time = 0.26666666666666666,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("d5cb007b-e843-4464-80cc-3f122993ffc1"),
                Condition = Condition.AtWork,
                Date = new DateTime(638188416000000000),
                StartConditionTime = new TimeSpan(418080000000),
                Time = 0.16666666666666666,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("5d7d3ce8-dd53-4356-8b61-4bbdf375d6f3"),
                Condition = Condition.AtWork,
                Date = new DateTime(638188416000000000),
                StartConditionTime = new TimeSpan(418350000000),
                Time = 0.25,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("b5dc7bdc-bed7-4e07-b379-060ed0fb5208"),
                Condition = Condition.AtWork,
                Date = new DateTime(638188416000000000),
                StartConditionTime = new TimeSpan(418920000000),
                Time = 0.23333333333333334,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("8ec18257-2bf0-4836-a0be-b885ff0a3b48"),
                Condition = Condition.AtWork,
                Date = new DateTime(638188416000000000),
                StartConditionTime = new TimeSpan(419260000000),
                Time = 0.18333333333333332,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("7817492b-e8bf-412c-b766-bc52986f9cb8"),
                Condition = Condition.AtWork,
                Date = new DateTime(638188416000000000),
                StartConditionTime = new TimeSpan(419490000000),
                Time = 0.3,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("f646c2cf-01ca-4135-abdf-2775bbf6b31a"),
                Condition = Condition.AtWork,
                Date = new DateTime(638188416000000000),
                StartConditionTime = new TimeSpan(419860000000),
                Time = 0.2833333333333333,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("77cba2b5-8833-45f9-8dbf-f447803f0ad2"),
                Condition = Condition.AtWork,
                Date = new DateTime(638188416000000000),
                StartConditionTime = new TimeSpan(456860000000),
                Time = 0.16666666666666666,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("2732f185-c536-49e1-aaa5-b50a9b0793bd"),
                Condition = Condition.AtWork,
                Date = new DateTime(638188416000000000),
                StartConditionTime = new TimeSpan(457240000000),
                Time = 0.3,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("9c34166a-2926-41cb-bde2-53580716ad2b"),
                Condition = Condition.AtWork,
                Date = new DateTime(638188416000000000),
                StartConditionTime = new TimeSpan(457700000000),
                Time = 0.16666666666666666,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("c061527b-e551-4300-b835-131a6668bdf2"),
                Condition = Condition.AtWork,
                Date = new DateTime(638188416000000000),
                StartConditionTime = new TimeSpan(457880000000),
                Time = 0.23333333333333334,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("159e3500-52a6-4140-8ea9-28dd7c3ce689"),
                Condition = Condition.AtWork,
                Date = new DateTime(638188416000000000),
                StartConditionTime = new TimeSpan(458190000000),
                Time = 0.3333333333333333,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("afe0d989-8927-42f9-99dc-58f1c9d4744b"),
                Condition = Condition.AtWork,
                Date = new DateTime(638188416000000000),
                StartConditionTime = new TimeSpan(458610000000),
                Time = 0.15,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("f8f9f789-bdd3-475a-869a-df8a0ccb6b29"),
                Condition = Condition.AtWork,
                Date = new DateTime(638188416000000000),
                StartConditionTime = new TimeSpan(458770000000),
                Time = 0.18333333333333332,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("ec4910f1-2ca9-4e3e-9ca8-7176ce6b9bc2"),
                Condition = Condition.AtWork,
                Date = new DateTime(638188416000000000),
                StartConditionTime = new TimeSpan(463810000000),
                Time = 0.23333333333333334,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("31151a13-e61c-4a6b-9ba1-407fd9be3b92"),
                Condition = Condition.AtWork,
                Date = new DateTime(638188416000000000),
                StartConditionTime = new TimeSpan(464030000000),
                Time = 0.21666666666666667,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("1486f2df-63a0-41f7-8feb-d3ce656edd8a"),
                Condition = Condition.AtWork,
                Date = new DateTime(638188416000000000),
                StartConditionTime = new TimeSpan(464230000000),
                Time = 0.26666666666666666,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("61d695ef-6bf6-44b5-b32f-050b18dbdbee"),
                Condition = Condition.AtWork,
                Date = new DateTime(638188416000000000),
                StartConditionTime = new TimeSpan(464730000000),
                Time = 0.3,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("18a0e90e-ffec-4722-82f4-61eac02a4923"),
                Condition = Condition.AtWork,
                Date = new DateTime(638188416000000000),
                StartConditionTime = new TimeSpan(465180000000),
                Time = 0.31666666666666665,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("6ecb1f2e-fdbb-4de3-958f-26d196b7f28d"),
                Condition = Condition.AtWork,
                Date = new DateTime(638188416000000000),
                StartConditionTime = new TimeSpan(465640000000),
                Time = 0.26666666666666666,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("b018b4ff-ed11-48fb-93c0-090900b932c4"),
                Condition = Condition.On,
                Date = new DateTime(638192736000000000),
                StartConditionTime = new TimeSpan(276420000000),
                Time = 1,
                WeldingEquipmentId = Guid.Parse("a623d6e5-7a95-4c22-addb-35ec1a76e606"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("33457b83-d885-4126-b166-1f4e1561a64a"),
                Condition = Condition.On,
                Date = new DateTime(638192736000000000),
                StartConditionTime = new TimeSpan(278240000000),
                Time = 2,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("c25107a5-58d9-4451-acf5-31ded78982d1"),
                Condition = Condition.AtWork,
                Date = new DateTime(638192736000000000),
                StartConditionTime = new TimeSpan(283200000000),
                Time = 0.25,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("b0e68333-fada-4084-863e-bc63ec2d2f7c"),
                Condition = Condition.AtWork,
                Date = new DateTime(638192736000000000),
                StartConditionTime = new TimeSpan(283480000000),
                Time = 0.16666666666666666,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("eb88afa3-8565-4b6b-8063-1c600bbaa304"),
                Condition = Condition.AtWork,
                Date = new DateTime(638192736000000000),
                StartConditionTime = new TimeSpan(283880000000),
                Time = 0.2,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("be14417f-b541-4c35-ac43-88078e57fd47"),
                Condition = Condition.AtWork,
                Date = new DateTime(638192736000000000),
                StartConditionTime = new TimeSpan(294450000000),
                Time = 0.5666666666666667,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("c49dbfe8-a5b9-4391-89b9-b2968450f502"),
                Condition = Condition.AtWork,
                Date = new DateTime(638192736000000000),
                StartConditionTime = new TimeSpan(294880000000),
                Time = 0.3333333333333333,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("5d3d7c45-2ed4-4871-a29b-2d565599b19d"),
                Condition = Condition.AtWork,
                Date = new DateTime(638192736000000000),
                StartConditionTime = new TimeSpan(295150000000),
                Time = 0.3333333333333333,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("3c3025c8-03e1-4a1e-95b4-077e30aa7e96"),
                Condition = Condition.AtWork,
                Date = new DateTime(638192736000000000),
                StartConditionTime = new TimeSpan(295430000000),
                Time = 0.5166666666666667,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("3ae1839f-5a96-46ea-b06c-d95234a7ece5"),
                Condition = Condition.AtWork,
                Date = new DateTime(638192736000000000),
                StartConditionTime = new TimeSpan(295820000000),
                Time = 0.5833333333333334,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("e688508a-9553-4aeb-9de4-27884a6f9faa"),
                Condition = Condition.AtWork,
                Date = new DateTime(638192736000000000),
                StartConditionTime = new TimeSpan(296250000000),
                Time = 0.16666666666666666,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("188ac82b-9a6e-4e15-8c86-86972b145aee"),
                Condition = Condition.AtWork,
                Date = new DateTime(638192736000000000),
                StartConditionTime = new TimeSpan(296420000000),
                Time = 0.6833333333333333,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("fc371e8e-b1f9-4950-8c84-b2ff0fdd890c"),
                Condition = Condition.AtWork,
                Date = new DateTime(638192736000000000),
                StartConditionTime = new TimeSpan(297050000000),
                Time = 0.9166666666666666,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("e0fe9465-53b9-4aec-961f-c2d81e6d9077"),
                Condition = Condition.AtWork,
                Date = new DateTime(638192736000000000),
                StartConditionTime = new TimeSpan(297700000000),
                Time = 0.45,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("1fec938f-0e7d-4e78-9d2a-884810f1635d"),
                Condition = Condition.AtWork,
                Date = new DateTime(638192736000000000),
                StartConditionTime = new TimeSpan(298050000000),
                Time = 0.26666666666666666,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("9e707236-dfcf-470b-af97-b7f4cd2789e7"),
                Condition = Condition.AtWork,
                Date = new DateTime(638192736000000000),
                StartConditionTime = new TimeSpan(298420000000),
                Time = 0.35,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("fecd9e96-4714-4e51-a141-2be060f1467e"),
                Condition = Condition.AtWork,
                Date = new DateTime(638192736000000000),
                StartConditionTime = new TimeSpan(302070000000),
                Time = 1.1833333333333333,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("40f818a7-ca5c-4ca4-9f95-ac9890b6f781"),
                Condition = Condition.AtWork,
                Date = new DateTime(638192736000000000),
                StartConditionTime = new TimeSpan(302950000000),
                Time = 1.1666666666666667,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("1ee67721-788f-4355-8a17-0548bcaeea0e"),
                Condition = Condition.AtWork,
                Date = new DateTime(638192736000000000),
                StartConditionTime = new TimeSpan(303760000000),
                Time = 0.8833333333333333,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("59bd4dc8-90e2-4bf7-bd9c-20ebfdfa2464"),
                Condition = Condition.AtWork,
                Date = new DateTime(638192736000000000),
                StartConditionTime = new TimeSpan(304430000000),
                Time = 0.75,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("08a66a8a-a2a1-4880-8667-ee5a58f003ba"),
                Condition = Condition.AtWork,
                Date = new DateTime(638192736000000000),
                StartConditionTime = new TimeSpan(304970000000),
                Time = 1.0666666666666667,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("1f0dd506-fb2c-46e4-ac02-277a58c469f1"),
                Condition = Condition.AtWork,
                Date = new DateTime(638192736000000000),
                StartConditionTime = new TimeSpan(312860000000),
                Time = 0.23333333333333334,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("5624da82-c189-4299-bdb9-3a00bbc6675d"),
                Condition = Condition.AtWork,
                Date = new DateTime(638192736000000000),
                StartConditionTime = new TimeSpan(313080000000),
                Time = 0.55,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("3ac11aa2-8ea0-4498-91b0-d93aa378a8b2"),
                Condition = Condition.AtWork,
                Date = new DateTime(638192736000000000),
                StartConditionTime = new TimeSpan(313490000000),
                Time = 0.7333333333333333,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("0ff3b248-1628-49b5-acab-d22eb7ec71a0"),
                Condition = Condition.AtWork,
                Date = new DateTime(638192736000000000),
                StartConditionTime = new TimeSpan(317690000000),
                Time = 1.2,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("e3820126-ac2d-4770-aeec-b72ba2d63b96"),
                Condition = Condition.AtWork,
                Date = new DateTime(638192736000000000),
                StartConditionTime = new TimeSpan(318670000000),
                Time = 0.35,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("40cfc920-1742-42cc-8d2f-a54a2034b8aa"),
                Condition = Condition.AtWork,
                Date = new DateTime(638192736000000000),
                StartConditionTime = new TimeSpan(321380000000),
                Time = 0.6333333333333333,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("26c2dee3-42c5-438d-b07c-272a74e25fd8"),
                Condition = Condition.AtWork,
                Date = new DateTime(638192736000000000),
                StartConditionTime = new TimeSpan(321850000000),
                Time = 0.4166666666666667,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("79e762e8-d638-42e1-ae90-b21a30294eb3"),
                Condition = Condition.AtWork,
                Date = new DateTime(638192736000000000),
                StartConditionTime = new TimeSpan(325750000000),
                Time = 1.0333333333333334,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("46e7ffc2-3326-4a30-affb-c080f0b700d5"),
                Condition = Condition.AtWork,
                Date = new DateTime(638192736000000000),
                StartConditionTime = new TimeSpan(326730000000),
                Time = 0.55,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("c532ca46-51e5-40cc-a8ac-5734b885d24b"),
                Condition = Condition.AtWork,
                Date = new DateTime(638192736000000000),
                StartConditionTime = new TimeSpan(327140000000),
                Time = 0.016666666666666666,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("35e4ed05-3f76-452a-a59e-e4a9b4db9322"),
                Condition = Condition.On,
                Date = new DateTime(638192736000000000),
                StartConditionTime = new TimeSpan(330490000000),
                Time = 2,
                WeldingEquipmentId = Guid.Parse("a623d6e5-7a95-4c22-addb-35ec1a76e606"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("0e943ca6-f9e6-46a5-8382-2d986c012daf"),
                Condition = Condition.AtWork,
                Date = new DateTime(638192736000000000),
                StartConditionTime = new TimeSpan(332570000000),
                Time = 1.0833333333333333,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("36ef7ff3-f79a-4234-aa40-49c901cbac26"),
                Condition = Condition.AtWork,
                Date = new DateTime(638192736000000000),
                StartConditionTime = new TimeSpan(333510000000),
                Time = 0.16666666666666666,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("4dad0d3c-c6ae-4e34-b846-1086f65c303f"),
                Condition = Condition.AtWork,
                Date = new DateTime(638192736000000000),
                StartConditionTime = new TimeSpan(335250000000),
                Time = 0.55,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("dd3fcfbc-8ea4-4911-b5f0-56ab2da68324"),
                Condition = Condition.AtWork,
                Date = new DateTime(638192736000000000),
                StartConditionTime = new TimeSpan(335840000000),
                Time = 0.2,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("79eb5fb2-bdab-42ec-b9d0-7e30bd1a608b"),
                Condition = Condition.AtWork,
                Date = new DateTime(638192736000000000),
                StartConditionTime = new TimeSpan(345530000000),
                Time = 0.5,
                WeldingEquipmentId = Guid.Parse("a623d6e5-7a95-4c22-addb-35ec1a76e606"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("86e982b0-6938-4faa-a1df-8a753383c3c3"),
                Condition = Condition.AtWork,
                Date = new DateTime(638192736000000000),
                StartConditionTime = new TimeSpan(346130000000),
                Time = 0.6,
                WeldingEquipmentId = Guid.Parse("a623d6e5-7a95-4c22-addb-35ec1a76e606"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("c6436ecf-eb3b-4ffb-a6d1-e95270fd3130"),
                Condition = Condition.AtWork,
                Date = new DateTime(638192736000000000),
                StartConditionTime = new TimeSpan(346570000000),
                Time = 0.7166666666666667,
                WeldingEquipmentId = Guid.Parse("a623d6e5-7a95-4c22-addb-35ec1a76e606"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("ceda6084-a4c1-4e21-bb8a-9428e7a2d067"),
                Condition = Condition.AtWork,
                Date = new DateTime(638192736000000000),
                StartConditionTime = new TimeSpan(347080000000),
                Time = 0.75,
                WeldingEquipmentId = Guid.Parse("a623d6e5-7a95-4c22-addb-35ec1a76e606"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("6241c3ef-5777-47c4-9f9b-02f6ff73c273"),
                Condition = Condition.AtWork,
                Date = new DateTime(638192736000000000),
                StartConditionTime = new TimeSpan(347880000000),
                Time = 0.8,
                WeldingEquipmentId = Guid.Parse("a623d6e5-7a95-4c22-addb-35ec1a76e606"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("e6ab48af-4da6-4427-a20a-4764d3c7a7c3"),
                Condition = Condition.AtWork,
                Date = new DateTime(638192736000000000),
                StartConditionTime = new TimeSpan(348450000000),
                Time = 0.6833333333333333,
                WeldingEquipmentId = Guid.Parse("a623d6e5-7a95-4c22-addb-35ec1a76e606"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("bbccba2e-7de3-40bb-937f-08b0091fad0d"),
                Condition = Condition.AtWork,
                Date = new DateTime(638192736000000000),
                StartConditionTime = new TimeSpan(348940000000),
                Time = 0.13333333333333333,
                WeldingEquipmentId = Guid.Parse("a623d6e5-7a95-4c22-addb-35ec1a76e606"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("3e4aa892-a9bb-4c81-83b9-d3889e05f085"),
                Condition = Condition.AtWork,
                Date = new DateTime(638192736000000000),
                StartConditionTime = new TimeSpan(350530000000),
                Time = 0.5166666666666667,
                WeldingEquipmentId = Guid.Parse("a623d6e5-7a95-4c22-addb-35ec1a76e606"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("c3cd0d51-a6b9-4279-a3bd-9956e6ab342a"),
                Condition = Condition.AtWork,
                Date = new DateTime(638192736000000000),
                StartConditionTime = new TimeSpan(351840000000),
                Time = 1.05,
                WeldingEquipmentId = Guid.Parse("a623d6e5-7a95-4c22-addb-35ec1a76e606"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("4760395d-4f2f-428c-93df-cff74f4b4df5"),
                Condition = Condition.AtWork,
                Date = new DateTime(638192736000000000),
                StartConditionTime = new TimeSpan(352620000000),
                Time = 0.45,
                WeldingEquipmentId = Guid.Parse("a623d6e5-7a95-4c22-addb-35ec1a76e606"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("2fbbcb29-7914-484a-b668-f83ed0335ba8"),
                Condition = Condition.AtWork,
                Date = new DateTime(638192736000000000),
                StartConditionTime = new TimeSpan(353260000000),
                Time = 1.05,
                WeldingEquipmentId = Guid.Parse("a623d6e5-7a95-4c22-addb-35ec1a76e606"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("dbfd86a7-4dc7-4c78-99b7-ed774529f39b"),
                Condition = Condition.AtWork,
                Date = new DateTime(638192736000000000),
                StartConditionTime = new TimeSpan(354030000000),
                Time = 1.2333333333333334,
                WeldingEquipmentId = Guid.Parse("a623d6e5-7a95-4c22-addb-35ec1a76e606"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("8ebe137d-c1e4-4712-950b-2958b4c1c674"),
                Condition = Condition.AtWork,
                Date = new DateTime(638192736000000000),
                StartConditionTime = new TimeSpan(354880000000),
                Time = 0.95,
                WeldingEquipmentId = Guid.Parse("a623d6e5-7a95-4c22-addb-35ec1a76e606"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("f1717f46-5412-4dcd-84a2-9b1f2983effc"),
                Condition = Condition.AtWork,
                Date = new DateTime(638192736000000000),
                StartConditionTime = new TimeSpan(355590000000),
                Time = 0.8666666666666667,
                WeldingEquipmentId = Guid.Parse("a623d6e5-7a95-4c22-addb-35ec1a76e606"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("93c1877c-47ca-4b76-b565-e57236f2cc8b"),
                Condition = Condition.AtWork,
                Date = new DateTime(638192736000000000),
                StartConditionTime = new TimeSpan(356720000000),
                Time = 1.2333333333333334,
                WeldingEquipmentId = Guid.Parse("a623d6e5-7a95-4c22-addb-35ec1a76e606"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("dd435b34-c2ec-4c2b-9b9f-f8391c33dc3e"),
                Condition = Condition.AtWork,
                Date = new DateTime(638192736000000000),
                StartConditionTime = new TimeSpan(357630000000),
                Time = 0.65,
                WeldingEquipmentId = Guid.Parse("a623d6e5-7a95-4c22-addb-35ec1a76e606"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("16c2d3bc-4439-4dcd-931a-5b10d908167d"),
                Condition = Condition.AtWork,
                Date = new DateTime(638192736000000000),
                StartConditionTime = new TimeSpan(361010000000),
                Time = 1.2333333333333334,
                WeldingEquipmentId = Guid.Parse("a623d6e5-7a95-4c22-addb-35ec1a76e606"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("37e1afd6-5725-4e2b-98c8-54fc6a49b06b"),
                Condition = Condition.AtWork,
                Date = new DateTime(638192736000000000),
                StartConditionTime = new TimeSpan(361900000000),
                Time = 0.4,
                WeldingEquipmentId = Guid.Parse("a623d6e5-7a95-4c22-addb-35ec1a76e606"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("7c60dda2-c69c-470b-917f-5dd197111f1c"),
                Condition = Condition.AtWork,
                Date = new DateTime(638192736000000000),
                StartConditionTime = new TimeSpan(362220000000),
                Time = 1.1333333333333333,
                WeldingEquipmentId = Guid.Parse("a623d6e5-7a95-4c22-addb-35ec1a76e606"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("aa6c3be7-e75a-45b1-a144-905a8e04c247"),
                Condition = Condition.AtWork,
                Date = new DateTime(638192736000000000),
                StartConditionTime = new TimeSpan(363000000000),
                Time = 0.9666666666666667,
                WeldingEquipmentId = Guid.Parse("a623d6e5-7a95-4c22-addb-35ec1a76e606"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("3bb2fb46-705d-4e25-818d-b2a26178186d"),
                Condition = Condition.AtWork,
                Date = new DateTime(638192736000000000),
                StartConditionTime = new TimeSpan(363720000000),
                Time = 0.5333333333333333,
                WeldingEquipmentId = Guid.Parse("a623d6e5-7a95-4c22-addb-35ec1a76e606"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("7366a7ae-d361-47f1-83c1-b2835a31867f"),
                Condition = Condition.AtWork,
                Date = new DateTime(638192736000000000),
                StartConditionTime = new TimeSpan(364240000000),
                Time = 0.7,
                WeldingEquipmentId = Guid.Parse("a623d6e5-7a95-4c22-addb-35ec1a76e606"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("dafb9f9b-97f8-4896-b385-61f14baba40b"),
                Condition = Condition.AtWork,
                Date = new DateTime(638192736000000000),
                StartConditionTime = new TimeSpan(365420000000),
                Time = 0.9,
                WeldingEquipmentId = Guid.Parse("a623d6e5-7a95-4c22-addb-35ec1a76e606"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("c49dbd0d-9aeb-40f7-aa78-178be072ee5e"),
                Condition = Condition.AtWork,
                Date = new DateTime(638192736000000000),
                StartConditionTime = new TimeSpan(366480000000),
                Time = 0.7333333333333333,
                WeldingEquipmentId = Guid.Parse("a623d6e5-7a95-4c22-addb-35ec1a76e606"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("98d62694-5cce-4655-bca3-7707278240d7"),
                Condition = Condition.AtWork,
                Date = new DateTime(638192736000000000),
                StartConditionTime = new TimeSpan(367070000000),
                Time = 0.35,
                WeldingEquipmentId = Guid.Parse("a623d6e5-7a95-4c22-addb-35ec1a76e606"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("d8fef732-a7f5-49cc-a1a0-3ff2a874106d"),
                Condition = Condition.AtWork,
                Date = new DateTime(638192736000000000),
                StartConditionTime = new TimeSpan(367350000000),
                Time = 1.0333333333333334,
                WeldingEquipmentId = Guid.Parse("a623d6e5-7a95-4c22-addb-35ec1a76e606"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("c0cf1333-ac24-4a6b-bf94-08578a37aee6"),
                Condition = Condition.AtWork,
                Date = new DateTime(638192736000000000),
                StartConditionTime = new TimeSpan(380560000000),
                Time = 0.8166666666666667,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("1cd9daa4-ba65-4951-b8f7-2e4a8f105920"),
                Condition = Condition.AtWork,
                Date = new DateTime(638192736000000000),
                StartConditionTime = new TimeSpan(383170000000),
                Time = 0.8,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("e0de7a2d-f274-40f7-8545-821a8838f6fc"),
                Condition = Condition.AtWork,
                Date = new DateTime(638192736000000000),
                StartConditionTime = new TimeSpan(385600000000),
                Time = 0.8666666666666667,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("0ad41e10-4c49-4b19-985d-63b33ab5d576"),
                Condition = Condition.AtWork,
                Date = new DateTime(638192736000000000),
                StartConditionTime = new TimeSpan(388650000000),
                Time = 0.7666666666666667,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("71b44030-b01f-4a12-8e06-10e7fb1c2a0a"),
                Condition = Condition.AtWork,
                Date = new DateTime(638192736000000000),
                StartConditionTime = new TimeSpan(389200000000),
                Time = 0.18333333333333332,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("7285436e-3575-4025-b2e6-2b3800d5c904"),
                Condition = Condition.AtWork,
                Date = new DateTime(638192736000000000),
                StartConditionTime = new TimeSpan(401250000000),
                Time = 1.1166666666666667,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("0760665f-6e8c-4096-b62f-4d06d8319e0e"),
                Condition = Condition.AtWork,
                Date = new DateTime(638192736000000000),
                StartConditionTime = new TimeSpan(402070000000),
                Time = 0.7666666666666667,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("196848b7-dc8a-46ca-a20a-a445d91803f8"),
                Condition = Condition.AtWork,
                Date = new DateTime(638192736000000000),
                StartConditionTime = new TimeSpan(402880000000),
                Time = 1.1666666666666667,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("e951817e-df27-4adc-8988-d8ce4b6d0b16"),
                Condition = Condition.AtWork,
                Date = new DateTime(638192736000000000),
                StartConditionTime = new TimeSpan(404510000000),
                Time = 0.16666666666666666,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("b1b6abf0-4252-4df1-8694-9e0de5dab043"),
                Condition = Condition.AtWork,
                Date = new DateTime(638192736000000000),
                StartConditionTime = new TimeSpan(405980000000),
                Time = 1,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("fdaf07e1-a0e0-43d5-af59-2b7ad9dbb046"),
                Condition = Condition.AtWork,
                Date = new DateTime(638192736000000000),
                StartConditionTime = new TimeSpan(406980000000),
                Time = 0.2,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("27acbbf6-50b1-4c1f-85dc-eba82d8151cf"),
                Condition = Condition.AtWork,
                Date = new DateTime(638192736000000000),
                StartConditionTime = new TimeSpan(407750000000),
                Time = 0.9166666666666666,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("82d139b0-32bb-495a-83d4-75767eb8aa48"),
                Condition = Condition.AtWork,
                Date = new DateTime(638192736000000000),
                StartConditionTime = new TimeSpan(410720000000),
                Time = 0.9,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("92ba6058-4be9-4297-8d3e-5cfb64587aaf"),
                Condition = Condition.AtWork,
                Date = new DateTime(638192736000000000),
                StartConditionTime = new TimeSpan(412420000000),
                Time = 1.05,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("eb810d75-ca09-41b9-a5a3-7c99a702428a"),
                Condition = Condition.AtWork,
                Date = new DateTime(638192736000000000),
                StartConditionTime = new TimeSpan(413380000000),
                Time = 0.2,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("ca74c6cc-015c-460b-804f-0a7fd9ebddb2"),
                Condition = Condition.AtWork,
                Date = new DateTime(638192736000000000),
                StartConditionTime = new TimeSpan(422220000000),
                Time = 0.4666666666666667,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("643ac97b-514f-4b2b-9d20-11bb2414b90b"),
                Condition = Condition.AtWork,
                Date = new DateTime(638192736000000000),
                StartConditionTime = new TimeSpan(423550000000),
                Time = 1.1166666666666667,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("6cab8729-de57-4ddb-ad4e-61d0ccf80643"),
                Condition = Condition.AtWork,
                Date = new DateTime(638192736000000000),
                StartConditionTime = new TimeSpan(465660000000),
                Time = 0.9666666666666667,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("c6909ec0-2d58-4a34-95bd-5acf4b27e85b"),
                Condition = Condition.AtWork,
                Date = new DateTime(638192736000000000),
                StartConditionTime = new TimeSpan(466690000000),
                Time = 0.26666666666666666,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("a1f6d976-f726-4174-988c-307edc57a54e"),
                Condition = Condition.AtWork,
                Date = new DateTime(638192736000000000),
                StartConditionTime = new TimeSpan(467380000000),
                Time = 0.8,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("17d8219a-4115-4213-ae62-36b7f7926828"),
                Condition = Condition.AtWork,
                Date = new DateTime(638192736000000000),
                StartConditionTime = new TimeSpan(468020000000),
                Time = 0.43333333333333335,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("413eb0e8-0577-487c-b5ff-286a0775645a"),
                Condition = Condition.AtWork,
                Date = new DateTime(638192736000000000),
                StartConditionTime = new TimeSpan(468350000000),
                Time = 0.31666666666666665,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("07af763e-9e1e-4b9c-a787-46002565b93f"),
                Condition = Condition.AtWork,
                Date = new DateTime(638192736000000000),
                StartConditionTime = new TimeSpan(468620000000),
                Time = 0.43333333333333335,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("0577977e-fa2d-4c58-a727-fdd43f6c50fa"),
                Condition = Condition.AtWork,
                Date = new DateTime(638192736000000000),
                StartConditionTime = new TimeSpan(468950000000),
                Time = 0.21666666666666667,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("f7022346-4758-4855-97fa-22f98a4006c0"),
                Condition = Condition.AtWork,
                Date = new DateTime(638192736000000000),
                StartConditionTime = new TimeSpan(476300000000),
                Time = 1.1666666666666667,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("71735dec-f7d7-4297-987e-7eca22eead83"),
                Condition = Condition.AtWork,
                Date = new DateTime(638192736000000000),
                StartConditionTime = new TimeSpan(484160000000),
                Time = 1.1666666666666667,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("a0a70632-021f-497a-95b5-d1221ad4c9a0"),
                Condition = Condition.AtWork,
                Date = new DateTime(638192736000000000),
                StartConditionTime = new TimeSpan(486280000000),
                Time = 0.21666666666666667,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("97fa6021-f09a-49f4-8882-8a79c6149f65"),
                Condition = Condition.AtWork,
                Date = new DateTime(638192736000000000),
                StartConditionTime = new TimeSpan(486580000000),
                Time = 0.23333333333333334,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("a63a5509-5996-493b-a62d-3d07cc1c2dcd"),
                Condition = Condition.AtWork,
                Date = new DateTime(638192736000000000),
                StartConditionTime = new TimeSpan(492160000000),
                Time = 0.6,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("2faf0483-6c7c-40c8-b6a4-b144dbb06ce4"),
                Condition = Condition.AtWork,
                Date = new DateTime(638192736000000000),
                StartConditionTime = new TimeSpan(492600000000),
                Time = 1.0333333333333334,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("4912271b-2d21-4d4c-a7d4-a7e0d6ea908c"),
                Condition = Condition.AtWork,
                Date = new DateTime(638192736000000000),
                StartConditionTime = new TimeSpan(493330000000),
                Time = 0.6166666666666667,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("96190b9b-6bcf-47e7-8f3f-089651073e44"),
                Condition = Condition.AtWork,
                Date = new DateTime(638192736000000000),
                StartConditionTime = new TimeSpan(493840000000),
                Time = 0.85,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("981e52cd-c856-404c-8cac-06e0c40eecc2"),
                Condition = Condition.AtWork,
                Date = new DateTime(638192736000000000),
                StartConditionTime = new TimeSpan(494440000000),
                Time = 0.5333333333333333,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("0a2e4d0e-a73a-4944-b5d2-1424f476a961"),
                Condition = Condition.AtWork,
                Date = new DateTime(638192736000000000),
                StartConditionTime = new TimeSpan(494840000000),
                Time = 0.9,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("2243b97c-37e6-4258-9ac2-60471afb6484"),
                Condition = Condition.AtWork,
                Date = new DateTime(638192736000000000),
                StartConditionTime = new TimeSpan(495480000000),
                Time = 0.5666666666666667,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("9938f357-1ef1-4ef7-97e2-0da29537789f"),
                Condition = Condition.AtWork,
                Date = new DateTime(638192736000000000),
                StartConditionTime = new TimeSpan(495900000000),
                Time = 1.1666666666666667,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("c9f020cc-1251-4324-9228-9cf5b23f3745"),
                Condition = Condition.AtWork,
                Date = new DateTime(638192736000000000),
                StartConditionTime = new TimeSpan(496790000000),
                Time = 0.85,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("5c1d373f-31da-4a7d-ac33-0ba092e69152"),
                Condition = Condition.AtWork,
                Date = new DateTime(638192736000000000),
                StartConditionTime = new TimeSpan(497480000000),
                Time = 0.5333333333333333,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("51708325-83f5-4739-9566-4f7cb6527535"),
                Condition = Condition.AtWork,
                Date = new DateTime(638192736000000000),
                StartConditionTime = new TimeSpan(497990000000),
                Time = 1.0166666666666666,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("d3aa8350-485c-4606-afbb-b25a74040c39"),
                Condition = Condition.AtWork,
                Date = new DateTime(638192736000000000),
                StartConditionTime = new TimeSpan(535490000000),
                Time = 0.6,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("dae5a824-2ed9-4a8f-b115-caafb191588b"),
                Condition = Condition.AtWork,
                Date = new DateTime(638192736000000000),
                StartConditionTime = new TimeSpan(535930000000),
                Time = 1.1666666666666667,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("b24c59a4-6b1f-4db4-a91b-505bda37ede8"),
                Condition = Condition.AtWork,
                Date = new DateTime(638192736000000000),
                StartConditionTime = new TimeSpan(536960000000),
                Time = 0.7833333333333333,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("8aa4e050-997f-4f67-9537-ba17c8815ec7"),
                Condition = Condition.AtWork,
                Date = new DateTime(638192736000000000),
                StartConditionTime = new TimeSpan(537520000000),
                Time = 0.5,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("0d3dd574-3a80-44c6-ad49-5616090e5bea"),
                Condition = Condition.AtWork,
                Date = new DateTime(638192736000000000),
                StartConditionTime = new TimeSpan(541940000000),
                Time = 0.95,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("6615f95d-c588-4d2c-ab43-dc2fd828836e"),
                Condition = Condition.AtWork,
                Date = new DateTime(638192736000000000),
                StartConditionTime = new TimeSpan(543080000000),
                Time = 0.15,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("65e44a55-2b3e-4b33-a0bd-bcbca8c09836"),
                Condition = Condition.AtWork,
                Date = new DateTime(638192736000000000),
                StartConditionTime = new TimeSpan(545010000000),
                Time = 0.65,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("e0e1daa5-f086-4e36-bc9e-e13ad0e854ed"),
                Condition = Condition.AtWork,
                Date = new DateTime(638192736000000000),
                StartConditionTime = new TimeSpan(545560000000),
                Time = 0.45,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("97dd2980-be7a-4f38-b948-bb95227ef926"),
                Condition = Condition.AtWork,
                Date = new DateTime(638192736000000000),
                StartConditionTime = new TimeSpan(559400000000),
                Time = 0.3333333333333333,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("36d7986f-22c1-4cb7-92c7-923a976f8430"),
                Condition = Condition.AtWork,
                Date = new DateTime(638192736000000000),
                StartConditionTime = new TimeSpan(560030000000),
                Time = 1.15,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("b49c0c13-d09c-4e0a-9e3e-5b098a8b7bba"),
                Condition = Condition.AtWork,
                Date = new DateTime(638192736000000000),
                StartConditionTime = new TimeSpan(560990000000),
                Time = 0.6,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("8264a6e0-4860-438a-ab18-a258e3b57355"),
                Condition = Condition.AtWork,
                Date = new DateTime(638192736000000000),
                StartConditionTime = new TimeSpan(562470000000),
                Time = 0.5166666666666667,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("a78274ff-aafa-45f8-b48c-fceb2a50aa41"),
                Condition = Condition.AtWork,
                Date = new DateTime(638192736000000000),
                StartConditionTime = new TimeSpan(562860000000),
                Time = 0.38333333333333336,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("02310a88-7cfb-4a8e-8a9a-bdde34e7fbd6"),
                Condition = Condition.AtWork,
                Date = new DateTime(638192736000000000),
                StartConditionTime = new TimeSpan(600150000000),
                Time = 0.16666666666666666,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("88cea2e3-2b89-4ebc-94fb-645bafdd0ddc"),
                Condition = Condition.AtWork,
                Date = new DateTime(638192736000000000),
                StartConditionTime = new TimeSpan(600320000000),
                Time = 0.18333333333333332,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("25e85190-75de-4949-9767-da609de21095"),
                Condition = Condition.AtWork,
                Date = new DateTime(638192736000000000),
                StartConditionTime = new TimeSpan(600570000000),
                Time = 0.2,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("d0dfdf64-46cb-49c4-bcaa-a03cce07860e"),
                Condition = Condition.AtWork,
                Date = new DateTime(638192736000000000),
                StartConditionTime = new TimeSpan(600760000000),
                Time = 0.31666666666666665,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("02a3b7e5-2986-47a6-ba22-b61781edba02"),
                Condition = Condition.AtWork,
                Date = new DateTime(638192736000000000),
                StartConditionTime = new TimeSpan(601160000000),
                Time = 0.3,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("7955f55a-0c19-4d61-89f0-f8a5589749be"),
                Condition = Condition.AtWork,
                Date = new DateTime(638192736000000000),
                StartConditionTime = new TimeSpan(601410000000),
                Time = 0.15,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("412d9f05-5687-4b6b-a44c-58b29896922c"),
                Condition = Condition.AtWork,
                Date = new DateTime(638192736000000000),
                StartConditionTime = new TimeSpan(601810000000),
                Time = 0.26666666666666666,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("7307ea78-3173-43f7-a6b9-366806b71492"),
                Condition = Condition.AtWork,
                Date = new DateTime(638192736000000000),
                StartConditionTime = new TimeSpan(602220000000),
                Time = 0.25,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("9d854b23-1f48-4684-93e7-74bffaf9911b"),
                Condition = Condition.AtWork,
                Date = new DateTime(638192736000000000),
                StartConditionTime = new TimeSpan(607270000000),
                Time = 0.23333333333333334,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("7d4c154a-bfa0-4cc4-ba98-c7c77c5e6f96"),
                Condition = Condition.AtWork,
                Date = new DateTime(638192736000000000),
                StartConditionTime = new TimeSpan(607480000000),
                Time = 0.2833333333333333,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("70c4a1ac-c2fa-47e6-b4a3-05020ed8e007"),
                Condition = Condition.AtWork,
                Date = new DateTime(638192736000000000),
                StartConditionTime = new TimeSpan(607720000000),
                Time = 0.3333333333333333,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("7ba18ede-8779-4fd9-b6d2-a4d97c6d06c9"),
                Condition = Condition.AtWork,
                Date = new DateTime(638192736000000000),
                StartConditionTime = new TimeSpan(608140000000),
                Time = 0.3,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("a655efdc-3a4a-4237-b612-e3472ca1121c"),
                Condition = Condition.AtWork,
                Date = new DateTime(638192736000000000),
                StartConditionTime = new TimeSpan(608620000000),
                Time = 0.31666666666666665,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("5c123a6f-d77d-4aac-a6d8-993b733c0b96"),
                Condition = Condition.AtWork,
                Date = new DateTime(638192736000000000),
                StartConditionTime = new TimeSpan(609030000000),
                Time = 0.25,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("b53151e2-d6d4-4f90-9ee3-3d5d3c62b74e"),
                Condition = Condition.AtWork,
                Date = new DateTime(638192736000000000),
                StartConditionTime = new TimeSpan(609300000000),
                Time = 0.2,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("cdc1271b-5166-4b9f-80ef-a2847abfd673"),
                Condition = Condition.AtWork,
                Date = new DateTime(638192736000000000),
                StartConditionTime = new TimeSpan(620060000000),
                Time = 0.3,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("1532c673-cc2b-4b36-ab67-1a974bbae217"),
                Condition = Condition.AtWork,
                Date = new DateTime(638192736000000000),
                StartConditionTime = new TimeSpan(621550000000),
                Time = 0.4,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("df417272-b3d1-40c4-9b77-440cac8acd42"),
                Condition = Condition.AtWork,
                Date = new DateTime(638192736000000000),
                StartConditionTime = new TimeSpan(621860000000),
                Time = 0.3,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("1795c708-47ec-4be2-bcbf-d95a2504c80f"),
                Condition = Condition.AtWork,
                Date = new DateTime(638192736000000000),
                StartConditionTime = new TimeSpan(622110000000),
                Time = 0.4,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("73a12b79-810a-425c-8e4d-bc0b852f3f60"),
                Condition = Condition.AtWork,
                Date = new DateTime(638192736000000000),
                StartConditionTime = new TimeSpan(622480000000),
                Time = 0.23333333333333334,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("10e31806-1ac1-4703-8976-9efd045023da"),
                Condition = Condition.AtWork,
                Date = new DateTime(638192736000000000),
                StartConditionTime = new TimeSpan(622740000000),
                Time = 0.3333333333333333,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("26e669a5-b1b0-41f1-aacf-ae83a7c0fcf3"),
                Condition = Condition.AtWork,
                Date = new DateTime(638192736000000000),
                StartConditionTime = new TimeSpan(623710000000),
                Time = 0.2833333333333333,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("fe2c61f1-2147-4139-9d2e-a62a2740f56b"),
                Condition = Condition.AtWork,
                Date = new DateTime(638192736000000000),
                StartConditionTime = new TimeSpan(624500000000),
                Time = 0.5333333333333333,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("91038ff1-4ed6-418a-a645-b83016060287"),
                Condition = Condition.AtWork,
                Date = new DateTime(638192736000000000),
                StartConditionTime = new TimeSpan(624950000000),
                Time = 1.0666666666666667,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("df5fc7e8-4496-448d-bbab-146df45cca40"),
                Condition = Condition.AtWork,
                Date = new DateTime(638192736000000000),
                StartConditionTime = new TimeSpan(625900000000),
                Time = 0.2833333333333333,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("1b6dbf38-0f6c-4006-994b-fa2212f08f88"),
                Condition = Condition.On,
                Date = new DateTime(638193600000000000),
                StartConditionTime = new TimeSpan(273630000000),
                Time = 2,
                WeldingEquipmentId = Guid.Parse("a623d6e5-7a95-4c22-addb-35ec1a76e606"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("84601bf8-a2b6-422e-8ad5-00d6bd61e812"),
                Condition = Condition.On,
                Date = new DateTime(638193600000000000),
                StartConditionTime = new TimeSpan(275370000000),
                Time = 2,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("ab6a80be-11d2-4cbd-b054-87a7ccb5e5f5"),
                Condition = Condition.AtWork,
                Date = new DateTime(638193600000000000),
                StartConditionTime = new TimeSpan(279250000000),
                Time = 0.21666666666666667,
                WeldingEquipmentId = Guid.Parse("a623d6e5-7a95-4c22-addb-35ec1a76e606"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("00622af8-01f8-4040-8abf-55d718e9c51b"),
                Condition = Condition.AtWork,
                Date = new DateTime(638193600000000000),
                StartConditionTime = new TimeSpan(280750000000),
                Time = 0.45,
                WeldingEquipmentId = Guid.Parse("a623d6e5-7a95-4c22-addb-35ec1a76e606"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("1e798e54-3796-4185-b537-77235348ee25"),
                Condition = Condition.AtWork,
                Date = new DateTime(638193600000000000),
                StartConditionTime = new TimeSpan(287060000000),
                Time = 0.3,
                WeldingEquipmentId = Guid.Parse("a623d6e5-7a95-4c22-addb-35ec1a76e606"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("7025f48d-14ed-4903-a5fa-a7185a379b3d"),
                Condition = Condition.AtWork,
                Date = new DateTime(638193600000000000),
                StartConditionTime = new TimeSpan(287310000000),
                Time = 0.2,
                WeldingEquipmentId = Guid.Parse("a623d6e5-7a95-4c22-addb-35ec1a76e606"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("b974feb1-1c76-4cf2-b7a1-d92070398047"),
                Condition = Condition.AtWork,
                Date = new DateTime(638193600000000000),
                StartConditionTime = new TimeSpan(287490000000),
                Time = 0.23333333333333334,
                WeldingEquipmentId = Guid.Parse("a623d6e5-7a95-4c22-addb-35ec1a76e606"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("fe98dcec-5bd2-4c6e-a18f-86ddd78a6ac6"),
                Condition = Condition.AtWork,
                Date = new DateTime(638193600000000000),
                StartConditionTime = new TimeSpan(287790000000),
                Time = 0.26666666666666666,
                WeldingEquipmentId = Guid.Parse("a623d6e5-7a95-4c22-addb-35ec1a76e606"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("ca31f60b-4677-4db6-97ca-c62d08f3095e"),
                Condition = Condition.AtWork,
                Date = new DateTime(638193600000000000),
                StartConditionTime = new TimeSpan(288100000000),
                Time = 0.2,
                WeldingEquipmentId = Guid.Parse("a623d6e5-7a95-4c22-addb-35ec1a76e606"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("a25ef529-91c5-4ab7-81ff-65eca578b738"),
                Condition = Condition.AtWork,
                Date = new DateTime(638193600000000000),
                StartConditionTime = new TimeSpan(288290000000),
                Time = 0.23333333333333334,
                WeldingEquipmentId = Guid.Parse("a623d6e5-7a95-4c22-addb-35ec1a76e606"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("6549e749-6bda-46ea-9989-06a6555be88e"),
                Condition = Condition.AtWork,
                Date = new DateTime(638193600000000000),
                StartConditionTime = new TimeSpan(290290000000),
                Time = 0.9333333333333333,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("f1efc699-2b55-4579-a5c0-5cb733667668"),
                Condition = Condition.AtWork,
                Date = new DateTime(638193600000000000),
                StartConditionTime = new TimeSpan(290950000000),
                Time = 1.0166666666666666,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("0544a8f2-f936-48c9-aa91-efa4324204c8"),
                Condition = Condition.AtWork,
                Date = new DateTime(638193600000000000),
                StartConditionTime = new TimeSpan(291650000000),
                Time = 0.6333333333333333,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("89bd02f9-23a2-4d65-b334-f9544fca46d7"),
                Condition = Condition.AtWork,
                Date = new DateTime(638193600000000000),
                StartConditionTime = new TimeSpan(292120000000),
                Time = 0.8666666666666667,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("50a35a14-49ca-489d-ab57-40d3babce6b8"),
                Condition = Condition.AtWork,
                Date = new DateTime(638193600000000000),
                StartConditionTime = new TimeSpan(292730000000),
                Time = 0.8,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("5ad0dd01-18e9-4959-b58e-acf701aea54b"),
                Condition = Condition.AtWork,
                Date = new DateTime(638193600000000000),
                StartConditionTime = new TimeSpan(293300000000),
                Time = 0.9666666666666667,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("e8f5921d-2609-47e6-9585-823eb792c731"),
                Condition = Condition.AtWork,
                Date = new DateTime(638193600000000000),
                StartConditionTime = new TimeSpan(293970000000),
                Time = 0.7333333333333333,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("670573a2-5085-4a99-a2d3-9116f53ffd68"),
                Condition = Condition.AtWork,
                Date = new DateTime(638193600000000000),
                StartConditionTime = new TimeSpan(294490000000),
                Time = 1.05,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("95fdb120-c0bd-4b23-a748-b348558ba3a3"),
                Condition = Condition.AtWork,
                Date = new DateTime(638193600000000000),
                StartConditionTime = new TimeSpan(295220000000),
                Time = 0.23333333333333334,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("a7802991-f770-4349-b8bb-0dc9434bf557"),
                Condition = Condition.AtWork,
                Date = new DateTime(638193600000000000),
                StartConditionTime = new TimeSpan(295430000000),
                Time = 0.7833333333333333,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("35c4098d-fd77-4e52-b5c5-0ecb931acab8"),
                Condition = Condition.AtWork,
                Date = new DateTime(638193600000000000),
                StartConditionTime = new TimeSpan(296040000000),
                Time = 0.05,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("8d3ac42a-fb41-48c3-ad3a-e2d6749c01e7"),
                Condition = Condition.AtWork,
                Date = new DateTime(638193600000000000),
                StartConditionTime = new TimeSpan(298890000000),
                Time = 0.4666666666666667,
                WeldingEquipmentId = Guid.Parse("a623d6e5-7a95-4c22-addb-35ec1a76e606"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("39eea15f-59ff-45bf-80ff-1501ca837cff"),
                Condition = Condition.AtWork,
                Date = new DateTime(638193600000000000),
                StartConditionTime = new TimeSpan(299480000000),
                Time = 0.7833333333333333,
                WeldingEquipmentId = Guid.Parse("a623d6e5-7a95-4c22-addb-35ec1a76e606"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("fd1e1775-42df-4b8b-a63c-519e3c09ed62"),
                Condition = Condition.AtWork,
                Date = new DateTime(638193600000000000),
                StartConditionTime = new TimeSpan(300610000000),
                Time = 0.6833333333333333,
                WeldingEquipmentId = Guid.Parse("a623d6e5-7a95-4c22-addb-35ec1a76e606"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("0dc1323e-f597-423a-8f63-250814c9902d"),
                Condition = Condition.AtWork,
                Date = new DateTime(638193600000000000),
                StartConditionTime = new TimeSpan(301860000000),
                Time = 0.9666666666666667,
                WeldingEquipmentId = Guid.Parse("a623d6e5-7a95-4c22-addb-35ec1a76e606"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("f01d2b79-ff02-4f3d-a3f1-3a10bdbaa5ef"),
                Condition = Condition.AtWork,
                Date = new DateTime(638193600000000000),
                StartConditionTime = new TimeSpan(302530000000),
                Time = 0.6666666666666666,
                WeldingEquipmentId = Guid.Parse("a623d6e5-7a95-4c22-addb-35ec1a76e606"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("0545aaed-42ef-49b4-827f-c580316fdaae"),
                Condition = Condition.AtWork,
                Date = new DateTime(638193600000000000),
                StartConditionTime = new TimeSpan(303080000000),
                Time = 0.3333333333333333,
                WeldingEquipmentId = Guid.Parse("a623d6e5-7a95-4c22-addb-35ec1a76e606"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("648cbd5c-6459-463f-b249-7b67bc0ed0e6"),
                Condition = Condition.AtWork,
                Date = new DateTime(638193600000000000),
                StartConditionTime = new TimeSpan(304500000000),
                Time = 0.7833333333333333,
                WeldingEquipmentId = Guid.Parse("a623d6e5-7a95-4c22-addb-35ec1a76e606"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("a11a67a4-5676-4597-8f95-3da68845cba1"),
                Condition = Condition.AtWork,
                Date = new DateTime(638193600000000000),
                StartConditionTime = new TimeSpan(305870000000),
                Time = 1.1833333333333333,
                WeldingEquipmentId = Guid.Parse("a623d6e5-7a95-4c22-addb-35ec1a76e606"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("e479ce86-c848-4166-86ae-cea4664ac54a"),
                Condition = Condition.AtWork,
                Date = new DateTime(638193600000000000),
                StartConditionTime = new TimeSpan(306750000000),
                Time = 0.9666666666666667,
                WeldingEquipmentId = Guid.Parse("a623d6e5-7a95-4c22-addb-35ec1a76e606"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("652e7c98-a3ed-4580-a3cb-cb5f066833cb"),
                Condition = Condition.AtWork,
                Date = new DateTime(638193600000000000),
                StartConditionTime = new TimeSpan(307420000000),
                Time = 1.0833333333333333,
                WeldingEquipmentId = Guid.Parse("a623d6e5-7a95-4c22-addb-35ec1a76e606"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("36050d16-8c1e-4c96-bc56-4ae02ee83b12"),
                Condition = Condition.AtWork,
                Date = new DateTime(638193600000000000),
                StartConditionTime = new TimeSpan(308220000000),
                Time = 0.6,
                WeldingEquipmentId = Guid.Parse("a623d6e5-7a95-4c22-addb-35ec1a76e606"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("fd3bb18e-81de-4176-ba3c-1222b3d44092"),
                Condition = Condition.AtWork,
                Date = new DateTime(638193600000000000),
                StartConditionTime = new TimeSpan(310830000000),
                Time = 0.23333333333333334,
                WeldingEquipmentId = Guid.Parse("a623d6e5-7a95-4c22-addb-35ec1a76e606"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("951ea02f-8452-488e-95a9-7de8062aeae6"),
                Condition = Condition.AtWork,
                Date = new DateTime(638193600000000000),
                StartConditionTime = new TimeSpan(310340000000),
                Time = 0.05,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("975f93bc-6bc3-49b1-8417-dc82ad3e772c"),
                Condition = Condition.AtWork,
                Date = new DateTime(638193600000000000),
                StartConditionTime = new TimeSpan(314390000000),
                Time = 0.8833333333333333,
                WeldingEquipmentId = Guid.Parse("a623d6e5-7a95-4c22-addb-35ec1a76e606"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("c0c4e297-7731-47f0-b6b8-5796401f0231"),
                Condition = Condition.AtWork,
                Date = new DateTime(638193600000000000),
                StartConditionTime = new TimeSpan(314640000000),
                Time = 0.95,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("f8a7f2d4-77dc-430c-a541-44f3db473947"),
                Condition = Condition.AtWork,
                Date = new DateTime(638193600000000000),
                StartConditionTime = new TimeSpan(315520000000),
                Time = 0.9,
                WeldingEquipmentId = Guid.Parse("a623d6e5-7a95-4c22-addb-35ec1a76e606"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("7a675b1e-6c05-42a7-b818-7c29eb80be47"),
                Condition = Condition.AtWork,
                Date = new DateTime(638193600000000000),
                StartConditionTime = new TimeSpan(316580000000),
                Time = 1.1,
                WeldingEquipmentId = Guid.Parse("a623d6e5-7a95-4c22-addb-35ec1a76e606"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("80d91700-4f32-46b2-ab4c-20e333256db2"),
                Condition = Condition.AtWork,
                Date = new DateTime(638193600000000000),
                StartConditionTime = new TimeSpan(317390000000),
                Time = 0.3333333333333333,
                WeldingEquipmentId = Guid.Parse("a623d6e5-7a95-4c22-addb-35ec1a76e606"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("89ef594b-725b-4a56-945d-3d4bd13d36f2"),
                Condition = Condition.AtWork,
                Date = new DateTime(638193600000000000),
                StartConditionTime = new TimeSpan(315750000000),
                Time = 0.25,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("b7aa1bc1-bb91-49a3-ab50-1a402aea5167"),
                Condition = Condition.AtWork,
                Date = new DateTime(638193600000000000),
                StartConditionTime = new TimeSpan(317650000000),
                Time = 0.26666666666666666,
                WeldingEquipmentId = Guid.Parse("a623d6e5-7a95-4c22-addb-35ec1a76e606"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("64d17597-9e7e-43ff-977c-66590bc5b09f"),
                Condition = Condition.AtWork,
                Date = new DateTime(638193600000000000),
                StartConditionTime = new TimeSpan(317580000000),
                Time = 0.55,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("b97b1f29-9310-4b38-856f-37352a02dec3"),
                Condition = Condition.AtWork,
                Date = new DateTime(638193600000000000),
                StartConditionTime = new TimeSpan(318000000000),
                Time = 0.8333333333333334,
                WeldingEquipmentId = Guid.Parse("a623d6e5-7a95-4c22-addb-35ec1a76e606"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("aaa1c374-6d80-4a12-8e2e-d82fc86e98f8"),
                Condition = Condition.AtWork,
                Date = new DateTime(638193600000000000),
                StartConditionTime = new TimeSpan(318090000000),
                Time = 0.3333333333333333,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("171d89ee-23d0-4c8f-98ef-c4ae02284011"),
                Condition = Condition.AtWork,
                Date = new DateTime(638193600000000000),
                StartConditionTime = new TimeSpan(318590000000),
                Time = 0.9,
                WeldingEquipmentId = Guid.Parse("a623d6e5-7a95-4c22-addb-35ec1a76e606"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("274aebce-7114-4df0-87ed-b45cde2bf2ed"),
                Condition = Condition.AtWork,
                Date = new DateTime(638193600000000000),
                StartConditionTime = new TimeSpan(319230000000),
                Time = 0.43333333333333335,
                WeldingEquipmentId = Guid.Parse("a623d6e5-7a95-4c22-addb-35ec1a76e606"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("67816704-e535-4faf-9576-1060f4a84cdb"),
                Condition = Condition.AtWork,
                Date = new DateTime(638193600000000000),
                StartConditionTime = new TimeSpan(319650000000),
                Time = 0.6666666666666666,
                WeldingEquipmentId = Guid.Parse("a623d6e5-7a95-4c22-addb-35ec1a76e606"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("613a2138-2de0-4792-96b2-72982fad0006"),
                Condition = Condition.AtWork,
                Date = new DateTime(638193600000000000),
                StartConditionTime = new TimeSpan(320140000000),
                Time = 0.6666666666666666,
                WeldingEquipmentId = Guid.Parse("a623d6e5-7a95-4c22-addb-35ec1a76e606"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("e5f32f6c-4627-40d9-8f70-60b418845238"),
                Condition = Condition.AtWork,
                Date = new DateTime(638193600000000000),
                StartConditionTime = new TimeSpan(320620000000),
                Time = 0.31666666666666665,
                WeldingEquipmentId = Guid.Parse("a623d6e5-7a95-4c22-addb-35ec1a76e606"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("9853809f-f04c-485c-8aa2-8cb0454c7187"),
                Condition = Condition.AtWork,
                Date = new DateTime(638193600000000000),
                StartConditionTime = new TimeSpan(320880000000),
                Time = 0.45,
                WeldingEquipmentId = Guid.Parse("a623d6e5-7a95-4c22-addb-35ec1a76e606"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("06451e8b-60e2-4a23-ab54-a4454ca6e860"),
                Condition = Condition.AtWork,
                Date = new DateTime(638193600000000000),
                StartConditionTime = new TimeSpan(321220000000),
                Time = 0.35,
                WeldingEquipmentId = Guid.Parse("a623d6e5-7a95-4c22-addb-35ec1a76e606"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("f8742b07-7354-4cea-a6aa-daff04729cb8"),
                Condition = Condition.AtWork,
                Date = new DateTime(638193600000000000),
                StartConditionTime = new TimeSpan(321510000000),
                Time = 0.23333333333333334,
                WeldingEquipmentId = Guid.Parse("a623d6e5-7a95-4c22-addb-35ec1a76e606"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("18f01468-2b10-4679-afe8-543521dc346f"),
                Condition = Condition.AtWork,
                Date = new DateTime(638193600000000000),
                StartConditionTime = new TimeSpan(321200000000),
                Time = 0.7333333333333333,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("ae56015a-5b8e-4dbd-ac37-fa7fcabc153e"),
                Condition = Condition.AtWork,
                Date = new DateTime(638193600000000000),
                StartConditionTime = new TimeSpan(322410000000),
                Time = 0.4666666666666667,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("f2df4eb7-a8c8-4845-a8f5-9b23e193dd9d"),
                Condition = Condition.AtWork,
                Date = new DateTime(638193600000000000),
                StartConditionTime = new TimeSpan(322830000000),
                Time = 0.08333333333333333,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("81f7f9fa-41c1-4213-8af2-26fc48cb9b50"),
                Condition = Condition.AtWork,
                Date = new DateTime(638193600000000000),
                StartConditionTime = new TimeSpan(328330000000),
                Time = 1.2166666666666666,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("f28ac88d-dd05-4e1c-bcd2-9d49d0f051a8"),
                Condition = Condition.AtWork,
                Date = new DateTime(638193600000000000),
                StartConditionTime = new TimeSpan(329190000000),
                Time = 0.5333333333333333,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("9e00a0cc-b9e5-4d30-9873-16afe090c512"),
                Condition = Condition.AtWork,
                Date = new DateTime(638193600000000000),
                StartConditionTime = new TimeSpan(341030000000),
                Time = 0.65,
                WeldingEquipmentId = Guid.Parse("a623d6e5-7a95-4c22-addb-35ec1a76e606"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("41da61f6-0e03-46f0-93e3-51ad4c28b20f"),
                Condition = Condition.AtWork,
                Date = new DateTime(638193600000000000),
                StartConditionTime = new TimeSpan(342250000000),
                Time = 1.0333333333333334,
                WeldingEquipmentId = Guid.Parse("a623d6e5-7a95-4c22-addb-35ec1a76e606"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("da73e059-42fe-48d9-ab9e-8c42cf649a1c"),
                Condition = Condition.AtWork,
                Date = new DateTime(638193600000000000),
                StartConditionTime = new TimeSpan(342970000000),
                Time = 1.2166666666666666,
                WeldingEquipmentId = Guid.Parse("a623d6e5-7a95-4c22-addb-35ec1a76e606"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("49db4722-bf9a-4097-866e-c870dde26b12"),
                Condition = Condition.AtWork,
                Date = new DateTime(638193600000000000),
                StartConditionTime = new TimeSpan(343990000000),
                Time = 1.0333333333333334,
                WeldingEquipmentId = Guid.Parse("a623d6e5-7a95-4c22-addb-35ec1a76e606"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("58738bef-a44f-4104-83db-e35cd1510786"),
                Condition = Condition.AtWork,
                Date = new DateTime(638193600000000000),
                StartConditionTime = new TimeSpan(344700000000),
                Time = 0.6333333333333333,
                WeldingEquipmentId = Guid.Parse("a623d6e5-7a95-4c22-addb-35ec1a76e606"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("be51bc9a-d7ea-4a11-a26a-1f0d6f46e742"),
                Condition = Condition.AtWork,
                Date = new DateTime(638193600000000000),
                StartConditionTime = new TimeSpan(345280000000),
                Time = 1.2,
                WeldingEquipmentId = Guid.Parse("a623d6e5-7a95-4c22-addb-35ec1a76e606"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("6fdc1b2d-bad9-4cd1-b5e0-cea011fd9f78"),
                Condition = Condition.AtWork,
                Date = new DateTime(638193600000000000),
                StartConditionTime = new TimeSpan(346160000000),
                Time = 0.6833333333333333,
                WeldingEquipmentId = Guid.Parse("a623d6e5-7a95-4c22-addb-35ec1a76e606"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("8af60f30-7413-4807-aa70-9008839845a8"),
                Condition = Condition.AtWork,
                Date = new DateTime(638193600000000000),
                StartConditionTime = new TimeSpan(347350000000),
                Time = 0.7166666666666667,
                WeldingEquipmentId = Guid.Parse("a623d6e5-7a95-4c22-addb-35ec1a76e606"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("12ce45a1-7342-406f-86e3-c66d8629e767"),
                Condition = Condition.AtWork,
                Date = new DateTime(638193600000000000),
                StartConditionTime = new TimeSpan(347920000000),
                Time = 1.0666666666666667,
                WeldingEquipmentId = Guid.Parse("a623d6e5-7a95-4c22-addb-35ec1a76e606"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("50d3a9a4-57b6-4fe7-9020-8d62b362184f"),
                Condition = Condition.AtWork,
                Date = new DateTime(638193600000000000),
                StartConditionTime = new TimeSpan(348750000000),
                Time = 0.8,
                WeldingEquipmentId = Guid.Parse("a623d6e5-7a95-4c22-addb-35ec1a76e606"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("8974b216-9f09-44fd-84fc-f2f51af094d3"),
                Condition = Condition.AtWork,
                Date = new DateTime(638193600000000000),
                StartConditionTime = new TimeSpan(349320000000),
                Time = 0.5166666666666667,
                WeldingEquipmentId = Guid.Parse("a623d6e5-7a95-4c22-addb-35ec1a76e606"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("9f4904ac-aa35-4aab-87be-93631ffd96cd"),
                Condition = Condition.AtWork,
                Date = new DateTime(638193600000000000),
                StartConditionTime = new TimeSpan(349880000000),
                Time = 0.4,
                WeldingEquipmentId = Guid.Parse("a623d6e5-7a95-4c22-addb-35ec1a76e606"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("272a97af-1793-4903-b483-649cb5b5a5f2"),
                Condition = Condition.AtWork,
                Date = new DateTime(638193600000000000),
                StartConditionTime = new TimeSpan(350330000000),
                Time = 0.4166666666666667,
                WeldingEquipmentId = Guid.Parse("a623d6e5-7a95-4c22-addb-35ec1a76e606"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("6a93b0ce-ce47-49a2-a2b8-4da00bce3004"),
                Condition = Condition.AtWork,
                Date = new DateTime(638193600000000000),
                StartConditionTime = new TimeSpan(350770000000),
                Time = 0.38333333333333336,
                WeldingEquipmentId = Guid.Parse("a623d6e5-7a95-4c22-addb-35ec1a76e606"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("78648721-35e4-420a-bda2-89539fa4a68a"),
                Condition = Condition.AtWork,
                Date = new DateTime(638193600000000000),
                StartConditionTime = new TimeSpan(351170000000),
                Time = 0.4166666666666667,
                WeldingEquipmentId = Guid.Parse("a623d6e5-7a95-4c22-addb-35ec1a76e606"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("54a2b055-3f24-4cb0-a9e8-e6818bb9fee0"),
                Condition = Condition.AtWork,
                Date = new DateTime(638193600000000000),
                StartConditionTime = new TimeSpan(352110000000),
                Time = 0.4666666666666667,
                WeldingEquipmentId = Guid.Parse("a623d6e5-7a95-4c22-addb-35ec1a76e606"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("9794d56d-dcc9-4605-b054-b4da5da1469b"),
                Condition = Condition.AtWork,
                Date = new DateTime(638193600000000000),
                StartConditionTime = new TimeSpan(352730000000),
                Time = 0.5,
                WeldingEquipmentId = Guid.Parse("a623d6e5-7a95-4c22-addb-35ec1a76e606"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("3795c9b7-1ce1-4234-bd5f-3fb263e379c5"),
                Condition = Condition.AtWork,
                Date = new DateTime(638193600000000000),
                StartConditionTime = new TimeSpan(353100000000),
                Time = 0.26666666666666666,
                WeldingEquipmentId = Guid.Parse("a623d6e5-7a95-4c22-addb-35ec1a76e606"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("fe710590-82e6-4365-952d-7d7e006ebd7e"),
                Condition = Condition.AtWork,
                Date = new DateTime(638193600000000000),
                StartConditionTime = new TimeSpan(353340000000),
                Time = 0.8666666666666667,
                WeldingEquipmentId = Guid.Parse("a623d6e5-7a95-4c22-addb-35ec1a76e606"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("0606cb85-6a52-40d5-a1c5-bf31525e7e35"),
                Condition = Condition.AtWork,
                Date = new DateTime(638193600000000000),
                StartConditionTime = new TimeSpan(353950000000),
                Time = 1,
                WeldingEquipmentId = Guid.Parse("a623d6e5-7a95-4c22-addb-35ec1a76e606"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("3f5f7129-056a-4ac2-aa21-b4b7190564d1"),
                Condition = Condition.AtWork,
                Date = new DateTime(638193600000000000),
                StartConditionTime = new TimeSpan(354950000000),
                Time = 1.1666666666666667,
                WeldingEquipmentId = Guid.Parse("a623d6e5-7a95-4c22-addb-35ec1a76e606"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("dd9776cb-cbb4-407f-b4fe-8df6f9a589e7"),
                Condition = Condition.AtWork,
                Date = new DateTime(638193600000000000),
                StartConditionTime = new TimeSpan(355850000000),
                Time = 0.9166666666666666,
                WeldingEquipmentId = Guid.Parse("a623d6e5-7a95-4c22-addb-35ec1a76e606"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("45df5a8f-3c5a-45e8-b7ae-7c7dcc1d7333"),
                Condition = Condition.AtWork,
                Date = new DateTime(638193600000000000),
                StartConditionTime = new TimeSpan(356490000000),
                Time = 0.7166666666666667,
                WeldingEquipmentId = Guid.Parse("a623d6e5-7a95-4c22-addb-35ec1a76e606"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("634bfdbf-42e9-481f-97ba-4c8fe31a18b4"),
                Condition = Condition.AtWork,
                Date = new DateTime(638193600000000000),
                StartConditionTime = new TimeSpan(369670000000),
                Time = 0.2833333333333333,
                WeldingEquipmentId = Guid.Parse("a623d6e5-7a95-4c22-addb-35ec1a76e606"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("4da57eff-3d51-4dac-bed8-f8f581ecdf98"),
                Condition = Condition.AtWork,
                Date = new DateTime(638193600000000000),
                StartConditionTime = new TimeSpan(372170000000),
                Time = 0.5333333333333333,
                WeldingEquipmentId = Guid.Parse("a623d6e5-7a95-4c22-addb-35ec1a76e606"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("d8347827-cf14-479d-aba2-ea6168e69f05"),
                Condition = Condition.AtWork,
                Date = new DateTime(638193600000000000),
                StartConditionTime = new TimeSpan(372570000000),
                Time = 0.5166666666666667,
                WeldingEquipmentId = Guid.Parse("a623d6e5-7a95-4c22-addb-35ec1a76e606"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("1cf830ae-0eaa-4373-b794-e966462414d8"),
                Condition = Condition.AtWork,
                Date = new DateTime(638193600000000000),
                StartConditionTime = new TimeSpan(391430000000),
                Time = 0.21666666666666667,
                WeldingEquipmentId = Guid.Parse("a623d6e5-7a95-4c22-addb-35ec1a76e606"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("8fee2722-2f21-4c6b-9080-c5149a9b8062"),
                Condition = Condition.AtWork,
                Date = new DateTime(638193600000000000),
                StartConditionTime = new TimeSpan(392170000000),
                Time = 0.16666666666666666,
                WeldingEquipmentId = Guid.Parse("a623d6e5-7a95-4c22-addb-35ec1a76e606"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("e9108a7e-f77c-4a07-af8c-36092591758f"),
                Condition = Condition.AtWork,
                Date = new DateTime(638193600000000000),
                StartConditionTime = new TimeSpan(393430000000),
                Time = 0.6666666666666666,
                WeldingEquipmentId = Guid.Parse("a623d6e5-7a95-4c22-addb-35ec1a76e606"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("0a0594c9-e752-4af4-ba1d-e44e5574c82e"),
                Condition = Condition.AtWork,
                Date = new DateTime(638193600000000000),
                StartConditionTime = new TimeSpan(394040000000),
                Time = 1.0333333333333334,
                WeldingEquipmentId = Guid.Parse("a623d6e5-7a95-4c22-addb-35ec1a76e606"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("60abf59c-cf94-49fb-9369-373991014056"),
                Condition = Condition.AtWork,
                Date = new DateTime(638193600000000000),
                StartConditionTime = new TimeSpan(413380000000),
                Time = 0.5666666666666667,
                WeldingEquipmentId = Guid.Parse("a623d6e5-7a95-4c22-addb-35ec1a76e606"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("4183f370-3a88-4605-be8b-c11eb5c83b52"),
                Condition = Condition.AtWork,
                Date = new DateTime(638193600000000000),
                StartConditionTime = new TimeSpan(413980000000),
                Time = 0.3,
                WeldingEquipmentId = Guid.Parse("a623d6e5-7a95-4c22-addb-35ec1a76e606"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("6634533b-a689-4d10-a19b-cdd6e333bb28"),
                Condition = Condition.AtWork,
                Date = new DateTime(638193600000000000),
                StartConditionTime = new TimeSpan(414240000000),
                Time = 0.3333333333333333,
                WeldingEquipmentId = Guid.Parse("a623d6e5-7a95-4c22-addb-35ec1a76e606"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("ae134419-910f-4e1e-a514-1096e2bd87b1"),
                Condition = Condition.AtWork,
                Date = new DateTime(638193600000000000),
                StartConditionTime = new TimeSpan(414570000000),
                Time = 0.5833333333333334,
                WeldingEquipmentId = Guid.Parse("a623d6e5-7a95-4c22-addb-35ec1a76e606"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("3ebca978-b117-4c62-bf99-bfa3bd9fff5c"),
                Condition = Condition.AtWork,
                Date = new DateTime(638193600000000000),
                StartConditionTime = new TimeSpan(415330000000),
                Time = 0.7166666666666667,
                WeldingEquipmentId = Guid.Parse("a623d6e5-7a95-4c22-addb-35ec1a76e606"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("c04191ef-779d-438f-aea0-10489e2f8494"),
                Condition = Condition.AtWork,
                Date = new DateTime(638193600000000000),
                StartConditionTime = new TimeSpan(417360000000),
                Time = 0.5,
                WeldingEquipmentId = Guid.Parse("a623d6e5-7a95-4c22-addb-35ec1a76e606"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("8f17a048-3f28-4010-bedf-31da10c0ee9a"),
                Condition = Condition.AtWork,
                Date = new DateTime(638193600000000000),
                StartConditionTime = new TimeSpan(417850000000),
                Time = 0.43333333333333335,
                WeldingEquipmentId = Guid.Parse("a623d6e5-7a95-4c22-addb-35ec1a76e606"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("6a21404f-c636-42b3-bf55-4e6bab90ffc9"),
                Condition = Condition.AtWork,
                Date = new DateTime(638193600000000000),
                StartConditionTime = new TimeSpan(418230000000),
                Time = 0.31666666666666665,
                WeldingEquipmentId = Guid.Parse("a623d6e5-7a95-4c22-addb-35ec1a76e606"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("4752e76c-9099-4afb-ae20-88d489aed48c"),
                Condition = Condition.AtWork,
                Date = new DateTime(638193600000000000),
                StartConditionTime = new TimeSpan(418770000000),
                Time = 0.23333333333333334,
                WeldingEquipmentId = Guid.Parse("a623d6e5-7a95-4c22-addb-35ec1a76e606"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("38d60134-1e01-4f51-9e61-dc4bd51e7b00"),
                Condition = Condition.AtWork,
                Date = new DateTime(638193600000000000),
                StartConditionTime = new TimeSpan(419040000000),
                Time = 0.38333333333333336,
                WeldingEquipmentId = Guid.Parse("a623d6e5-7a95-4c22-addb-35ec1a76e606"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("cc639c11-d59f-4361-8b56-2457cebdbf6f"),
                Condition = Condition.AtWork,
                Date = new DateTime(638193600000000000),
                StartConditionTime = new TimeSpan(419540000000),
                Time = 0.23333333333333334,
                WeldingEquipmentId = Guid.Parse("a623d6e5-7a95-4c22-addb-35ec1a76e606"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("c6f18268-b928-4172-9d27-0c66281f902f"),
                Condition = Condition.AtWork,
                Date = new DateTime(638193600000000000),
                StartConditionTime = new TimeSpan(419920000000),
                Time = 0.35,
                WeldingEquipmentId = Guid.Parse("a623d6e5-7a95-4c22-addb-35ec1a76e606"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("e62a2aba-0416-4914-b574-b083cc0fa012"),
                Condition = Condition.AtWork,
                Date = new DateTime(638193600000000000),
                StartConditionTime = new TimeSpan(420510000000),
                Time = 0.3,
                WeldingEquipmentId = Guid.Parse("a623d6e5-7a95-4c22-addb-35ec1a76e606"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("acd6556a-e58e-41aa-9b10-a95f252ba223"),
                Condition = Condition.AtWork,
                Date = new DateTime(638193600000000000),
                StartConditionTime = new TimeSpan(420820000000),
                Time = 0.15,
                WeldingEquipmentId = Guid.Parse("a623d6e5-7a95-4c22-addb-35ec1a76e606"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("888b9968-7a2a-4399-94f8-82661ec4a630"),
                Condition = Condition.AtWork,
                Date = new DateTime(638193600000000000),
                StartConditionTime = new TimeSpan(420970000000),
                Time = 0.2,
                WeldingEquipmentId = Guid.Parse("a623d6e5-7a95-4c22-addb-35ec1a76e606"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("e723e3d3-fbde-4cf9-b72c-57fb76933f64"),
                Condition = Condition.AtWork,
                Date = new DateTime(638193600000000000),
                StartConditionTime = new TimeSpan(421500000000),
                Time = 0.2833333333333333,
                WeldingEquipmentId = Guid.Parse("a623d6e5-7a95-4c22-addb-35ec1a76e606"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("e5114c62-f424-4679-b8aa-08ec95ff35e0"),
                Condition = Condition.AtWork,
                Date = new DateTime(638193600000000000),
                StartConditionTime = new TimeSpan(500190000000),
                Time = 0.25,
                WeldingEquipmentId = Guid.Parse("a623d6e5-7a95-4c22-addb-35ec1a76e606"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("7701b3dc-5ced-487a-8374-3c836ce6564d"),
                Condition = Condition.AtWork,
                Date = new DateTime(638193600000000000),
                StartConditionTime = new TimeSpan(521330000000),
                Time = 0.5666666666666667,
                WeldingEquipmentId = Guid.Parse("a623d6e5-7a95-4c22-addb-35ec1a76e606"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("78611967-4067-4dc8-ae5b-d0150186841e"),
                Condition = Condition.AtWork,
                Date = new DateTime(638193600000000000),
                StartConditionTime = new TimeSpan(522780000000),
                Time = 0.2833333333333333,
                WeldingEquipmentId = Guid.Parse("a623d6e5-7a95-4c22-addb-35ec1a76e606"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("421e1a10-d716-498f-a61c-fd03e6e9bf68"),
                Condition = Condition.AtWork,
                Date = new DateTime(638193600000000000),
                StartConditionTime = new TimeSpan(523020000000),
                Time = 0.4166666666666667,
                WeldingEquipmentId = Guid.Parse("a623d6e5-7a95-4c22-addb-35ec1a76e606"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("0b4f46be-0105-4fa0-a741-c5d4fb376512"),
                Condition = Condition.AtWork,
                Date = new DateTime(638193600000000000),
                StartConditionTime = new TimeSpan(523630000000),
                Time = 0.36666666666666664,
                WeldingEquipmentId = Guid.Parse("a623d6e5-7a95-4c22-addb-35ec1a76e606"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("bd9bb4e9-fca2-479e-8f3d-b4d4bf62457a"),
                Condition = Condition.AtWork,
                Date = new DateTime(638193600000000000),
                StartConditionTime = new TimeSpan(523980000000),
                Time = 1.1,
                WeldingEquipmentId = Guid.Parse("a623d6e5-7a95-4c22-addb-35ec1a76e606"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("abdc4626-f47b-40d5-acbe-8907a9af979f"),
                Condition = Condition.AtWork,
                Date = new DateTime(638193600000000000),
                StartConditionTime = new TimeSpan(524910000000),
                Time = 1.1,
                WeldingEquipmentId = Guid.Parse("a623d6e5-7a95-4c22-addb-35ec1a76e606"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("6947fc19-2bee-4106-8bb7-7b7d216d6a15"),
                Condition = Condition.AtWork,
                Date = new DateTime(638193600000000000),
                StartConditionTime = new TimeSpan(525670000000),
                Time = 0.7,
                WeldingEquipmentId = Guid.Parse("a623d6e5-7a95-4c22-addb-35ec1a76e606"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("fb3f3697-8f0d-4381-b17f-98ccced2f784"),
                Condition = Condition.AtWork,
                Date = new DateTime(638193600000000000),
                StartConditionTime = new TimeSpan(526520000000),
                Time = 1.0833333333333333,
                WeldingEquipmentId = Guid.Parse("a623d6e5-7a95-4c22-addb-35ec1a76e606"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("6da3262f-9eaf-44d3-a8c6-e8c3020b848d"),
                Condition = Condition.AtWork,
                Date = new DateTime(638193600000000000),
                StartConditionTime = new TimeSpan(527590000000),
                Time = 0.9,
                WeldingEquipmentId = Guid.Parse("a623d6e5-7a95-4c22-addb-35ec1a76e606"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("26ecb4e0-8e92-4147-aff4-be894d16e1ee"),
                Condition = Condition.AtWork,
                Date = new DateTime(638193600000000000),
                StartConditionTime = new TimeSpan(528880000000),
                Time = 0.7,
                WeldingEquipmentId = Guid.Parse("a623d6e5-7a95-4c22-addb-35ec1a76e606"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("fc04225d-9949-41fd-b56a-2672f9ba6fb7"),
                Condition = Condition.AtWork,
                Date = new DateTime(638193600000000000),
                StartConditionTime = new TimeSpan(530060000000),
                Time = 0.06666666666666667,
                WeldingEquipmentId = Guid.Parse("a623d6e5-7a95-4c22-addb-35ec1a76e606"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("bf66ce7f-6d17-414f-8a25-ee790d411848"),
                Condition = Condition.AtWork,
                Date = new DateTime(638193600000000000),
                StartConditionTime = new TimeSpan(531760000000),
                Time = 0.4,
                WeldingEquipmentId = Guid.Parse("a623d6e5-7a95-4c22-addb-35ec1a76e606"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("3e8c36d4-11dd-4b37-b1af-e2fb133d27f4"),
                Condition = Condition.AtWork,
                Date = new DateTime(638193600000000000),
                StartConditionTime = new TimeSpan(533230000000),
                Time = 0.7333333333333333,
                WeldingEquipmentId = Guid.Parse("a623d6e5-7a95-4c22-addb-35ec1a76e606"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("8e894ed8-30e7-474d-8261-b69b07833170"),
                Condition = Condition.AtWork,
                Date = new DateTime(638193600000000000),
                StartConditionTime = new TimeSpan(536740000000),
                Time = 1,
                WeldingEquipmentId = Guid.Parse("a623d6e5-7a95-4c22-addb-35ec1a76e606"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("097e2cc3-486e-4e31-8b8c-7d32e46a6418"),
                Condition = Condition.AtWork,
                Date = new DateTime(638193600000000000),
                StartConditionTime = new TimeSpan(540090000000),
                Time = 0.95,
                WeldingEquipmentId = Guid.Parse("a623d6e5-7a95-4c22-addb-35ec1a76e606"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("d57ee542-f59d-489b-85f0-04b9a364f2f7"),
                Condition = Condition.AtWork,
                Date = new DateTime(638193600000000000),
                StartConditionTime = new TimeSpan(540810000000),
                Time = 0.2833333333333333,
                WeldingEquipmentId = Guid.Parse("a623d6e5-7a95-4c22-addb-35ec1a76e606"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("e0a664a5-90fd-46a9-8a87-57623031b6e7"),
                Condition = Condition.AtWork,
                Date = new DateTime(638193600000000000),
                StartConditionTime = new TimeSpan(542360000000),
                Time = 0.6666666666666666,
                WeldingEquipmentId = Guid.Parse("a623d6e5-7a95-4c22-addb-35ec1a76e606"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("84d430a5-fbd2-4d40-b224-d48ad6f12d88"),
                Condition = Condition.AtWork,
                Date = new DateTime(638193600000000000),
                StartConditionTime = new TimeSpan(543080000000),
                Time = 1.0666666666666667,
                WeldingEquipmentId = Guid.Parse("a623d6e5-7a95-4c22-addb-35ec1a76e606"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("bead40b1-04c2-4113-9f9b-5af3a3ac8c83"),
                Condition = Condition.AtWork,
                Date = new DateTime(638193600000000000),
                StartConditionTime = new TimeSpan(543900000000),
                Time = 0.35,
                WeldingEquipmentId = Guid.Parse("a623d6e5-7a95-4c22-addb-35ec1a76e606"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("c858ef1c-b897-4dac-86b8-ff14d5173b9d"),
                Condition = Condition.AtWork,
                Date = new DateTime(638193600000000000),
                StartConditionTime = new TimeSpan(544230000000),
                Time = 0.21666666666666667,
                WeldingEquipmentId = Guid.Parse("a623d6e5-7a95-4c22-addb-35ec1a76e606"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("0f90272f-cdb5-4e67-8717-7eb6bd41121e"),
                Condition = Condition.AtWork,
                Date = new DateTime(638193600000000000),
                StartConditionTime = new TimeSpan(544680000000),
                Time = 1.0333333333333334,
                WeldingEquipmentId = Guid.Parse("a623d6e5-7a95-4c22-addb-35ec1a76e606"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("ee5083ac-4e29-411b-8e84-aa048fc6533f"),
                Condition = Condition.AtWork,
                Date = new DateTime(638193600000000000),
                StartConditionTime = new TimeSpan(545390000000),
                Time = 0.8166666666666667,
                WeldingEquipmentId = Guid.Parse("a623d6e5-7a95-4c22-addb-35ec1a76e606"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("cae394d5-10a2-4511-a88a-465de1203e6e"),
                Condition = Condition.AtWork,
                Date = new DateTime(638193600000000000),
                StartConditionTime = new TimeSpan(545970000000),
                Time = 0.36666666666666664,
                WeldingEquipmentId = Guid.Parse("a623d6e5-7a95-4c22-addb-35ec1a76e606"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("dd1349b6-7ea8-4828-bcfa-bc4f185587fe"),
                Condition = Condition.AtWork,
                Date = new DateTime(638193600000000000),
                StartConditionTime = new TimeSpan(547700000000),
                Time = 0.23333333333333334,
                WeldingEquipmentId = Guid.Parse("a623d6e5-7a95-4c22-addb-35ec1a76e606"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("98186197-7225-4047-ba5f-64ff26b66bda"),
                Condition = Condition.AtWork,
                Date = new DateTime(638193600000000000),
                StartConditionTime = new TimeSpan(547920000000),
                Time = 0.16666666666666666,
                WeldingEquipmentId = Guid.Parse("a623d6e5-7a95-4c22-addb-35ec1a76e606"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("09a893cd-5029-4503-bc5c-7cb247a33a59"),
                Condition = Condition.AtWork,
                Date = new DateTime(638193600000000000),
                StartConditionTime = new TimeSpan(549470000000),
                Time = 1.1833333333333333,
                WeldingEquipmentId = Guid.Parse("a623d6e5-7a95-4c22-addb-35ec1a76e606"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("e0dc618a-6392-4146-99d3-2be104ac86a5"),
                Condition = Condition.AtWork,
                Date = new DateTime(638193600000000000),
                StartConditionTime = new TimeSpan(550350000000),
                Time = 0.75,
                WeldingEquipmentId = Guid.Parse("a623d6e5-7a95-4c22-addb-35ec1a76e606"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("943a0cd9-14a9-4160-a170-c7395458f07f"),
                Condition = Condition.AtWork,
                Date = new DateTime(638193600000000000),
                StartConditionTime = new TimeSpan(551700000000),
                Time = 0.8833333333333333,
                WeldingEquipmentId = Guid.Parse("a623d6e5-7a95-4c22-addb-35ec1a76e606"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("e8819f2c-e074-4988-b2d6-8fa5fffbef0b"),
                Condition = Condition.AtWork,
                Date = new DateTime(638193600000000000),
                StartConditionTime = new TimeSpan(555750000000),
                Time = 0.6,
                WeldingEquipmentId = Guid.Parse("a623d6e5-7a95-4c22-addb-35ec1a76e606"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("34abc51e-d0f2-42e2-9c28-2833a5cfb493"),
                Condition = Condition.AtWork,
                Date = new DateTime(638193600000000000),
                StartConditionTime = new TimeSpan(557000000000),
                Time = 0.5,
                WeldingEquipmentId = Guid.Parse("a623d6e5-7a95-4c22-addb-35ec1a76e606"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("e9e37a0d-d3c0-4c7d-9205-81234e7ee3b1"),
                Condition = Condition.AtWork,
                Date = new DateTime(638193600000000000),
                StartConditionTime = new TimeSpan(563940000000),
                Time = 0.8166666666666667,
                WeldingEquipmentId = Guid.Parse("a623d6e5-7a95-4c22-addb-35ec1a76e606"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("38db14ac-943e-41e3-918a-1fe04554ee30"),
                Condition = Condition.AtWork,
                Date = new DateTime(638193600000000000),
                StartConditionTime = new TimeSpan(568490000000),
                Time = 0.43333333333333335,
                WeldingEquipmentId = Guid.Parse("a623d6e5-7a95-4c22-addb-35ec1a76e606"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("a14c4e9a-7d30-4270-8454-c0030fba7b15"),
                Condition = Condition.AtWork,
                Date = new DateTime(638193600000000000),
                StartConditionTime = new TimeSpan(568830000000),
                Time = 0.4666666666666667,
                WeldingEquipmentId = Guid.Parse("a623d6e5-7a95-4c22-addb-35ec1a76e606"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("dc19edbe-d928-4120-a464-2a9de9aa1282"),
                Condition = Condition.AtWork,
                Date = new DateTime(638193600000000000),
                StartConditionTime = new TimeSpan(569180000000),
                Time = 0.2833333333333333,
                WeldingEquipmentId = Guid.Parse("a623d6e5-7a95-4c22-addb-35ec1a76e606"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("dd6ef9d1-b127-4c6a-bcf7-fee2c95d226e"),
                Condition = Condition.AtWork,
                Date = new DateTime(638193600000000000),
                StartConditionTime = new TimeSpan(569490000000),
                Time = 0.48333333333333334,
                WeldingEquipmentId = Guid.Parse("a623d6e5-7a95-4c22-addb-35ec1a76e606"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("156a2408-ba28-4050-8497-5860933b35d6"),
                Condition = Condition.AtWork,
                Date = new DateTime(638193600000000000),
                StartConditionTime = new TimeSpan(569860000000),
                Time = 0.4666666666666667,
                WeldingEquipmentId = Guid.Parse("a623d6e5-7a95-4c22-addb-35ec1a76e606"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("7b719111-091b-45ec-9d2d-9d489d439d47"),
                Condition = Condition.AtWork,
                Date = new DateTime(638193600000000000),
                StartConditionTime = new TimeSpan(570220000000),
                Time = 0.3,
                WeldingEquipmentId = Guid.Parse("a623d6e5-7a95-4c22-addb-35ec1a76e606"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("ac1f22e2-9143-45bc-a58f-8df2d6775d35"),
                Condition = Condition.On,
                Date = new DateTime(638194464000000000),
                StartConditionTime = new TimeSpan(287000000000),
                Time = 2,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("9fae0f96-599a-428e-8945-0ce8809f7d11"),
                Condition = Condition.AtWork,
                Date = new DateTime(638194464000000000),
                StartConditionTime = new TimeSpan(329260000000),
                Time = 0.2833333333333333,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("7309eb1a-b102-4496-ad79-7a8f2cb0c004"),
                Condition = Condition.AtWork,
                Date = new DateTime(638194464000000000),
                StartConditionTime = new TimeSpan(329500000000),
                Time = 0.25,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("411fcf16-b7fa-4f2c-bf6d-cb9fb384be7d"),
                Condition = Condition.AtWork,
                Date = new DateTime(638194464000000000),
                StartConditionTime = new TimeSpan(329730000000),
                Time = 0.25,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("cd2143e0-1da8-4d38-ae88-e4989b1d4fc1"),
                Condition = Condition.AtWork,
                Date = new DateTime(638194464000000000),
                StartConditionTime = new TimeSpan(330090000000),
                Time = 0.2833333333333333,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("c0cdb369-b707-41c2-85fd-d4c2777367ba"),
                Condition = Condition.AtWork,
                Date = new DateTime(638194464000000000),
                StartConditionTime = new TimeSpan(330530000000),
                Time = 0.3,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("a607b461-6e00-482e-b89d-685e73462324"),
                Condition = Condition.AtWork,
                Date = new DateTime(638194464000000000),
                StartConditionTime = new TimeSpan(330920000000),
                Time = 0.31666666666666665,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("8206649f-e383-4580-8aaa-9651dbba71a9"),
                Condition = Condition.AtWork,
                Date = new DateTime(638194464000000000),
                StartConditionTime = new TimeSpan(393940000000),
                Time = 0.65,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("0df911fd-270b-4d41-ba03-c759a60e2c0b"),
                Condition = Condition.AtWork,
                Date = new DateTime(638194464000000000),
                StartConditionTime = new TimeSpan(395160000000),
                Time = 0.35,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("c4525660-6d06-4e1d-aee0-36757d5caca7"),
                Condition = Condition.AtWork,
                Date = new DateTime(638194464000000000),
                StartConditionTime = new TimeSpan(395900000000),
                Time = 0.55,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("c9ca3753-9b1b-4571-9f60-2fe2d26f075e"),
                Condition = Condition.AtWork,
                Date = new DateTime(638194464000000000),
                StartConditionTime = new TimeSpan(396310000000),
                Time = 0.2833333333333333,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("19cf54ba-45a8-4be9-a526-3272b1620489"),
                Condition = Condition.AtWork,
                Date = new DateTime(638194464000000000),
                StartConditionTime = new TimeSpan(396550000000),
                Time = 0.4,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("f8f5dd19-34fb-49ac-a30d-a887bfe8de19"),
                Condition = Condition.AtWork,
                Date = new DateTime(638194464000000000),
                StartConditionTime = new TimeSpan(396870000000),
                Time = 0.21666666666666667,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("ca5198c0-c56d-450e-ad18-1a00747f47fb"),
                Condition = Condition.AtWork,
                Date = new DateTime(638194464000000000),
                StartConditionTime = new TimeSpan(397240000000),
                Time = 0.36666666666666664,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("19c1274e-aa3d-409d-a4de-483f0f97ad33"),
                Condition = Condition.AtWork,
                Date = new DateTime(638194464000000000),
                StartConditionTime = new TimeSpan(397680000000),
                Time = 0.2,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("494e2ed3-0531-44f2-beb5-6ab64543bb8b"),
                Condition = Condition.AtWork,
                Date = new DateTime(638194464000000000),
                StartConditionTime = new TimeSpan(398240000000),
                Time = 1.1666666666666667,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("18c00eed-1c75-46a3-a3a4-7b23798bb80a"),
                Condition = Condition.AtWork,
                Date = new DateTime(638194464000000000),
                StartConditionTime = new TimeSpan(399040000000),
                Time = 0.25,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("7364d943-4e37-4ab2-a3f7-00b5704f2b46"),
                Condition = Condition.AtWork,
                Date = new DateTime(638194464000000000),
                StartConditionTime = new TimeSpan(399260000000),
                Time = 0.15,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("a8af6b7b-f836-4034-9d1a-cc2435740711"),
                Condition = Condition.AtWork,
                Date = new DateTime(638194464000000000),
                StartConditionTime = new TimeSpan(399420000000),
                Time = 0.23333333333333334,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("597f2906-768c-4bb8-858c-a8cb46449850"),
                Condition = Condition.AtWork,
                Date = new DateTime(638194464000000000),
                StartConditionTime = new TimeSpan(399680000000),
                Time = 0.7666666666666667,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("91e9d615-84f6-47f5-9b2b-8240e01cee82"),
                Condition = Condition.AtWork,
                Date = new DateTime(638194464000000000),
                StartConditionTime = new TimeSpan(400310000000),
                Time = 0.43333333333333335,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("43e51b8e-1f22-4d13-b209-04d4ec4d1652"),
                Condition = Condition.AtWork,
                Date = new DateTime(638194464000000000),
                StartConditionTime = new TimeSpan(400650000000),
                Time = 0.3333333333333333,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("38af73e5-6a38-4031-a5fe-7f95287e34fb"),
                Condition = Condition.AtWork,
                Date = new DateTime(638194464000000000),
                StartConditionTime = new TimeSpan(400920000000),
                Time = 0.43333333333333335,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("4fe2e12a-b77d-4d08-b8d1-205969cfd19c"),
                Condition = Condition.AtWork,
                Date = new DateTime(638194464000000000),
                StartConditionTime = new TimeSpan(401250000000),
                Time = 0.2,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("6d950862-68a2-4092-a4ba-e5badf168f21"),
                Condition = Condition.AtWork,
                Date = new DateTime(638194464000000000),
                StartConditionTime = new TimeSpan(401520000000),
                Time = 0.4166666666666667,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("66122e9e-fe65-4c75-ba1a-d6ad96087055"),
                Condition = Condition.AtWork,
                Date = new DateTime(638194464000000000),
                StartConditionTime = new TimeSpan(401850000000),
                Time = 0.16666666666666666,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("71e4a70c-f16f-4f44-b1fd-8ddaa3b3bb85"),
                Condition = Condition.AtWork,
                Date = new DateTime(638194464000000000),
                StartConditionTime = new TimeSpan(402140000000),
                Time = 0.15,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("2d5fad20-bcd5-4429-81e0-99eee5934bd9"),
                Condition = Condition.AtWork,
                Date = new DateTime(638194464000000000),
                StartConditionTime = new TimeSpan(402570000000),
                Time = 0.36666666666666664,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("25581045-f5c5-4abd-a770-e4e70a79cadb"),
                Condition = Condition.AtWork,
                Date = new DateTime(638194464000000000),
                StartConditionTime = new TimeSpan(404060000000),
                Time = 0.36666666666666664,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("1fdb12ad-7ea4-406d-8fc9-e0aeb200bd67"),
                Condition = Condition.AtWork,
                Date = new DateTime(638194464000000000),
                StartConditionTime = new TimeSpan(405460000000),
                Time = 0.48333333333333334,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("3582a9d0-6db7-4a4a-ad78-1666a24bdc9b"),
                Condition = Condition.AtWork,
                Date = new DateTime(638194464000000000),
                StartConditionTime = new TimeSpan(406830000000),
                Time = 0.85,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("4783c69a-2ec8-4e1d-9e01-cf6c728f9a93"),
                Condition = Condition.AtWork,
                Date = new DateTime(638194464000000000),
                StartConditionTime = new TimeSpan(412270000000),
                Time = 0.2,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("1edea12b-e964-46e0-a0f7-3c5a6e3f09c9"),
                Condition = Condition.AtWork,
                Date = new DateTime(638194464000000000),
                StartConditionTime = new TimeSpan(412470000000),
                Time = 0.7166666666666667,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("b5643bc8-c5f7-41fd-8f8c-46bc4996ada7"),
                Condition = Condition.AtWork,
                Date = new DateTime(638194464000000000),
                StartConditionTime = new TimeSpan(413420000000),
                Time = 0.2833333333333333,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("7082cb3f-50e9-4a79-bee6-e19a5e4ba6e0"),
                Condition = Condition.AtWork,
                Date = new DateTime(638194464000000000),
                StartConditionTime = new TimeSpan(413670000000),
                Time = 0.21666666666666667,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("4da58b15-dbb4-4dad-9930-071e6260a4a4"),
                Condition = Condition.AtWork,
                Date = new DateTime(638194464000000000),
                StartConditionTime = new TimeSpan(414100000000),
                Time = 0.23333333333333334,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("e2164405-6407-4c73-9b57-baeabf0dd452"),
                Condition = Condition.AtWork,
                Date = new DateTime(638194464000000000),
                StartConditionTime = new TimeSpan(414310000000),
                Time = 0.26666666666666666,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("ea84d05d-a8f7-42c6-8b96-8dae91050eb0"),
                Condition = Condition.AtWork,
                Date = new DateTime(638194464000000000),
                StartConditionTime = new TimeSpan(414540000000),
                Time = 0.21666666666666667,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("8fddb018-62d4-46e5-9e2e-7abf869ffcc3"),
                Condition = Condition.AtWork,
                Date = new DateTime(638194464000000000),
                StartConditionTime = new TimeSpan(414880000000),
                Time = 0.25,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("da9adcbb-a92b-4c64-b32c-7e8a099c1713"),
                Condition = Condition.AtWork,
                Date = new DateTime(638194464000000000),
                StartConditionTime = new TimeSpan(415110000000),
                Time = 0.25,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("295cee32-a69c-4957-a686-7cc0a7981e28"),
                Condition = Condition.AtWork,
                Date = new DateTime(638194464000000000),
                StartConditionTime = new TimeSpan(415440000000),
                Time = 0.26666666666666666,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("8ffdf3ac-05cd-4fee-a355-09312489f3ad"),
                Condition = Condition.AtWork,
                Date = new DateTime(638194464000000000),
                StartConditionTime = new TimeSpan(415670000000),
                Time = 0.23333333333333334,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("d7883ca5-dbe0-4751-9d4f-e8e8fadbc6f8"),
                Condition = Condition.AtWork,
                Date = new DateTime(638194464000000000),
                StartConditionTime = new TimeSpan(415890000000),
                Time = 0.2,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("5910f8e9-b2ea-44e1-8e48-a108174b8148"),
                Condition = Condition.AtWork,
                Date = new DateTime(638194464000000000),
                StartConditionTime = new TimeSpan(420980000000),
                Time = 1.0166666666666666,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("66fe6a9b-3a21-42e7-942d-5527f8126225"),
                Condition = Condition.AtWork,
                Date = new DateTime(638194464000000000),
                StartConditionTime = new TimeSpan(464580000000),
                Time = 0.75,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("426c4395-6e1e-4653-aa4d-56867c620916"),
                Condition = Condition.AtWork,
                Date = new DateTime(638194464000000000),
                StartConditionTime = new TimeSpan(465120000000),
                Time = 0.7333333333333333,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("b58d362c-4a85-49ad-94bf-cf4993ccbb4a"),
                Condition = Condition.AtWork,
                Date = new DateTime(638194464000000000),
                StartConditionTime = new TimeSpan(465640000000),
                Time = 0.35,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("e8d0e34b-5def-439c-9ef5-54ef461c4e47"),
                Condition = Condition.AtWork,
                Date = new DateTime(638194464000000000),
                StartConditionTime = new TimeSpan(467200000000),
                Time = 0.8833333333333333,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("70a5f823-8017-4145-8850-52f8f92d9e4d"),
                Condition = Condition.AtWork,
                Date = new DateTime(638194464000000000),
                StartConditionTime = new TimeSpan(467830000000),
                Time = 0.6833333333333333,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("58bfa5c3-5eb0-43d9-af8b-209fef8b1c5b"),
                Condition = Condition.AtWork,
                Date = new DateTime(638194464000000000),
                StartConditionTime = new TimeSpan(468320000000),
                Time = 1.1333333333333333,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("e77cd464-94bb-43f5-936e-c7340119af16"),
                Condition = Condition.AtWork,
                Date = new DateTime(638194464000000000),
                StartConditionTime = new TimeSpan(469230000000),
                Time = 0.2833333333333333,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("2935d5c9-9f1e-44b5-b3c0-425adf577bcd"),
                Condition = Condition.AtWork,
                Date = new DateTime(638194464000000000),
                StartConditionTime = new TimeSpan(469480000000),
                Time = 0.7333333333333333,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("13036e91-d012-4d2b-92e1-1e3e9d16b939"),
                Condition = Condition.AtWork,
                Date = new DateTime(638194464000000000),
                StartConditionTime = new TimeSpan(470000000000),
                Time = 0.4666666666666667,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("0bb1fe1f-230f-47e2-85ae-72298369a109"),
                Condition = Condition.AtWork,
                Date = new DateTime(638194464000000000),
                StartConditionTime = new TimeSpan(470350000000),
                Time = 0.4166666666666667,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("d2caee91-5293-4db1-b294-54c54e8b0f3a"),
                Condition = Condition.AtWork,
                Date = new DateTime(638194464000000000),
                StartConditionTime = new TimeSpan(470680000000),
                Time = 1.0333333333333334,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("c2a8b08e-e002-4215-8eb1-bb8e2c3db68a"),
                Condition = Condition.AtWork,
                Date = new DateTime(638194464000000000),
                StartConditionTime = new TimeSpan(475650000000),
                Time = 0.8,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("fee3fde5-4062-4747-951b-1a44788b0bb7"),
                Condition = Condition.AtWork,
                Date = new DateTime(638194464000000000),
                StartConditionTime = new TimeSpan(476940000000),
                Time = 1,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("f28d0877-fa65-4810-93ef-1530447170ef"),
                Condition = Condition.AtWork,
                Date = new DateTime(638194464000000000),
                StartConditionTime = new TimeSpan(477640000000),
                Time = 0.18333333333333332,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("dc8b57c8-fe6c-447d-b42a-d35ad27d3db0"),
                Condition = Condition.AtWork,
                Date = new DateTime(638194464000000000),
                StartConditionTime = new TimeSpan(477890000000),
                Time = 0.3333333333333333,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("b260f5be-35e5-49b4-9ea7-ccad1139e9cd"),
                Condition = Condition.AtWork,
                Date = new DateTime(638194464000000000),
                StartConditionTime = new TimeSpan(479360000000),
                Time = 1.1833333333333333,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("3c88e2e0-7702-42c1-ae7d-fd2c5eca5eb7"),
                Condition = Condition.AtWork,
                Date = new DateTime(638194464000000000),
                StartConditionTime = new TimeSpan(480340000000),
                Time = 0.31666666666666665,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("10acfc2b-3c9f-4c7a-8166-98650916e997"),
                Condition = Condition.AtWork,
                Date = new DateTime(638194464000000000),
                StartConditionTime = new TimeSpan(482160000000),
                Time = 0.2833333333333333,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("324f92d6-a88f-4837-97ff-ce593a995603"),
                Condition = Condition.AtWork,
                Date = new DateTime(638194464000000000),
                StartConditionTime = new TimeSpan(482630000000),
                Time = 0.9833333333333333,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("df06dda1-bfa9-4cbe-a280-93c61d2bf7d2"),
                Condition = Condition.AtWork,
                Date = new DateTime(638194464000000000),
                StartConditionTime = new TimeSpan(483320000000),
                Time = 0.5,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("735cbf21-c81b-4fdb-ac2d-1bd45bf288e6"),
                Condition = Condition.AtWork,
                Date = new DateTime(638194464000000000),
                StartConditionTime = new TimeSpan(484980000000),
                Time = 0.18333333333333332,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("dc9b71e0-0764-4ace-9b7d-e1b50259669f"),
                Condition = Condition.AtWork,
                Date = new DateTime(638194464000000000),
                StartConditionTime = new TimeSpan(485160000000),
                Time = 0.4666666666666667,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
            new WeldingEquipmentConditionTime
            {
                Id = Guid.Parse("a340db69-4400-4b4a-b4c3-a8fbae6632c1"),
                Condition = Condition.AtWork,
                Date = new DateTime(638194464000000000),
                StartConditionTime = new TimeSpan(485520000000),
                Time = 0.43333333333333335,
                WeldingEquipmentId = Guid.Parse("5f8a0d82-9648-4b94-9b9b-60888960210c"),
                WelderId = Guid.Parse("398d8d0a-9d53-4632-8559-245816abd384"),
            },
        };

        return conditionTimes;
    }
}