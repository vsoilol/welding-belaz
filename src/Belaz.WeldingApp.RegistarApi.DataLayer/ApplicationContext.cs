using Belaz.WeldingApp.RegistarApi.Domain.Entities;
using Belaz.WeldingApp.RegistarApi.Domain.Entities.CalendarInfo;
using Belaz.WeldingApp.RegistarApi.Domain.Entities.IdentityUser;
using Belaz.WeldingApp.RegistarApi.Domain.Entities.ProductInfo;
using Belaz.WeldingApp.RegistarApi.Domain.Entities.Production;
using Belaz.WeldingApp.RegistarApi.Domain.Entities.TaskInfo;
using Belaz.WeldingApp.RegistarApi.Domain.Entities.TechnologicalProcessInfo;
using Belaz.WeldingApp.RegistarApi.Domain.Entities.Users;
using Belaz.WeldingApp.RegistarApi.Domain.Entities.WeldingEquipmentInfo;
using Microsoft.EntityFrameworkCore;

namespace Belaz.WeldingApp.RegistarApi.DataLayer;

public sealed class ApplicationContext : DbContext
{
    public DbSet<UserData> Users { get; set; } = null!;

    public DbSet<RoleData> Roles { get; set; } = null!;

    public DbSet<UserRole> UserRoles { get; set; } = null!;

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

        modelBuilder.Entity<UserRole>().HasKey(t => new { t.RoleId, t.UserId });
        modelBuilder
            .Entity<ProductInside>()
            .HasKey(t => new { t.InsideProductId, t.MainProductId });
    }
}
