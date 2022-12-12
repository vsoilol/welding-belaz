using Belaz.WeldingApp.WeldingApi.Managers.Implementations;
using Belaz.WeldingApp.WeldingApi.Managers.Interfaces;
using Belaz.WeldingApp.WeldingApi.Repositories;
using Belaz.WeldingApp.WeldingApi.Repositories.Entities.Users;
using Belaz.WeldingApp.WeldingApi.Repositories.Entities.WeldingEquipmentInfo;
using Belaz.WeldingApp.WeldingApi.Repositories.Implementations;
using Microsoft.EntityFrameworkCore;

namespace Belaz.WeldingApp.WeldingApi
{
    public class Program
    {
        public static void Main(string[] args)
        {
            var builder = WebApplication.CreateBuilder(args);

            // Add services to the container.

            var connectionString = builder.Configuration.GetConnectionString("WeldingDatabase");

            builder.Services.AddDbContext<ApplicationContext>(options =>
                options.UseNpgsql(connectionString));

            builder.Services.AddAutoMapper(typeof(Program).Assembly);

            builder.Services.AddScoped<EntityFrameworkRepository<Welder>, WelderRepository>();
            builder.Services.AddScoped<EntityFrameworkRepository<WeldingEquipment>, WeldingEquipmentRepository>();
            builder.Services
                .AddScoped<EntityFrameworkRepository<WeldingEquipmentConditionTime>,
                    WeldingEquipmentConditionTimeRepository>();

            builder.Services.AddScoped<IWelderManager, WelderManager>();
            builder.Services.AddScoped<IWeldingEquipmentManager, WeldingEquipmentManager>();

            builder.Services.AddControllers();
            // Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
            builder.Services.AddEndpointsApiExplorer();
            builder.Services.AddSwaggerGen();

            var app = builder.Build();

            /*if (app.Environment.IsDevelopment())
            {
                app.UseSwagger();
                app.UseSwaggerUI();
            }*/
            app.UseSwagger();
            app.UseSwaggerUI();

            app.UseHttpsRedirection();

            app.UseAuthorization();

            app.MapControllers();

            app.Run();
        }
    }
}
