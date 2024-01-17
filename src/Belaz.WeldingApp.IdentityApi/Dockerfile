FROM mcr.microsoft.com/dotnet/aspnet:6.0 AS base
WORKDIR /app
EXPOSE 80
EXPOSE 443

FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build
WORKDIR /src
COPY ["Belaz.WeldingApp.IdentityApi/Belaz.WeldingApp.IdentityApi.csproj", "Belaz.WeldingApp.IdentityApi/"]
COPY ["Belaz.WeldingApp.IdentityApi.Domain/Belaz.WeldingApp.IdentityApi.Domain.csproj", "Belaz.WeldingApp.IdentityApi.Domain/"]
COPY ["Belaz.WeldingApp.IdentityApi.DataLayer/Belaz.WeldingApp.IdentityApi.DataLayer.csproj", "Belaz.WeldingApp.IdentityApi.DataLayer/"]
COPY ["Belaz.WeldingApp.IdentityApi.BusinessLayer/Belaz.WeldingApp.IdentityApi.BusinessLayer.csproj", "Belaz.WeldingApp.IdentityApi.BusinessLayer/"]

RUN dotnet restore "Belaz.WeldingApp.IdentityApi/Belaz.WeldingApp.IdentityApi.csproj"
COPY . .
WORKDIR "/src/Belaz.WeldingApp.IdentityApi"
RUN dotnet build "Belaz.WeldingApp.IdentityApi.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "Belaz.WeldingApp.IdentityApi.csproj" -c Release -o /app/publish

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .

RUN apt-get update && apt-get install -y iputils-ping net-tools telnet

ENTRYPOINT ["dotnet", "Belaz.WeldingApp.IdentityApi.dll"]
