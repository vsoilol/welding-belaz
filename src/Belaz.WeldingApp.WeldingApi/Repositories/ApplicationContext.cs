using Belaz.WeldingApp.WeldingApi.Repositories.Entities.CalendarInfo;
using Belaz.WeldingApp.WeldingApi.Repositories.Entities.IdentityUser;
using Belaz.WeldingApp.WeldingApi.Repositories.Entities.Production;
using Belaz.WeldingApp.WeldingApi.Repositories.Entities.Users;
using Belaz.WeldingApp.WeldingApi.Repositories.Entities.WeldingEquipmentInfo;
using Microsoft.EntityFrameworkCore;

namespace Belaz.WeldingApp.WeldingApi.Repositories;

public class ApplicationContext : DbContext
{
    public DbSet<UserData> Users { get; set; }

    public DbSet<Calendar> Calendars { get; set; }

    public DbSet<Day> Days { get; set; }

    public DbSet<WorkingShift> WorkingShifts { get; set; }

    public DbSet<Post> Posts { get; set; }

    public DbSet<ProductionArea> ProductionAreas { get; set; }

    public DbSet<Workplace> Workplaces { get; set; }

    public DbSet<Workshop> Workshops { get; set; }

    public DbSet<Welder> Welders { get; set; }

    public DbSet<WeldingEquipment> WeldingEquipments { get; set; }

    public DbSet<WeldingEquipmentWorkingShift> WeldingEquipmentWorkingShifts { get; set; }

    public DbSet<WeldingEquipmentConditionTime> WeldingEquipmentConditionTimes { get; set; }

    public ApplicationContext(DbContextOptions<ApplicationContext> options) : base(options)
    {
    }

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        base.OnModelCreating(modelBuilder);
        modelBuilder.Entity<WeldingEquipmentWorkingShift>().HasKey(t =>
            new { t.WeldingEquipmentId, t.WorkingShiftId, t.WeldingEquipmentConditionTimeId });
    }
}
