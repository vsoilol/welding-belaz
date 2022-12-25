using Belaz.WeldingApp.WeldingApi.Repositories;
using Belaz.WeldingApp.WeldingApi.Repositories.Entities.CalendarInfo;
using Belaz.WeldingApp.WeldingApi.Repositories.Entities.IdentityUser;
using Belaz.WeldingApp.WeldingApi.Repositories.Entities.Production;
using Belaz.WeldingApp.WeldingApi.Repositories.Entities.Users;
using Belaz.WeldingApp.WeldingApi.Repositories.Entities.WeldingEquipmentInfo;
using Microsoft.EntityFrameworkCore;
using WeldingApp.Common.Enums;

namespace Belaz.WeldingApp.WeldingApi.Helpers;

public class DataSeed
{
    public static async Task SeedSampleDataAsync(ApplicationContext context)
    {
        await AddExecutorRole(context);

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
    }

    private static async Task AddExecutorRole(ApplicationContext context)
    {
        var roleName = "Executor";

        if (!context.Roles.Any(_ => _.Name == roleName))
        {
            var creationRole = new RoleData { Name = roleName };
            await context.Roles.AddAsync(creationRole);
            await context.SaveChangesAsync();
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

        welders[0].WeldingEquipmentId = weldingEquipments[0].Id;
        welders[1].WeldingEquipmentId = weldingEquipments[1].Id;
        welders[2].WeldingEquipmentId = weldingEquipments[2].Id;

        context.Welders.UpdateRange(welders);
        await context.SaveChangesAsync();
    }
}