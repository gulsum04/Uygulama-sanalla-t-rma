# Temel ASP.NET Core Runtime imajı (ASP.NET Core 7.0)
FROM mcr.microsoft.com/dotnet/aspnet:7.0 AS base
WORKDIR /app
EXPOSE 80

# Uygulamanın derlenmesi için SDK imajı (Dotnet SDK 7.0)
FROM mcr.microsoft.com/dotnet/sdk:7.0 AS build
WORKDIR /src

# Proje dosyasını kopyalayıp bağımlılıkları yüklüyoruz
COPY ["sinemaOtamasyonu.csproj", "./"]
RUN dotnet restore "sinemaOtamasyonu.csproj"

# Diğer proje dosyalarını kopyalıyoruz
COPY . . 
WORKDIR "/src"

# Uygulamayı derliyoruz
RUN dotnet build "sinemaOtamasyonu.csproj" -c Release -o /app/build

# Uygulamanın yayımlanması
FROM build AS publish
RUN dotnet publish "sinemaOtamasyonu.csproj" -c Release -o /app/publish

# Nihai çalışma imajı
FROM base AS final
WORKDIR /app

# Yayınlanan uygulamayı kopyalıyoruz
COPY --from=publish /app/publish .

# Uygulamanın çalıştırılması
ENTRYPOINT ["dotnet", "sinemaOtamasyonu.dll"]
