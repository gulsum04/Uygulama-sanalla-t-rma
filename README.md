# .NET MVC Core Uygulamasının Docker, Oracle VM VirtualBox ve Azure ile Sanallaştırılması ve Bulut Ortamında Çalıştırılması

## Proje Açıklaması
Bu projede, bir **.NET MVC Core** web uygulaması geliştirilmiş, **MSSQL** veritabanı kullanılarak veri tabanı tasarımı yapılmıştır. Uygulama aşağıdaki sanallaştırma teknolojileri kullanılarak farklı ortamlarda çalıştırılmıştır:

1. **Docker** ile yerel bilgisayarda çalıştırma.
2. **Oracle VM VirtualBox** üzerinde sanal Ubuntu ortamında Docker kullanarak çalıştırma.
3. **Microsoft Azure** bulut platformunda uygulama deploy ederek bulut ortamında erişilebilir hale getirme.

## Proje Yapısı
- **Uygulama Katmanı:** .NET MVC Core  
- **Veritabanı Katmanı:** MSSQL  
- **Sanallaştırma Katmanı:** Docker, Oracle VM VirtualBox  
- **Bulut Katmanı:** Microsoft Azure  

## Proje Hedefleri
- Docker kullanarak uygulamayı konteynerleştirmek.
- Oracle VM VirtualBox üzerinde sanal makine oluşturarak uygulamayı çalıştırmak.
- Microsoft Azure platformunda uygulamayı bulut ortamında deploy etmek.
- Sanallaştırma teknolojilerini kullanarak taşınabilirlik ve ölçeklenebilirlik sağlamak.

## Kullanılan Teknolojiler ve Araçlar
- **.NET MVC Core:** Web uygulaması geliştirme.  
- **MSSQL:** Veritabanı yönetimi.  
- **Docker:** Uygulama konteynerleştirme.  
- **Oracle VM VirtualBox:** Sanallaştırma platformu.  
- **Microsoft Azure:** Bulut platformu.  
- **Ubuntu:** Sanal makine işletim sistemi.  

## Proje Kurulumu

### 1. Yerel Bilgisayarda Docker ile Çalıştırma

1. **Docker Kurulumu:**  
   [Docker Kurulumu İçin Rehber](https://docs.docker.com/get-docker/)
   
2. **Dockerfile ve Docker Compose ile Uygulamayı Çalıştırma:**
   ```bash
   docker-compose up --build
 3. **Uygulamaya Erişim::**
 4.  ```bash
          (https://localhost:5000/Movies)

  ### 2. Oracle VM VirtualBox ile Sanal Ubuntu Ortamında Çalıştırma
  1. **Oracle VM VirtualBox Kurulumu:**  
   [Oracle VM VirtualBox Kurulumu İçin Rehber]([https://docs.docker.com/get-docker/](https://www.virtualbox.org/wiki/Downloads)
   
  2. **Ubuntu Sanal Makinesi Kurulumu:**
     [Ubuntu Sanal Makinesi Kurulumu İçin Rehber]([https://docs.docker.com/get-docker/]([https://www.virtualbox.org/wiki/Downloads](https://ubuntu.com/download)
  3. **Docker ve Docker Compose Kurulumu:**
       ```bash
          sudo apt-get update
          sudo apt-get install docker.io docker-compose
  4. **Uygulamayı Çalıştırma:**
       ```bash
          docker-compose up --build
  5. **Uygulamaya Erişim:**
       ```bash
           http://[VM_IP]:5000/Movies

  ### 3. Azure Cloud Platformunda Çalıştırma
  1. **Azure CLI Kurulumu:**  
   [Azure CLI Kurulumu İçin Rehber](https://learn.microsoft.com/en-us/cli/azure/install-azure-cli)
  2. **Azure Container Registry (ACR) Oluşturma ve Docker İmajını Deploy Etme::**
       ```bash
             az acr create --name <RegistryName> --sku Basic --resource-group <ResourceGroupName>
             az acr login --name <RegistryName>
             docker tag <image> <RegistryName>.azurecr.io/<image>:v1
             docker push <RegistryName>.azurecr.io/<image>:v1
  3. **Azure'da Container'ı Çalıştırma:**
       ```bash
            az container create --resource-group <ResourceGroupName> --name <ContainerName> --image <RegistryName>.azurecr.io/<image>:v1 --dns-name-label <UniqueLabel> --ports 5000

  4. **Uygulamaya Erişim:**
       ```bash
           http://<UniqueLabel>.<region>.azurecontainer.io:5000/Movies

        
  
