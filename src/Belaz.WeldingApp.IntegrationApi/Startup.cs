using System.Text;
using Belaz.WeldingApp.IntegrationApi.Common;
using Belaz.WeldingApp.IntegrationApi.Config;
using Belaz.WeldingApp.IntegrationApi.DelegatingHandlers;
using Belaz.WeldingApp.IntegrationApi.IntegrationApi;
using Belaz.WeldingApp.IntegrationApi.IntegrationApi.Implementations;
using Belaz.WeldingApp.IntegrationApi.IntegrationApi.Interfaces;
using Belaz.WeldingApp.IntegrationApi.Managers;
using Belaz.WeldingApp.IntegrationApi.Managers.Implementations;
using Belaz.WeldingApp.IntegrationApi.Managers.Interfaces;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Diagnostics;
using Microsoft.Extensions.Http;
using Microsoft.IdentityModel.Tokens;
using Microsoft.OpenApi.Models;
using Swashbuckle.AspNetCore.Filters;

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
            services.RegisterIntegrationApis(Configuration);
            services.AddScoped<IUserManager, UserManager>();

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
