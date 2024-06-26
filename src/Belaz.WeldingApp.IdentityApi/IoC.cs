﻿using Belaz.WeldingApp.IdentityApi.Data.Repositories;
using Belaz.WeldingApp.IdentityApi.Data.Repositories.Entities;
using Belaz.WeldingApp.IdentityApi.Data.Repositories.Interfaces;
using Belaz.WeldingApp.IdentityApi.Managers.Implementations;
using Belaz.WeldingApp.IdentityApi.Managers.Interfaces;

namespace Belaz.WeldingApp.IdentityApi;

public static class IoC
{
    public static void RegisterDependency(this IServiceCollection services)
    {
        services.AddScoped<IRepository<UserData>, UserRepository>();
        services.AddScoped<IRepository<RoleData>, RoleRepository>();
        services.AddScoped<IRoleRepository, RoleRepository>();
        services.AddScoped<IUserManager, UserManager>();
        services.AddScoped<ITokenManager, TokenManager>();
        services.AddScoped<IAuthManager, AuthManager>();
    }
}
