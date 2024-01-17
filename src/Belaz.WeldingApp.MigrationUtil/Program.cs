using Belaz.WeldingApp.Migrations;
using Belaz.WeldingApp.MigrationUtil;
using FluentMigrator.Runner;
using FluentMigrator.Runner.Initialization;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;

var configuration = ConfigureConfigurationBuilder(args).Build();

var connectionString = GetConnectionString(configuration);

using IHost host = CreateHostBuilder(args, configuration, connectionString).Build();
using var scope = host.Services.CreateScope();

var services = scope.ServiceProvider;

try
{
    await services.GetRequiredService<App>().ExecuteAsync();
}
catch (Exception ex)
{
    Console.WriteLine(ex.Message);
}

static IHostBuilder CreateHostBuilder(string[] args, IConfiguration? configuration, string connectionString)
{
    return Host.CreateDefaultBuilder(args)
        .ConfigureAppConfiguration(builder =>
        {
            builder.Sources.Clear();
            builder.AddConfiguration(configuration!);
        })
        .ConfigureServices((_, services) =>
        {
            services.AddSingleton<App>();
            services.AddFluentMigratorCore()
                .Configure<AssemblySourceOptions>(x => x.AssemblyNames = new[] { typeof(_202312180001_InitialTables).Assembly.GetName().Name })
                .ConfigureRunner(rb => rb
                    .AddPostgres()
                    .WithGlobalConnectionString(connectionString)
                    .ScanIn(typeof(_202312180001_InitialTables).Assembly).For.Migrations())
                .AddLogging(lb => lb.AddFluentMigratorConsole());
        });
}

static string GetConnectionString(IConfiguration configuration, string sectionName = "DefaultConnection")
{
    var prodConnectionString = configuration.GetConnectionString(sectionName)!;

    return prodConnectionString;
}

static IConfigurationBuilder ConfigureConfigurationBuilder(string[] args,
    IConfigurationBuilder? configurationBuilder = null)
{
    configurationBuilder ??= new ConfigurationBuilder();

    configurationBuilder
        .AddJsonFile("appsettings.json", optional: true, reloadOnChange: true)
        .AddEnvironmentVariables()
        .AddCommandLine(args);

    return configurationBuilder;
}