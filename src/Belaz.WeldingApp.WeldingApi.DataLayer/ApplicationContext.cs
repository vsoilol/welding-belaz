using Belaz.WeldingApp.Common.Entities;
using Belaz.WeldingApp.Common.Entities.CalendarInfo;
using Belaz.WeldingApp.Common.Entities.IdentityUser;
using Belaz.WeldingApp.Common.Entities.ProductInfo;
using Belaz.WeldingApp.Common.Entities.Production;
using Belaz.WeldingApp.Common.Entities.TaskInfo;
using Belaz.WeldingApp.Common.Entities.TechnologicalProcessInfo;
using Belaz.WeldingApp.Common.Entities.Users;
using Belaz.WeldingApp.Common.Entities.WeldingEquipmentInfo;
using Microsoft.EntityFrameworkCore;

namespace Belaz.WeldingApp.WeldingApi.DataLayer;

public sealed class ApplicationContext : DbContext
{
    public DbSet<UserData> Users { get; set; } = null!;

    public DbSet<Post> Posts { get; set; } = null!;

    public DbSet<ProductionArea> ProductionAreas { get; set; } = null!;

    public DbSet<Workplace> Workplaces { get; set; } = null!;

    public DbSet<DowntimeReason> DowntimeReasons { get; set; } = null!;

    public DbSet<Workshop> Workshops { get; set; } = null!;

    public DbSet<Calendar> Calendars { get; set; } = null!;

    public DbSet<Day> Days { get; set; } = null!;

    public DbSet<WorkingShift> WorkingShifts { get; set; } = null!;

    public DbSet<Chief> Chiefs { get; set; } = null!;

    public DbSet<Inspector> Inspectors { get; set; } = null!;

    public DbSet<Master> Masters { get; set; } = null!;

    public DbSet<Welder> Welders { get; set; } = null!;

    public DbSet<WeldingEquipment> WeldingEquipments { get; set; } = null!;

    public DbSet<WeldingEquipmentConditionTime> WeldingEquipmentConditionTimes { get; set; } =
        null!;

    public DbSet<TechnologicalProcess> TechnologicalProcesses { get; set; } = null!;

    public DbSet<TechnologicalInstruction> TechnologicalInstructions { get; set; } = null!;

    public DbSet<WeldingTask> WeldingTasks { get; set; } = null!;

    public DbSet<EventLog> EventLogs { get; set; } = null!;

    public DbSet<Product> Products { get; set; } = null!;

    public DbSet<ProductInside> ProductInsides { get; set; } = null!;

    public DbSet<WeldPassage> WeldPassages { get; set; } = null!;

    public DbSet<Seam> Seams { get; set; } = null!;

    public DbSet<WeldPassageInstruction> WeldPassageInstructions { get; set; } = null!;

    public DbSet<ProductAccount> ProductAccounts { get; set; } = null!;

    public DbSet<ProductResult> ProductResults { get; set; } = null!;

    public DbSet<WeldingRecord> WeldingRecords { get; set; } = null!;

    public DbSet<DefectiveReason> DefectiveReasons { get; set; } = null!;

    public DbSet<SeamAccount> SeamAccounts { get; set; } = null!;

    public DbSet<SeamResult> SeamResults { get; set; } = null!;

    public ApplicationContext(DbContextOptions<ApplicationContext> options)
        : base(options)
    {
        Database.EnsureCreated();
    }

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        base.OnModelCreating(modelBuilder);

        modelBuilder
            .Entity<ProductInside>()
            .HasOne(e => e.MainProduct)
            .WithMany(e => e.ProductInsides);

        modelBuilder
            .Entity<ProductInside>()
            .HasOne(e => e.InsideProduct)
            .WithOne(e => e.ProductMain)
            .OnDelete(DeleteBehavior.Restrict);
        
        modelBuilder
            .Entity<ProductInside>()
            .HasKey(t => new { t.InsideProductId, t.MainProductId });
    }
}
