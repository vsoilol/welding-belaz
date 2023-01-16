using Belaz.WeldingApp.WeldingApi.Repositories.Entities;
using Belaz.WeldingApp.WeldingApi.Repositories.Entities.CalendarInfo;
using Belaz.WeldingApp.WeldingApi.Repositories.Entities.IdentityUser;
using Belaz.WeldingApp.WeldingApi.Repositories.Entities.ProductInfo;
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
        
    public DbSet<Chief> Chiefs { get; set; }

    public DbSet<Inspector> Inspectors { get; set; }
        
    public DbSet<Master> Masters { get; set; }
        
    public DbSet<Welder> Welders { get; set; }
        
    public DbSet<WeldingEquipment> WeldingEquipments { get; set; }

    public DbSet<WeldingEquipmentConditionTime> WeldingEquipmentConditionTimes { get; set; }
        
    public DbSet<LayerInstruction> LayerInstructions { get; set; }
        
    public DbSet<TechnologicalProcess> TechnologicalProcesses { get; set; }
        
    public DbSet<WeldingTask> WeldingTasks { get; set; }
        
    public DbSet<EventLog> EventLogs { get; set; }

    public DbSet<Product> Products { get; set; }
    
    public DbSet<ProductInside> ProductInsides { get; set; }
    
    public DbSet<WeldPassage> WeldPassages { get; set; }
    
    public DbSet<Seam> Seams { get; set; }

    public ApplicationContext(DbContextOptions<ApplicationContext> options) : base(options)
    {
        Database.EnsureCreated();
    }

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        base.OnModelCreating(modelBuilder);
        
        modelBuilder.Entity<ProductInside>()
            .HasOne(e => e.MainProduct)
            .WithMany(e => e.ProductInsides);

        modelBuilder.Entity<ProductInside>()
            .HasOne(e => e.InsideProduct)
            .WithMany(e => e.ProductMains)
            .OnDelete(DeleteBehavior.Restrict);
        
        modelBuilder.Entity<UserRole>().HasKey(t => new { t.RoleId, t.UserId });
        modelBuilder.Entity<ProductInside>().HasKey(t => new { t.InsideProductId, t.MainProductId });
    }
}
