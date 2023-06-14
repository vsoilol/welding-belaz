﻿using Belaz.WeldingApp.Common.Enums;
using Belaz.WeldingApp.Common.Entities.IdentityUser;
using Belaz.WeldingApp.Common.Entities.ProductInfo;
using Belaz.WeldingApp.Common.Entities.Production;
using Belaz.WeldingApp.Common.Entities.TaskInfo;
using Belaz.WeldingApp.Common.Entities.TechnologicalProcessInfo;
using Belaz.WeldingApp.Common.Entities.Users;
using Belaz.WeldingApp.Common.Entities.WeldingEquipmentInfo;
using Microsoft.EntityFrameworkCore;

namespace Belaz.WeldingApp.WeldingApi.DataLayer.Helpers;

public class DataSeed
{
    public static async Task SeedSampleDataAsync(ApplicationContext context)
    {
        var admin = UserGenerator.GenerateAdmin();
        if (!(await context.Users.AnyAsync(_ => _.UserName == admin.UserName)))
        {
            context.Users.Add(admin);
            await context.SaveChangesAsync();
        }

        if (!context.DowntimeReasons.Any())
        {
            await AddDowntimeReasons(context);
        }

        if (!context.Workshops.Any())
        {
            var workshops = WorkshopGenerator.GenerateWorkshops();
            context.Workshops.AddRange(workshops);
            await context.SaveChangesAsync();
        }

        if (!context.WeldingEquipments.Any())
        {
            var workplace = await context.Workplaces.ToListAsync();
            var weldingEquipments = WeldingEquipmentGenerator.GenerateWeldingEquipments(workplace);
            context.WeldingEquipments.AddRange(weldingEquipments);
            await context.SaveChangesAsync();
        }

        if (!context.Calendars.Any())
        {
            var calendar = CalendarGenerator.GenerateCalendar();
            context.Calendars.Add(calendar);
            await context.SaveChangesAsync();
        }

        if (!context.Inspectors.Any())
        {
            var inspectors = InspectorGenerator.GenerateInspectors();
            context.Inspectors.AddRange(inspectors);
            await context.SaveChangesAsync();
        }

        if (!context.Masters.Any())
        {
            var weldingEquipments06 = await context.WeldingEquipments
                .Where(
                    _ => _.Workplaces.Any(workplace => workplace.ProductionArea!.IdFromSystem == "06")
                )
                .ToListAsync();

            var masters = MasterGenerator.GenerateMasters(weldingEquipments06);
            context.Masters.AddRange(masters);
            await context.SaveChangesAsync();
        }

        if (!context.Welders.Any())
        {
            var weldingEquipments = await context.WeldingEquipments.ToListAsync();

            var welders = WelderGenerator.GenerateWelders(weldingEquipments);
            context.Welders.AddRange(welders);
            await context.SaveChangesAsync();
        }

        if (!context.TechnologicalProcesses.Any())
        {
            var technologicalProcesses = TechnologicalProcessGenerator.GenerateTechnologicalProcesses();
            context.TechnologicalProcesses.AddRange(technologicalProcesses);
            await context.SaveChangesAsync();
        }

        if (!context.TechnologicalInstructions.Any())
        {
            var technologicalInstructions = TechnologicalInstructionGenerator.GenerateTechnologicalInstructions();
            context.TechnologicalInstructions.AddRange(technologicalInstructions);
            await context.SaveChangesAsync();
        }

        if (!context.Products.Any())
        {
            var products = ProductGenerator.GenerateProducts();
            context.Products.AddRange(products);
            await context.SaveChangesAsync();

            var productInside = ProductGenerator.GenerateProductInside();
            context.ProductInsides.AddRange(productInside);
            await context.SaveChangesAsync();
        }

        if (!context.Seams.Any())
        {
            var seams = SeamGenerator.GenerateSeams();
            context.Seams.AddRange(seams);
            await context.SaveChangesAsync();
        }

        if (!context.ProductAccounts.Any())
        {
            var productAccounts =
                await AddWeldingEquipmentToProductAccounts(context, ProductAccountGenerator.GenerateProductAccounts());
            context.ProductAccounts.AddRange(productAccounts);
            await context.SaveChangesAsync();

            var productResults = ProductAccountGenerator.GenerateProductResults();
            context.ProductResults.AddRange(productResults);
            await context.SaveChangesAsync();

            var seamAccount = SeamAccountGenerator.GenerateSeamAccounts();
            context.SeamAccounts.AddRange(seamAccount);
            await context.SaveChangesAsync();

            var seamResults = SeamAccountGenerator.GenerateSeamResults();
            context.SeamResults.AddRange(seamResults);
            await context.SaveChangesAsync();
        }

        if (!context.WeldingEquipmentConditionTimes.Any())
        {
            var conditionTimes = WeldingEquipmentConditionTimeGenerator.GenerateWeldingEquipmentConditionTimes();
            context.WeldingEquipmentConditionTimes.AddRange(conditionTimes);
            await context.SaveChangesAsync();
        }

        if (!context.Workshops.Any())
        {
            var workshops = WorkshopGenerator.GenerateWorkshops();
            context.Workshops.AddRange(workshops);
            await context.SaveChangesAsync();
        }

        if (!context.WeldingRecordLimits.Any())
        {
            var weldingRecordLimit = new WeldingRecordLimit
            {
                WeldingCurrentMin = 100,
                WeldingCurrentMax = 200,
                ArcVoltageMin = 20,
                ArcVoltageMax = 40
            };

            context.WeldingRecordLimits.Add(weldingRecordLimit);
            await context.SaveChangesAsync();
        }

        if (!context.WeldingRecords.Any())
        {
            var weldingRecordLimit = (await context.WeldingRecordLimits.FirstOrDefaultAsync())!;
            var weldingRecords = WeldingRecordGenerator.GenerateWeldingRecords();
            weldingRecords.ForEach(_ => { _.WeldingRecordLimitId = weldingRecordLimit.Id; });
            context.WeldingRecords.AddRange(weldingRecords);
            await context.SaveChangesAsync();
        }

        if (!context.WeldingTasks.Any())
        {
            var weldingTasks = WeldingTaskGenerator.GenerateWeldingTasks();
            context.WeldingTasks.AddRange(weldingTasks);
            await context.SaveChangesAsync();
        }

        if (!context.WeldPassages.Any())
        {
            var weldPassages = WeldPassageGenerator.GenerateWeldPassages();
            context.WeldPassages.AddRange(weldPassages);
            await context.SaveChangesAsync();
        }
    }

    private static async Task<List<ProductAccount>> AddWeldingEquipmentToProductAccounts(ApplicationContext context,
        List<ProductAccount> productAccounts)
    {
        foreach (var productAccount in productAccounts)
        {
            var weldingEquipmentIds = productAccount.WeldingEquipments.Select(_ => _.Id);
            var weldingEquipments = await context.WeldingEquipments
                .Where(equipment => weldingEquipmentIds.Any(id => id == equipment.Id))
                .ToListAsync();

            productAccount.WeldingEquipments = weldingEquipments;
        }

        return productAccounts;
    }

    private static async Task GenerateTaskByProductAccounts(ApplicationContext context)
    {
        var date = DateTime.Now;

        var master = (
            await context.Masters.FirstOrDefaultAsync(_ => _.UserInfo.ServiceNumber == "10422")
        )!;

        var seamAccounts = await context.SeamAccounts
            .Include(_ => _.SeamResults)
            .Include(_ => _.ProductAccount)
            .Include(_ => _.Seam.Inspector)
            .Where(
                _ =>
                    _.DateFromPlan.Date.Equals(date.Date)
                    && _.Seam.Product.ProductionArea.Number == 6
                    && _.ProductAccount.AmountFromPlan > 0
            )
            .ToListAsync();

        var weldingTasks = new List<WeldingTask>();

        foreach (var seamAccount in seamAccounts)
        {
            weldingTasks.Add(
                new WeldingTask
                {
                    WeldingDate = date,
                    Master = master,
                    Inspector = seamAccount.Seam.Inspector,
                    SeamAccount = seamAccount
                }
            );
        }

        context.WeldingTasks.AddRange(weldingTasks);
        await context.SaveChangesAsync();
    }

    private static async Task AddProductAccounts(ApplicationContext context)
    {
        var products = await context.ProductionAreas
            .Where(_ => _.Number == 6)
            .SelectMany(_ => _.Products)
            .Include(_ => _.Seams)
            .ToListAsync();

        var weldingEquipment = (
            await context.WeldingEquipments
                .Where(_ => _.IdFromSystem == "49283")
                .FirstOrDefaultAsync()
        )!;

        var productAccounts = new List<ProductAccount>();
        for (int i = 0; i < products.Count; i++)
        {
            var product = products[i];
            var productResultStatus = new List<ProductResult>
            {
                new() { Amount = 0, Status = ResultProductStatus.Manufactured },
                new() { Amount = 0, Status = ResultProductStatus.Accept },
                new() { Amount = 0, Status = ResultProductStatus.Defective }
            };

            var seamAccounts = new List<SeamAccount>();

            foreach (var seam in product.Seams)
            {
                var seamResultStatus = new List<SeamResult>
                {
                    new() { Amount = 0, Status = ResultProductStatus.Manufactured },
                    new() { Amount = 0, Status = ResultProductStatus.Accept },
                    new() { Amount = 0, Status = ResultProductStatus.Defective }
                };

                var seamAccount = new SeamAccount
                {
                    DateFromPlan = DateTime.Now,
                    Seam = seam,
                    SeamResults = seamResultStatus
                };
                seamAccounts.Add(seamAccount);
            }

            var productAccount = new ProductAccount
            {
                Number = i + 1,
                AmountFromPlan = 10,
                DateFromPlan = DateTime.Now,
                Product = product,
                ProductResults = productResultStatus,
                SeamAccounts = seamAccounts,
                WeldingEquipments = new List<WeldingEquipment> { weldingEquipment }
            };
            productAccounts.Add(productAccount);
        }

        context.ProductAccounts.AddRange(productAccounts);
        await context.SaveChangesAsync();
    }

    private static async Task AddDowntimeReasons(ApplicationContext context)
    {
        var downtimeReasons = new List<DowntimeReason>
        {
            new DowntimeReason { Reason = "Нерабочее время по графику согласно сменности" },
            new DowntimeReason { Reason = "Праздники и выходные" },
            new DowntimeReason { Reason = "Обед" },
            new DowntimeReason { Reason = "Плановый ремонт централизованными службами" },
            new DowntimeReason { Reason = "Аварийный ремонт централизованными службами" },
            new DowntimeReason { Reason = "Отсутствие заданий" },
            new DowntimeReason { Reason = "Отсутствие материала, заготовок, деталей" },
            new DowntimeReason
            {
                Reason = "Отсутствие инструмента, оснастки вспомогательного оборудования"
            },
            new DowntimeReason { Reason = "Отсутствие крана, транспорта" },
            new DowntimeReason { Reason = "Отсутствие оператора в связи с необеспеченностью" },
            new DowntimeReason { Reason = "Неявка оператора (б/лист, отпуск, и пр.)" },
            new DowntimeReason { Reason = "Отсутствие энергоносителей" },
            new DowntimeReason { Reason = "Отсутствие сотрудника ОТК" },
            new DowntimeReason
            {
                Reason = "Отсутствие конструктора, технолога или ожидание его решения"
            },
            new DowntimeReason { Reason = "Естественные надобности" },
            new DowntimeReason { Reason = "Ознакомление с работой, документацией, инструктаж" },
            new DowntimeReason
            {
                Reason =
                    "Переналадка оборудования, получение инструмента до начала работы, снятие/сдача по окончании работы"
            },
            new DowntimeReason { Reason = "Работа с управляющей программой" },
            new DowntimeReason { Reason = "Установка, выверка, снятие детали" },
            new DowntimeReason { Reason = "Установка, выверка, снятие детали" },
            new DowntimeReason { Reason = "Изменение режимов, смена инструмента, приспособления" },
            new DowntimeReason { Reason = "Контроль на рабочем месте" },
            new DowntimeReason
            {
                Reason = "Уборка, осмотр оборудования, чистка/смазка оборудования"
            },
            new DowntimeReason { Reason = "Сборочные операции" },
            new DowntimeReason { Reason = "Работа по карте несоответствий" }
        };

        await context.DowntimeReasons.AddRangeAsync(downtimeReasons);
        await context.SaveChangesAsync();
    }

    private static async Task AddWeldingTasks(ApplicationContext context)
    {
        var productionArea6 = await context.ProductionAreas.FirstOrDefaultAsync(
            _ => _.IdFromSystem == "06"
        );

        var welder = (await context.Welders.FirstOrDefaultAsync(_ => _.IdFromSystem == "121267"))!;

        var master = (await context.Masters.FirstOrDefaultAsync(_ => _.IdFromSystem == "610422"))!;

        var inspector = (
            await context.Inspectors.FirstOrDefaultAsync(_ => _.IdFromSystem == "249550")
        )!;

        var seam1 = (
            await context.Seams
                .Include(_ => _.Product.Master)
                .Include(_ => _.SeamAccounts)
                .FirstOrDefaultAsync(
                    _ => _.Number == 48 && _.Product.ProductType == ProductType.Detail
                )
        )!;

        var seam2 = (
            await context.Seams
                .Include(_ => _.Product.Master)
                .Include(_ => _.SeamAccounts)
                .FirstOrDefaultAsync(
                    _ => _.Number == 18 && _.Product.ProductType == ProductType.Knot
                )
        )!;

        seam1.Product.Master = master;
        seam2.Product.Master = master;

        await context.SaveChangesAsync();

        var voltageValues1 = new[]
        {
            23.2,
            25.3,
            26.8,
            23.8,
            27.0,
            24.9,
            25.3,
            25.0,
            24.6,
            24.9,
            23.8,
            25.0,
            25.0,
            22.4,
            21.2,
            21.4,
            21.0,
            20.9,
            20.7,
            21.5,
            20.6,
            20.39,
            20.3,
            22.1,
            21.2,
            19.7,
            22.1,
            21.4,
            21.5,
            20.7,
            18.89,
            21.0,
            20.8,
            19.7,
            21.6,
            19.6,
            22.1,
            20.0,
            18.0,
            21.6,
            19.2,
            19.0,
            20.0,
            20.2,
            17.6,
            19.0,
            20.1,
            18.7,
            18.2,
            20.2,
            18.3,
            19.6,
            17.7,
            19.6,
            16.8,
            30.3,
            17.1,
            30.9,
            16.89,
            17.8,
            15.7,
            18.5,
            22.0,
            18.3,
            17.8,
            16.2,
            17.1,
            18.0,
            25.9,
            22.8,
            22.7,
            57.3,
            21.8,
            27.4,
            18.2,
            18.0,
            18.1,
            14.7,
            15.6,
            15.4,
            15.9,
            16.7,
            14.8,
            15.2,
            16.2,
            13.1,
            16.0,
            13.6,
            17.8,
            17.1,
            16.2,
            11.9,
            16.5,
            17.8,
            16.8,
            14.3,
            13.2,
            12.0,
            12.2,
            15.6,
            9.5,
            13.4,
            18.39,
            59.3,
            63.4,
            39.6,
            44.7,
            14.7,
            11.5,
            10.6,
            45.3,
            21.8,
            18.7,
            38.7,
            10.6,
            15.6,
            14.6,
            14.7,
            14.1,
            11.6,
            25.8,
            17.5,
            13.9,
            34.79,
            19.89,
            14.9,
            10.5,
            18.7,
            15.9,
            15.8,
            12.2,
            16.5,
            41.2,
            28.1,
            36.2,
            10.1,
            14.0,
            29.0,
            29.0,
            8.8,
            57.5,
            56.4,
            23.1,
            8.8,
            23.4,
            14.8,
            22.5,
            43.1,
            9.3,
            20.6,
            33.1,
            29.8,
            17.8,
            11.8,
            35.9,
            9.9,
            18.8,
            15.1,
            15.4,
            13.6,
            49.0,
            56.6,
            10.4,
            16.1,
            13.9,
            13.6,
            14.5,
            16.6,
            14.8,
            17.5,
            16.8,
            17.5,
            13.7,
            18.1,
            47.1,
            12.2,
            16.2,
            19.0,
            17.3,
            15.5,
            19.8,
            14.4,
            21.2,
            15.7,
            32.79,
            48.6,
            16.3,
            20.2,
            15.4,
            19.3,
            16.7,
            17.5,
            18.6,
            18.39,
            17.89,
            19.0,
            17.1,
            20.6,
            16.2,
            64.7,
            22.5,
            21.1,
            18.0,
            24.6,
            19.0,
            23.5,
            17.8,
            19.7,
            20.6,
            17.89,
            18.7,
            18.39,
            19.1,
            18.8,
            19.6,
            21.4,
            19.7,
            18.39,
            20.5,
            19.6,
            18.8,
            20.3,
            19.0,
            20.39,
            19.3,
            19.6,
            19.39,
            20.3,
            20.5,
            19.5,
            20.0,
            20.0,
            19.6,
            20.0,
            19.7,
            19.7,
            20.1,
            19.5,
            19.89,
            20.5,
            19.6,
            20.2,
            19.89,
            20.2,
            20.7,
            20.0,
            19.5,
            19.8,
            20.39,
            19.3,
            19.6,
            21.0,
            18.7,
            21.2,
            20.39,
            19.1,
            20.7,
            19.1,
            21.8,
            19.39,
            20.1,
            20.1,
            20.1,
            20.9,
            20.0,
            19.7,
            19.89,
            19.39,
            19.3,
            21.2,
            19.6,
            20.5,
            19.6,
            20.3,
            19.8,
            19.0,
            20.6,
            19.6,
            21.1,
            19.6,
            20.6,
            20.5,
            19.6,
            20.39,
            20.0,
            19.7
        };

        var currentValues1 = new[]
        {
            115.8,
            135.4,
            87.8,
            150.0,
            103.0,
            133.1,
            122.6,
            122.9,
            146.9,
            122.2,
            146.9,
            124.6,
            117.5,
            134.4,
            106.0,
            109.7,
            111.4,
            103.3,
            107.0,
            96.2,
            109.4,
            123.6,
            109.7,
            70.59,
            101.0,
            125.0,
            51.3,
            95.2,
            94.2,
            83.4,
            140.19,
            62.5,
            95.2,
            132.0,
            62.1,
            94.9,
            77.7,
            78.7,
            120.6,
            52.3,
            78.0,
            102.3,
            77.7,
            57.4,
            119.2,
            91.2,
            52.3,
            101.0,
            87.8,
            68.5,
            101.6,
            53.3,
            124.6,
            57.0,
            111.4,
            29.7,
            77.0,
            22.2,
            66.8,
            49.6,
            81.7,
            99.6,
            8.4,
            35.79,
            40.5,
            47.2,
            28.3,
            27.0,
            16.2,
            22.6,
            35.4,
            14.5,
            43.5,
            21.2,
            16.5,
            15.2,
            10.1,
            37.1,
            35.4,
            35.4,
            23.9,
            19.89,
            28.0,
            27.3,
            17.2,
            55.4,
            27.7,
            46.9,
            38.5,
            21.2,
            15.5,
            66.2,
            18.5,
            8.1,
            13.1,
            30.0,
            43.5,
            55.4,
            49.3,
            17.5,
            81.4,
            61.1,
            7.4,
            11.4,
            2.7,
            18.2,
            15.5,
            32.7,
            53.7,
            76.59,
            16.8,
            44.2,
            57.0,
            29.3,
            112.5,
            44.2,
            65.5,
            41.5,
            58.4,
            116.2,
            29.3,
            46.2,
            44.5,
            19.89,
            53.7,
            36.79,
            136.8,
            43.2,
            28.0,
            40.79,
            100.3,
            98.6,
            7.0,
            8.1,
            6.7,
            130.69,
            118.9,
            8.4,
            8.1,
            125.3,
            23.3,
            13.5,
            58.1,
            130.69,
            43.2,
            86.8,
            9.1,
            34.7,
            136.1,
            24.6,
            84.7,
            15.5,
            53.0,
            130.0,
            8.69,
            146.9,
            30.7,
            63.1,
            88.1,
            77.3,
            37.1,
            22.9,
            121.2,
            45.9,
            62.8,
            78.3,
            56.4,
            92.9,
            54.3,
            66.5,
            23.3,
            59.1,
            116.2,
            86.1,
            11.8,
            118.5,
            72.2,
            26.6,
            31.7,
            159.69,
            28.7,
            159.4,
            34.4,
            147.6,
            8.1,
            25.6,
            140.8,
            78.0,
            130.4,
            53.3,
            134.1,
            97.6,
            105.0,
            103.0,
            125.6,
            79.7,
            139.5,
            62.8,
            159.4,
            23.3,
            140.5,
            37.5,
            127.3,
            78.3,
            74.59,
            95.6,
            99.3,
            94.5,
            60.1,
            132.4,
            96.9,
            142.9,
            93.2,
            116.2,
            95.2,
            113.5,
            90.2,
            128.69,
            66.5,
            110.1,
            114.1,
            81.4,
            116.8,
            98.3,
            109.4,
            100.3,
            108.1,
            94.2,
            100.6,
            118.2,
            96.2,
            107.0,
            112.1,
            101.3,
            105.4,
            106.0,
            114.1,
            97.2,
            116.5,
            99.3,
            106.4,
            121.2,
            92.2,
            116.5,
            89.8,
            105.7,
            127.7,
            96.6,
            95.6,
            107.0,
            127.3,
            86.8,
            124.6,
            91.5,
            91.8,
            128.0,
            92.2,
            116.5,
            55.4,
            130.4,
            128.3,
            88.1,
            130.4,
            91.8,
            106.7,
            108.4,
            112.1,
            115.5,
            124.3,
            69.2,
            115.2,
            102.0,
            119.9,
            106.0,
            104.0,
            122.6,
            107.7,
            111.1,
            82.4,
            121.2,
            85.8,
            88.5,
            102.7,
            113.8,
            100.6,
            117.2
        };

        var seconds1 = 0.1 * voltageValues1.Length;
        var roundSeconds1 = Math.Round(seconds1);

        var weldingStartTime1 = new TimeSpan(13, 25, 43);
        var weldingEndTime1 = weldingStartTime1.Add(TimeSpan.FromSeconds(roundSeconds1));

        var voltageValues2 = new[]
        {
            79.2,
            78.7,
            78.7,
            78.9,
            78.2,
            78.09,
            78.09,
            78.7,
            77.7,
            51.3,
            52.0,
            50.9,
            50.9,
            52.0,
            50.9,
            50.9,
            50.9,
            50.8,
            50.9,
            50.8,
            50.9,
            50.8,
            50.9,
            50.8,
            50.8,
            50.9,
            51.9,
            50.9,
            51.0,
            50.9,
            51.0,
            50.9,
            50.9,
            50.8,
            50.9,
            50.9,
            51.0,
            50.7,
            50.8,
            51.1,
            51.8,
            50.8,
            50.9,
            51.9,
            50.9,
            50.9,
            50.9,
            50.8,
            50.9,
            50.7,
            50.8,
            50.9,
            51.0,
            50.8,
            50.8,
            50.7,
            51.8,
            50.9,
            50.8,
            50.7,
            50.8,
            50.9,
            50.8,
            50.9,
            51.0,
            50.9,
            50.9,
            50.8,
            50.9,
            51.2,
            52.1,
            51.0,
            51.0,
            51.9,
            51.0,
            50.9,
            51.0,
            50.9,
            50.9,
            50.9,
            50.9,
            40.7,
            40.4,
            40.5,
            40.4,
            40.29,
            40.29,
            40.29,
            40.4,
            40.4,
            40.29,
            40.4,
            40.4,
            40.4,
            40.5,
            40.4,
            40.6,
            40.4,
            40.5,
            40.4,
            40.4,
            40.5,
            40.4,
            40.4,
            40.4,
            40.4,
            40.4,
            40.4,
            40.4,
            40.4,
            40.4,
            40.5,
            40.5,
            40.5,
            40.4,
            40.4,
            40.4,
            40.4,
            40.4,
            40.5,
            40.4,
            40.6,
            41.2,
            41.5,
            41.4,
            41.5,
            41.3,
            41.5,
            41.6,
            41.5,
            41.6,
            41.5,
            41.4,
            41.3,
            41.4,
            41.7,
            41.5,
            41.7,
            41.3,
            41.8,
            41.5,
            41.7,
            41.5,
            41.6,
            41.6,
            41.5,
            41.3,
            41.5,
            41.7,
            41.2,
            41.5,
            41.5,
            41.7,
            41.6,
            41.5,
            41.6,
            41.2,
            41.4,
            41.4,
            41.5,
            41.5,
            41.8,
            41.4,
            41.2,
            41.5,
            41.7,
            41.4,
            41.5,
            41.5,
            41.8,
            41.5,
            41.6,
            41.2,
            42.8,
            44.7,
            45.6,
            44.7,
            43.7,
            43.3,
            43.3,
            43.3,
            43.4,
            43.4,
            43.3,
            43.4,
            43.3,
            43.3,
            43.3,
            43.2,
            43.3,
            43.3,
            43.3,
            43.3,
            43.3,
            43.2,
            43.2,
            43.3,
            43.3,
            43.3,
            43.2,
            43.2,
            43.3,
            43.3,
            43.3,
            43.3,
            43.3,
            43.3,
            43.2,
            43.3,
            43.3,
            43.3,
            43.4,
            45.7,
            44.7,
            45.5,
            45.5,
            44.7,
            45.7,
            44.8,
            45.7,
            44.7,
            44.7,
            44.8,
            45.7,
            44.7,
            44.8,
            45.7,
            44.9,
            45.9,
            44.9,
            44.9,
            44.8,
            44.7,
            45.8,
            44.9,
            44.8,
            44.9,
            44.8,
            45.0,
            44.9,
            45.0,
            44.9,
            44.9,
            45.7,
            45.6,
            44.9,
            44.9,
            44.9,
            45.0,
            45.0,
            44.9,
            45.0,
            45.1,
            45.0,
            45.9,
            44.9,
            45.0,
            44.9,
            45.0,
            45.0,
            45.0,
            44.9,
            45.0,
            45.0,
            45.0,
            45.0,
            45.9,
            45.0,
            44.9,
            45.0,
            44.9,
            45.0,
            45.0,
            45.0,
            45.0,
            45.0,
            45.0,
            44.9,
            45.9,
            45.0,
            45.0,
            45.9,
            45.0,
            45.0,
            45.1,
            44.9,
            45.0,
            45.0,
            44.9,
            45.1,
            45.9,
            46.2,
            45.9,
            45.8,
            45.8,
            45.7,
            45.7,
            45.7,
            45.7,
            45.8,
            45.7,
            45.9,
            45.9,
            45.8,
            45.9,
            45.9,
            45.8,
            45.0,
            45.0,
            45.0,
            46.0,
            45.2,
            45.3,
            46.1,
            45.1,
            45.1,
            45.1,
            45.1,
            45.2,
            45.2,
            45.2,
            45.1,
            45.3,
            45.1,
            45.2,
            45.2,
            45.9,
            45.6,
            45.3,
            45.0,
            45.2,
            45.1,
            45.2,
            45.2,
            45.2,
            45.2,
            45.1,
            45.1,
            45.3,
            45.3,
            46.2,
            45.2,
            45.3,
            46.2,
            45.4,
            45.2,
            45.3,
            45.3,
            45.3,
            45.3,
            45.2,
            45.3,
            45.3,
            45.3,
            45.3,
            45.3,
            46.2,
            45.8,
            45.2,
            45.3,
            45.3,
            45.4,
            45.2,
            45.2,
            45.3,
            45.1,
            45.3,
            45.2,
            45.3,
            45.3,
            46.4,
            45.3,
            45.3,
            46.3,
            45.4,
            45.4,
            45.4,
            45.6,
            45.6,
            45.4,
            45.4,
            45.4,
            45.3,
            45.3,
            45.3,
            45.6,
            46.3,
            45.9,
            45.3,
            45.5,
            45.5,
            45.5,
            45.4,
            45.5,
            45.6,
            45.4,
            45.4,
            45.6,
            45.4,
            46.1,
            45.9,
            46.2,
            46.2,
            46.1,
            46.2,
            46.1,
            46.1,
            46.3,
            46.1,
            46.0,
            46.1,
            46.3,
            45.9,
            45.6,
            45.6,
            45.6,
            45.5,
            45.5,
            45.6,
            45.7,
            46.6,
            45.7,
            45.7,
            46.5,
            45.7,
            45.5,
            45.7,
            45.8,
            45.6,
            45.6,
            45.6,
            45.6,
            45.5,
            45.6,
            44.4,
            43.7,
            43.6,
            43.7,
            48.8,
            78.7,
            78.09,
            77.0,
            77.5,
            78.5,
            76.59,
            77.59,
            77.3,
            76.7,
            77.09,
            77.59,
            77.3
        };

        var currentValues2 = new[]
        {
            53.3,
            52.7,
            53.0,
            53.0,
            52.7,
            52.7,
            52.7,
            53.0,
            54.0,
            101.3,
            102.7,
            100.3,
            100.6,
            102.7,
            100.6,
            100.3,
            100.3,
            100.3,
            100.6,
            100.3,
            100.3,
            100.3,
            100.3,
            100.3,
            100.3,
            100.3,
            102.7,
            100.6,
            100.6,
            100.3,
            100.6,
            100.0,
            100.3,
            100.3,
            100.6,
            100.6,
            100.3,
            100.0,
            100.3,
            101.0,
            102.3,
            100.3,
            100.0,
            102.3,
            100.3,
            100.3,
            100.3,
            100.0,
            100.0,
            100.0,
            100.0,
            100.3,
            100.6,
            99.6,
            99.6,
            100.0,
            102.3,
            100.0,
            100.0,
            99.6,
            100.0,
            100.0,
            100.0,
            100.0,
            100.0,
            100.0,
            100.0,
            100.0,
            99.6,
            100.6,
            102.0,
            100.0,
            100.0,
            102.0,
            100.3,
            100.0,
            99.6,
            99.6,
            99.6,
            100.0,
            99.6,
            175.0,
            178.0,
            178.3,
            178.3,
            178.3,
            178.3,
            178.3,
            178.3,
            178.3,
            178.7,
            178.7,
            178.7,
            179.0,
            179.0,
            179.0,
            179.0,
            179.0,
            178.7,
            179.0,
            179.0,
            178.7,
            178.7,
            178.7,
            178.7,
            178.3,
            178.7,
            178.7,
            178.3,
            178.7,
            178.3,
            178.7,
            178.3,
            178.3,
            178.3,
            178.3,
            178.3,
            178.7,
            178.3,
            178.3,
            178.3,
            177.0,
            162.1,
            156.69,
            157.0,
            156.69,
            156.69,
            156.4,
            156.4,
            156.4,
            156.0,
            156.4,
            156.4,
            156.69,
            156.0,
            156.0,
            156.4,
            156.4,
            156.69,
            156.0,
            156.4,
            156.69,
            156.4,
            156.4,
            156.4,
            156.4,
            156.4,
            156.0,
            155.69,
            156.0,
            156.0,
            156.4,
            156.0,
            156.0,
            155.69,
            156.0,
            156.0,
            156.0,
            156.4,
            156.0,
            156.0,
            156.0,
            156.0,
            156.4,
            155.69,
            155.69,
            156.0,
            155.69,
            156.0,
            155.4,
            155.4,
            156.0,
            156.4,
            146.9,
            114.5,
            116.8,
            114.1,
            119.2,
            138.5,
            138.5,
            138.8,
            138.5,
            138.5,
            138.5,
            138.8,
            138.8,
            138.5,
            138.5,
            138.5,
            138.5,
            138.5,
            138.5,
            138.5,
            138.1,
            138.1,
            138.1,
            138.5,
            138.1,
            138.1,
            138.1,
            138.1,
            138.1,
            138.1,
            138.1,
            138.1,
            138.1,
            138.1,
            138.1,
            138.1,
            138.1,
            138.1,
            137.8,
            123.6,
            113.8,
            115.8,
            115.2,
            113.5,
            116.2,
            113.8,
            116.2,
            113.5,
            113.5,
            113.5,
            116.2,
            113.5,
            113.8,
            116.2,
            113.5,
            116.5,
            113.8,
            113.8,
            113.1,
            113.5,
            116.2,
            113.5,
            113.1,
            113.5,
            113.5,
            113.8,
            113.5,
            113.8,
            113.1,
            113.5,
            115.8,
            115.2,
            113.5,
            113.1,
            113.1,
            113.5,
            113.8,
            113.5,
            113.1,
            113.8,
            113.1,
            115.8,
            113.1,
            113.1,
            113.1,
            113.1,
            113.1,
            113.5,
            112.8,
            113.1,
            113.1,
            113.1,
            113.1,
            115.8,
            112.8,
            112.8,
            113.1,
            113.1,
            112.8,
            113.1,
            112.8,
            113.1,
            113.1,
            113.1,
            112.8,
            115.2,
            112.8,
            112.5,
            115.2,
            112.8,
            112.8,
            112.8,
            112.5,
            112.8,
            112.8,
            112.5,
            112.8,
            114.8,
            120.9,
            122.2,
            122.2,
            122.2,
            122.2,
            122.2,
            122.2,
            122.2,
            122.6,
            122.2,
            122.2,
            122.2,
            122.2,
            122.6,
            122.2,
            116.2,
            112.1,
            112.1,
            112.5,
            114.5,
            112.5,
            112.5,
            114.5,
            112.1,
            112.5,
            112.5,
            112.1,
            112.1,
            112.1,
            112.5,
            111.8,
            112.5,
            112.1,
            112.1,
            112.1,
            114.5,
            113.1,
            112.1,
            111.8,
            112.1,
            111.8,
            111.8,
            112.1,
            112.1,
            112.1,
            111.8,
            111.8,
            112.5,
            112.5,
            114.5,
            111.8,
            112.1,
            114.5,
            112.5,
            111.8,
            112.1,
            112.1,
            112.5,
            112.5,
            111.8,
            112.1,
            111.8,
            111.8,
            112.1,
            111.8,
            114.5,
            113.1,
            111.4,
            111.8,
            111.8,
            111.8,
            111.8,
            111.4,
            111.8,
            111.4,
            111.8,
            111.4,
            111.4,
            111.4,
            114.1,
            111.8,
            111.4,
            114.1,
            111.8,
            111.8,
            111.8,
            112.1,
            112.1,
            111.8,
            111.4,
            111.4,
            111.4,
            111.4,
            111.8,
            111.8,
            113.8,
            112.5,
            111.4,
            111.8,
            111.8,
            111.4,
            111.4,
            111.4,
            111.8,
            111.1,
            111.1,
            111.8,
            111.8,
            121.2,
            120.9,
            121.2,
            120.9,
            121.2,
            121.2,
            120.9,
            120.9,
            120.9,
            120.9,
            120.9,
            120.9,
            120.6,
            115.5,
            111.4,
            111.4,
            111.4,
            111.1,
            110.8,
            111.1,
            111.8,
            113.8,
            111.4,
            111.1,
            113.1,
            111.1,
            111.1,
            111.4,
            111.8,
            110.8,
            110.8,
            110.8,
            111.1,
            110.4,
            110.8,
            130.69,
            134.69,
            134.4,
            134.69,
            113.5,
            53.0,
            52.0,
            51.0,
            51.6,
            52.3,
            51.0,
            51.6,
            51.6,
            51.0,
            51.3,
            51.3,
            51.6
        };

        var seconds2 = 0.1 * voltageValues2.Length;
        var roundSeconds2 = Math.Round(seconds2);

        var weldingStartTime2 = new TimeSpan(19, 43, 13);
        var weldingEndTime2 = weldingStartTime2.Add(TimeSpan.FromSeconds(roundSeconds2));

        var weldingEquipment = (
            await context.WeldingEquipments.FirstOrDefaultAsync(_ => _.IdFromSystem == "49283")
        )!;

        var tasks = new List<WeldingTask>
        {
            new WeldingTask
            {
                WeldingDate = new DateTime(2000, 1, 1),
                BasicMaterial = "Сталь 20",
                TaskStatus = WeldingTaskStatus.Completed,
                MainMaterialBatchNumber = "454578",
                WeldingMaterial = "Проволока 1,2 Св-08Г2С",
                WeldingMaterialBatchNumber = "00252565",
                ProtectiveGas = "Какой-то Защитный газ",
                ProtectiveGasBatchNumber = "111111",
                Status = SeamStatus.Accept,
                Welder = welder,
                Inspector = inspector,
                Master = master,
                WeldPassages = new List<WeldPassage>
                {
                    new()
                    {
                        Number = 1,
                        Name = "Корневой",
                        ShortTermDeviation = 11,
                        LongTermDeviation = 12,
                        PreheatingTemperature = 82,
                        IsEnsuringVoltageAllowance = false,
                        IsEnsuringCurrentAllowance = false,
                        IsEnsuringTemperatureAllowance = true,
                        WeldingRecord = new WeldingRecord
                        {
                            WeldingCurrentValues = currentValues1,
                            ArcVoltageValues = voltageValues1,
                            WeldingStartTime = weldingStartTime1,
                            WeldingEndTime = weldingEndTime1,
                            WeldingEquipment = weldingEquipment,
                            Welder = welder,
                            Master = master,
                            Date = DateTime.Now,
                        }
                    }
                },
                SeamAccount = seam1.SeamAccounts.First(),
            },
            new WeldingTask
            {
                WeldingDate = new DateTime(2000, 1, 1),
                BasicMaterial = "Сталь 20",
                TaskStatus = WeldingTaskStatus.Completed,
                MainMaterialBatchNumber = "454578",
                WeldingMaterial = "Проволока 1,2 Св-08Г2С",
                WeldingMaterialBatchNumber = "00252565",
                ProtectiveGas = "Какой-то Защитный газ",
                ProtectiveGasBatchNumber = "111111",
                Status = SeamStatus.Accept,
                Welder = welder,
                Inspector = inspector,
                Master = master,
                WeldPassages = new List<WeldPassage>
                {
                    new()
                    {
                        Number = 1,
                        Name = "Корневой",
                        ShortTermDeviation = 11,
                        LongTermDeviation = 12,
                        PreheatingTemperature = 82,
                        IsEnsuringVoltageAllowance = false,
                        IsEnsuringCurrentAllowance = false,
                        IsEnsuringTemperatureAllowance = true,
                        WeldingRecord = new WeldingRecord
                        {
                            WeldingStartTime = weldingStartTime1,
                            WeldingEndTime = weldingEndTime1,
                            WeldingCurrentValues = currentValues1,
                            ArcVoltageValues = voltageValues1,
                            WeldingEquipment = weldingEquipment,
                            Master = master,
                            Welder = welder,
                            Date = DateTime.Now,
                        }
                    }
                },
                SeamAccount = seam2.SeamAccounts.First(),
            }
        };

        context.WeldingTasks.AddRange(tasks);

        await context.SaveChangesAsync();
    }
}