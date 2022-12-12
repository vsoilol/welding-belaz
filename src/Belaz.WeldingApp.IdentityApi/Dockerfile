FROM mcr.microsoft.com/dotnet/aspnet:6.0 AS base
WORKDIR /app
EXPOSE 80
EXPOSE 443

FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build
WORKDIR /src
COPY ["Belaz.WeldingApp.IdentityApi/Belaz.WeldingApp.IdentityApi.csproj", "Belaz.WeldingApp.IdentityApi/"]
COPY ["Belaz.WeldingApp.IdentityApi.Data/Belaz.WeldingApp.IdentityApi.Data.csproj", "Belaz.WeldingApp.IdentityApi.Data/"]
RUN dotnet restore "Belaz.WeldingApp.IdentityApi/Belaz.WeldingApp.IdentityApi.csproj"
COPY . .
WORKDIR "/src/Belaz.WeldingApp.IdentityApi"
RUN dotnet build "Belaz.WeldingApp.IdentityApi.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "Belaz.WeldingApp.IdentityApi.csproj" -c Release -o /app/publish

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "Belaz.WeldingApp.IdentityApi.dll"]
