using System.Text;
using Belaz.WeldingApp.WeldingApi.Managers.Implementations;
using Belaz.WeldingApp.WeldingApi.Managers.Interfaces;
using Belaz.WeldingApp.WeldingApi.Repositories;
using Belaz.WeldingApp.WeldingApi.Repositories.Entities.Users;
using Belaz.WeldingApp.WeldingApi.Repositories.Entities.WeldingEquipmentInfo;
using Belaz.WeldingApp.WeldingApi.Repositories.Implementations;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.EntityFrameworkCore;
using Microsoft.IdentityModel.Tokens;
using Microsoft.OpenApi.Models;
using Swashbuckle.AspNetCore.Filters;

namespace Belaz.WeldingApp.WeldingApi
{
    public class Program
    {
        public static void Main(string[] args)
        {
            var builder = WebApplication.CreateBuilder(args);

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

            builder.Services.AddEndpointsApiExplorer();
            builder.Services.AddSwaggerGen();
            
            builder.Services.AddSwaggerGen(options =>
            {
                options.AddSecurityDefinition("oauth2",
                    new OpenApiSecurityScheme
                    {
                        Description = "Standard Authorization header using the Bearer scheme (\"bearer {token}\")",
                        In = ParameterLocation.Header,
                        Name = "Authorization",
                        Type = SecuritySchemeType.ApiKey
                    });

                options.OperationFilter<SecurityRequirementsOperationFilter>();
            });

            builder.Services.AddAuthentication(JwtBearerDefaults.AuthenticationScheme)
                .AddJwtBearer(options =>
                {
                    options.TokenValidationParameters = new TokenValidationParameters
                    {
                        ValidateIssuerSigningKey = true,
                        IssuerSigningKey = new SymmetricSecurityKey(Encoding.UTF8
                            .GetBytes(builder.Configuration.GetSection("Auth:Secret").Value)),
                        ValidateIssuer = false,
                        ValidateAudience = false,
                    };
                });

            var app = builder.Build();
            
            app.UseSwagger();
            app.UseSwaggerUI();

            app.UseHttpsRedirection();

            app.UseAuthentication();
            app.UseAuthorization();

            app.MapControllers();

            app.Run();
        }
    }
}
