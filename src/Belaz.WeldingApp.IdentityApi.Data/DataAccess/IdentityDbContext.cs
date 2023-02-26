using System.Security.Cryptography;
using System.Text;
using Belaz.WeldingApp.IdentityApi.Data.Repositories.Entities;
using Microsoft.EntityFrameworkCore;

namespace Belaz.WeldingApp.IdentityApi.Data.DataAccess
{
    public class IdentityDbContext : DbContext
    {
        public IdentityDbContext(DbContextOptions<IdentityDbContext> options)
            : base(options) { }

        public DbSet<UserData> Users { get; set; }

        public DbSet<RoleData> Roles { get; set; }

        public DbSet<UserRole> UserRoles { get; set; }

        public DbSet<ProductionArea> ProductionAreas { get; set; }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            base.OnConfiguring(optionsBuilder);
        }

        protected override void OnModelCreating(ModelBuilder builder)
        {
            builder.Entity<UserRole>().HasKey(t => new { t.RoleId, t.UserId });
        }
    }
}
