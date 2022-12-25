using System.Reflection;
using Belaz.WeldingApp.IdentityApi.ValidatorFactory;
using FluentValidation;

namespace Belaz.WeldingApp.IdentityApi.Extensions
{
    public static class FluentValidationExtensions
    {
        public static void RegisterValidatorsInAssembly(this IMvcBuilder builder, Assembly assembly)
        {
            builder.RegisterValidatorsInAssemblyList(assembly);
        }

        public static void RegisterValidatorsInAssemblyList(this IMvcBuilder builder, params Assembly[] assemblies)
        {
            var assemblyList = assemblies?.ToList() ?? new List<Assembly>();
            if (!assemblyList.Any())
            {
                return;
            }

            // register the validators from the respective assemblies
            assemblyList.ForEach(x => builder.Services.AddValidatorsFromAssembly(x));

            // register the custom validator factory, to get `IValidator` instances to validate requests
            builder.Services.AddSingleton<ICustomValidatorFactory, CustomValidatorFactory>();
        }
    }
}
