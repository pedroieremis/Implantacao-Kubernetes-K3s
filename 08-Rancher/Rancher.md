## **Instalação do Rancher Single Node com Docker - Noutra Máquina**

### Pré-Requisitos

- SO atualizado
- Docker instalado

### Criação de pasta para dados persistentes

```shell
sudo mkdir /dados-rancher
```

### Navegue até a pasta criada

```shell
cd /dados-rancher
```

### Provisione o Rancher Single Node em Docker

```shell
sudo docker run -d --privileged -v ./rancher:/var/lib/rancher --restart=unless-stopped -p 80:80 -p 443:443 rancher/rancher:stable
```

### Visualizar Logs do Container

```shell
sudo docker logs <id-container> -f
```

---

Documentação Oficial do Rancher: [Link](https://ranchermanager.docs.rancher.com/)