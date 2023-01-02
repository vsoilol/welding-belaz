using Belaz.WeldingApp.ApiGateway.Config;
using Microsoft.OpenApi.Models;
using MMLib.Ocelot.Provider.AppConfiguration;
using MMLib.SwaggerForOcelot.DependencyInjection;
using Ocelot.DependencyInjection;
using Ocelot.Middleware;

var builder = WebApplication.CreateBuilder(args);

/*builder.Host.ConfigureAppConfiguration((hostingContext, config) =>
{
    config
        .SetBasePath(hostingContext.HostingEnvironment.ContentRootPath)
        .AddJsonFile("appsettings.json", optional: true, reloadOnChange: true)
        .AddJsonFile($"appsettings.{hostingContext.HostingEnvironment.EnvironmentName}.json",
            optional: true, reloadOnChange: true)
        .AddOcelotWithSwaggerSupport((o) =>
        {
            o.Folder = "Configuration";
        })
        .AddEnvironmentVariables();
});*/

builder.Configuration.SetBasePath(builder.Environment.ContentRootPath)
    .AddJsonFile("appsettings.json", optional: true, reloadOnChange: true)
    .AddJsonFile($"appsettings.{builder.Environment.EnvironmentName}.json",
        optional: true, reloadOnChange: true)
    .AddOcelotWithSwaggerSupport((o) => { o.Folder = "Configuration"; })
    .AddEnvironmentVariables();

builder.Services.AddOcelot().AddAppConfiguration();;
builder.Services.AddSwaggerForOcelot(builder.Configuration);

// Add services to the container.
// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer();

builder.Services.AddSwaggerGen(c =>
{
    c.SwaggerDoc("v1", new OpenApiInfo { Title = "Welding API Gateway", Version = "v1" });
});

var app = builder.Build();

app.UseSwagger();

await app.UseSwaggerForOcelotUI(options =>
{
    options.ReConfigureUpstreamSwaggerJson = AlterUpstream.AlterUpstreamSwaggerJson;
    options.DownstreamSwaggerEndPointBasePath = "/swagger/docs";
    options.PathToSwaggerGenerator = "/swagger/docs";
}).UseOcelot();

app.Run();