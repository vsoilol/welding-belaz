using Belaz.WeldingApp.WeldingApi.Domain.Entities.CalendarInfo;
using Belaz.WeldingApp.WeldingApi.Domain.Entities.IdentityUser;
using Belaz.WeldingApp.WeldingApi.Domain.Entities.ProductInfo;
using Belaz.WeldingApp.WeldingApi.Domain.Entities.Production;
using Belaz.WeldingApp.WeldingApi.Domain.Entities.TaskInfo;
using Belaz.WeldingApp.WeldingApi.Domain.Entities.Users;
using Belaz.WeldingApp.WeldingApi.Domain.Entities.WeldingEquipmentInfo;
using Microsoft.EntityFrameworkCore;
using WeldingApp.Common.Enums;

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

        if (!context.Products.Any())
        {
            await AddProducts(context);
        }

        /*

        if (!context.Products.Any())
        {
            await AddProducts(context);
        }

        if (!context.TechnologicalProcesses.Any())
        {
            await AddTechnologicalProcesses(context);
        }

        if (!context.WeldingTasks.Any())
        {
            await AddWeldingTasks(context);
        }*/
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
            new DowntimeReason
            {
                Reason = "Нерабочее время по графику согласно сменности"
            },
            new DowntimeReason
            {
                Reason = "Праздники и выходные"
            },
            new DowntimeReason
            {
                Reason = "Обед"
            },
            new DowntimeReason
            {
                Reason = "Плановый ремонт централизованными службами"
            },
            new DowntimeReason
            {
                Reason = "Аварийный ремонт централизованными службами"
            },
            new DowntimeReason
            {
                Reason = "Отсутствие заданий"
            },
            new DowntimeReason
            {
                Reason = "Отсутствие материала, заготовок, деталей"
            },
            new DowntimeReason
            {
                Reason = "Отсутствие инструмента, оснастки вспомогательного оборудования"
            },
            new DowntimeReason
            {
                Reason = "Отсутствие крана, транспорта"
            },
            new DowntimeReason
            {
                Reason = "Отсутствие оператора в связи с необеспеченностью"
            },
            new DowntimeReason
            {
                Reason = "Неявка оператора (б/лист, отпуск, и пр.)"
            },
            new DowntimeReason
            {
                Reason = "Отсутствие энергоносителей"
            },
            new DowntimeReason
            {
                Reason = "Отсутствие сотрудника ОТК"
            },
            new DowntimeReason
            {
                Reason = "Отсутствие конструктора, технолога или ожидание его решения"
            },
            new DowntimeReason
            {
                Reason = "Естественные надобности"
            },
            new DowntimeReason
            {
                Reason = "Ознакомление с работой, документацией, инструктаж"
            },
            new DowntimeReason
            {
                Reason =
                    "Переналадка оборудования, получение инструмента до начала работы, снятие/сдача по окончании работы"
            },
            new DowntimeReason
            {
                Reason = "Работа с управляющей программой"
            },
            new DowntimeReason
            {
                Reason = "Установка, выверка, снятие детали"
            },
            new DowntimeReason
            {
                Reason = "Установка, выверка, снятие детали"
            },
            new DowntimeReason
            {
                Reason = "Изменение режимов, смена инструмента, приспособления"
            },
            new DowntimeReason
            {
                Reason = "Контроль на рабочем месте"
            },
            new DowntimeReason
            {
                Reason = "Уборка, осмотр оборудования, чистка/смазка оборудования"
            },
            new DowntimeReason
            {
                Reason = "Сборочные операции"
            },
            new DowntimeReason
            {
                Reason = "Работа по карте несоответствий"
            }
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
                Name = "Цех 50",
                IdFromSystem = "050",
                Number = 50,
                ProductionAreas = new List<ProductionArea>
                {
                    new ProductionArea
                    {
                        Name = "Сборка, сварка мостов",
                        Number = 1,
                        IdFromSystem = "01",
                        Posts = new List<Post>
                        {
                            new Post
                            {
                                Number = 1,
                                Name = "Пост 1"
                            }
                        },
                        Workplaces = new List<Workplace>
                        {
                            new Workplace
                            {
                                Number = 2150,
                                IdFromSystem = "2150"
                            },
                            new Workplace
                            {
                                Number = 2130,
                                IdFromSystem = "2130"
                            },
                            new Workplace
                            {
                                Number = 2050,
                                IdFromSystem = "2050"
                            }
                        }
                    },
                    new ProductionArea
                    {
                        Name = "Сборка, сварка узл. и рам к/с г/п 120-220т",
                        Number = 4,
                        IdFromSystem = "04",
                        Posts = new List<Post>
                        {
                            new Post
                            {
                                Number = 2,
                                Name = "Пост 2"
                            }
                        },
                        Workplaces = new List<Workplace>
                        {
                            new Workplace
                            {
                                Number = 1280,
                                IdFromSystem = "1280"
                            },
                            new Workplace
                            {
                                Number = 1400,
                                IdFromSystem = "1400"
                            },
                            new Workplace
                            {
                                Number = 1390,
                                IdFromSystem = "1390"
                            },
                            new Workplace
                            {
                                Number = 1380,
                                IdFromSystem = "1380"
                            },
                            new Workplace
                            {
                                Number = 1270,
                                IdFromSystem = "1270"
                            },
                            new Workplace
                            {
                                Number = 1260,
                                IdFromSystem = "1260"
                            },
                            new Workplace
                            {
                                Number = 1550,
                                IdFromSystem = "1550"
                            },
                            new Workplace
                            {
                                Number = 1360,
                                IdFromSystem = "1360"
                            }
                        }
                    }
                }
            },
            new Workshop
            {
                Name = "Цех 480",
                IdFromSystem = "480",
                Number = 480,
                ProductionAreas = new List<ProductionArea>
                {
                    new ProductionArea
                    {
                        Name = "Производственный участок 5",
                        Number = 5,
                        IdFromSystem = "05"
                    },
                }
            }
        };

        context.Workshops.AddRange(workshops);
        await context.SaveChangesAsync();
    }

    private static async Task AddWeldingEquipmentsAsync(ApplicationContext context)
    {
        var weldingEquipments = new List<WeldingEquipment>
        {
            new WeldingEquipment
            {
                IdFromSystem = "8008336102-130",
                Name = "QINEO TRONIC",
                Marking = "ECO600CQWDM2",
                FactoryNumber = "49451",
                CommissioningDate = new DateTime(2013, 1, 1),
                GroupNumber = "3.11",
                ManufacturerName = "CLOOS",
                WeldingProcess = "Полуавтоматическая сварка",
                WeldingCurrentMin = 10,
                WeldingCurrentMax = 500,
                ArcVoltageMin = 14.5,
                ArcVoltageMax = 39,
                LoadDuration = 100,
                IdleVoltage = 70,
            },
            new WeldingEquipment
            {
                IdFromSystem = "162",
                Name = "QINEO TRONIC",
                Marking = "ECO600CQWDM2",
                FactoryNumber = "49506",
                CommissioningDate = new DateTime(2013, 1, 1),
                GroupNumber = "3.11",
                ManufacturerName = "CLOOS",
                WeldingProcess = "Полуавтоматическая сварка"
            },
            new WeldingEquipment
            {
                IdFromSystem = "146",
                Name = "QINEO TRONIC",
                Marking = "ECO600CQWDM2",
                FactoryNumber = "49504",
                CommissioningDate = new DateTime(2013, 1, 1),
                GroupNumber = "3.11",
                ManufacturerName = "CLOOS",
                WeldingProcess = "Полуавтоматическая сварка"
            },
            new WeldingEquipment
            {
                IdFromSystem = "114",
                Name = "QINEO TRONIC",
                Marking = "ECO600CQWDM2",
                FactoryNumber = "49505",
                CommissioningDate = new DateTime(2013, 1, 1),
                GroupNumber = "3.11",
                ManufacturerName = "CLOOS",
                WeldingProcess = "Полуавтоматическая сварка"
            }
        };

        await context.WeldingEquipments.AddRangeAsync(weldingEquipments);
        await context.SaveChangesAsync();
    }

    private static async Task AddInspectors(ApplicationContext context)
    {
        var techUserRole = (await context.Roles.FirstOrDefaultAsync(_ => _.Name == nameof(Role.TechUser)))!;
        var productionArea = await context.ProductionAreas.FirstOrDefaultAsync(_ => _.IdFromSystem == "05");

        var inspectors = new List<Inspector>
        {
            new Inspector
            {
                IdFromSystem = "235565",
                UserInfo = new UserData
                {
                    ServiceNumber = "35565",
                    MiddleName = "Долгая",
                    FirstName = "Татьяна",
                    LastName = "Стефановна",
                    Position = "Контролер сварочных работ",
                    ProductionArea = productionArea,
                    UserRoles = new List<UserRole>
                    {
                        new UserRole
                        {
                            Role = techUserRole
                        }
                    }
                }
            },
            new Inspector
            {
                IdFromSystem = "256467",
                UserInfo = new UserData
                {
                    ServiceNumber = "56467",
                    MiddleName = "Михальченко",
                    FirstName = "Елена",
                    LastName = "Викторовна",
                    Position = "Контролер сварочных работ",
                    ProductionArea = productionArea,
                    UserRoles = new List<UserRole>
                    {
                        new UserRole
                        {
                            Role = techUserRole
                        }
                    }
                },
            },
            new Inspector
            {
                IdFromSystem = "251534",
                UserInfo = new UserData
                {
                    ServiceNumber = "51534",
                    MiddleName = "Люцко",
                    FirstName = "Ирина",
                    LastName = "Алексеевна",
                    Position = "Контролер сварочных работ",
                    ProductionArea = productionArea,
                    UserRoles = new List<UserRole>
                    {
                        new UserRole
                        {
                            Role = techUserRole
                        }
                    }
                },
            }
        };

        context.Inspectors.AddRange(inspectors);
        await context.SaveChangesAsync();
    }

    private static async Task AddMasters(ApplicationContext context)
    {
        var masterRole = (await context.Roles.FirstOrDefaultAsync(_ => _.Name == nameof(Role.Master)))!;
        var productionArea4 = await context.ProductionAreas.FirstOrDefaultAsync(_ => _.IdFromSystem == "04");
        var productionArea1 = await context.ProductionAreas.FirstOrDefaultAsync(_ => _.IdFromSystem == "01");

        var masters = new List<Master>
        {
            new Master
            {
                IdFromSystem = "613668",
                UserInfo = new UserData
                {
                    ServiceNumber = "13668",
                    MiddleName = "Яичкин",
                    FirstName = "Павел",
                    LastName = "Анатольевич",
                    Position = "Старший мастер производственного участка",
                    ProductionArea = productionArea4,
                    UserRoles = new List<UserRole>
                    {
                        new UserRole
                        {
                            Role = masterRole
                        }
                    }
                },
            },
            new Master
            {
                IdFromSystem = "612000",
                UserInfo = new UserData
                {
                    ServiceNumber = "12000",
                    MiddleName = "Подобед",
                    FirstName = "Денис",
                    LastName = "Александрович",
                    Position = "Мастер производственного участка",
                    ProductionArea = productionArea4,
                    UserRoles = new List<UserRole>
                    {
                        new UserRole
                        {
                            Role = masterRole
                        }
                    }
                },
            },
            new Master
            {
                IdFromSystem = "643759",
                UserInfo = new UserData
                {
                    ServiceNumber = "43759",
                    MiddleName = "Шаврук",
                    FirstName = "Игорь",
                    LastName = "Сергеевич",
                    Position = "Мастер производственного участка",
                    ProductionArea = productionArea4,
                    UserRoles = new List<UserRole>
                    {
                        new UserRole
                        {
                            Role = masterRole
                        }
                    }
                },
            },
            new Master
            {
                IdFromSystem = "617215",
                UserInfo = new UserData
                {
                    ServiceNumber = "17215",
                    MiddleName = "Слабухо",
                    FirstName = "Сергей",
                    LastName = "Николаевич",
                    Position = "Старший мастер производственного участка",
                    ProductionArea = productionArea1,
                    UserRoles = new List<UserRole>
                    {
                        new UserRole
                        {
                            Role = masterRole
                        }
                    }
                },
            },
            new Master
            {
                IdFromSystem = "614208",
                UserInfo = new UserData
                {
                    ServiceNumber = "14208",
                    MiddleName = "Кузьминский",
                    FirstName = "Александр",
                    LastName = "Михайлович",
                    Position = "Мастер производственного участка",
                    ProductionArea = productionArea1,
                    UserRoles = new List<UserRole>
                    {
                        new UserRole
                        {
                            Role = masterRole
                        }
                    }
                },
            }
        };

        context.Masters.AddRange(masters);
        await context.SaveChangesAsync();
    }

    private static async Task AddWelders(ApplicationContext context)
    {
        var productionArea4 = await context.ProductionAreas.FirstOrDefaultAsync(_ => _.IdFromSystem == "04");
        var productionArea1 = await context.ProductionAreas.FirstOrDefaultAsync(_ => _.IdFromSystem == "01");

        var weldingEquipment =
            (await context.WeldingEquipments.FirstOrDefaultAsync(_ => _.IdFromSystem == "8008336102-130"))!;
        var weldingEquipment162 = (await context.WeldingEquipments.FirstOrDefaultAsync(_ => _.IdFromSystem == "162"))!;
        var weldingEquipment114 = (await context.WeldingEquipments.FirstOrDefaultAsync(_ => _.IdFromSystem == "114"))!;
        var weldingEquipment146 = (await context.WeldingEquipments.FirstOrDefaultAsync(_ => _.IdFromSystem == "146"))!;

        var welderRole = (await context.Roles.FirstOrDefaultAsync(_ => _.Name == nameof(Role.Executor)))!;

        var welders = new List<Welder>
        {
            new Welder
            {
                IdFromSystem = "121537",
                WeldingEquipments = new List<WeldingEquipment> { weldingEquipment },
                UserInfo = new UserData
                {
                    ServiceNumber = "21537",
                    MiddleName = "Денисенко",
                    FirstName = "Александр",
                    LastName = "Николаевич",
                    Position = "Электросварщик на автоматических и полуавтоматических машинах",
                    ProductionArea = productionArea4,
                    UserRoles = new List<UserRole>
                    {
                        new UserRole
                        {
                            Role = welderRole
                        }
                    }
                }
            },
            new Welder
            {
                IdFromSystem = "121538",
                WeldingEquipments = new List<WeldingEquipment> { weldingEquipment },
                UserInfo = new UserData
                {
                    ServiceNumber = "21538",
                    MiddleName = "Денисенко",
                    FirstName = "Василий",
                    LastName = "Николаевич",
                    Position = "Электросварщик на автоматических и полуавтоматических машинах",
                    ProductionArea = productionArea4,
                    UserRoles = new List<UserRole>
                    {
                        new UserRole
                        {
                            Role = welderRole
                        }
                    }
                }
            },
            new Welder
            {
                IdFromSystem = "152365",
                WeldingEquipments = new List<WeldingEquipment> { weldingEquipment },
                UserInfo = new UserData
                {
                    ServiceNumber = "52365",
                    MiddleName = "Ходот",
                    FirstName = "Павел",
                    LastName = "Антонович",
                    Position = "Электросварщик на автоматических и полуавтоматических машинах",
                    ProductionArea = productionArea4,
                    UserRoles = new List<UserRole>
                    {
                        new UserRole
                        {
                            Role = welderRole
                        }
                    }
                }
            },
            new Welder
            {
                IdFromSystem = "147329",
                WeldingEquipments = new List<WeldingEquipment> { weldingEquipment },
                UserInfo = new UserData
                {
                    ServiceNumber = "47329",
                    MiddleName = "Пучнин",
                    FirstName = "Егор",
                    LastName = "Николаевич",
                    Position = "Электросварщик на автоматических и полуавтоматических машинах",
                    ProductionArea = productionArea4,
                    UserRoles = new List<UserRole>
                    {
                        new UserRole
                        {
                            Role = welderRole
                        }
                    }
                }
            },
            new Welder
            {
                IdFromSystem = "156298",
                WeldingEquipments = new List<WeldingEquipment> { weldingEquipment },
                UserInfo = new UserData
                {
                    ServiceNumber = "56298",
                    MiddleName = "Распутин",
                    FirstName = "Вячеслав",
                    LastName = "Сергеевич",
                    Position = "Электросварщик на автоматических и полуавтоматических машинах",
                    ProductionArea = productionArea4,
                    UserRoles = new List<UserRole>
                    {
                        new UserRole
                        {
                            Role = welderRole
                        }
                    }
                }
            },
            new Welder
            {
                IdFromSystem = "153274",
                WeldingEquipments = new List<WeldingEquipment> { weldingEquipment162 },
                UserInfo = new UserData
                {
                    ServiceNumber = "53274",
                    MiddleName = "Малиновский",
                    FirstName = "Дмитрий",
                    LastName = "Сергеевич",
                    Position = "Электросварщик на автоматических и полуавтоматических машинах",
                    ProductionArea = productionArea4,
                    UserRoles = new List<UserRole>
                    {
                        new UserRole
                        {
                            Role = welderRole
                        }
                    }
                }
            },
            new Welder
            {
                IdFromSystem = "155288",
                WeldingEquipments = new List<WeldingEquipment> { weldingEquipment162 },
                UserInfo = new UserData
                {
                    ServiceNumber = "55288",
                    MiddleName = "Редько",
                    FirstName = "Иван",
                    LastName = "Игоревич",
                    Position = "Электросварщик на автоматических и полуавтоматических машинах",
                    ProductionArea = productionArea4,
                    UserRoles = new List<UserRole>
                    {
                        new UserRole
                        {
                            Role = welderRole
                        }
                    }
                }
            },
            new Welder
            {
                IdFromSystem = "151861",
                WeldingEquipments = new List<WeldingEquipment> { weldingEquipment162 },
                UserInfo = new UserData
                {
                    ServiceNumber = "51861",
                    MiddleName = "Спиридонов",
                    FirstName = "Александр",
                    LastName = "Николаевич",
                    Position = "Электросварщик на автоматических и полуавтоматических машинах",
                    ProductionArea = productionArea4,
                    UserRoles = new List<UserRole>
                    {
                        new UserRole
                        {
                            Role = welderRole
                        }
                    }
                }
            },
            new Welder
            {
                IdFromSystem = "152441",
                WeldingEquipments = new List<WeldingEquipment> { weldingEquipment162 },
                UserInfo = new UserData
                {
                    ServiceNumber = "52441",
                    MiddleName = "Баркетов",
                    FirstName = "Максим",
                    LastName = "Александрович",
                    Position = "Электросварщик на автоматических и полуавтоматических машинах",
                    ProductionArea = productionArea4,
                    UserRoles = new List<UserRole>
                    {
                        new UserRole
                        {
                            Role = welderRole
                        }
                    }
                }
            },
            new Welder
            {
                IdFromSystem = "150402",
                WeldingEquipments = new List<WeldingEquipment> { weldingEquipment146 },
                UserInfo = new UserData
                {
                    ServiceNumber = "50402",
                    MiddleName = "Смородин",
                    FirstName = "Александр",
                    LastName = "Сергеевич",
                    Position = "Электросварщик на автоматических и полуавтоматических машинах",
                    ProductionArea = productionArea4,
                    UserRoles = new List<UserRole>
                    {
                        new UserRole
                        {
                            Role = welderRole
                        }
                    }
                }
            },
            new Welder
            {
                IdFromSystem = "149921",
                WeldingEquipments = new List<WeldingEquipment> { weldingEquipment146 },
                UserInfo = new UserData
                {
                    ServiceNumber = "49921",
                    MiddleName = "Ильюшонок",
                    FirstName = "Вадим",
                    LastName = "Александрович",
                    Position = "Электросварщик на автоматических и полуавтоматических машинах",
                    ProductionArea = productionArea4,
                    UserRoles = new List<UserRole>
                    {
                        new UserRole
                        {
                            Role = welderRole
                        }
                    }
                }
            },
            new Welder
            {
                IdFromSystem = "152207",
                WeldingEquipments = new List<WeldingEquipment> { weldingEquipment114 },
                UserInfo = new UserData
                {
                    ServiceNumber = "52207",
                    MiddleName = "Курто",
                    FirstName = "Владислав",
                    LastName = "Николаевич",
                    Position = "Электросварщик на автоматических и полуавтоматических машинах",
                    ProductionArea = productionArea1,
                    UserRoles = new List<UserRole>
                    {
                        new UserRole
                        {
                            Role = welderRole
                        }
                    }
                }
            },
            new Welder
            {
                IdFromSystem = "152444",
                WeldingEquipments = new List<WeldingEquipment> { weldingEquipment114 },
                UserInfo = new UserData
                {
                    ServiceNumber = "52444",
                    MiddleName = "Хурсанов",
                    FirstName = "Сергей",
                    LastName = "Анатольевич",
                    Position = "Электросварщик на автоматических и полуавтоматических машинах",
                    ProductionArea = productionArea1,
                    UserRoles = new List<UserRole>
                    {
                        new UserRole
                        {
                            Role = welderRole
                        }
                    }
                }
            },
            new Welder
            {
                IdFromSystem = "156278",
                WeldingEquipments = new List<WeldingEquipment> { weldingEquipment114 },
                UserInfo = new UserData
                {
                    ServiceNumber = "56278",
                    MiddleName = "Слаёк",
                    FirstName = "Александр",
                    LastName = "Анатольевич",
                    Position = "Электросварщик на автоматических и полуавтоматических машинах",
                    ProductionArea = productionArea1,
                    UserRoles = new List<UserRole>
                    {
                        new UserRole
                        {
                            Role = welderRole
                        }
                    }
                }
            },
        };

        context.Welders.AddRange(welders);
        await context.SaveChangesAsync();
    }

    private static async Task AddChief(ApplicationContext context)
    {
        var chiefRole = (await context.Roles.FirstOrDefaultAsync(_ => _.Name == nameof(Role.Chief)))!;
        var productionArea = await context.ProductionAreas.FirstOrDefaultAsync();

        var chief = new Chief
        {
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
                ProductionArea = productionArea,
                UserRoles = new List<UserRole>
                {
                    new UserRole
                    {
                        Role = chiefRole
                    }
                }
            },
        };

        await context.Chiefs.AddAsync(chief);
        await context.SaveChangesAsync();
    }

    private static async Task AddProducts(ApplicationContext context)
    {
        var productionArea4 = await context.ProductionAreas.FirstOrDefaultAsync(_ => _.IdFromSystem == "04");
        var productionArea1 = await context.ProductionAreas.FirstOrDefaultAsync(_ => _.IdFromSystem == "01");

        var product1 = new Product
        {
            IdFromSystem = "4536467567",
            Number = "75132-2401006-50",
            Name = "Картер заднего моста",
            Status = ProductStatus.NotManufactured,
            ProductType = ProductType.Product,
            ProductionArea = productionArea1,
            TechnologicalProcess = new TechnologicalProcess
            {
                IdFromSystem = "3090319",
                Number = 3090319,
                Name = "Технологический процесс",
                PdmSystemFileLink = "Ссылка"
            },
            ProductInsides = new List<ProductInside>
            {
                new ProductInside
                {
                    InsideProduct = new Product
                    {
                        IdFromSystem = "4536467565",
                        Number = "75132-2401008-50",
                        Name = "Картер заднего моста",
                        Status = ProductStatus.NotManufactured,
                        ProductType = ProductType.Knot,
                        ProductionArea = productionArea1,
                        TechnologicalProcess = new TechnologicalProcess
                        {
                            IdFromSystem = "3232836",
                            Number = 3232836,
                            Name = "Технологический процесс",
                            PdmSystemFileLink = "Ссылка"
                        },
                        ProductInsides = new List<ProductInside>
                        {
                            new ProductInside
                            {
                                InsideProduct = new Product
                                {
                                    IdFromSystem = "4536276803",
                                    Number = "75211-2401122",
                                    Name = "Опора",
                                    Status = ProductStatus.NotManufactured,
                                    ProductType = ProductType.Detail,
                                    ProductionArea = productionArea1,
                                    TechnologicalProcess = new TechnologicalProcess
                                    {
                                        IdFromSystem = "3211246",
                                        Number = 3211246,
                                        Name = "Технологический процесс",
                                        PdmSystemFileLink = "Ссылка"
                                    },
                                }
                            },
                            new ProductInside
                            {
                                InsideProduct = new Product
                                {
                                    IdFromSystem = "4536444153",
                                    Number = "75132-2401106",
                                    Name = "Пластина",
                                    Status = ProductStatus.NotManufactured,
                                    ProductType = ProductType.Detail,
                                    ProductionArea = productionArea1,
                                    TechnologicalProcess = new TechnologicalProcess
                                    {
                                        IdFromSystem = "1003048",
                                        Number = 1003048,
                                        Name = "Технологический процесс",
                                        PdmSystemFileLink = "Ссылка"
                                    },
                                }
                            }
                        }
                    },
                },
                new ProductInside
                {
                    InsideProduct = new Product
                    {
                        IdFromSystem = "4536273956",
                        Number = "7521-2401220",
                        Name = "Кронштейн",
                        Status = ProductStatus.NotManufactured,
                        ProductType = ProductType.Knot,
                        ProductionArea = productionArea1,
                        TechnologicalProcess = new TechnologicalProcess
                        {
                            IdFromSystem = "1362989",
                            Number = 1362989,
                            Name = "Технологический процесс",
                            PdmSystemFileLink = "Ссылка"
                        },
                        ProductInsides = new List<ProductInside>
                        {
                            new ProductInside
                            {
                                InsideProduct = new Product
                                {
                                    IdFromSystem = "4536274170",
                                    Number = "7521-2401224",
                                    Name = "Проушина",
                                    Status = ProductStatus.NotManufactured,
                                    ProductType = ProductType.Detail,
                                    ProductionArea = productionArea1,
                                    TechnologicalProcess = new TechnologicalProcess
                                    {
                                        IdFromSystem = "1124147",
                                        Number = 1124147,
                                        Name = "Технологический процесс",
                                        PdmSystemFileLink = "Ссылка"
                                    },
                                }
                            },
                            new ProductInside
                            {
                                InsideProduct = new Product
                                {
                                    IdFromSystem = "4536273606",
                                    Number = "7521-3932688",
                                    Name = "Распорка",
                                    Status = ProductStatus.NotManufactured,
                                    ProductType = ProductType.Detail,
                                    ProductionArea = productionArea1,
                                    TechnologicalProcess = new TechnologicalProcess
                                    {
                                        IdFromSystem = "908693",
                                        Number = 908693,
                                        Name = "Технологический процесс",
                                        PdmSystemFileLink = "Ссылка"
                                    },
                                }
                            }
                        }
                    }
                },
                new ProductInside
                {
                    InsideProduct = new Product
                    {
                        IdFromSystem = "4536417730",
                        Number = "75132-2105522",
                        Name = "Панель",
                        Status = ProductStatus.NotManufactured,
                        ProductType = ProductType.Detail,
                        ProductionArea = productionArea1,
                        TechnologicalProcess = new TechnologicalProcess
                        {
                            IdFromSystem = "1053809",
                            Number = 1053809,
                            Name = "Технологический процесс",
                            PdmSystemFileLink = "Ссылка"
                        },
                    }
                },
                new ProductInside
                {
                    InsideProduct = new Product
                    {
                        IdFromSystem = "4536461620",
                        Number = "75131-2113296-10",
                        Name = "Кронштейн",
                        Status = ProductStatus.NotManufactured,
                        ProductType = ProductType.Detail,
                        ProductionArea = productionArea1,
                        TechnologicalProcess = new TechnologicalProcess
                        {
                            IdFromSystem = "526870",
                            Number = 526870,
                            Name = "Технологический процесс",
                            PdmSystemFileLink = "Ссылка"
                        },
                    }
                }
            }
        };

        var product2 = new Product
        {
            IdFromSystem = "4536384294",
            Number = "75580-2401006",
            Name = "Картер заднего моста",
            Status = ProductStatus.NotManufactured,
            ProductType = ProductType.Product,
            ProductionArea = productionArea1,
            TechnologicalProcess = new TechnologicalProcess
            {
                IdFromSystem = "2433634",
                Number = 2433634,
                Name = "Технологический процесс",
                PdmSystemFileLink = "Ссылка"
            },
            ProductInsides = new List<ProductInside>
            {
                new()
                {
                    InsideProduct = new Product
                    {
                        IdFromSystem = "4536386240",
                        Number = "75580-2401010-01",
                        Name = "Труба картера заднего моста",
                        Status = ProductStatus.NotManufactured,
                        ProductType = ProductType.Knot,
                        ProductionArea = productionArea1,
                        TechnologicalProcess = new TechnologicalProcess
                        {
                            IdFromSystem = "2915477",
                            Number = 2915477,
                            Name = "Технологический процесс",
                            PdmSystemFileLink = "Ссылка"
                        },
                        ProductInsides = new List<ProductInside>
                        {
                            new()
                            {
                                InsideProduct = new Product
                                {
                                    IdFromSystem = "4536386265",
                                    Number = "75580-2401114-11",
                                    Name = "Фланец картера",
                                    Status = ProductStatus.NotManufactured,
                                    ProductType = ProductType.Detail,
                                    ProductionArea = productionArea1,
                                    TechnologicalProcess = new TechnologicalProcess
                                    {
                                        IdFromSystem = "3338649",
                                        Number = 3338649,
                                        Name = "Технологический процесс",
                                        PdmSystemFileLink = "Ссылка"
                                    },
                                }
                            },
                            new()
                            {
                                InsideProduct = new Product
                                {
                                    IdFromSystem = "4536386250",
                                    Number = "75580-2401132-10",
                                    Name = "Труба картера",
                                    Status = ProductStatus.NotManufactured,
                                    ProductType = ProductType.Detail,
                                    ProductionArea = productionArea1,
                                    TechnologicalProcess = new TechnologicalProcess
                                    {
                                        IdFromSystem = "2822569",
                                        Number = 2822569,
                                        Name = "Технологический процесс",
                                        PdmSystemFileLink = "Ссылка"
                                    },
                                }
                            }
                        }
                    }
                },

                new()
                {
                    InsideProduct = new Product
                    {
                        IdFromSystem = "4536384295",
                        Number = "75580-2401008",
                        Name = "Картер заднего моста",
                        Status = ProductStatus.NotManufactured,
                        ProductType = ProductType.Knot,
                        ProductionArea = productionArea1,
                        TechnologicalProcess = new TechnologicalProcess
                        {
                            IdFromSystem = "3232938",
                            Number = 3232938,
                            Name = "Технологический процесс",
                            PdmSystemFileLink = "Ссылка"
                        },
                        ProductInsides = new List<ProductInside>
                        {
                            new()
                            {
                                InsideProduct = new Product
                                {
                                    IdFromSystem = "4536248270",
                                    Number = "75303-2128438",
                                    Name = "Втулка",
                                    Status = ProductStatus.NotManufactured,
                                    ProductType = ProductType.Detail,
                                    ProductionArea = productionArea1,
                                    TechnologicalProcess = new TechnologicalProcess
                                    {
                                        IdFromSystem = "3011514",
                                        Number = 3011514,
                                        Name = "Технологический процесс",
                                        PdmSystemFileLink = "Ссылка"
                                    },
                                }
                            },
                            new()
                            {
                                InsideProduct = new Product
                                {
                                    IdFromSystem = "4536384312",
                                    Number = "75580-2401227",
                                    Name = "Кольцо",
                                    Status = ProductStatus.NotManufactured,
                                    ProductType = ProductType.Detail,
                                    ProductionArea = productionArea1,
                                    TechnologicalProcess = new TechnologicalProcess
                                    {
                                        IdFromSystem = "1402616",
                                        Number = 1402616,
                                        Name = "Технологический процесс",
                                        PdmSystemFileLink = "Ссылка"
                                    },
                                }
                            }
                        }
                    }
                },

                new()
                {
                    InsideProduct = new Product
                    {
                        IdFromSystem = "4536384399",
                        Number = "75580-2105522",
                        Name = "Панель",
                        Status = ProductStatus.NotManufactured,
                        ProductType = ProductType.Detail,
                        ProductionArea = productionArea1,
                        TechnologicalProcess = new TechnologicalProcess
                        {
                            IdFromSystem = "1405307",
                            Number = 1405307,
                            Name = "Технологический процесс",
                            PdmSystemFileLink = "Ссылка"
                        },
                    }
                },

                new()
                {
                    InsideProduct = new Product
                    {
                        IdFromSystem = "4536384314",
                        Number = "75580-2113192",
                        Name = "Кронштейн",
                        Status = ProductStatus.NotManufactured,
                        ProductType = ProductType.Detail,
                        ProductionArea = productionArea1,
                        TechnologicalProcess = new TechnologicalProcess
                        {
                            IdFromSystem = "1405914",
                            Number = 1405914,
                            Name = "Технологический процесс",
                            PdmSystemFileLink = "Ссылка"
                        },
                    }
                }
            }
        };

        var product3 = new Product
        {
            IdFromSystem = "4536287819",
            Number = "75313-2800010-20",
            Name = "Рама",
            Status = ProductStatus.NotManufactured,
            ProductType = ProductType.Product,
            ProductionArea = productionArea4,
            TechnologicalProcess = new TechnologicalProcess
            {
                IdFromSystem = "3239598",
                Number = 3239598,
                Name = "Технологический процесс",
                PdmSystemFileLink = "Ссылка"
            },
            ProductInsides = new List<ProductInside>
            {
                new()
                {
                    InsideProduct = new Product
                    {
                        IdFromSystem = "4536248707",
                        Number = "75304-1001251",
                        Name = "Кронштейн амортизатора левый",
                        Status = ProductStatus.NotManufactured,
                        ProductType = ProductType.Knot,
                        ProductionArea = productionArea4,
                        TechnologicalProcess = new TechnologicalProcess
                        {
                            IdFromSystem = "1334123",
                            Number = 1334123,
                            Name = "Технологический процесс",
                            PdmSystemFileLink = "Ссылка"
                        },
                        ProductInsides = new List<ProductInside>
                        {
                            new()
                            {
                                InsideProduct = new Product
                                {
                                    IdFromSystem = "4536248708",
                                    Number = "75304-1001253",
                                    Name = "Кронштейн",
                                    Status = ProductStatus.NotManufactured,
                                    ProductType = ProductType.Detail,
                                    ProductionArea = productionArea4,
                                    TechnologicalProcess = new TechnologicalProcess
                                    {
                                        IdFromSystem = "1492964",
                                        Number = 1492964,
                                        Name = "Технологический процесс",
                                        PdmSystemFileLink = "Ссылка"
                                    },
                                }
                            },
                            new()
                            {
                                InsideProduct = new Product
                                {
                                    IdFromSystem = "4536247228",
                                    Number = "75303-1001293",
                                    Name = "Кронштейн",
                                    Status = ProductStatus.NotManufactured,
                                    ProductType = ProductType.Detail,
                                    ProductionArea = productionArea4,
                                    TechnologicalProcess = new TechnologicalProcess
                                    {
                                        IdFromSystem = "3049271",
                                        Number = 3049271,
                                        Name = "Технологический процесс",
                                        PdmSystemFileLink = "Ссылка"
                                    },
                                }
                            }
                        }
                    }
                },

                new()
                {
                    InsideProduct = new Product
                    {
                        IdFromSystem = "4536267493",
                        Number = "75310-1183100",
                        Name = "Кронштейн",
                        Status = ProductStatus.NotManufactured,
                        ProductType = ProductType.Knot,
                        ProductionArea = productionArea4,
                        TechnologicalProcess = new TechnologicalProcess
                        {
                            IdFromSystem = "1823031",
                            Number = 1823031,
                            Name = "Технологический процесс",
                            PdmSystemFileLink = "Ссылка"
                        },
                        ProductInsides = new List<ProductInside>
                        {
                            new()
                            {
                                InsideProduct = new Product
                                {
                                    IdFromSystem = "4536267484",
                                    Number = "75310-1183102",
                                    Name = "Кронштейн",
                                    Status = ProductStatus.NotManufactured,
                                    ProductType = ProductType.Detail,
                                    ProductionArea = productionArea4,
                                    TechnologicalProcess = new TechnologicalProcess
                                    {
                                        IdFromSystem = "1104641",
                                        Number = 1104641,
                                        Name = "Технологический процесс",
                                        PdmSystemFileLink = "Ссылка"
                                    },
                                }
                            },
                            new()
                            {
                                InsideProduct = new Product
                                {
                                    IdFromSystem = "4536267485",
                                    Number = "75310-1183106",
                                    Name = "Кронштейн",
                                    Status = ProductStatus.NotManufactured,
                                    ProductType = ProductType.Detail,
                                    ProductionArea = productionArea4,
                                    TechnologicalProcess = new TechnologicalProcess
                                    {
                                        IdFromSystem = "1119363",
                                        Number = 1119363,
                                        Name = "Технологический процесс",
                                        PdmSystemFileLink = "Ссылка"
                                    },
                                }
                            }
                        }
                    }
                },

                new()
                {
                    InsideProduct = new Product
                    {
                        IdFromSystem = "4536270344",
                        Number = "75211-1018162",
                        Name = "Кронштейн",
                        Status = ProductStatus.NotManufactured,
                        ProductType = ProductType.Detail,
                        ProductionArea = productionArea4,
                        TechnologicalProcess = new TechnologicalProcess
                        {
                            IdFromSystem = "2841119",
                            Number = 2841119,
                            Name = "Технологический процесс",
                            PdmSystemFileLink = "Ссылка"
                        },
                    }
                },
                new()
                {
                    InsideProduct = new Product
                    {
                        IdFromSystem = "4536196288",
                        Number = "549Б-1015842",
                        Name = "Накладка",
                        Status = ProductStatus.NotManufactured,
                        ProductType = ProductType.Detail,
                        ProductionArea = productionArea4,
                        TechnologicalProcess = new TechnologicalProcess
                        {
                            IdFromSystem = "1426226",
                            Number = 1426226,
                            Name = "Технологический процесс",
                            PdmSystemFileLink = "Ссылка"
                        },
                    }
                }
            }
        };

        await context.Products.AddRangeAsync(product1, product2, product3);
        await context.SaveChangesAsync();
    }

    private static async Task AddTechnologicalProcesses(ApplicationContext context)
    {
        var seam = (await context.Seams.FirstOrDefaultAsync(_ => _.Number == 1))!;
        var seam2 = (await context.Seams.FirstOrDefaultAsync(_ => _.Number == 2))!;

        var product = (await context.Products.FirstOrDefaultAsync(_ => _.Number == "4536467567"
                                                                       && _.ProductType == ProductType.Product))!;
        var product2 = (await context.Products.FirstOrDefaultAsync(_ => _.Number == "4536384294"
                                                                        && _.ProductType == ProductType.Product))!;

        var technologicalProcesses = new List<TechnologicalProcess>
        {
            new TechnologicalProcess
            {
                Name = "Технологический процесс 1",
                Products = new List<Product> { product },
                Number = 1,
                PdmSystemFileLink = "Ссылка",
                TechnologicalInstructions = new List<TechnologicalInstruction>
                {
                    new TechnologicalInstruction
                    {
                        Name = "Инструкция 1",
                        Number = 1,
                        Seam = seam
                    }
                }
            },
            new TechnologicalProcess
            {
                Name = "Технологический процесс 2",
                Number = 2,
                PdmSystemFileLink = "Ссылка",
                Products = new List<Product> { product2 },
                TechnologicalInstructions = new List<TechnologicalInstruction>
                {
                    new TechnologicalInstruction
                    {
                        Name = "Инструкция 2",
                        Number = 2,
                        Seam = seam2
                    }
                }
            }
        };

        await context.TechnologicalProcesses.AddRangeAsync(technologicalProcesses);
        await context.SaveChangesAsync();
    }

    private static async Task AddWeldingTasks(ApplicationContext context)
    {
        var seam1 = await context.Seams.FirstOrDefaultAsync(_ => _.Number == 1);
        var seam2 = await context.Seams.FirstOrDefaultAsync(_ => _.Number == 2);

        var tasks = new List<WeldingTask>
        {
            new WeldingTask
            {
                Number = 1,
                WeldingDate = new DateTime(2022, 01, 01),
                BasicMaterial = "Основной материал",
                MainMaterialBatchNumber = "№ сертификата",
                Seam = seam2!,
                WeldingMaterial = "варочные материалы",
                WeldingMaterialBatchNumber = "№ сертификата",
            },
            new WeldingTask
            {
                Number = 2,
                WeldingDate = new DateTime(2022, 01, 01),
                BasicMaterial = "Основной материал",
                MainMaterialBatchNumber = "№ сертификата",
                Seam = seam1!,
                WeldingMaterial = "варочные материалы",
                WeldingMaterialBatchNumber = "№ сертификата",
            }
        };

        await context.WeldingTasks.AddRangeAsync(tasks);
        await context.SaveChangesAsync();
    }
}