FROM mcr.microsoft.com/dotnet/aspnet:6.0 AS base
WORKDIR /app
EXPOSE 80
EXPOSE 443

FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build
WORKDIR /src
COPY ["Belaz.WeldingApp.IdentityApi.WebApi/Belaz.WeldingApp.IdentityApi.WebApi.csproj", "Belaz.WeldingApp.IdentityApi.WebApi/"]
RUN dotnet restore "Belaz.WeldingApp.IdentityApi.WebApi/Belaz.WeldingApp.IdentityApi.WebApi.csproj"
COPY . .
WORKDIR "/src/Belaz.WeldingApp.IdentityApi.WebApi"
RUN dotnet build "Belaz.WeldingApp.IdentityApi.WebApi.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "Belaz.WeldingApp.IdentityApi.WebApi.csproj" -c Release -o /app/publish /p:UseAppHost=false

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "Belaz.WeldingApp.IdentityApi.WebApi.dll"]
