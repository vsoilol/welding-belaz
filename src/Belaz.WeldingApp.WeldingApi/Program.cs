using System.Reflection;
using System.Text;
using Belaz.WeldingApp.WeldingApi.BusinessLayer;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.IdentityModel.Tokens;
using Microsoft.OpenApi.Models;
using Serilog;
using Swashbuckle.AspNetCore.Filters;
using Belaz.WeldingApp.WeldingApi.DataLayer;
using Belaz.WeldingApp.WeldingApi.Middlewares;
using Belaz.WeldingApp.Common.Extensions;
using Belaz.WeldingApp.WeldingApi.Filters;

var builder = WebApplication.CreateBuilder(args);

builder.Host.UseSerilog(ProjectLoggerConfiguration.GetLoggerConfiguration("welding-api"));

builder.WebHost.ConfigureAppConfiguration(
    (builderContext, config) =>
    {
        var env = builderContext.HostingEnvironment;

        //load the SharedSettings first, so that appsettings.json overrwrites it
        config
            .AddJsonFile("appsettings.json", optional: true)
            .AddJsonFile($"appsettings.{env.EnvironmentName}.json", optional: true);

        config.AddEnvironmentVariables();
    }
);

var connectionString = builder.Configuration.GetConnectionString("WeldingDatabase");

var domainProjectAssembly =
    typeof(Belaz.WeldingApp.WeldingApi.Domain.Mappings.MappingProfile).Assembly;

var businessLayerProjectAssembly =
    typeof(Belaz.WeldingApp.WeldingApi.BusinessLayer.Mappings.MappingProfile).Assembly;

builder.Services.AddAutoMapper(domainProjectAssembly, businessLayerProjectAssembly);

builder.Services.AddDataLayer(connectionString);

builder.Services.AddBusinessLayer();

builder.Services
    .AddControllers(options =>
    {
        options.Filters.Add<AuthorizationFilter>();
        options.Filters.Add<LogEventFilter>();
    });

builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();

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

    var xmlFilename = $"{Assembly.GetExecutingAssembly().GetName().Name}.xml";
    options.IncludeXmlComments(Path.Combine(AppContext.BaseDirectory, xmlFilename));
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

AppContext.SetSwitch("Npgsql.EnableLegacyTimestampBehavior", true);

var app = builder.Build();

app.UseMiddleware<ExceptionHandlerMiddleware>();

app.UseSwagger(c =>
{
    c.RouteTemplate = "api/swagger/{documentname}/swagger.json";
});
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
