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

public class ApplicationContext : DbContext
{
    public virtual DbSet<UserData> Users { get; set; } = null!;

    public virtual DbSet<Post> Posts { get; set; } = null!;

    public virtual DbSet<ProductAccountTask> ProductAccountTasks { get; set; } = null!;

    public virtual DbSet<ProductionArea> ProductionAreas { get; set; } = null!;

    public virtual DbSet<Workplace> Workplaces { get; set; } = null!;

    public virtual DbSet<DowntimeReason> DowntimeReasons { get; set; } = null!;

    public virtual DbSet<Workshop> Workshops { get; set; } = null!;

    public virtual DbSet<Calendar> Calendars { get; set; } = null!;

    public virtual DbSet<Day> Days { get; set; } = null!;

    public virtual DbSet<WeldingRecordLimit> WeldingRecordLimits { get; set; } = null!;

    public virtual DbSet<WorkingShift> WorkingShifts { get; set; } = null!;

    public virtual DbSet<Chief> Chiefs { get; set; } = null!;

    public virtual DbSet<Inspector> Inspectors { get; set; } = null!;

    public virtual DbSet<Master> Masters { get; set; } = null!;

    public virtual DbSet<Welder> Welders { get; set; } = null!;

    public virtual DbSet<WeldingEquipment> WeldingEquipments { get; set; } = null!;

    public virtual DbSet<WeldingEquipmentConditionTime> WeldingEquipmentConditionTimes { get; set; } =
        null!;

    public virtual DbSet<TechnologicalProcess> TechnologicalProcesses { get; set; } = null!;

    public virtual DbSet<TechnologicalInstruction> TechnologicalInstructions { get; set; } = null!;

    public virtual DbSet<WeldingTask> WeldingTasks { get; set; } = null!;

    public virtual DbSet<EventLog> EventLogs { get; set; } = null!;

    public virtual DbSet<Product> Products { get; set; } = null!;

    public virtual DbSet<ProductInside> ProductInsides { get; set; } = null!;

    public virtual DbSet<WeldPassage> WeldPassages { get; set; } = null!;

    public virtual DbSet<Seam> Seams { get; set; } = null!;

    public virtual DbSet<WeldPassageInstruction> WeldPassageInstructions { get; set; } = null!;

    public virtual DbSet<ProductAccount> ProductAccounts { get; set; } = null!;

    public virtual DbSet<ProductResult> ProductResults { get; set; } = null!;

    public virtual DbSet<WeldingRecord> WeldingRecords { get; set; } = null!;

    public virtual DbSet<DefectiveReason> DefectiveReasons { get; set; } = null!;

    public virtual DbSet<SeamAccount> SeamAccounts { get; set; } = null!;

    public virtual DbSet<SeamResult> SeamResults { get; set; } = null!;

    public static string ToChar(DateTime date, string format) => throw new NotSupportedException();

    public static string ToChar(TimeSpan time, string format) => throw new NotImplementedException();

    public ApplicationContext(DbContextOptions<ApplicationContext> options)
        : base(options)
    {
        Database.EnsureCreated();
    }

    public ApplicationContext()
    {
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
            .HasKey(t => new {t.InsideProductId, t.MainProductId});

        modelBuilder
            .HasDbFunction(
                typeof(ApplicationContext).GetMethod(nameof(ToChar), new[] {typeof(DateTime), typeof(string)})!)
            .HasName("to_char")
            .IsBuiltIn();

        modelBuilder
            .HasDbFunction(
                typeof(ApplicationContext).GetMethod(nameof(ToChar), new[] {typeof(TimeSpan), typeof(string)})!)
            .HasName("to_char")
            .IsBuiltIn();
    }
}