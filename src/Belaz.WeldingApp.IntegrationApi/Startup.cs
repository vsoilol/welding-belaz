using System.Text;
using Belaz.WeldingApp.IntegrationApi.Common;
using Belaz.WeldingApp.IntegrationApi.Config;

namespace Belaz.WeldingApp.IntegrationApi
{
    public class Startup
    {
        public IConfiguration Configuration { get; }

        public Startup(IConfiguration configuration)
        {
            Configuration = configuration;
        }

        public void ConfigureServices(IServiceCollection services)
        {
            services.Configure<ApiOptions>(Configuration.GetSection("Api"));

            services.AddHttpContextAccessor();

            services.AddAutoMapper(typeof(Startup).Assembly);

            services.AddControllers()
                    .AddNewtonsoftJson(options =>
                    options.SerializerSettings.ReferenceLoopHandling = Newtonsoft.Json.ReferenceLoopHandling.Ignore);

            services.AddHealthChecks();

            services.SetupSwagger();

            var apiUrls = new ApiOptions();
            Configuration.Bind("Api", apiUrls);
            services.RegisterIntegrationApis(Configuration, apiUrls);

            services.AddEndpointsApiExplorer();

            services.SetupJwtTokens(Configuration);

            services.AddCors(options => options.AddPolicy(name: "NgOrigins",
                policy =>
                {
                    policy.AllowAnyOrigin().AllowAnyMethod().AllowAnyHeader();
                }));
        }
        public void Configure(IApplicationBuilder app, IWebHostEnvironment env)
        {
            app.UseMiddleware<Middlewares.ExceptionHandlerMiddleware>();

            app.UseSwagger();
            app.UseSwaggerUI();

            app.UseCors("NgOrigins");
            app.UseHttpsRedirection();

            app.UseRouting();

            app.UseAuthentication();
            app.UseAuthorization();

            app.UseEndpoints(endpoints =>
            {
                endpoints.MapControllers();
            });
        }
    }
}
