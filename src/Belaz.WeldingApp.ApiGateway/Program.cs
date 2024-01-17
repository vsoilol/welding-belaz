using System.Text;
using Belaz.WeldingApp.ApiGateway.Config;
using Belaz.WeldingApp.Common.Extensions;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.IdentityModel.Tokens;
using Microsoft.OpenApi.Models;
using MMLib.Ocelot.Provider.AppConfiguration;
using MMLib.SwaggerForOcelot.DependencyInjection;
using Ocelot.DependencyInjection;
using Ocelot.Middleware;
using Serilog;
using Swashbuckle.AspNetCore.Filters;

var builder = WebApplication.CreateBuilder(args);

builder.Host.UseSerilog(ProjectLoggerConfiguration.GetLoggerConfiguration("gateway-api"));

builder.Configuration
    .SetBasePath(builder.Environment.ContentRootPath)
    .AddJsonFile("appsettings.json", optional: true, reloadOnChange: true)
    .AddJsonFile(
        $"appsettings.{builder.Environment.EnvironmentName}.json",
        optional: true,
        reloadOnChange: true
    )
    .AddOcelotWithSwaggerSupport(
        (o) =>
        {
            o.Folder = "Configuration";
        }
    )
    .AddEnvironmentVariables();

builder.Services.AddOcelot().AddAppConfiguration();
;
builder.Services.AddSwaggerForOcelot(builder.Configuration);

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
    .AddJwtBearer(
        "ApiGatewayKey",
        options =>
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
        }
    );

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

var app = builder.Build();

app.UseCors("NgOrigins");

app.UseSwagger();

await app.UseSwaggerForOcelotUI(options =>
    {
        options.ReConfigureUpstreamSwaggerJson = AlterUpstream.AlterUpstreamSwaggerJson;
        options.DownstreamSwaggerEndPointBasePath = "/swagger/docs";
        options.PathToSwaggerGenerator = "/swagger/docs";
    })
    .UseOcelot();

app.Run();
