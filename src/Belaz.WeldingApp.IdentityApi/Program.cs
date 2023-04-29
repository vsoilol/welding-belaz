using System.Text;
using Belaz.WeldingApp.Common.Entities.IdentityUser;
using Belaz.WeldingApp.Common.Extensions;
using Belaz.WeldingApp.Common.Filters;
using Belaz.WeldingApp.Common.Options;
using Belaz.WeldingApp.IdentityApi;
using Belaz.WeldingApp.IdentityApi.Data.DataAccess;
using Belaz.WeldingApp.IdentityApi.Data.Repositories.Interfaces;
using Belaz.WeldingApp.IdentityApi.Filters;
using Belaz.WeldingApp.IdentityApi.Helpers;
using Belaz.WeldingApp.IdentityApi.Middlewares;
using FluentValidation;
using FluentValidation.AspNetCore;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.EntityFrameworkCore;
using Microsoft.IdentityModel.Tokens;
using Microsoft.OpenApi.Models;
using Serilog;
using Swashbuckle.AspNetCore.Filters;

var builder = WebApplication.CreateBuilder(args);

builder.Host.UseSerilog(ProjectLoggerConfiguration.GetLoggerConfiguration("identity-api"));

builder.WebHost.ConfigureAppConfiguration(
    (builderContext, config) =>
    {
        var env = builderContext.HostingEnvironment;

        // find the shared folder in the parent folder
        var sharedFolder = env.EnvironmentName.Contains("Docker")
            ? ""
            : Path.Combine(env.ContentRootPath, "..");

        //load the SharedSettings first, so that appsettings.json overrwrites it
        config
            .AddJsonFile(Path.Combine(sharedFolder, "sharedsettings.json"), optional: true)
            .AddJsonFile("appsettings.json", optional: true)
            .AddJsonFile($"appsettings.{env.EnvironmentName}.json", optional: true);

        config.AddEnvironmentVariables();
    }
);

builder.Services.Configure<AuthOptions>(builder.Configuration.GetSection("Auth"));

builder.Services.AddDbContext<IdentityDbContext>(
    options => options.UseNpgsql(builder.Configuration.GetConnectionString("IdentityDb"))
);

builder.Services.AddFluentValidationClientsideAdapters();
builder.Services.AddValidatorsFromAssembly(typeof(Program).Assembly);

builder.Services.AddHttpContextAccessor();

builder.Services.RegisterDependency();

builder.Services.AddAutoMapper(typeof(Program).Assembly);

builder.Services
    .AddControllers(options =>
    {
        options.Filters.Add<ApiValidationFilter>();
        options.Filters.Add<LogEventFilter>();
    })
    .AddNewtonsoftJson(
        options =>
            options.SerializerSettings.ReferenceLoopHandling = Newtonsoft
                .Json
                .ReferenceLoopHandling
                .Ignore
    )
    .RegisterValidatorsInAssembly(typeof(Program).Assembly);

builder.Services.AddEndpointsApiExplorer();

builder.Services.AddSwaggerGen(options =>
{
    options.AddSecurityDefinition(
        "oauth2",
        new OpenApiSecurityScheme
        {
            Description =
                "Standard Authorization header using the Bearer scheme (\"bearer {token}\")",
            In = ParameterLocation.Header,
            Name = "Authorization",
            Type = SecuritySchemeType.ApiKey
        }
    );

    options.OperationFilter<SecurityRequirementsOperationFilter>();
});

builder.Services
    .AddAuthentication(JwtBearerDefaults.AuthenticationScheme)
    .AddJwtBearer(options =>
    {
        options.TokenValidationParameters = new TokenValidationParameters
        {
            ValidateIssuerSigningKey = true,
            IssuerSigningKey = new SymmetricSecurityKey(
                Encoding.UTF8.GetBytes(builder.Configuration.GetSection("Auth:Secret").Value)
            ),
            ValidateIssuer = false,
            ValidateAudience = false,
        };
    });

builder.Services.AddCors(
    options =>
        options.AddPolicy(
            name: "NgOrigins",
            policy =>
            {
                policy.AllowAnyOrigin().AllowAnyMethod().AllowAnyHeader();
            }
        )
);

AppContext.SetSwitch("Npgsql.EnableLegacyTimestampBehavior", true);

///////////////////////////////////////////////////////////////////////////////////////////

var app = builder.Build();

using (var scope = app.Services.CreateScope())
{
    var services = scope.ServiceProvider;

    try
    {
        var userRepository = services.GetRequiredService<IRepository<UserData>>();
        var context = services.GetRequiredService<IdentityDbContext>();
        await DataSeed.SeedSampleDataAsync(userRepository, context);
    }
    catch (Exception ex)
    {
        Log.Fatal(ex, "Application start-up failed");
    }
    finally
    {
        await Log.CloseAndFlushAsync();
    }
}

app.UseMiddleware<ExceptionHandlerMiddleware>();

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

app.UseEndpoints(endpoints =>
{
    endpoints.MapControllers();
});

app.Run();
