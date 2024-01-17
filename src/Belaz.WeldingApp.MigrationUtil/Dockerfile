FROM mcr.microsoft.com/dotnet/runtime:6.0 AS base
WORKDIR /app

ENV http_proxy http://temp:54321@192.168.100.5:3128
ENV https_proxy http://temp:54321@192.168.100.5:3128

FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build
WORKDIR /src
COPY ["Belaz.WeldingApp.MigrationUtil/Belaz.WeldingApp.MigrationUtil.csproj", "Belaz.WeldingApp.MigrationUtil/"]
COPY ["Belaz.WeldingApp.Migrations/Belaz.WeldingApp.Migrations.csproj", "Belaz.WeldingApp.Migrations/"]

ENV http_proxy http://temp:54321@192.168.100.5:3128
ENV https_proxy http://temp:54321@192.168.100.5:3128

RUN dotnet restore "Belaz.WeldingApp.MigrationUtil/Belaz.WeldingApp.MigrationUtil.csproj"
COPY . .
WORKDIR "/src/Belaz.WeldingApp.MigrationUtil"
RUN dotnet build "Belaz.WeldingApp.MigrationUtil.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "Belaz.WeldingApp.MigrationUtil.csproj" -c Release -o /app/publish

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "Belaz.WeldingApp.MigrationUtil.dll"]
