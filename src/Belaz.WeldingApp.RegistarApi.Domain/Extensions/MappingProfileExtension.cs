using System.Reflection;
using AutoMapper;
using Belaz.WeldingApp.RegistarApi.Domain.Mappings;

namespace Belaz.WeldingApp.RegistarApi.Domain.Extensions;

public static class MappingProfileExtension
{
    public static void ApplyMappingsFromAssembly(this Profile profile, Assembly assembly)
    {
        var types = assembly.GetExportedTypes()
            .Where(t => t.GetInterfaces().Any(i =>
                i.IsGenericType &&
                (i.GetGenericTypeDefinition() == typeof(IMapFrom<>)
                 || i.GetGenericTypeDefinition() == typeof(IMapTo<>))))
            .ToList();

        foreach (var type in types)
        {
            var instance = Activator.CreateInstance(type);

            var methodInfo = type.GetMethod("Mapping")
                             ?? GetInterface(type).GetMethod("Mapping");

            methodInfo?.Invoke(instance, new object[] { profile });
        }
    }

    private static Type GetInterface(Type type)
    {
        return type.GetInterface("IMapFrom`1") ?? type.GetInterface("IMapTo`1")!;
    }
}