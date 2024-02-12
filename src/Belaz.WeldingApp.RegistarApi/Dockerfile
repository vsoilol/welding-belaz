FROM mcr.microsoft.com/dotnet/aspnet:6.0 AS base
WORKDIR /app
EXPOSE 80
EXPOSE 443

ENV http_proxy http://temp:54321@192.168.100.5:3128
ENV https_proxy http://temp:54321@192.168.100.5:3128

FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build
WORKDIR /src
COPY ["Belaz.WeldingApp.RegistarApi/Belaz.WeldingApp.RegistarApi.csproj", "Belaz.WeldingApp.RegistarApi/"]

ENV http_proxy http://temp:54321@192.168.100.5:3128
ENV https_proxy http://temp:54321@192.168.100.5:3128

RUN dotnet restore "Belaz.WeldingApp.RegistarApi/Belaz.WeldingApp.RegistarApi.csproj"
COPY . .
WORKDIR "/src/Belaz.WeldingApp.RegistarApi"
RUN dotnet build "Belaz.WeldingApp.RegistarApi.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "Belaz.WeldingApp.RegistarApi.csproj" -c Release -o /app/publish

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "Belaz.WeldingApp.RegistarApi.dll"]
