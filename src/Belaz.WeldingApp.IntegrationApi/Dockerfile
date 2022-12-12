FROM mcr.microsoft.com/dotnet/aspnet:6.0 AS base
WORKDIR /app
EXPOSE 80
EXPOSE 443

FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build
WORKDIR /src
COPY ["Belaz.WeldingApp.IntegrationApi/Belaz.WeldingApp.IntegrationApi.csproj", "Belaz.WeldingApp.IntegrationApi/"]
RUN dotnet restore "Belaz.WeldingApp.IntegrationApi/Belaz.WeldingApp.IntegrationApi.csproj"
COPY . .
WORKDIR "/src/Belaz.WeldingApp.IntegrationApi"
RUN dotnet build "Belaz.WeldingApp.IntegrationApi.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "Belaz.WeldingApp.IntegrationApi.csproj" -c Release -o /app/publish

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "Belaz.WeldingApp.IntegrationApi.dll"]
