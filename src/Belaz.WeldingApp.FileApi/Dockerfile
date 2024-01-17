FROM mcr.microsoft.com/dotnet/aspnet:6.0 AS base
WORKDIR /app
EXPOSE 80
EXPOSE 443

FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build
WORKDIR /src
COPY ["Belaz.WeldingApp.FileApi/Belaz.WeldingApp.FileApi.csproj", "Belaz.WeldingApp.FileApi/"]
RUN dotnet restore "Belaz.WeldingApp.FileApi/Belaz.WeldingApp.FileApi.csproj"
COPY . .
WORKDIR "/src/Belaz.WeldingApp.FileApi"
RUN dotnet build "Belaz.WeldingApp.FileApi.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "Belaz.WeldingApp.FileApi.csproj" -c Release -o /app/publish

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .

RUN apt update \
    && apt install -y sudo libxkbcommon-x11-0 libc6 libc6-dev libgtk2.0-0 libnss3 libatk-bridge2.0-0 libx11-xcb1 libxcb-dri3-0 libdrm-common libgbm1 libasound2 libxrender1 libfontconfig1 libxshmfence1 libgdiplus libva-dev locales
RUN localedef -i ru_RU -c -f CP866 -A /usr/share/locale/locale.alias ru_RU.CP866
ENV LANG ru_RU.CP866

ENTRYPOINT ["dotnet", "Belaz.WeldingApp.FileApi.dll"]
