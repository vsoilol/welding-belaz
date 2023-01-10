using System.Text;
using Belaz.WeldingApp.WeldingApi;
using Belaz.WeldingApp.WeldingApi.Helpers;
using Belaz.WeldingApp.WeldingApi.Repositories;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.EntityFrameworkCore;
using Microsoft.IdentityModel.Tokens;
using Microsoft.OpenApi.Models;
using Serilog;
using Swashbuckle.AspNetCore.Filters;
using WeldingApp.Common.Extensions;
using WeldingApp.Common.Filters;


var builder = WebApplication.CreateBuilder(args);

builder.Host.UseSerilog(ProjectLoggerConfiguration.GetLoggerConfiguration("welding-api"));

builder.WebHost.ConfigureAppConfiguration((builderContext, config) =>
{
    var env = builderContext.HostingEnvironment;

    // find the shared folder in the parent folder
    var sharedFolder = env.EnvironmentName.Contains("Docker") ? "" : Path.Combine(env.ContentRootPath, "..");

    //load the SharedSettings first, so that appsettings.json overrwrites it
    config
        .AddJsonFile(Path.Combine(sharedFolder, "sharedsettings.json"), optional: true)
        .AddJsonFile("appsettings.json", optional: true)
        .AddJsonFile($"appsettings.{env.EnvironmentName}.json", optional: true);

    config.AddEnvironmentVariables();
});

var connectionString = builder.Configuration.GetConnectionString("WeldingDatabase");

builder.Services.AddDbContext<ApplicationContext>(options =>
    options.UseNpgsql(connectionString));

builder.Services.AddAutoMapper(typeof(Program).Assembly);

builder.Services.RegisterDependency();

builder.Services.AddControllers(
        options => { options.Filters.Add<ApiValidationFilter>(); })
    .RegisterValidatorsInAssembly(typeof(Program).Assembly);

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

AppContext.SetSwitch("Npgsql.EnableLegacyTimestampBehavior", true);

var app = builder.Build();

using (var scope = app.Services.CreateScope())
{
    var services = scope.ServiceProvider;

    var context = services.GetRequiredService<ApplicationContext>();
    await DataSeed.SeedSampleDataAsync(context);
}

app.UseSwagger(c => { c.RouteTemplate = "api/swagger/{documentname}/swagger.json"; });
app.UseSwaggerUI(c =>
{
    c.SwaggerEndpoint("/api/swagger/v1/swagger.json", "Welding Belaz");
    c.RoutePrefix = "api/swagger";
});

app.UseHttpsRedirection();

app.UseAuthentication();
app.UseAuthorization();

app.MapControllers();

app.Run();