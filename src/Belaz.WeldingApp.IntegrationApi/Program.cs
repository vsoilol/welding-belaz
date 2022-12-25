using Serilog;

namespace Belaz.WeldingApp.IntegrationApi
{
    public class Program
    {
        private static bool IsDevelopment => Environment.GetEnvironmentVariable("ASPNETCORE_ENVIRONMENT") == "Development";

        public static string HostPort => IsDevelopment ? "" : Environment.GetEnvironmentVariable("PORT");

        public static void Main(string[] args)
        {
            Log.Logger = new LoggerConfiguration()
                .Enrich.FromLogContext()
                .WriteTo.Console()
                .CreateLogger();

            //var host = CreateHostBuilder(args).Build();

            try
            {
                //await MigrationHelper.EnsureDatabasesMigrated(host.Services);

                //using (var scope = host.Services.CreateScope())
                //{
                //    var services = scope.ServiceProvider;
                //    await services.GetService<InitialData>().InitializeAsync();
                //}

                CreateHostBuilder(args).Build().Run();
            }
            catch (System.Exception ex)
            {
                Log.Fatal(ex, "Application start-up failed");
            }
            finally
            {
                Log.CloseAndFlush();
            }
        }


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
