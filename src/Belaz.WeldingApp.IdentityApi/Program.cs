using System.Text;
using Belaz.WeldingApp.Common.Extensions;
using Belaz.WeldingApp.Common.Options;
using Belaz.WeldingApp.IdentityApi.BusinessLayer;
using Belaz.WeldingApp.IdentityApi.BusinessLayer.Configs;
using Belaz.WeldingApp.IdentityApi.BusinessLayer.Helpers;
using Belaz.WeldingApp.IdentityApi.DataLayer;
using Belaz.WeldingApp.IdentityApi.Filters;
using Belaz.WeldingApp.IdentityApi.Middlewares;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.HttpOverrides;
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

        //load the SharedSettings first, so that appsettings.json overrwrites it
        config
            .AddJsonFile("appsettings.json", optional: true)
            .AddJsonFile($"appsettings.{env.EnvironmentName}.json", optional: true);

        config.AddEnvironmentVariables();
    }
);

builder.Services.Configure<AuthOptions>(builder.Configuration.GetSection("Auth"));

var domainProjectAssembly =
    typeof(Belaz.WeldingApp.IdentityApi.Domain.Mappings.MappingProfile).Assembly;
var businessLayerProjectAssembly =
    typeof(Belaz.WeldingApp.IdentityApi.BusinessLayer.Mappings.MappingProfile).Assembly;

builder.Services.AddAutoMapper(domainProjectAssembly, businessLayerProjectAssembly);

var connectionString = builder.Configuration.GetConnectionString("IdentityDb");

builder.Services.AddDataLayer(connectionString);

builder.Services.AddBusinessLayer();

builder.Services
    .AddControllers(options =>
    {
        options.Filters.Add<AuthorizationFilter>();
        options.Filters.Add<LogEventFilter>();
    });

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

var emailConfig = builder.Configuration
    .GetSection("EmailConfiguration")
    .Get<EmailConfiguration>();

builder.Services.AddSingleton(emailConfig);

AppContext.SetSwitch("Npgsql.EnableLegacyTimestampBehavior", true);

///////////////////////////////////////////////////////////////////////////////////////////

var app = builder.Build();

app.UseMiddleware<ExceptionHandlerMiddleware>();

/*using (var scope = app.Services.CreateScope())
{
    var services = scope.ServiceProvider;

    var context = services.GetRequiredService<ApplicationContext>();
    await DataSeed.SeedSampleDataAsync(context);
}*/

app.UseForwardedHeaders(new ForwardedHeadersOptions
{
    ForwardedHeaders = ForwardedHeaders.XForwardedFor | ForwardedHeaders.XForwardedProto
});

app.UseSwagger(c =>
{
    c.RouteTemplate = "api/swagger/{documentname}/swagger.json";
});
app.UseSwaggerUI(c =>
{
    c.SwaggerEndpoint("/api/swagger/v1/swagger.json", "Welding Belaz Identity");
    c.RoutePrefix = "api/swagger";
});

app.UseHttpsRedirection();

app.UseAuthentication();
app.UseAuthorization();

app.MapControllers();

app.Run();
