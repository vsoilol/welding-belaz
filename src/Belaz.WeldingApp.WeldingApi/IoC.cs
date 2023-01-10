using Belaz.WeldingApp.WeldingApi.Managers.Implementations;
using Belaz.WeldingApp.WeldingApi.Managers.Interfaces;
using Belaz.WeldingApp.WeldingApi.Repositories;
using Belaz.WeldingApp.WeldingApi.Repositories.Entities.ProductInfo;
using Belaz.WeldingApp.WeldingApi.Repositories.Entities.Production;
using Belaz.WeldingApp.WeldingApi.Repositories.Entities.TaskInfo;
using Belaz.WeldingApp.WeldingApi.Repositories.Entities.Users;
using Belaz.WeldingApp.WeldingApi.Repositories.Entities.WeldingEquipmentInfo;
using Belaz.WeldingApp.WeldingApi.Repositories.Implementations;

namespace Belaz.WeldingApp.WeldingApi;

public static class IoC
{
    public static void RegisterDependency(this IServiceCollection services)
    {
        // Repositories
        services.AddScoped<EntityFrameworkRepository<Welder>, WelderRepository>();
        services.AddScoped<EntityFrameworkRepository<WeldingEquipment>, WeldingEquipmentRepository>();
        services
            .AddScoped<EntityFrameworkRepository<WeldingEquipmentConditionTime>,
                WeldingEquipmentConditionTimeRepository>();
        services.AddScoped<EntityFrameworkRepository<Workshop>, WorkshopRepository>();
        services.AddScoped<EntityFrameworkRepository<Workplace>, WorkplaceRepository>();
        services.AddScoped<EntityFrameworkRepository<ProductionArea>, ProductionAreaRepository>();
        services.AddScoped<EntityFrameworkRepository<Post>, PostRepository>();
        services.AddScoped<EntityFrameworkRepository<Seam>, SeamRepository>();
        services.AddScoped<EntityFrameworkRepository<Product>, ProductRepository>();
        services.AddScoped<EntityFrameworkRepository<TechnologicalProcess>, TechnologicalProcessRepository>();
        services.AddScoped<EntityFrameworkRepository<WeldingTask>, WeldingTaskRepository>();
        services.AddScoped<EntityFrameworkRepository<Chief>, ChiefRepository>();
        services.AddScoped<EntityFrameworkRepository<Inspector>, InspectorRepository>();
        services.AddScoped<EntityFrameworkRepository<Master>, MasterRepository>();
        services.AddScoped<EntityFrameworkRepository<TechnologicalInstruction>, TechnologicalInstructionRepository>();

        // Managers
        services.AddScoped<IWelderManager, WelderManager>();
        services.AddScoped<IWeldingEquipmentManager, WeldingEquipmentManager>();
        services.AddScoped<IWorkshopManager, WorkshopManager>();
        services.AddScoped<IWorkplaceManager, WorkplaceManager>();
        services.AddScoped<IProductionAreaManager, ProductionAreaManager>();
        services.AddScoped<IPostManager, PostManager>();
        services.AddScoped<ITechnologicalProcessManager, TechnologicalProcessManager>();
        services.AddScoped<IWeldingTaskManager, WeldingTaskManager>();
        services.AddScoped<ISeamManager, SeamManager>();
        services.AddScoped<IProductManager, ProductManager>();
        services.AddScoped<IChiefManager, ChiefManager>();
        services.AddScoped<IInspectorManager, InspectorManager>();
        services.AddScoped<IMasterManager, MasterManager>();
        services.AddScoped<ITechnologicalInstructionManager, TechnologicalInstructionManager>();
    }
}