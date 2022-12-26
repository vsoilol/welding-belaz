using System.Reflection;
using System.Text;
using Belaz.WeldingApp.IdentityApi.Data.DataAccess;
using Belaz.WeldingApp.IdentityApi.Data.Repositories;
using Belaz.WeldingApp.IdentityApi.Data.Repositories.Entities;
using Belaz.WeldingApp.IdentityApi.Data.Repositories.Interfaces;
using Belaz.WeldingApp.IdentityApi.Extensions;
using Belaz.WeldingApp.IdentityApi.Filters;
using Belaz.WeldingApp.IdentityApi.Managers;
using Belaz.WeldingApp.IdentityApi.Managers.Interfaces;
using Belaz.WeldingApp.IdentityApi.Middlewares;
using Belaz.WeldingApp.IdentityApi.Options;
using Belaz.WeldingApp.IdentityApi.Presenters;
using Belaz.WeldingApp.IdentityApi.Presenters.Interfaces;
using Belaz.WeldingApp.IdentityApi.Validators;
using FluentValidation;
using FluentValidation.AspNetCore;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.EntityFrameworkCore;
using Microsoft.IdentityModel.Tokens;
using Microsoft.OpenApi.Models;
using Swashbuckle.AspNetCore.Filters;

namespace Belaz.WeldingApp.IdentityApi
{
    public class Startup
    {
        public IConfiguration Configuration { get; }

        public string DatabaseConnectionString => Configuration.GetConnectionString("IdentityDb");

        public Startup(IConfiguration configuration)
        {
            Configuration = configuration;
        }

        public void ConfigureServices(IServiceCollection services)
        {
            services.Configure<AuthOptions>(Configuration.GetSection("Auth"));

            services.AddDbContext<IdentityDbContext>(
                options => options.UseNpgsql(DatabaseConnectionString));

            services.AddFluentValidationClientsideAdapters();
            services.AddValidatorsFromAssembly(typeof(Startup).Assembly);

            services.AddScoped<IRepository<UserData>, UserRepository>();
            services.AddScoped<IRepository<RoleData>, RoleRepository>();
            services.AddScoped<IRoleRepository, RoleRepository>();
            services.AddScoped<IUserPresenter, UserPresenter>();
            services.AddScoped<IUserManager, UserManager>();
            services.AddScoped<ITokenManager, TokenManager>();
            services.AddScoped<IAuthPresenter, AuthPresenter>();
            services.AddScoped<IAuthManager, AuthManager>();

            services.AddHttpContextAccessor();

            services.AddAutoMapper(typeof(Startup).Assembly);

            services.AddControllers(
                    options =>
                    {
                        options.Filters.Add<ApiValidationFilter>();
                    })
                .AddNewtonsoftJson(options =>
                    options.SerializerSettings.ReferenceLoopHandling = Newtonsoft.Json.ReferenceLoopHandling.Ignore)
                .RegisterValidatorsInAssembly(typeof(Startup).Assembly);

            services.AddEndpointsApiExplorer();

            services.AddSwaggerGen(options =>
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

            services.AddAuthentication(JwtBearerDefaults.AuthenticationScheme)
                .AddJwtBearer(options =>
                {
                    options.TokenValidationParameters = new TokenValidationParameters
                    {
                        ValidateIssuerSigningKey = true,
                        IssuerSigningKey = new SymmetricSecurityKey(Encoding.UTF8
                            .GetBytes(Configuration.GetSection("Auth:Secret").Value)),
                        ValidateIssuer = false,
                        ValidateAudience = false,
                    };
                });

            services.AddCors(options => options.AddPolicy(name: "NgOrigins",
                policy => { policy.AllowAnyOrigin().AllowAnyMethod().AllowAnyHeader(); }));
        }

        public void Configure(IApplicationBuilder app, IWebHostEnvironment env)
        {
            app.UseMiddleware<ExceptionHandlerMiddleware>();

            /*app.UseSwagger();
            app.UseSwaggerUI(c =>
            {
                c.RoutePrefix = "api/swagger";
            });*/

            app.UseSwagger(c =>
            {
                c.RouteTemplate = "api/swagger/{documentname}/swagger.json";
            });
            app.UseSwaggerUI(c =>
            {
                c.SwaggerEndpoint("/api/swagger/v1/swagger.json", "Welding Belaz Identity");
                c.RoutePrefix = "api/swagger";
            });

            app.UseCors("NgOrigins");
            app.UseHttpsRedirection();

            app.UseRouting();

            app.UseAuthentication();
            app.UseAuthorization();

            app.UseEndpoints(endpoints => { endpoints.MapControllers(); });
        }

        //private readonly IWebHostEnvironment _webHostEnvironment;
        //_webHostEnvironment.IsDevelopment()
        //    ? Configuration.GetConnectionString("WeldingDBConnection")
        //    : GetHerokuConnectionString();


        //private string GetHerokuConnectionString()
        //{
        //    string connectionUrl = Environment.GetEnvironmentVariable("DATABASE_URL");

        //    var databaseUri = new Uri(connectionUrl);

        //    string db = databaseUri.LocalPath.TrimStart('/');
        //    string[] userInfo = databaseUri.UserInfo.Split(':', StringSplitOptions.RemoveEmptyEntries);

        //    return $"User ID={userInfo[0]};Password={userInfo[1]};Host={databaseUri.Host};Port={databaseUri.Port};Database={db};Pooling=true;SSL Mode=Require;Trust Server Certificate=True;";
        //}
    }
}
