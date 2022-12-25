using Belaz.WeldingApp.WeldingApi.Repositories.Entities;
using Belaz.WeldingApp.WeldingApi.Repositories.Entities.CalendarInfo;
using Belaz.WeldingApp.WeldingApi.Repositories.Entities.IdentityUser;
using Belaz.WeldingApp.WeldingApi.Repositories.Entities.Production;
using Belaz.WeldingApp.WeldingApi.Repositories.Entities.TaskInfo;
using Belaz.WeldingApp.WeldingApi.Repositories.Entities.Users;
using Belaz.WeldingApp.WeldingApi.Repositories.Entities.WeldingEquipmentInfo;
using Microsoft.EntityFrameworkCore;

namespace Belaz.WeldingApp.WeldingApi.Repositories;

public class ApplicationContext : DbContext
{
    public DbSet<UserData> Users { get; set; }
        
    public DbSet<RoleData> Roles { get; set; }
        
    public DbSet<UserRole> UserRoles { get; set; }
        
    public DbSet<Post> Posts { get; set; }
        
    public DbSet<ProductionArea> ProductionAreas { get; set; }
        
    public DbSet<Workplace> Workplaces { get; set; }
        
    public DbSet<Workshop> Workshops { get; set; }
        
    public DbSet<Calendar> Calendars { get; set; }
        
    public DbSet<Day> Days { get; set; }
        
    public DbSet<WorkingShift> WorkingShifts { get; set; }
        
    public DbSet<Inspector> Inspectors { get; set; }
        
    public DbSet<Master> Masters { get; set; }
        
    public DbSet<Welder> Welders { get; set; }
        
    public DbSet<WeldingEquipment> WeldingEquipments { get; set; }
        
    public DbSet<WeldingEquipmentWorkingShift> WeldingEquipmentWorkingShifts { get; set; }
        
    public DbSet<WeldingEquipmentConditionTime> WeldingEquipmentConditionTimes { get; set; }
        
    public DbSet<LayerInstruction> Layers { get; set; }
        
    public DbSet<TechnologicalProcessInstruction> TechnologicalProcessInstructions { get; set; }
        
    public DbSet<WeldingTask> WeldingTasks { get; set; }
        
    public DbSet<EventLog> EventLogs { get; set; }

    public ApplicationContext(DbContextOptions<ApplicationContext> options) : base(options)
    {
        Database.EnsureCreated();
    }

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        base.OnModelCreating(modelBuilder);
        modelBuilder.Entity<WeldingEquipmentWorkingShift>().HasKey(t =>
            new { t.WeldingEquipmentId, t.WorkingShiftId, t.WeldingEquipmentConditionTimeId });
        modelBuilder.Entity<UserRole>().HasKey(t => new { t.RoleId, t.UserId });
    }
}
