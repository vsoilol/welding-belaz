using Belaz.WeldingApp.WeldingApi.Domain.Entities.CalendarInfo;
using Belaz.WeldingApp.WeldingApi.Domain.Entities.IdentityUser;
using Belaz.WeldingApp.WeldingApi.Domain.Entities.ProductInfo;
using Belaz.WeldingApp.WeldingApi.Domain.Entities.Production;
using Belaz.WeldingApp.WeldingApi.Domain.Entities.TaskInfo;
using Belaz.WeldingApp.WeldingApi.Domain.Entities.TechnologicalProcessInfo;
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

        if (!context.WeldingTasks.Any())
        {
            await AddWeldingTasks(context);
        }

        if (!context.TechnologicalProcesses.Any())
        {
            await AddTechnologicalProcesses(context);
        }

        if (!context.TechnologicalInstructions.Any())
        {
            await AddTechnologicalInstruction(context);
        }
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
                    },
                    new ProductionArea
                    {
                        Name = "Сборка, сварка рам к/с г/п 120-130 т.",
                        Number = 6,
                        IdFromSystem = "06",
                        Workplaces = new List<Workplace>
                        {
                            new Workplace
                            {
                                Number = 3520,
                                IdFromSystem = "3520"
                            },
                            new Workplace
                            {
                                Number = 3610,
                                IdFromSystem = "3610"
                            },
                            new Workplace
                            {
                                Number = 3500,
                                IdFromSystem = "3500"
                            },
                            new Workplace
                            {
                                Number = 3590,
                                IdFromSystem = "3590"
                            },
                            new Workplace
                            {
                                Number = 3600,
                                IdFromSystem = "3600"
                            },
                            new Workplace
                            {
                                Number = 3690,
                                IdFromSystem = "3690"
                            },
                            new Workplace
                            {
                                Number = 3650,
                                IdFromSystem = "3650"
                            },
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
            },
            new WeldingEquipment
            {
                IdFromSystem = "508",
                Name = "GLC556-C",
                Marking = "GLC556-C",
                FactoryNumber = "49225",
                CommissioningDate = new DateTime(2008, 1, 1),
                GroupNumber = "3.11",
                ManufacturerName = "CLOOS",
                WeldingProcess = "Полуавтоматическая сварка"
            },
            new WeldingEquipment
            {
                IdFromSystem = "535",
                Name = "GLC556-C",
                Marking = "GLC556-C",
                FactoryNumber = "49286",
                CommissioningDate = new DateTime(2010, 1, 1),
                GroupNumber = "3.11",
                ManufacturerName = "CLOOS",
                WeldingProcess = "Полуавтоматическая сварка"
            },
            new WeldingEquipment
            {
                IdFromSystem = "511",
                Name = "GLC556-C",
                Marking = "GLC556-C",
                FactoryNumber = "49232",
                CommissioningDate = new DateTime(2008, 1, 1),
                GroupNumber = "3.11",
                ManufacturerName = "CLOOS",
                WeldingProcess = "Полуавтоматическая сварка"
            },
            new WeldingEquipment
            {
                IdFromSystem = "499",
                Name = "GLC556-C",
                Marking = "GLC556-C",
                FactoryNumber = "49283",
                CommissioningDate = new DateTime(2008, 1, 1),
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
        var techUserRole = (await context.Roles.FirstOrDefaultAsync(_ => _.Name == nameof(Role.Inspector)))!;
        var productionArea = await context.ProductionAreas.FirstOrDefaultAsync(_ => _.IdFromSystem == "05");
        var productionArea6 = await context.ProductionAreas.FirstOrDefaultAsync(_ => _.IdFromSystem == "06");

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
        var productionArea6 = await context.ProductionAreas.FirstOrDefaultAsync(_ => _.IdFromSystem == "06");

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
                IdFromSystem = "610422",
                UserInfo = new UserData
                {
                    ServiceNumber = "10422",
                    MiddleName = "Беляцкий",
                    FirstName = "Сергей",
                    LastName = "Николаевич",
                    Position = "Мастер производственного участка",
                    ProductionArea = productionArea6,
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
        var productionArea6 = await context.ProductionAreas.FirstOrDefaultAsync(_ => _.IdFromSystem == "06");

        var weldingEquipment =
            (await context.WeldingEquipments.FirstOrDefaultAsync(_ => _.IdFromSystem == "8008336102-130"))!;
        var weldingEquipment162 = (await context.WeldingEquipments.FirstOrDefaultAsync(_ => _.IdFromSystem == "162"))!;
        var weldingEquipment114 = (await context.WeldingEquipments.FirstOrDefaultAsync(_ => _.IdFromSystem == "114"))!;
        var weldingEquipment146 = (await context.WeldingEquipments.FirstOrDefaultAsync(_ => _.IdFromSystem == "146"))!;
        var weldingEquipment508 = (await context.WeldingEquipments
            .FirstOrDefaultAsync(_ => _.IdFromSystem == "508"))!;
        var weldingEquipment535 = (await context.WeldingEquipments
            .FirstOrDefaultAsync(_ => _.IdFromSystem == "535"))!;
        var weldingEquipment511 = (await context.WeldingEquipments
            .FirstOrDefaultAsync(_ => _.IdFromSystem == "511"))!;
        var weldingEquipment499 = (await context.WeldingEquipments
            .FirstOrDefaultAsync(_ => _.IdFromSystem == "499"))!;
        
        var workplace3520 = (await context.Workplaces.FirstOrDefaultAsync(_ => _.Number == 3520))!;
        var workplace3610 = (await context.Workplaces.FirstOrDefaultAsync(_ => _.Number == 3610))!;
        var workplace3500 = (await context.Workplaces.FirstOrDefaultAsync(_ => _.Number == 3500))!;
        var workplace3590 = (await context.Workplaces.FirstOrDefaultAsync(_ => _.Number == 3590))!;
        var workplace3600 = (await context.Workplaces.FirstOrDefaultAsync(_ => _.Number == 3600))!;
        var workplace3690 = (await context.Workplaces.FirstOrDefaultAsync(_ => _.Number == 3690))!;
        var workplace3650 = (await context.Workplaces.FirstOrDefaultAsync(_ => _.Number == 3650))!;

        var welderRole = (await context.Roles.FirstOrDefaultAsync(_ => _.Name == nameof(Role.Welder)))!;

        var welders = new List<Welder>
        {
            new Welder
            {
                IdFromSystem = "151299",
                WeldingEquipments = new List<WeldingEquipment> { weldingEquipment499 },
                Workplace = workplace3650,
                UserInfo = new UserData
                {
                    ServiceNumber = "51299",
                    MiddleName = "Михолап",
                    FirstName = "Василий",
                    LastName = "Васильевич",
                    Position = "Электросварщик на автоматических и полуавтоматических машинах",
                    ProductionArea = productionArea6,
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
                IdFromSystem = "150882",
                WeldingEquipments = new List<WeldingEquipment> { weldingEquipment499 },
                Workplace = workplace3690,
                UserInfo = new UserData
                {
                    ServiceNumber = "50882",
                    MiddleName = "Буландо",
                    FirstName = "Юрий",
                    LastName = "Сергеевич",
                    Position = "Электросварщик на автоматических и полуавтоматических машинах",
                    ProductionArea = productionArea6,
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
                IdFromSystem = "121267",
                WeldingEquipments = new List<WeldingEquipment> { weldingEquipment511 },
                Workplace = workplace3600,
                UserInfo = new UserData
                {
                    ServiceNumber = "21267",
                    MiddleName = "Казинец",
                    FirstName = "Василий",
                    LastName = "Владимирович",
                    Position = "Электросварщик на автоматических и полуавтоматических машинах",
                    ProductionArea = productionArea6,
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
                IdFromSystem = "117390",
                WeldingEquipments = new List<WeldingEquipment> { weldingEquipment511 },
                Workplace = workplace3610,
                UserInfo = new UserData
                {
                    ServiceNumber = "17390",
                    MiddleName = "Казачёнок",
                    FirstName = "Сергей",
                    LastName = "Анатольевич",
                    Position = "Электросварщик на автоматических и полуавтоматических машинах",
                    ProductionArea = productionArea6,
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
                IdFromSystem = "145092",
                WeldingEquipments = new List<WeldingEquipment> { weldingEquipment535 },
                Workplace = workplace3590,
                UserInfo = new UserData
                {
                    ServiceNumber = "45092",
                    MiddleName = "Козылев",
                    FirstName = "Антон",
                    LastName = "Павлович",
                    Position = "Электросварщик на автоматических и полуавтоматических машинах",
                    ProductionArea = productionArea6,
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
                IdFromSystem = "132695",
                WeldingEquipments = new List<WeldingEquipment> { weldingEquipment535 },
                Workplace = workplace3500,
                UserInfo = new UserData
                {
                    ServiceNumber = "32695",
                    MiddleName = "Виторский",
                    FirstName = "Владимир",
                    LastName = "Францевич",
                    Position = "Электросварщик на автоматических и полуавтоматических машинах",
                    ProductionArea = productionArea6,
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
                IdFromSystem = "146325",
                WeldingEquipments = new List<WeldingEquipment> { weldingEquipment508 },
                Workplace = workplace3610,
                UserInfo = new UserData
                {
                    ServiceNumber = "46325",
                    MiddleName = "Канапацкий",
                    FirstName = "Олег",
                    LastName = "Дмитриевич",
                    Position = "Электросварщик на автоматических и полуавтоматических машинах",
                    ProductionArea = productionArea6,
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
                IdFromSystem = "120756",
                WeldingEquipments = new List<WeldingEquipment> { weldingEquipment508 },
                Workplace = workplace3520,
                UserInfo = new UserData
                {
                    ServiceNumber = "20756",
                    MiddleName = "Авхимович",
                    FirstName = "Пётр",
                    LastName = "Алексеевич",
                    Position = "Электросварщик на автоматических и полуавтоматических машинах",
                    ProductionArea = productionArea6,
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
            },
            Seams = new List<Seam>
            {
                new Seam
                {
                    Number = 1,
                    Length = 111,
                    IsControlSubject = true,
                    ProductionArea = productionArea1,
                },
                new Seam
                {
                    Number = 2,
                    Length = 222,
                    IsControlSubject = true,
                    ProductionArea = productionArea1,
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
            },
            Seams = new List<Seam>
            {
                new Seam
                {
                    Number = 3,
                    Length = 333,
                    IsControlSubject = true,
                    ProductionArea = productionArea1,
                },
                new Seam
                {
                    Number = 4,
                    Length = 222,
                    IsControlSubject = true,
                    ProductionArea = productionArea1,
                }
            }
        };

        await context.Products.AddRangeAsync(product1, product2, product3);
        await context.SaveChangesAsync();
    }

    private static async Task AddWeldingTasks(ApplicationContext context)
    {
        var productionArea4 = await context.ProductionAreas.FirstOrDefaultAsync(_ => _.IdFromSystem == "04");

        var welderRole = (await context.Roles.FirstOrDefaultAsync(_ => _.Name == nameof(Role.Welder)))!;
        var masterRole = (await context.Roles.FirstOrDefaultAsync(_ => _.Name == nameof(Role.Master)))!;
        var inspectorRole = (await context.Roles.FirstOrDefaultAsync(_ => _.Name == nameof(Role.Inspector)))!;

        var detail = (await context.Products.FirstOrDefaultAsync(_ => _.IdFromSystem == "4536276803"))!;
        var detailWithoutKnot = (await context.Products.FirstOrDefaultAsync(_ => _.IdFromSystem == "4536384399"))!;

        var welder = new Welder
        {
            UserInfo = new UserData
            {
                ServiceNumber = "21537",
                MiddleName = "Денисенко",
                FirstName = "Александр",
                LastName = "Николаевич",
                Position = "Электросварщик на автоматических и полуавтоматических машинах",
                CertificateValidityPeriod = new DateTime(2023, 5, 12),
                ProductionArea = productionArea4,
                UserRoles = new List<UserRole>
                {
                    new UserRole
                    {
                        Role = welderRole
                    }
                }
            }
        };

        var master = new Master
        {
            UserInfo = new UserData
            {
                ServiceNumber = "13668",
                MiddleName = "Яичкин",
                FirstName = "Павел",
                LastName = "Анатольевич",
                Position = "Старший мастер производственного участка",
                ProductionArea = productionArea4,
                CertificateValidityPeriod = new DateTime(2021, 1, 30),
                UserRoles = new List<UserRole>
                {
                    new UserRole
                    {
                        Role = masterRole
                    }
                }
            },
        };

        var inspector = new Inspector
        {
            IdFromSystem = "235565",
            UserInfo = new UserData
            {
                ServiceNumber = "35565",
                MiddleName = "Долгая",
                FirstName = "Татьяна",
                LastName = "Стефановна",
                Position = "Контролер сварочных работ",
                ProductionArea = productionArea4,
                CertificateValidityPeriod = new DateTime(2023, 1, 30),
                UserRoles = new List<UserRole>
                {
                    new UserRole
                    {
                        Role = inspectorRole
                    }
                }
            }
        };

        detail.Master = master;
        detailWithoutKnot.Master = master;

        await context.SaveChangesAsync();

        /*var endedAt = startedAt.AddSeconds(0.1 * taskData.MachineData.Voltages.Count);
        var time = TimeSpan.FromSeconds(endedAt.Subtract(startedAt).TotalSeconds).ToString(@"mm\:ss");*/

        var voltageValues1 = new[]
        {
            23.2, 25.3, 26.8, 23.8, 27.0, 24.9, 25.3, 25.0, 24.6, 24.9, 23.8, 25.0, 25.0, 22.4, 21.2, 21.4, 21.0, 20.9,
            20.7, 21.5, 20.6, 20.39, 20.3, 22.1, 21.2, 19.7, 22.1, 21.4, 21.5, 20.7, 18.89, 21.0, 20.8, 19.7, 21.6,
            19.6, 22.1, 20.0, 18.0, 21.6, 19.2, 19.0, 20.0, 20.2, 17.6, 19.0, 20.1, 18.7, 18.2, 20.2, 18.3, 19.6, 17.7,
            19.6, 16.8, 30.3, 17.1, 30.9, 16.89, 17.8, 15.7, 18.5, 22.0, 18.3, 17.8, 16.2, 17.1, 18.0, 25.9, 22.8, 22.7,
            57.3, 21.8, 27.4, 18.2, 18.0, 18.1, 14.7, 15.6, 15.4, 15.9, 16.7, 14.8, 15.2, 16.2, 13.1, 16.0, 13.6, 17.8,
            17.1, 16.2, 11.9, 16.5, 17.8, 16.8, 14.3, 13.2, 12.0, 12.2, 15.6, 9.5, 13.4, 18.39, 59.3, 63.4, 39.6, 44.7,
            14.7, 11.5, 10.6, 45.3, 21.8, 18.7, 38.7, 10.6, 15.6, 14.6, 14.7, 14.1, 11.6, 25.8, 17.5, 13.9, 34.79,
            19.89, 14.9, 10.5, 18.7, 15.9, 15.8, 12.2, 16.5, 41.2, 28.1, 36.2, 10.1, 14.0, 29.0, 29.0, 8.8, 57.5, 56.4,
            23.1, 8.8, 23.4, 14.8, 22.5, 43.1, 9.3, 20.6, 33.1, 29.8, 17.8, 11.8, 35.9, 9.9, 18.8, 15.1, 15.4, 13.6,
            49.0, 56.6, 10.4, 16.1, 13.9, 13.6, 14.5, 16.6, 14.8, 17.5, 16.8, 17.5, 13.7, 18.1, 47.1, 12.2, 16.2, 19.0,
            17.3, 15.5, 19.8, 14.4, 21.2, 15.7, 32.79, 48.6, 16.3, 20.2, 15.4, 19.3, 16.7, 17.5, 18.6, 18.39, 17.89,
            19.0, 17.1, 20.6, 16.2, 64.7, 22.5, 21.1, 18.0, 24.6, 19.0, 23.5, 17.8, 19.7, 20.6, 17.89, 18.7, 18.39,
            19.1, 18.8, 19.6, 21.4, 19.7, 18.39, 20.5, 19.6, 18.8, 20.3, 19.0, 20.39, 19.3, 19.6, 19.39, 20.3, 20.5,
            19.5, 20.0, 20.0, 19.6, 20.0, 19.7, 19.7, 20.1, 19.5, 19.89, 20.5, 19.6, 20.2, 19.89, 20.2, 20.7, 20.0,
            19.5, 19.8, 20.39, 19.3, 19.6, 21.0, 18.7, 21.2, 20.39, 19.1, 20.7, 19.1, 21.8, 19.39, 20.1, 20.1, 20.1,
            20.9, 20.0, 19.7, 19.89, 19.39, 19.3, 21.2, 19.6, 20.5, 19.6, 20.3, 19.8, 19.0, 20.6, 19.6, 21.1, 19.6,
            20.6, 20.5, 19.6, 20.39, 20.0, 19.7
        };

        var currentValues1 = new[]
        {
            115.8, 135.4, 87.8, 150.0, 103.0, 133.1, 122.6, 122.9, 146.9, 122.2, 146.9, 124.6, 117.5, 134.4, 106.0,
            109.7, 111.4, 103.3, 107.0, 96.2, 109.4, 123.6, 109.7, 70.59, 101.0, 125.0, 51.3, 95.2, 94.2, 83.4, 140.19,
            62.5, 95.2, 132.0, 62.1, 94.9, 77.7, 78.7, 120.6, 52.3, 78.0, 102.3, 77.7, 57.4, 119.2, 91.2, 52.3, 101.0,
            87.8, 68.5, 101.6, 53.3, 124.6, 57.0, 111.4, 29.7, 77.0, 22.2, 66.8, 49.6, 81.7, 99.6, 8.4, 35.79, 40.5,
            47.2, 28.3, 27.0, 16.2, 22.6, 35.4, 14.5, 43.5, 21.2, 16.5, 15.2, 10.1, 37.1, 35.4, 35.4, 23.9, 19.89, 28.0,
            27.3, 17.2, 55.4, 27.7, 46.9, 38.5, 21.2, 15.5, 66.2, 18.5, 8.1, 13.1, 30.0, 43.5, 55.4, 49.3, 17.5, 81.4,
            61.1, 7.4, 11.4, 2.7, 18.2, 15.5, 32.7, 53.7, 76.59, 16.8, 44.2, 57.0, 29.3, 112.5, 44.2, 65.5, 41.5, 58.4,
            116.2, 29.3, 46.2, 44.5, 19.89, 53.7, 36.79, 136.8, 43.2, 28.0, 40.79, 100.3, 98.6, 7.0, 8.1, 6.7, 130.69,
            118.9, 8.4, 8.1, 125.3, 23.3, 13.5, 58.1, 130.69, 43.2, 86.8, 9.1, 34.7, 136.1, 24.6, 84.7, 15.5, 53.0,
            130.0, 8.69, 146.9, 30.7, 63.1, 88.1, 77.3, 37.1, 22.9, 121.2, 45.9, 62.8, 78.3, 56.4, 92.9, 54.3, 66.5,
            23.3, 59.1, 116.2, 86.1, 11.8, 118.5, 72.2, 26.6, 31.7, 159.69, 28.7, 159.4, 34.4, 147.6, 8.1, 25.6, 140.8,
            78.0, 130.4, 53.3, 134.1, 97.6, 105.0, 103.0, 125.6, 79.7, 139.5, 62.8, 159.4, 23.3, 140.5, 37.5, 127.3,
            78.3, 74.59, 95.6, 99.3, 94.5, 60.1, 132.4, 96.9, 142.9, 93.2, 116.2, 95.2, 113.5, 90.2, 128.69, 66.5,
            110.1, 114.1, 81.4, 116.8, 98.3, 109.4, 100.3, 108.1, 94.2, 100.6, 118.2, 96.2, 107.0, 112.1, 101.3, 105.4,
            106.0, 114.1, 97.2, 116.5, 99.3, 106.4, 121.2, 92.2, 116.5, 89.8, 105.7, 127.7, 96.6, 95.6, 107.0, 127.3,
            86.8, 124.6, 91.5, 91.8, 128.0, 92.2, 116.5, 55.4, 130.4, 128.3, 88.1, 130.4, 91.8, 106.7, 108.4, 112.1,
            115.5, 124.3, 69.2, 115.2, 102.0, 119.9, 106.0, 104.0, 122.6, 107.7, 111.1, 82.4, 121.2, 85.8, 88.5, 102.7,
            113.8, 100.6, 117.2
        };

        var seconds1 = 0.1 * voltageValues1.Length;
        var roundSeconds1 = Math.Round(seconds1);

        var weldingStartTime1 = new TimeSpan(13, 25, 43);
        var weldingEndTime1 = weldingStartTime1.Add(TimeSpan.FromSeconds(roundSeconds1));

        var voltageValues2 = new[]
        {
            79.2, 78.7, 78.7, 78.9, 78.2, 78.09, 78.09, 78.7, 77.7, 51.3, 52.0, 50.9, 50.9, 52.0, 50.9, 50.9, 50.9,
            50.8, 50.9, 50.8, 50.9, 50.8, 50.9, 50.8, 50.8, 50.9, 51.9, 50.9, 51.0, 50.9, 51.0, 50.9, 50.9, 50.8, 50.9,
            50.9, 51.0, 50.7, 50.8, 51.1, 51.8, 50.8, 50.9, 51.9, 50.9, 50.9, 50.9, 50.8, 50.9, 50.7, 50.8, 50.9, 51.0,
            50.8, 50.8, 50.7, 51.8, 50.9, 50.8, 50.7, 50.8, 50.9, 50.8, 50.9, 51.0, 50.9, 50.9, 50.8, 50.9, 51.2, 52.1,
            51.0, 51.0, 51.9, 51.0, 50.9, 51.0, 50.9, 50.9, 50.9, 50.9, 40.7, 40.4, 40.5, 40.4, 40.29, 40.29, 40.29,
            40.4, 40.4, 40.29, 40.4, 40.4, 40.4, 40.5, 40.4, 40.6, 40.4, 40.5, 40.4, 40.4, 40.5, 40.4, 40.4, 40.4, 40.4,
            40.4, 40.4, 40.4, 40.4, 40.4, 40.5, 40.5, 40.5, 40.4, 40.4, 40.4, 40.4, 40.4, 40.5, 40.4, 40.6, 41.2, 41.5,
            41.4, 41.5, 41.3, 41.5, 41.6, 41.5, 41.6, 41.5, 41.4, 41.3, 41.4, 41.7, 41.5, 41.7, 41.3, 41.8, 41.5, 41.7,
            41.5, 41.6, 41.6, 41.5, 41.3, 41.5, 41.7, 41.2, 41.5, 41.5, 41.7, 41.6, 41.5, 41.6, 41.2, 41.4, 41.4, 41.5,
            41.5, 41.8, 41.4, 41.2, 41.5, 41.7, 41.4, 41.5, 41.5, 41.8, 41.5, 41.6, 41.2, 42.8, 44.7, 45.6, 44.7, 43.7,
            43.3, 43.3, 43.3, 43.4, 43.4, 43.3, 43.4, 43.3, 43.3, 43.3, 43.2, 43.3, 43.3, 43.3, 43.3, 43.3, 43.2, 43.2,
            43.3, 43.3, 43.3, 43.2, 43.2, 43.3, 43.3, 43.3, 43.3, 43.3, 43.3, 43.2, 43.3, 43.3, 43.3, 43.4, 45.7, 44.7,
            45.5, 45.5, 44.7, 45.7, 44.8, 45.7, 44.7, 44.7, 44.8, 45.7, 44.7, 44.8, 45.7, 44.9, 45.9, 44.9, 44.9, 44.8,
            44.7, 45.8, 44.9, 44.8, 44.9, 44.8, 45.0, 44.9, 45.0, 44.9, 44.9, 45.7, 45.6, 44.9, 44.9, 44.9, 45.0, 45.0,
            44.9, 45.0, 45.1, 45.0, 45.9, 44.9, 45.0, 44.9, 45.0, 45.0, 45.0, 44.9, 45.0, 45.0, 45.0, 45.0, 45.9, 45.0,
            44.9, 45.0, 44.9, 45.0, 45.0, 45.0, 45.0, 45.0, 45.0, 44.9, 45.9, 45.0, 45.0, 45.9, 45.0, 45.0, 45.1, 44.9,
            45.0, 45.0, 44.9, 45.1, 45.9, 46.2, 45.9, 45.8, 45.8, 45.7, 45.7, 45.7, 45.7, 45.8, 45.7, 45.9, 45.9, 45.8,
            45.9, 45.9, 45.8, 45.0, 45.0, 45.0, 46.0, 45.2, 45.3, 46.1, 45.1, 45.1, 45.1, 45.1, 45.2, 45.2, 45.2, 45.1,
            45.3, 45.1, 45.2, 45.2, 45.9, 45.6, 45.3, 45.0, 45.2, 45.1, 45.2, 45.2, 45.2, 45.2, 45.1, 45.1, 45.3, 45.3,
            46.2, 45.2, 45.3, 46.2, 45.4, 45.2, 45.3, 45.3, 45.3, 45.3, 45.2, 45.3, 45.3, 45.3, 45.3, 45.3, 46.2, 45.8,
            45.2, 45.3, 45.3, 45.4, 45.2, 45.2, 45.3, 45.1, 45.3, 45.2, 45.3, 45.3, 46.4, 45.3, 45.3, 46.3, 45.4, 45.4,
            45.4, 45.6, 45.6, 45.4, 45.4, 45.4, 45.3, 45.3, 45.3, 45.6, 46.3, 45.9, 45.3, 45.5, 45.5, 45.5, 45.4, 45.5,
            45.6, 45.4, 45.4, 45.6, 45.4, 46.1, 45.9, 46.2, 46.2, 46.1, 46.2, 46.1, 46.1, 46.3, 46.1, 46.0, 46.1, 46.3,
            45.9, 45.6, 45.6, 45.6, 45.5, 45.5, 45.6, 45.7, 46.6, 45.7, 45.7, 46.5, 45.7, 45.5, 45.7, 45.8, 45.6, 45.6,
            45.6, 45.6, 45.5, 45.6, 44.4, 43.7, 43.6, 43.7, 48.8, 78.7, 78.09, 77.0, 77.5, 78.5, 76.59, 77.59, 77.3,
            76.7, 77.09, 77.59, 77.3
        };

        var currentValues2 = new[]
        {
            53.3, 52.7, 53.0, 53.0, 52.7, 52.7, 52.7, 53.0, 54.0, 101.3, 102.7, 100.3, 100.6, 102.7, 100.6, 100.3,
            100.3, 100.3, 100.6, 100.3, 100.3, 100.3, 100.3, 100.3, 100.3, 100.3, 102.7, 100.6, 100.6, 100.3, 100.6,
            100.0, 100.3, 100.3, 100.6, 100.6, 100.3, 100.0, 100.3, 101.0, 102.3, 100.3, 100.0, 102.3, 100.3, 100.3,
            100.3, 100.0, 100.0, 100.0, 100.0, 100.3, 100.6, 99.6, 99.6, 100.0, 102.3, 100.0, 100.0, 99.6, 100.0, 100.0,
            100.0, 100.0, 100.0, 100.0, 100.0, 100.0, 99.6, 100.6, 102.0, 100.0, 100.0, 102.0, 100.3, 100.0, 99.6, 99.6,
            99.6, 100.0, 99.6, 175.0, 178.0, 178.3, 178.3, 178.3, 178.3, 178.3, 178.3, 178.3, 178.7, 178.7, 178.7,
            179.0, 179.0, 179.0, 179.0, 179.0, 178.7, 179.0, 179.0, 178.7, 178.7, 178.7, 178.7, 178.3, 178.7, 178.7,
            178.3, 178.7, 178.3, 178.7, 178.3, 178.3, 178.3, 178.3, 178.3, 178.7, 178.3, 178.3, 178.3, 177.0, 162.1,
            156.69, 157.0, 156.69, 156.69, 156.4, 156.4, 156.4, 156.0, 156.4, 156.4, 156.69, 156.0, 156.0, 156.4, 156.4,
            156.69, 156.0, 156.4, 156.69, 156.4, 156.4, 156.4, 156.4, 156.4, 156.0, 155.69, 156.0, 156.0, 156.4, 156.0,
            156.0, 155.69, 156.0, 156.0, 156.0, 156.4, 156.0, 156.0, 156.0, 156.0, 156.4, 155.69, 155.69, 156.0, 155.69,
            156.0, 155.4, 155.4, 156.0, 156.4, 146.9, 114.5, 116.8, 114.1, 119.2, 138.5, 138.5, 138.8, 138.5, 138.5,
            138.5, 138.8, 138.8, 138.5, 138.5, 138.5, 138.5, 138.5, 138.5, 138.5, 138.1, 138.1, 138.1, 138.5, 138.1,
            138.1, 138.1, 138.1, 138.1, 138.1, 138.1, 138.1, 138.1, 138.1, 138.1, 138.1, 138.1, 138.1, 137.8, 123.6,
            113.8, 115.8, 115.2, 113.5, 116.2, 113.8, 116.2, 113.5, 113.5, 113.5, 116.2, 113.5, 113.8, 116.2, 113.5,
            116.5, 113.8, 113.8, 113.1, 113.5, 116.2, 113.5, 113.1, 113.5, 113.5, 113.8, 113.5, 113.8, 113.1, 113.5,
            115.8, 115.2, 113.5, 113.1, 113.1, 113.5, 113.8, 113.5, 113.1, 113.8, 113.1, 115.8, 113.1, 113.1, 113.1,
            113.1, 113.1, 113.5, 112.8, 113.1, 113.1, 113.1, 113.1, 115.8, 112.8, 112.8, 113.1, 113.1, 112.8, 113.1,
            112.8, 113.1, 113.1, 113.1, 112.8, 115.2, 112.8, 112.5, 115.2, 112.8, 112.8, 112.8, 112.5, 112.8, 112.8,
            112.5, 112.8, 114.8, 120.9, 122.2, 122.2, 122.2, 122.2, 122.2, 122.2, 122.2, 122.6, 122.2, 122.2, 122.2,
            122.2, 122.6, 122.2, 116.2, 112.1, 112.1, 112.5, 114.5, 112.5, 112.5, 114.5, 112.1, 112.5, 112.5, 112.1,
            112.1, 112.1, 112.5, 111.8, 112.5, 112.1, 112.1, 112.1, 114.5, 113.1, 112.1, 111.8, 112.1, 111.8, 111.8,
            112.1, 112.1, 112.1, 111.8, 111.8, 112.5, 112.5, 114.5, 111.8, 112.1, 114.5, 112.5, 111.8, 112.1, 112.1,
            112.5, 112.5, 111.8, 112.1, 111.8, 111.8, 112.1, 111.8, 114.5, 113.1, 111.4, 111.8, 111.8, 111.8, 111.8,
            111.4, 111.8, 111.4, 111.8, 111.4, 111.4, 111.4, 114.1, 111.8, 111.4, 114.1, 111.8, 111.8, 111.8, 112.1,
            112.1, 111.8, 111.4, 111.4, 111.4, 111.4, 111.8, 111.8, 113.8, 112.5, 111.4, 111.8, 111.8, 111.4, 111.4,
            111.4, 111.8, 111.1, 111.1, 111.8, 111.8, 121.2, 120.9, 121.2, 120.9, 121.2, 121.2, 120.9, 120.9, 120.9,
            120.9, 120.9, 120.9, 120.6, 115.5, 111.4, 111.4, 111.4, 111.1, 110.8, 111.1, 111.8, 113.8, 111.4, 111.1,
            113.1, 111.1, 111.1, 111.4, 111.8, 110.8, 110.8, 110.8, 111.1, 110.4, 110.8, 130.69, 134.69, 134.4, 134.69,
            113.5, 53.0, 52.0, 51.0, 51.6, 52.3, 51.0, 51.6, 51.6, 51.0, 51.3, 51.3, 51.6
        };

        var seconds2 = 0.1 * voltageValues2.Length;
        var roundSeconds2 = Math.Round(seconds2);

        var weldingStartTime2 = new TimeSpan(19, 43, 13);
        var weldingEndTime2 = weldingStartTime2.Add(TimeSpan.FromSeconds(roundSeconds2));

        var tasks = new List<WeldingTask>
        {
            new WeldingTask
            {
                WeldingDate = DateTime.Now,
                BasicMaterial = "Сталь 20",
                MainMaterialBatchNumber = "454578",
                WeldingMaterial = "Проволока 1,2 Св-08Г2С",
                WeldingMaterialBatchNumber = "00252565",
                ProtectiveGas = "Какой-то Защитный газ",
                ProtectiveGasBatchNumber = "111111",
                WeldingEquipment = new WeldingEquipment
                {
                    Name = "QINEO TRONIC",
                    Marking = "ECO600CQWDM2",
                    FactoryNumber = "49505",
                    CommissioningDate = new DateTime(2013, 1, 1),
                    NextAttestationDate = new DateTime(2023, 6, 25),
                    GroupNumber = "3.11",
                    ManufacturerName = "CLOOS",
                    WeldingProcess = "Полуавтоматическая сварка"
                },
                Seam = new Seam
                {
                    Number = 2,
                    Length = 100,
                    Status = ProductStatus.Accept,
                    IsControlSubject = true,
                    ProductionArea = productionArea4,
                    Welders = new List<Welder> { welder },
                    Inspector = inspector,
                    WeldPassages = new List<WeldPassage>
                    {
                        new()
                        {
                            Number = 1,
                            Name = "Корневой",
                            WeldingCurrentValues = currentValues1,
                            ArcVoltageValues = voltageValues1,
                            ShortTermDeviation = 0.11,
                            LongTermDeviation = 0.68,
                            WeldingStartTime = weldingStartTime1,
                            WeldingEndTime = weldingEndTime1,
                            PreheatingTemperature = 82,
                        },
                        new()
                        {
                            Number = 2,
                            Name = "Заполняющий",
                            WeldingCurrentValues = currentValues2,
                            ArcVoltageValues = voltageValues2,
                            ShortTermDeviation = 0.22,
                            LongTermDeviation = 0.44,
                            WeldingStartTime = weldingStartTime2,
                            WeldingEndTime = weldingEndTime2,
                            PreheatingTemperature = 100,
                        }
                    },
                    TechnologicalInstruction = new TechnologicalInstruction
                    {
                        Number = 1,
                        Name = "ИТП",
                        WeldPassageInstructions = new List<WeldPassageInstruction>
                        {
                            new()
                            {
                                Number = 1,
                                Name = "Корневой",
                                PreheatingTemperatureMin = 50,
                                PreheatingTemperatureMax = 250,
                                WeldingCurrentMin = 80,
                                WeldingCurrentMax = 120,
                                ArcVoltageMin = 22,
                                ArcVoltageMax = 24,
                            },
                            new()
                            {
                                Number = 2,
                                Name = "Заполняющий",
                                PreheatingTemperatureMin = 50,
                                PreheatingTemperatureMax = 250,
                                WeldingCurrentMin = 80,
                                WeldingCurrentMax = 120,
                                ArcVoltageMin = 21,
                                ArcVoltageMax = 25,
                            }
                        }
                    },
                    Product = detail
                }
            },
            new WeldingTask
            {
                WeldingDate = DateTime.Now,
                BasicMaterial = "Сталь 20",
                MainMaterialBatchNumber = "454578",
                WeldingMaterial = "Проволока 1,2 Св-08Г2С",
                WeldingMaterialBatchNumber = "00252565",
                ProtectiveGas = "Какой-то Защитный газ",
                ProtectiveGasBatchNumber = "111111",
                WeldingEquipment = new WeldingEquipment
                {
                    Name = "QINEO TRONIC",
                    Marking = "ECO600CQWDM2",
                    FactoryNumber = "49505",
                    CommissioningDate = new DateTime(2013, 1, 1),
                    NextAttestationDate = new DateTime(2023, 6, 25),
                    GroupNumber = "3.11",
                    ManufacturerName = "CLOOS",
                    WeldingProcess = "Полуавтоматическая сварка"
                },
                Seam = new Seam
                {
                    Number = 2,
                    Length = 200,
                    Status = ProductStatus.Accept,
                    IsControlSubject = true,
                    ProductionArea = productionArea4,
                    Welders = new List<Welder> { welder },
                    Inspector = inspector,
                    WeldPassages = new List<WeldPassage>
                    {
                        new()
                        {
                            Number = 1,
                            Name = "Корневой",
                            WeldingCurrentValues = currentValues1,
                            ArcVoltageValues = voltageValues1,
                            ShortTermDeviation = 0.11,
                            LongTermDeviation = 0.68,
                            WeldingStartTime = weldingStartTime1,
                            WeldingEndTime = weldingEndTime1,
                            PreheatingTemperature = 82,
                        },
                        new()
                        {
                            Number = 2,
                            Name = "Заполняющий",
                            WeldingCurrentValues = currentValues2,
                            ArcVoltageValues = voltageValues2,
                            ShortTermDeviation = 0.22,
                            LongTermDeviation = 0.44,
                            WeldingStartTime = weldingStartTime2,
                            WeldingEndTime = weldingEndTime2,
                            PreheatingTemperature = 100,
                        }
                    },
                    TechnologicalInstruction = new TechnologicalInstruction
                    {
                        Number = 1,
                        Name = "ИТП",
                        WeldPassageInstructions = new List<WeldPassageInstruction>
                        {
                            new()
                            {
                                Number = 1,
                                Name = "Корневой",
                                PreheatingTemperatureMin = 50,
                                PreheatingTemperatureMax = 250,
                                WeldingCurrentMin = 80,
                                WeldingCurrentMax = 120,
                                ArcVoltageMin = null,
                                ArcVoltageMax = null,
                            },
                            new()
                            {
                                Number = 2,
                                Name = "Заполняющий",
                                PreheatingTemperatureMin = 50,
                                PreheatingTemperatureMax = 250,
                                WeldingCurrentMin = 80,
                                WeldingCurrentMax = 120,
                                ArcVoltageMin = 21,
                                ArcVoltageMax = 25,
                            }
                        }
                    },
                    Product = detailWithoutKnot
                }
            }
        };

        await context.WeldingTasks.AddRangeAsync(tasks);
        await context.SaveChangesAsync();
    }

    private static async Task AddTechnologicalProcesses(ApplicationContext context)
    {
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
            },
            new TechnologicalProcess
            {
                Name = "Технологический процесс 2",
                Number = 2,
                PdmSystemFileLink = "Ссылка",
                Products = new List<Product> { product2 },
            }
        };

        await context.TechnologicalProcesses.AddRangeAsync(technologicalProcesses);
        await context.SaveChangesAsync();
    }

    private static async Task AddTechnologicalInstruction(ApplicationContext context)
    {
        var seam = (await context.Seams.FirstOrDefaultAsync(_ => _.Number == 1))!;
        var seam2 = (await context.Seams.FirstOrDefaultAsync(_ => _.Number == 2))!;

        var technologicalInstructions = new List<TechnologicalInstruction>
        {
            new TechnologicalInstruction
            {
                Name = "Инструкция 1",
                Number = 1,
                Seams = new List<Seam> { seam },
            },
            new TechnologicalInstruction
            {
                Name = "Инструкция 2",
                Number = 2,
                Seams = new List<Seam> { seam2 },
            }
        };

        context.TechnologicalInstructions.AddRange(technologicalInstructions);
        await context.SaveChangesAsync();
    }
}