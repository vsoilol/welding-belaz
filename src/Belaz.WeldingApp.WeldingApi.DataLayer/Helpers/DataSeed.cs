using Belaz.WeldingApp.Common.Enums;
using Belaz.WeldingApp.Common.Entities.CalendarInfo;
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
        await CreateRolesAsync(context);

        if (!context.DowntimeReasons.Any())
        {
            await AddDowntimeReasons(context);
        }

        if (!context.Calendars.Any())
        {
            await AddCalendar(context);
        }

        if (!context.Workshops.Any())
        {
            await AddProduction(context);
        }

        if (!context.WeldingEquipments.Any())
        {
            await AddWeldingEquipmentsAsync(context);
        }

        if (!context.Inspectors.Any())
        {
            await AddInspectors(context);
        }

        if (!context.Masters.Any())
        {
            await AddMasters(context);
        }

        if (!context.Welders.Any())
        {
            await AddWelders(context);
        }

        if (!context.Chiefs.Any())
        {
            await AddChief(context);
        }

        if (!context.TechnologicalProcesses.Any())
        {
            await AddTechnologicalProcesses(context);
        }

        if (!context.TechnologicalInstructions.Any())
        {
            await AddTechnologicalInstruction(context);
        }

        if (!context.Products.Any())
        {
            await AddProducts(context);
        }

        if (!context.ProductAccounts.Any())
        {
            await AddProductAccounts(context);
        }

        if (!context.WeldingTasks.Any())
        {
            //await AddWeldingTasks(context);
            //await GenerateTaskByProductAccounts(context);
        }
    }

    private static async Task GenerateTaskByProductAccounts(ApplicationContext context)
    {
        var date = new DateTime(2023, 3, 12);

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
                .Where(_ => _.IdFromSystem == "49232")
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
                    DateFromPlan = new DateTime(2023, 3, 12),
                    Seam = seam,
                    SeamResults = seamResultStatus
                };
                seamAccounts.Add(seamAccount);
            }

            var productAccount = new ProductAccount
            {
                Number = i + 1,
                AmountFromPlan = 2,
                DateFromPlan = new DateTime(2023, 3, 12),
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

    private static async Task CreateRolesAsync(ApplicationContext context)
    {
        var enumValues = Enum.GetNames(typeof(Role));

        foreach (var role in enumValues)
        {
            if (!context.Roles.Any(_ => _.Name == role))
            {
                var creationRole = new RoleData { Name = role };
                await context.Roles.AddAsync(creationRole);
                await context.SaveChangesAsync();
            }
        }
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

    private static async Task AddCalendar(ApplicationContext context)
    {
        var calendar = new Calendar
        {
            Year = 2023,
            IsMain = true,
            Days = new List<Day>
            {
                new Day
                {
                    MonthNumber = 1,
                    Number = 10,
                    IsWorkingDay = true,
                    WorkingShifts = new List<WorkingShift>
                    {
                        new WorkingShift
                        {
                            Number = 1,
                            ShiftStart = new TimeSpan(12, 10, 0),
                            ShiftEnd = new TimeSpan(13, 10, 0),
                            BreakStart = new TimeSpan(13, 20, 0),
                            BreakEnd = new TimeSpan(13, 50, 0),
                        }
                    }
                }
            },
            MainWorkingShifts = new List<WorkingShift>
            {
                new WorkingShift
                {
                    Number = 1,
                    ShiftStart = new TimeSpan(12, 0, 0),
                    ShiftEnd = new TimeSpan(13, 0, 0),
                    BreakStart = new TimeSpan(13, 10, 0),
                    BreakEnd = new TimeSpan(13, 40, 0),
                },
                new WorkingShift
                {
                    Number = 2,
                    ShiftStart = new TimeSpan(14, 0, 0),
                    ShiftEnd = new TimeSpan(15, 0, 0),
                    BreakStart = new TimeSpan(15, 10, 0),
                    BreakEnd = new TimeSpan(15, 40, 0),
                },
                new WorkingShift
                {
                    Number = 3,
                    ShiftStart = new TimeSpan(16, 0, 0),
                    ShiftEnd = new TimeSpan(17, 0, 0),
                    BreakStart = new TimeSpan(17, 10, 0),
                    BreakEnd = new TimeSpan(17, 40, 0),
                }
            }
        };

        await context.Calendars.AddAsync(calendar);
        await context.SaveChangesAsync();
    }

    private static async Task AddProduction(ApplicationContext context)
    {
        var workshops = new List<Workshop>
        {
            new Workshop
            {
                Name = "Сварочный цех",
                IdFromSystem = "050",
                Number = 50,
                ProductionAreas = new List<ProductionArea>
                {
                    new ProductionArea
                    {
                        Name = "Сборка, сварка рам к/с г/п 120-130 т.",
                        Number = 6,
                        IdFromSystem = "06",
                        Workplaces = new List<Workplace>
                        {
                            new Workplace { Number = 3600, IdFromSystem = "3600" },
                            new Workplace { Number = 3610, IdFromSystem = "3610" },
                            new Workplace { Number = 3690, IdFromSystem = "3690" },
                            new Workplace { Number = 3550, IdFromSystem = "3550" },
                            new Workplace { Number = 3510, IdFromSystem = "3510" },
                            new Workplace { Number = 3500, IdFromSystem = "3500" },
                        }
                    }
                }
            }
        };

        context.Workshops.AddRange(workshops);
        await context.SaveChangesAsync();
    }

    private static async Task AddWeldingEquipmentsAsync(ApplicationContext context)
    {
        var workplace3610 = (
            await context.Workplaces.FirstOrDefaultAsync(_ => _.IdFromSystem == "3610")
        )!;

        var workplace3500 = (
            await context.Workplaces.FirstOrDefaultAsync(_ => _.IdFromSystem == "3500")
        )!;

        var workplace3600 = (
            await context.Workplaces.FirstOrDefaultAsync(_ => _.IdFromSystem == "3600")
        )!;

        var workplace3690 = (
            await context.Workplaces.FirstOrDefaultAsync(_ => _.IdFromSystem == "3690")
        )!;

        var workplace3550 = (
            await context.Workplaces.FirstOrDefaultAsync(_ => _.IdFromSystem == "3550")
        )!;

        var workplace3510 = (
            await context.Workplaces.FirstOrDefaultAsync(_ => _.IdFromSystem == "3510")
        )!;

        var weldingEquipments = new List<WeldingEquipment>
        {
            new WeldingEquipment
            {
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

        await context.WeldingEquipments.AddRangeAsync(weldingEquipments);
        await context.SaveChangesAsync();
    }

    private static async Task AddInspectors(ApplicationContext context)
    {
        var techUserRole = (
            await context.Roles.FirstOrDefaultAsync(_ => _.Name == nameof(Role.Inspector))
        )!;

        var productionArea6 = await context.ProductionAreas.FirstOrDefaultAsync(
            _ => _.IdFromSystem == "06"
        );

        var inspectors = new List<Inspector>
        {
            new Inspector
            {
                IdFromSystem = "249550",
                UserInfo = new UserData
                {
                    ServiceNumber = "49550",
                    MiddleName = "Грук",
                    FirstName = "Екатерина",
                    LastName = "Сергеевна",
                    Position = "Контролер сварочных работ",
                    ProductionArea = productionArea6,
                    UserRoles = new List<UserRole> { new UserRole { Role = techUserRole } }
                }
            },
            new Inspector
            {
                IdFromSystem = "219379",
                UserInfo = new UserData
                {
                    ServiceNumber = "19379",
                    MiddleName = "Шабалинская",
                    FirstName = "Мария",
                    LastName = "Николаевна",
                    Position = "Контролер сварочных работ",
                    ProductionArea = productionArea6,
                    UserRoles = new List<UserRole> { new UserRole { Role = techUserRole } }
                }
            }
        };

        context.Inspectors.AddRange(inspectors);
        await context.SaveChangesAsync();
    }

    private static async Task AddMasters(ApplicationContext context)
    {
        var masterRole = (
            await context.Roles.FirstOrDefaultAsync(_ => _.Name == nameof(Role.Master))
        )!;

        var productionArea6 = await context.ProductionAreas.FirstOrDefaultAsync(
            _ => _.IdFromSystem == "06"
        );

        var weldingEquipments06 = await context.WeldingEquipments
            .Where(
                _ => _.Workplaces.Any(workplace => workplace.ProductionArea!.IdFromSystem == "06")
            )
            .ToListAsync();

        var masters = new List<Master>
        {
            new Master
            {
                IdFromSystem = "614962",
                UserInfo = new UserData
                {
                    ServiceNumber = "14962",
                    MiddleName = "Алёксов",
                    FirstName = "Геннадий",
                    LastName = "Александрович",
                    Position = "Мастер производственного участка",
                    ProductionArea = productionArea6,
                    UserRoles = new List<UserRole> { new UserRole { Role = masterRole } }
                },
            },
            new Master
            {
                IdFromSystem = "610422",
                WeldingEquipments = weldingEquipments06,
                UserInfo = new UserData
                {
                    ServiceNumber = "10422",
                    MiddleName = "Беляцкий",
                    FirstName = "Сергей",
                    LastName = "Николаевич",
                    Position = "Мастер производственного участка",
                    ProductionArea = productionArea6,
                    UserRoles = new List<UserRole> { new UserRole { Role = masterRole } }
                },
            }
        };

        context.Masters.AddRange(masters);
        await context.SaveChangesAsync();
    }

    private static async Task AddWelders(ApplicationContext context)
    {
        var productionArea6 = await context.ProductionAreas.FirstOrDefaultAsync(
            _ => _.IdFromSystem == "06"
        );

        var weldingEquipment49141 = (
            await context.WeldingEquipments.FirstOrDefaultAsync(_ => _.IdFromSystem == "49141")
        )!;
        var weldingEquipment49283 = (
            await context.WeldingEquipments.FirstOrDefaultAsync(_ => _.IdFromSystem == "49283")
        )!;
        var weldingEquipment49286 = (
            await context.WeldingEquipments.FirstOrDefaultAsync(_ => _.IdFromSystem == "49286")
        )!;
        var weldingEquipment49232 = (
            await context.WeldingEquipments.FirstOrDefaultAsync(_ => _.IdFromSystem == "49232")
        )!;

        var welderRole = (
            await context.Roles.FirstOrDefaultAsync(_ => _.Name == nameof(Role.Welder))
        )!;

        var welders = new List<Welder>
        {
            new Welder
            {
                IdFromSystem = "150882",
                WeldingEquipments = new List<WeldingEquipment>
                {
                    weldingEquipment49141,
                    weldingEquipment49283
                },
                UserInfo = new UserData
                {
                    RfidTag = "17:CD:7F:5A",
                    ServiceNumber = "50882",
                    MiddleName = "Буландо",
                    FirstName = "Юрий",
                    LastName = "Сергеевич",
                    Position = "Электросварщик на автоматических и полуавтоматических машинах",
                    ProductionArea = productionArea6,
                    UserRoles = new List<UserRole> { new UserRole { Role = welderRole } }
                }
            },
            new Welder
            {
                IdFromSystem = "146164",
                WeldingEquipments = new List<WeldingEquipment>
                {
                    weldingEquipment49141,
                    weldingEquipment49283
                },
                UserInfo = new UserData
                {
                    RfidTag = "27:45:7E:B4",
                    ServiceNumber = "46164",
                    MiddleName = "Михейчик",
                    FirstName = "Александр",
                    LastName = "Васильевич",
                    Position = "Электросварщик на автоматических и полуавтоматических машинах",
                    ProductionArea = productionArea6,
                    UserRoles = new List<UserRole> { new UserRole { Role = welderRole } }
                }
            },
            new Welder
            {
                IdFromSystem = "121267",
                WeldingEquipments = new List<WeldingEquipment> { weldingEquipment49232 },
                UserInfo = new UserData
                {
                    RfidTag = "B7:5A:79:B5",
                    ServiceNumber = "21267",
                    MiddleName = "Казинец",
                    FirstName = "Василий",
                    LastName = "Владимирович",
                    Position = "Электросварщик на автоматических и полуавтоматических машинах",
                    ProductionArea = productionArea6,
                    UserRoles = new List<UserRole> { new UserRole { Role = welderRole } }
                }
            },
            new Welder
            {
                IdFromSystem = "117390",
                WeldingEquipments = new List<WeldingEquipment> { weldingEquipment49232 },
                UserInfo = new UserData
                {
                    RfidTag = "67:5A:70:B4",
                    ServiceNumber = "17390",
                    MiddleName = "Казачёнок",
                    FirstName = "Сергей",
                    LastName = "Анатольевич",
                    Position = "Электросварщик на автоматических и полуавтоматических машинах",
                    ProductionArea = productionArea6,
                    UserRoles = new List<UserRole> { new UserRole { Role = welderRole } }
                }
            },
            new Welder
            {
                IdFromSystem = "132695",
                WeldingEquipments = new List<WeldingEquipment> { weldingEquipment49286 },
                UserInfo = new UserData
                {
                    RfidTag = "D7:95:55:B4",
                    ServiceNumber = "32695",
                    MiddleName = "Виторский",
                    FirstName = "Владимир",
                    LastName = "Францевич",
                    Position = "Электросварщик на автоматических и полуавтоматических машинах",
                    ProductionArea = productionArea6,
                    UserRoles = new List<UserRole> { new UserRole { Role = welderRole } }
                }
            },
            new Welder
            {
                IdFromSystem = "122575",
                WeldingEquipments = new List<WeldingEquipment> { weldingEquipment49286 },
                UserInfo = new UserData
                {
                    ServiceNumber = "22575",
                    RfidTag = "67:CD:7E:5A",
                    MiddleName = "Костюкевич",
                    FirstName = "Максим",
                    LastName = "Александрович",
                    Position = "Электросварщик на автоматических и полуавтоматических машинах",
                    ProductionArea = productionArea6,
                    UserRoles = new List<UserRole> { new UserRole { Role = welderRole } }
                }
            },
            new Welder
            {
                IdFromSystem = "114729",
                WeldingEquipments = new List<WeldingEquipment>
                {
                    weldingEquipment49141,
                    weldingEquipment49283
                },
                UserInfo = new UserData
                {
                    ServiceNumber = "14729",
                    RfidTag = "D7:F1:7D:5A",
                    MiddleName = "Казинец",
                    FirstName = "Виталий",
                    LastName = "Владимирович",
                    Position = "Электросварщик на автоматических и полуавтоматических машинах",
                    ProductionArea = productionArea6,
                    UserRoles = new List<UserRole> { new UserRole { Role = welderRole } }
                }
            },
            new Welder
            {
                IdFromSystem = "150838",
                WeldingEquipments = new List<WeldingEquipment>
                {
                    weldingEquipment49141,
                    weldingEquipment49283
                },
                UserInfo = new UserData
                {
                    ServiceNumber = "50838",
                    RfidTag = "97:17:60:B4",
                    MiddleName = "Зубковский",
                    FirstName = "Валерий",
                    LastName = "Сергеевич",
                    Position = "Электросварщик на автоматических и полуавтоматических машинах",
                    ProductionArea = productionArea6,
                    UserRoles = new List<UserRole> { new UserRole { Role = welderRole } }
                }
            }
        };

        context.Welders.AddRange(welders);
        await context.SaveChangesAsync();
    }

    private static async Task AddChief(ApplicationContext context)
    {
        var chiefRole = (
            await context.Roles.FirstOrDefaultAsync(_ => _.Name == nameof(Role.Chief))
        )!;
        var workshop = (await context.Workshops.FirstOrDefaultAsync())!;

        var chief = new Chief
        {
            Workshop = workshop,
            UserInfo = new UserData
            {
                CertificateValidityPeriod = new DateTime(2025, 2, 2),
                FirstName = "Имя начальника цеха",
                LastName = "Отчество начальника цеха",
                MiddleName = "Фамилия начальника цеха",
                UserName = "UserName",
                Email = "Email",
                PasswordHash = "PasswordHash",
                Position = "Должность 1",
                ServiceNumber = "Табельный номер  1",
                RfidTag = "RFID метка начальника цеха 1",
                UserRoles = new List<UserRole> { new UserRole { Role = chiefRole } }
            },
        };

        await context.Chiefs.AddAsync(chief);
        await context.SaveChangesAsync();
    }

    private static async Task AddProducts(ApplicationContext context)
    {
        var productionArea6 = (
            await context.ProductionAreas.FirstOrDefaultAsync(_ => _.IdFromSystem == "06")
        )!;

        var technologicalProcess3330041 = await context.TechnologicalProcesses.FirstOrDefaultAsync(
            _ => _.IdFromSystem == "3330041"
        );

        var technologicalProcess3291137 = await context.TechnologicalProcesses.FirstOrDefaultAsync(
            _ => _.IdFromSystem == "3291137"
        );

        var technologicalProcess2868425 = await context.TechnologicalProcesses.FirstOrDefaultAsync(
            _ => _.IdFromSystem == "2868425"
        );

        var technologicalInstruction18 =
            await context.TechnologicalInstructions.FirstOrDefaultAsync(
                _ => _.IdFromSystem == "18"
            );
        var technologicalInstruction39 =
            await context.TechnologicalInstructions.FirstOrDefaultAsync(
                _ => _.IdFromSystem == "39"
            );
        var technologicalInstruction52 =
            await context.TechnologicalInstructions.FirstOrDefaultAsync(
                _ => _.IdFromSystem == "52"
            );
        var technologicalInstruction54 =
            await context.TechnologicalInstructions.FirstOrDefaultAsync(
                _ => _.IdFromSystem == "54"
            );
        var technologicalInstruction55 =
            await context.TechnologicalInstructions.FirstOrDefaultAsync(
                _ => _.IdFromSystem == "55"
            );
        var technologicalInstruction56 =
            await context.TechnologicalInstructions.FirstOrDefaultAsync(
                _ => _.IdFromSystem == "56"
            );
        var technologicalInstruction57 =
            await context.TechnologicalInstructions.FirstOrDefaultAsync(
                _ => _.IdFromSystem == "57"
            );
        var technologicalInstruction58 =
            await context.TechnologicalInstructions.FirstOrDefaultAsync(
                _ => _.IdFromSystem == "58"
            );
        var technologicalInstruction1 = await context.TechnologicalInstructions.FirstOrDefaultAsync(
            _ => _.IdFromSystem == "1"
        );
        var technologicalInstruction2 = await context.TechnologicalInstructions.FirstOrDefaultAsync(
            _ => _.IdFromSystem == "2"
        );
        var technologicalInstruction48 =
            await context.TechnologicalInstructions.FirstOrDefaultAsync(
                _ => _.IdFromSystem == "48"
            );

        var product1 = new Product
        {
            IdFromSystem = "4536492774",
            Number = "7513D-2800010-20",
            Name = "Рама",
            ProductType = ProductType.Product,
            ProductionArea = productionArea6,
            TechnologicalProcess = technologicalProcess3330041,
            Seams = new List<Seam>
            {
                new()
                {
                    Number = 39,
                    Length = 280,
                    ProductionArea = productionArea6,
                    TechnologicalInstruction = technologicalInstruction39,
                },
                new()
                {
                    Number = 55,
                    Length = 400,
                    ProductionArea = productionArea6,
                    TechnologicalInstruction = technologicalInstruction55,
                },
                new()
                {
                    Number = 57,
                    Length = 400,
                    ProductionArea = productionArea6,
                    TechnologicalInstruction = technologicalInstruction57,
                },
                new()
                {
                    Number = 58,
                    Length = 900,
                    ProductionArea = productionArea6,
                    TechnologicalInstruction = technologicalInstruction58,
                },
                new()
                {
                    Number = 18,
                    Length = 4000,
                    ProductionArea = productionArea6,
                    TechnologicalInstruction = technologicalInstruction18,
                },
                new()
                {
                    Number = 54,
                    Length = 400,
                    ProductionArea = productionArea6,
                    TechnologicalInstruction = technologicalInstruction54,
                }
            },
            ProductInsides = new List<ProductInside>
            {
                new()
                {
                    InsideProduct = new Product
                    {
                        Number = "75131-2801300-20",
                        Name = "Поперечина рамы задняя",
                        TechnologicalProcess = technologicalProcess3330041,
                        ProductType = ProductType.Knot,
                        ProductionArea = productionArea6,
                        Seams = new List<Seam>
                        {
                            new()
                            {
                                Number = 1,
                                Length = 1900,
                                ProductionArea = productionArea6,
                                TechnologicalInstruction = technologicalInstruction1,
                            },
                            new()
                            {
                                Number = 2,
                                Length = 1880,
                                ProductionArea = productionArea6,
                                TechnologicalInstruction = technologicalInstruction2,
                            },
                            new()
                            {
                                Number = 52,
                                Length = 1200,
                                ProductionArea = productionArea6,
                                TechnologicalInstruction = technologicalInstruction52,
                            }
                        },
                    }
                },
            },
        };

        var product2 = new Product
        {
            IdFromSystem = "4536479362",
            Number = "75131-2800010-70",
            Name = "Рама",
            ProductType = ProductType.Product,
            ProductionArea = productionArea6,
            TechnologicalProcess = technologicalProcess3291137,
            Seams = new List<Seam>
            {
                new()
                {
                    Number = 39,
                    Length = 280,
                    ProductionArea = productionArea6,
                    TechnologicalInstruction = technologicalInstruction39,
                },
                new()
                {
                    Number = 55,
                    Length = 400,
                    ProductionArea = productionArea6,
                    TechnologicalInstruction = technologicalInstruction55,
                },
                new()
                {
                    Number = 57,
                    Length = 400,
                    ProductionArea = productionArea6,
                    TechnologicalInstruction = technologicalInstruction57,
                },
                new()
                {
                    Number = 58,
                    Length = 900,
                    ProductionArea = productionArea6,
                    TechnologicalInstruction = technologicalInstruction58,
                },
                new()
                {
                    Number = 18,
                    Length = 4000,
                    ProductionArea = productionArea6,
                    TechnologicalInstruction = technologicalInstruction18,
                },
                new()
                {
                    Number = 54,
                    Length = 400,
                    ProductionArea = productionArea6,
                    TechnologicalInstruction = technologicalInstruction54,
                }
            },
            ProductInsides = new List<ProductInside>
            {
                new()
                {
                    InsideProduct = new Product
                    {
                        Number = "75131-2801300-20",
                        Name = "Поперечина рамы задняя",
                        TechnologicalProcess = technologicalProcess3291137,
                        ProductType = ProductType.Knot,
                        ProductionArea = productionArea6,
                        Seams = new List<Seam>
                        {
                            new()
                            {
                                Number = 1,
                                Length = 1900,
                                ProductionArea = productionArea6,
                                TechnologicalInstruction = technologicalInstruction1,
                            },
                            new()
                            {
                                Number = 2,
                                Length = 1880,
                                ProductionArea = productionArea6,
                                TechnologicalInstruction = technologicalInstruction2,
                            },
                            new()
                            {
                                Number = 52,
                                Length = 1200,
                                ProductionArea = productionArea6,
                                TechnologicalInstruction = technologicalInstruction52,
                            }
                        },
                    }
                },
            },
        };

        await context.Products.AddRangeAsync(product1, product2);
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

    private static async Task AddTechnologicalProcesses(ApplicationContext context)
    {
        var technologicalProcesses = new List<TechnologicalProcess>
        {
            new TechnologicalProcess
            {
                IdFromSystem = "2868425",
                Name = "Поперечина рамы задняя",
                Number = "75131-2801300-20"
            },
            new TechnologicalProcess
            {
                IdFromSystem = "3330041",
                Name = "Рама",
                Number = "7513D-2800010-20"
            },
            new TechnologicalProcess
            {
                IdFromSystem = "3291137",
                Name = "Рама",
                Number = "75131-2800010-70"
            }
        };

        await context.TechnologicalProcesses.AddRangeAsync(technologicalProcesses);
        await context.SaveChangesAsync();
    }

    private static async Task AddTechnologicalInstruction(ApplicationContext context)
    {
        var technologicalInstructions = new List<TechnologicalInstruction>
        {
            new TechnologicalInstruction
            {
                IdFromSystem = "18",
                Name = "Инструкция 18",
                Number = 18,
                WeldPassageInstructions = new List<WeldPassageInstruction>
                {
                    new()
                    {
                        Name = "Корневой",
                        Number = 1,
                        WeldingCurrentMin = 200,
                        WeldingCurrentMax = 270,
                        ArcVoltageMin = 23,
                        ArcVoltageMax = 26
                    },
                    new()
                    {
                        Name = "Заполняющий",
                        Number = 2,
                        WeldingCurrentMin = 270,
                        WeldingCurrentMax = 310,
                        ArcVoltageMin = 23,
                        ArcVoltageMax = 26
                    }
                }
            },
            new TechnologicalInstruction
            {
                IdFromSystem = "39",
                Name = "Инструкция 39",
                Number = 39,
                WeldPassageInstructions = new List<WeldPassageInstruction>
                {
                    new()
                    {
                        Name = "Корневой",
                        Number = 1,
                        WeldingCurrentMin = 200,
                        WeldingCurrentMax = 270,
                        ArcVoltageMin = 23,
                        ArcVoltageMax = 26
                    },
                    new()
                    {
                        Name = "Заполняющий",
                        Number = 2,
                        WeldingCurrentMin = 270,
                        WeldingCurrentMax = 310,
                        ArcVoltageMin = 23,
                        ArcVoltageMax = 26
                    }
                }
            },
            new TechnologicalInstruction
            {
                IdFromSystem = "52",
                Name = "Инструкция 52",
                Number = 52,
                WeldPassageInstructions = new List<WeldPassageInstruction>
                {
                    new()
                    {
                        Name = "Корневой",
                        Number = 1,
                        WeldingCurrentMin = 200,
                        WeldingCurrentMax = 270,
                        ArcVoltageMin = 23,
                        ArcVoltageMax = 26
                    },
                    new()
                    {
                        Name = "Заполняющий",
                        Number = 2,
                        WeldingCurrentMin = 270,
                        WeldingCurrentMax = 310,
                        ArcVoltageMin = 23,
                        ArcVoltageMax = 26
                    }
                }
            },
            new TechnologicalInstruction
            {
                IdFromSystem = "54",
                Name = "Инструкция 54",
                Number = 54,
                WeldPassageInstructions = new List<WeldPassageInstruction>
                {
                    new()
                    {
                        Name = "Корневой",
                        Number = 1,
                        WeldingCurrentMin = 200,
                        WeldingCurrentMax = 270,
                        ArcVoltageMin = 23,
                        ArcVoltageMax = 26
                    },
                    new()
                    {
                        Name = "Заполняющий",
                        Number = 2,
                        WeldingCurrentMin = 270,
                        WeldingCurrentMax = 310,
                        ArcVoltageMin = 23,
                        ArcVoltageMax = 26
                    }
                }
            },
            new TechnologicalInstruction
            {
                IdFromSystem = "55",
                Name = "Инструкция 55",
                Number = 55,
                WeldPassageInstructions = new List<WeldPassageInstruction>
                {
                    new()
                    {
                        Name = "Корневой",
                        Number = 1,
                        WeldingCurrentMin = 200,
                        WeldingCurrentMax = 270,
                        ArcVoltageMin = 23,
                        ArcVoltageMax = 26
                    },
                    new()
                    {
                        Name = "Заполняющий",
                        Number = 2,
                        WeldingCurrentMin = 270,
                        WeldingCurrentMax = 310,
                        ArcVoltageMin = 23,
                        ArcVoltageMax = 26
                    }
                }
            },
            new TechnologicalInstruction
            {
                IdFromSystem = "56",
                Name = "Инструкция 56",
                Number = 56,
                WeldPassageInstructions = new List<WeldPassageInstruction>
                {
                    new()
                    {
                        Name = "Корневой",
                        Number = 1,
                        WeldingCurrentMin = 200,
                        WeldingCurrentMax = 270,
                        ArcVoltageMin = 23,
                        ArcVoltageMax = 26
                    },
                    new()
                    {
                        Name = "Заполняющий",
                        Number = 2,
                        WeldingCurrentMin = 270,
                        WeldingCurrentMax = 310,
                        ArcVoltageMin = 23,
                        ArcVoltageMax = 26
                    }
                }
            },
            new TechnologicalInstruction
            {
                IdFromSystem = "57",
                Name = "Инструкция 57",
                Number = 57,
                WeldPassageInstructions = new List<WeldPassageInstruction>
                {
                    new()
                    {
                        Name = "Корневой",
                        Number = 1,
                        WeldingCurrentMin = 200,
                        WeldingCurrentMax = 270,
                        ArcVoltageMin = 23,
                        ArcVoltageMax = 26
                    },
                    new()
                    {
                        Name = "Заполняющий",
                        Number = 2,
                        WeldingCurrentMin = 270,
                        WeldingCurrentMax = 310,
                        ArcVoltageMin = 23,
                        ArcVoltageMax = 26
                    }
                }
            },
            new TechnologicalInstruction
            {
                IdFromSystem = "58",
                Name = "Инструкция 58",
                Number = 58,
                WeldPassageInstructions = new List<WeldPassageInstruction>
                {
                    new()
                    {
                        Name = "Корневой",
                        Number = 1,
                        WeldingCurrentMin = 200,
                        WeldingCurrentMax = 270,
                        ArcVoltageMin = 23,
                        ArcVoltageMax = 26
                    },
                    new()
                    {
                        Name = "Заполняющий",
                        Number = 2,
                        WeldingCurrentMin = 270,
                        WeldingCurrentMax = 310,
                        ArcVoltageMin = 23,
                        ArcVoltageMax = 26
                    }
                }
            },
            new TechnologicalInstruction
            {
                IdFromSystem = "1",
                Name = "Инструкция 1",
                Number = 1,
                WeldPassageInstructions = new List<WeldPassageInstruction>
                {
                    new()
                    {
                        Name = "Корневой",
                        Number = 1,
                        WeldingCurrentMin = 200,
                        WeldingCurrentMax = 270,
                        ArcVoltageMin = 23,
                        ArcVoltageMax = 26
                    },
                    new()
                    {
                        Name = "Заполняющий",
                        Number = 2,
                        WeldingCurrentMin = 270,
                        WeldingCurrentMax = 310,
                        ArcVoltageMin = 23,
                        ArcVoltageMax = 26
                    }
                }
            },
            new TechnologicalInstruction
            {
                IdFromSystem = "2",
                Name = "Инструкция 2",
                Number = 2,
                WeldPassageInstructions = new List<WeldPassageInstruction>
                {
                    new()
                    {
                        Name = "Корневой",
                        Number = 1,
                        WeldingCurrentMin = 200,
                        WeldingCurrentMax = 270,
                        ArcVoltageMin = 23,
                        ArcVoltageMax = 26
                    },
                    new()
                    {
                        Name = "Заполняющий",
                        Number = 2,
                        WeldingCurrentMin = 270,
                        WeldingCurrentMax = 310,
                        ArcVoltageMin = 23,
                        ArcVoltageMax = 26
                    }
                }
            },
            new TechnologicalInstruction
            {
                IdFromSystem = "48",
                Name = "Инструкция 48",
                Number = 48,
                WeldPassageInstructions = new List<WeldPassageInstruction>
                {
                    new()
                    {
                        Name = "Корневой",
                        Number = 1,
                        WeldingCurrentMin = 200,
                        WeldingCurrentMax = 270,
                        ArcVoltageMin = 23,
                        ArcVoltageMax = 26
                    },
                    new()
                    {
                        Name = "Заполняющий",
                        Number = 2,
                        WeldingCurrentMin = 270,
                        WeldingCurrentMax = 310,
                        ArcVoltageMin = 23,
                        ArcVoltageMax = 26
                    }
                }
            },
        };

        context.TechnologicalInstructions.AddRange(technologicalInstructions);
        await context.SaveChangesAsync();
    }
}
