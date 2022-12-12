using Belaz.WeldingApp.FileApi.Repositories.Entities;
using Microsoft.EntityFrameworkCore;

namespace Belaz.WeldingApp.FileApi.Repositories.DataAccess
{
    public class SQLContext : DbContext
    {
        public SQLContext(DbContextOptions<SQLContext> options)
            : base(options)
        {
        }

        public DbSet<Entity> Entities { get; set; }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            base.OnModelCreating(modelBuilder);
        }
    }
}
