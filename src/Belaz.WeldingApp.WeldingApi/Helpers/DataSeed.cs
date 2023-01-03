using Belaz.WeldingApp.WeldingApi.Repositories;
using Belaz.WeldingApp.WeldingApi.Repositories.Entities.CalendarInfo;
using Belaz.WeldingApp.WeldingApi.Repositories.Entities.IdentityUser;
using Belaz.WeldingApp.WeldingApi.Repositories.Entities.ProductInfo;
using Belaz.WeldingApp.WeldingApi.Repositories.Entities.Production;
using Belaz.WeldingApp.WeldingApi.Repositories.Entities.TaskInfo;
using Belaz.WeldingApp.WeldingApi.Repositories.Entities.Users;
using Belaz.WeldingApp.WeldingApi.Repositories.Entities.WeldingEquipmentInfo;
using Microsoft.EntityFrameworkCore;
using WeldingApp.Common.Enums;

namespace Belaz.WeldingApp.WeldingApi.Helpers;

public class DataSeed
{
    public static async Task SeedSampleDataAsync(ApplicationContext context)
    {
        await CreateRolesAsync(context);

        if (!context.Calendars.Any())
        {
            await AddCalendar(context);
        }

        if (!context.Workshops.Any())
        {
            await AddProduction(context);
        }

        if (!context.Welders.Any())
        {
            await AddWelders(context);
        }

        if (!context.WeldingEquipments.Any())
        {
            await AddSeveralWeldingEquipment(context);
        }

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

    private static async Task AddCalendar(ApplicationContext context)
    {
        var calendar = new Calendar
        {
            Year = 2022,
            IsMain = true,
            WorkingDays = new List<Day>
            {
                new Day
                {
                    BreakBetweenShifts = 30,
                    MonthNumber = 1,
                    Number = 1,
                    Shifts = new List<WorkingShift>
                    {
                        new WorkingShift
                        {
                            Number = 1,
                            ShiftStart = new TimeSpan(8, 0, 0),
                            ShiftEnd = new TimeSpan(12, 0, 0)
                        },
                        new WorkingShift
                        {
                            Number = 2,
                            ShiftStart = new TimeSpan(12, 30, 0),
                            ShiftEnd = new TimeSpan(16, 0, 0)
                        },
                        new WorkingShift
                        {
                            Number = 3,
                            ShiftStart = new TimeSpan(16, 30, 0),
                            ShiftEnd = new TimeSpan(20, 0, 0)
                        }
                    }
                }
            }
        };

        await context.Calendars.AddAsync(calendar);
        await context.SaveChangesAsync();
    }

    private static async Task AddProduction(ApplicationContext context)
    {
        var workShop = new Workshop
        {
            Name = "Цех",
            Number = 1,
            ProductionAreas = new List<ProductionArea>
            {
                new ProductionArea
                {
                    Name = "Производственный участок 1",
                    Posts = new List<Post>
                    {
                        new Post
                        {
                            Number = 1
                        }
                    },
                    Workplaces = new List<Workplace>
                    {
                        new Workplace
                        {
                            Number = 1
                        }
                    }
                },
                new ProductionArea
                {
                    Name = "Производственный участок 2",
                    Posts = new List<Post>
                    {
                        new Post
                        {
                            Number = 2
                        }
                    },
                    Workplaces = new List<Workplace>
                    {
                        new Workplace
                        {
                            Number = 2
                        }
                    }
                },
                new ProductionArea
                {
                    Name = "Производственный участок 3",
                    Posts = new List<Post>
                    {
                        new Post
                        {
                            Number = 3
                        }
                    },
                    Workplaces = new List<Workplace>
                    {
                        new Workplace
                        {
                            Number = 3
                        }
                    }
                }
            }
        };

        await context.Workshops.AddAsync(workShop);
        await context.SaveChangesAsync();
    }

    private static async Task AddWelders(ApplicationContext context)
    {
        var productionAreas = await context.ProductionAreas.ToListAsync();
        var workPlaces = context.Workplaces.ToList();
        var welderRole = context.Roles.FirstOrDefault(_ => _.Name == "Executor");

        var welders = new List<Welder>
        {
            new Welder
            {
                UserInfo = new UserData
                {
                    CertificateValidityPeriod = new DateTime(2025, 2, 2),
                    FirstName = "Имя 1",
                    LastName = "Отчество 1",
                    MiddleName = "Фамилия 1",
                    UserName = "UserName",
                    Email = "Email",
                    PasswordHash = "PasswordHash",
                    Position = "Должность 1",
                    ServiceNumber = "Табельный номер  1",
                    RfidTag = "RFID метка сварщика 1",
                    ProductionArea = productionAreas[0],
                    UserRoles = new List<UserRole>
                    {
                        new UserRole
                        {
                            Role = welderRole
                        }
                    }
                },
            },
            new Welder
            {
                UserInfo = new UserData
                {
                    CertificateValidityPeriod = new DateTime(2025, 1, 1),
                    FirstName = "Имя 2",
                    LastName = "Отчество 2",
                    MiddleName = "Фамилия 2",
                    UserName = "UserName",
                    Email = "Email",
                    PasswordHash = "PasswordHash",
                    Position = "Должность 2",
                    ServiceNumber = "Табельный номер  2",
                    RfidTag = "RFID метка сварщика 2",
                    ProductionArea = productionAreas[1],
                    UserRoles = new List<UserRole>
                    {
                        new UserRole
                        {
                            Role = welderRole
                        }
                    }
                },
                Workplace = workPlaces[1]
            },
            new Welder
            {
                UserInfo = new UserData
                {
                    CertificateValidityPeriod = new DateTime(2025, 3, 3),
                    FirstName = "Имя 3",
                    LastName = "Отчество 3",
                    MiddleName = "Фамилия 3",
                    UserName = "UserName",
                    Email = "Email",
                    PasswordHash = "PasswordHash",
                    Position = "Должность 3",
                    ServiceNumber = "Табельный номер 3",
                    RfidTag = "RFID метка сварщика 3",
                    ProductionArea = productionAreas[2],
                    UserRoles = new List<UserRole>
                    {
                        new UserRole
                        {
                            Role = welderRole
                        }
                    }
                },
                Workplace = workPlaces[2]
            }
        };

        await context.Welders.AddRangeAsync(welders);
        await context.SaveChangesAsync();
    }

    private static async Task AddSeveralWeldingEquipment(ApplicationContext context)
    {
        var post = context.Posts.FirstOrDefault(_ => _.Number == 1);
        var productionArea = context.ProductionAreas.First();
        var shifts = context.WorkingShifts.ToList();
        var welders = context.Welders.ToList();

        var weldingEquipments = new List<WeldingEquipment>
        {
            new WeldingEquipment
            {
                Id = Guid.NewGuid(),
                RfidTag = "RFID метка 1",
                Name = "Какое-то оборудование 1",
                Marking = "Маркировка 1",
                FactoryNumber = "12",
                CommissioningDate = new DateTime(2020, 1, 23),
                Height = 20,
                Width = 30,
                Lenght = 40,
                GroupNumber = 3,
                ManufacturerName = "Изготовитель 1",
                NextAttestationDate = new DateTime(2023, 2, 5),
                WeldingProcess = "Способ сварки 1",
                IdleVoltage = 12.3,
                WeldingCurrentMin = 5.5,
                WeldingCurrentMax = 10.9,
                ArcVoltageMin = 6.1,
                ArcVoltageMax = 7.9,
                Post = post,
                Welder = welders[0],
                CurrentCondition = Condition.On,
                WeldingEquipmentWorkingShifts = new List<WeldingEquipmentWorkingShift>
                {
                    new WeldingEquipmentWorkingShift
                    {
                        WorkingShift = shifts[0],
                        WeldingEquipmentConditionTime = new WeldingEquipmentConditionTime
                        {
                            Condition = Condition.AtWork,
                            Time = 60,
                        }
                    },
                    new WeldingEquipmentWorkingShift
                    {
                        WorkingShift = shifts[1],
                        WeldingEquipmentConditionTime = new WeldingEquipmentConditionTime
                        {
                            Condition = Condition.AtWork,
                            Time = 30,
                        }
                    },
                    new WeldingEquipmentWorkingShift
                    {
                        WorkingShift = shifts[0],
                        WeldingEquipmentConditionTime = new WeldingEquipmentConditionTime
                        {
                            Condition = Condition.ForcedDowntime,
                            Time = 30,
                            DowntimeReason = "Какая-то причина простоя",
                            ChangeConditionTime = new TimeSpan(9, 30, 0),
                        }
                    },
                    new WeldingEquipmentWorkingShift
                    {
                        WorkingShift = shifts[2],
                        WeldingEquipmentConditionTime = new WeldingEquipmentConditionTime
                        {
                            Condition = Condition.ForcedDowntime,
                            Time = 10,
                            DowntimeReason = "Какая-то причина простоя 2",
                            ChangeConditionTime = new TimeSpan(19, 30, 0),
                        }
                    }
                }
            },
            new WeldingEquipment
            {
                Id = Guid.NewGuid(),
                RfidTag = "RFID метка 2",
                Name = "Какое-то оборудование 2",
                Marking = "Маркировка 2",
                FactoryNumber = "22",
                CommissioningDate = new DateTime(2021, 2, 23),
                Height = 20,
                Width = 30,
                Lenght = 40,
                GroupNumber = 3,
                ManufacturerName = "Изготовитель 2",
                NextAttestationDate = new DateTime(2023, 2, 5),
                WeldingProcess = "Способ сварки 2",
                IdleVoltage = 12.3,
                WeldingCurrentMin = 5.5,
                WeldingCurrentMax = 10.9,
                ArcVoltageMin = 6.1,
                ArcVoltageMax = 7.9,
                Post = post,
                Welder = welders[1],
                CurrentCondition = Condition.Off,
                WeldingEquipmentWorkingShifts = new List<WeldingEquipmentWorkingShift>
                {
                    new WeldingEquipmentWorkingShift
                    {
                        WorkingShift = shifts[0],
                        WeldingEquipmentConditionTime = new WeldingEquipmentConditionTime
                        {
                            Condition = Condition.AtWork,
                            Time = 60,
                        }
                    },
                }
            },
            new WeldingEquipment
            {
                Id = Guid.NewGuid(),
                RfidTag = "RFID метка 3",
                Name = "Какое-то оборудование 3",
                Marking = "Маркировка 3",
                FactoryNumber = "32",
                CommissioningDate = new DateTime(2022, 2, 23),
                Height = 20,
                Width = 30,
                Lenght = 40,
                GroupNumber = 3,
                ManufacturerName = "Изготовитель 3",
                NextAttestationDate = new DateTime(2024, 2, 5),
                WeldingProcess = "Способ сварки 3",
                IdleVoltage = 12.3,
                WeldingCurrentMin = 5.5,
                WeldingCurrentMax = 10.9,
                ArcVoltageMin = 6.1,
                ArcVoltageMax = 7.9,
                Welder = welders[2],
                CurrentCondition = Condition.AtWork,
                WeldingEquipmentWorkingShifts = new List<WeldingEquipmentWorkingShift>
                {
                    new WeldingEquipmentWorkingShift
                    {
                        WorkingShift = shifts[0],
                        WeldingEquipmentConditionTime = new WeldingEquipmentConditionTime
                        {
                            Condition = Condition.AtWork,
                            Time = 60,
                        }
                    },
                    new WeldingEquipmentWorkingShift
                    {
                        WorkingShift = shifts[1],
                        WeldingEquipmentConditionTime = new WeldingEquipmentConditionTime
                        {
                            Condition = Condition.ForcedDowntime,
                            Time = 60,
                            ChangeConditionTime = new TimeSpan(12, 50, 0),
                            DowntimeReason = "Какая-то причина простоя 3"
                        }
                    },
                }
            }
        };

        await context.WeldingEquipments.AddRangeAsync(weldingEquipments);
        await context.SaveChangesAsync();

        context.Welders.UpdateRange(welders);
        await context.SaveChangesAsync();
    }

    private static async Task AddProducts(ApplicationContext context)
    {
        var products = new List<Product>
        {
            new Product
            {
                Name = "Изделие 1",
                Number = 1,
                ProductType = ProductType.Product,
                Seams = new List<Seam>
                {
                    new Seam
                    {
                        Number = 1,
                    }
                },
                ProductInsides = new List<ProductInside>
                {
                    new ProductInside
                    {
                        InsideProduct = new Product
                        {
                            Name = "Деталь 1",
                            Number = 1,
                            ProductType = ProductType.Detail
                        },
                    },
                    new ProductInside
                    {
                        InsideProduct = new Product
                        {
                            Name = "Узел 1",
                            Number = 1,
                            ProductType = ProductType.Knot
                        }
                    }
                },
            },
            new Product
            {
                Name = "Изделие 2",
                Number = 2,
                ProductType = ProductType.Product,
                Seams = new List<Seam>
                {
                    new Seam
                    {
                        Number = 2,
                    }
                },
                ProductInsides = new List<ProductInside>
                {
                    new ProductInside
                    {
                        InsideProduct = new Product
                        {
                            Name = "Деталь 2",
                            Number = 2,
                            ProductType = ProductType.Detail
                        },
                    },
                    new ProductInside
                    {
                        InsideProduct = new Product
                        {
                            Name = "Узел 2",
                            Number = 2,
                            ProductType = ProductType.Knot
                        }
                    }
                },
            },
        };

        await context.Products.AddRangeAsync(products);
        await context.SaveChangesAsync();
    }

    private static async Task AddTechnologicalProcesses(ApplicationContext context)
    {
        var seam = await context.Seams.FirstOrDefaultAsync(_ => _.Number == 1);
        var seam2 = await context.Seams.FirstOrDefaultAsync(_ => _.Number == 2);
        
        var product = await context.Products.FirstOrDefaultAsync(_ => _.Number == 1
                                                                      && _.ProductType == ProductType.Product);
        var product2 = await context.Products.FirstOrDefaultAsync(_ => _.Number == 2
                                                                      && _.ProductType == ProductType.Product);

        var technologicalProcesses = new List<TechnologicalProcess>
        {
            new TechnologicalProcess
            {
                Name = "Технологический процесс 1",
                Product = product,
                Number = 1,
                PdmSystemFileLink = "Ссылка",
                TechnologicalInstructions = new List<TechnologicalInstruction>
                {
                    new TechnologicalInstruction
                    {
                        Name = "Инструкция 1",
                        Number = 1,
                        Seam = seam,
                        WeldPassages = new List<WeldPassage>
                        {
                            new WeldPassage
                            {
                                Seam = seam,
                                Name = "Название прохода 1",
                                LayerInstruction = new LayerInstruction
                                {
                                    WeldingCurrentMin = 1,
                                    WeldingCurrentMax = 100,
                                    ArcVoltageMin = 5,
                                    ArcVoltageMax = 50,
                                    PreheatingTemperatureMin = 10,
                                    PreheatingTemperatureMax = 60,
                                }
                            }
                        }
                    }
                }
            },
            new TechnologicalProcess
            {
                Name = "Технологический процесс 2",
                Number = 2,
                PdmSystemFileLink = "Ссылка",
                Product = product2,
                TechnologicalInstructions = new List<TechnologicalInstruction>
                {
                    new TechnologicalInstruction
                    {
                        Name = "Инструкция 2",
                        Number = 2,
                        Seam = seam2,
                        WeldPassages = new List<WeldPassage>
                        {
                            new WeldPassage
                            {
                                Seam = seam2,
                                Name = "Название прохода 1",
                                LayerInstruction = new LayerInstruction
                                {
                                    WeldingCurrentMin = 1,
                                    WeldingCurrentMax = 100,
                                    ArcVoltageMin = 5,
                                    ArcVoltageMax = 50,
                                    PreheatingTemperatureMin = 10,
                                    PreheatingTemperatureMax = 60,
                                }
                            }
                        }
                    }
                }
            }
        };

        await context.TechnologicalProcesses.AddRangeAsync(technologicalProcesses);
        await context.SaveChangesAsync();
    }

    private static async Task AddWeldingTasks(ApplicationContext context)
    {
        var seam = await context.Seams.FirstOrDefaultAsync(_ => _.Number == 1);
        var knot = await context.Products.FirstOrDefaultAsync(_ => _.Number == 1 && _.ProductType == ProductType.Knot);
        var detail =
            await context.Products.FirstOrDefaultAsync(_ => _.Number == 1 && _.ProductType == ProductType.Detail);
        var product = await context.Products.FirstOrDefaultAsync(_ => _.Number == 1
                                                                      && _.ProductType == ProductType.Product);
        var welder = await context.Welders.FirstOrDefaultAsync(_ => _.Workplace != null);

        var seam2 = await context.Seams.FirstOrDefaultAsync(_ => _.Number == 2);
        var knot2 = await context.Products.FirstOrDefaultAsync(_ => _.Number == 2 && _.ProductType == ProductType.Knot);

        var techUserRole = await context.Roles.FirstOrDefaultAsync(_ => _.Name == nameof(Role.TechUser));
        var masterRole = await context.Roles.FirstOrDefaultAsync(_ => _.Name == nameof(Role.Master));

        var inspector = new Inspector
        {
            UserInfo = new UserData
            {
                CertificateValidityPeriod = new DateTime(2025, 2, 2),
                FirstName = "Имя Контролера",
                LastName = "Имя Контролера",
                MiddleName = "Имя Контролера",
                UserName = "UserName",
                Email = "Email",
                PasswordHash = "PasswordHash",
                Position = "Должность 1",
                ServiceNumber = "Табельный номер  1",
                RfidTag = "RFID метка проверяющего 1",
                UserRoles = new List<UserRole>
                {
                    new UserRole
                    {
                        Role = techUserRole
                    }
                }
            },
        };

        await context.Inspectors.AddAsync(inspector);
        await context.SaveChangesAsync();

        var master = new Master
        {
            UserInfo = new UserData
            {
                CertificateValidityPeriod = new DateTime(2025, 2, 2),
                FirstName = "Имя мастера",
                LastName = "Отчество мастера",
                MiddleName = "Фамилия мастера",
                UserName = "UserName",
                Email = "Email",
                PasswordHash = "PasswordHash",
                Position = "Должность 1",
                ServiceNumber = "Табельный номер  1",
                RfidTag = "RFID метка проверяющего 1",
                UserRoles = new List<UserRole>
                {
                    new UserRole
                    {
                        Role = masterRole
                    }
                }
            },
        };

        await context.Masters.AddAsync(master);
        await context.SaveChangesAsync();

        var tasks = new List<WeldingTask>
        {
            new WeldingTask
            {
                Number = 1,
                Welder = welder,
                Master = master,
                Inspector = inspector,
                WeldingDate = new DateTime(2022, 01, 01),
                WeldingStartTime = new DateTime(2022, 01, 03),
                WeldingEndTime = null,
                AmbientTemperature = 300,
                AirHumidity = 01,
                InterlayerTemperature = 200,
                CurrentLayerNumber = 81,
                PreheatingTemperature = 150,
                Status = Status.Manufactured,
                BasicMaterial = "Основной материал",
                MainMaterialBatchNumber = "№ сертификата",
                Seam = seam2,
                WeldingMaterial = "варочные материалы",
                WeldingMaterialBatchNumber = "№ сертификата",
                WeldingCurrentValues = new double[] { 1.2, 2.3, 6.8 },
                ArcVoltageValues = new double[] { 11.2, 2.33, 26.8 },
            },
            new WeldingTask
            {
                Number = 2,
                Welder = welder,
                Master = master,
                Inspector = inspector,
                WeldingDate = new DateTime(2022, 01, 01),
                WeldingStartTime = new DateTime(2022, 01, 03),
                WeldingEndTime = null,
                AmbientTemperature = 3067,
                AirHumidity = 41,
                InterlayerTemperature = 203,
                CurrentLayerNumber = 31,
                PreheatingTemperature = 110,
                Status = Status.Defective,
                BasicMaterial = "Основной материал",
                MainMaterialBatchNumber = "№ сертификата",
                Product = knot2,
                WeldingMaterial = "варочные материалы",
                WeldingMaterialBatchNumber = "№ сертификата",
                WeldingCurrentValues = new double[] { 1.2, 2.3, 6.8 },
                ArcVoltageValues = new double[] { 11.2, 2.33, 26.8 },
            },
            new WeldingTask
            {
                Number = 3,
                Welder = welder,
                Master = master,
                Inspector = inspector,
                WeldingDate = new DateTime(2022, 01, 01),
                WeldingStartTime = new DateTime(2022, 01, 03),
                WeldingEndTime = null,
                AmbientTemperature = 390,
                AirHumidity = 81,
                InterlayerTemperature = 820,
                CurrentLayerNumber = 81,
                PreheatingTemperature = 170,
                Status = Status.VerificationSubject,
                BasicMaterial = "Основной материал",
                MainMaterialBatchNumber = "№ сертификата",
                Product = detail,
                WeldingMaterial = "варочные материалы",
                WeldingMaterialBatchNumber = "№ сертификата",
                WeldingCurrentValues = new double[] { 1.2, 2.3, 6.8 },
                ArcVoltageValues = new double[] { 11.2, 2.33, 26.8 },
            },
            new WeldingTask
            {
                Number = 4,
                Welder = welder,
                Master = master,
                Inspector = inspector,
                WeldingDate = new DateTime(2022, 01, 01),
                WeldingStartTime = new DateTime(2022, 01, 03),
                WeldingEndTime = null,
                AmbientTemperature = 320,
                AirHumidity = 1,
                InterlayerTemperature = 220,
                CurrentLayerNumber = 12,
                PreheatingTemperature = 2,
                Status = Status.VerificationSubject,
                BasicMaterial = "Основной материал",
                MainMaterialBatchNumber = "№ сертификата",
                Seam = seam,
                WeldingMaterial = "варочные материалы",
                WeldingMaterialBatchNumber = "№ сертификата",
                WeldingCurrentValues = new double[] { 1.2, 2.3, 6.8 },
                ArcVoltageValues = new double[] { 11.2, 2.33, 26.8 },
            },
            new WeldingTask
            {
                Number = 5,
                Welder = welder,
                Master = master,
                Inspector = inspector,
                WeldingDate = new DateTime(2022, 01, 01),
                WeldingStartTime = new DateTime(2022, 01, 03),
                WeldingEndTime = null,
                AmbientTemperature = 130,
                AirHumidity = 21,
                InterlayerTemperature = 23,
                CurrentLayerNumber = 13,
                PreheatingTemperature = 10,
                Status = Status.VerificationSubject,
                BasicMaterial = "Основной материал",
                MainMaterialBatchNumber = "№ сертификата",
                Product = product,
                WeldingMaterial = "варочные материалы",
                WeldingMaterialBatchNumber = "№ сертификата",
                WeldingCurrentValues = new double[] { 1.2, 2.3, 6.8 },
                ArcVoltageValues = new double[] { 11.2, 2.33, 26.8 },
            },
            new WeldingTask
            {
                Number = 6,
                Welder = welder,
                Master = master,
                Inspector = inspector,
                WeldingDate = new DateTime(2022, 01, 01),
                WeldingStartTime = new DateTime(2022, 01, 03),
                WeldingEndTime = null,
                AmbientTemperature = 31,
                AirHumidity = 2,
                InterlayerTemperature = 22,
                CurrentLayerNumber = 2,
                PreheatingTemperature = 11,
                Status = Status.VerificationSubject,
                BasicMaterial = "Основной материал",
                MainMaterialBatchNumber = "№ сертификата",
                Product = knot,
                WeldingMaterial = "варочные материалы",
                WeldingMaterialBatchNumber = "№ сертификата",
                WeldingCurrentValues = new double[] { 1.2, 2.3, 6.8 },
                ArcVoltageValues = new double[] { 11.2, 2.33, 26.8 },
            }
        };

        await context.WeldingTasks.AddRangeAsync(tasks);
        await context.SaveChangesAsync();
    }
}