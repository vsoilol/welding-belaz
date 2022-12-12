using Belaz.WeldingApp.IdentityApi.Data.Repositories.Entities;
using Belaz.WeldingApp.IdentityApi.Data.Repositories.Interfaces;
using Belaz.WeldingApp.IdentityApi.Helpers;
using Serilog;

namespace Belaz.WeldingApp.IdentityApi
{
    public class Program
    {
        public static async Task Main(string[] args)
        {
            Log.Logger = new LoggerConfiguration()
                .Enrich.FromLogContext()
                .WriteTo.Console()
                .CreateLogger();

            var host = CreateHostBuilder(args).Build();

            await CreateDbIfNotExists(host);

            await host.RunAsync();
        }

        private static async Task CreateDbIfNotExists(IHost host)
        {
            using (var scope = host.Services.CreateScope())
            {
                var services = scope.ServiceProvider;

                try
                {
                    var userRepository = services.GetRequiredService<IRepository<UserData>>();
                    var roleRepository = services.GetRequiredService<IRepository<RoleData>>();
                    await DataSeed.SeedSampleDataAsync(roleRepository, userRepository);
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
        }

        private static bool IsDevelopment =>
            Environment.GetEnvironmentVariable("ASPNETCORE_ENVIRONMENT") == "Development";

        public static string HostPort => IsDevelopment ? "" : Environment.GetEnvironmentVariable("PORT");

        public static IHostBuilder CreateHostBuilder(string[] args)
        {
            return Host.CreateDefaultBuilder(args)
                .ConfigureWebHostDefaults(webBuilder =>
                {
                    if (HostPort != "")
                    {
                        webBuilder.UseUrls($"http://+:{HostPort}");
                    }

                    webBuilder.UseStartup<Startup>();
                });
        }
    }
}
