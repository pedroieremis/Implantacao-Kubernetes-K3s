## **Instalação do Helm - Máquina do(a) DevOps**

### Pré-Requisitos

- SO com cache atualizado
- curl
- ca-certificates
- apt-transport-https

---
### Atualizar o sistema e instalar os Pacotes
```shell
sudo apt update && sudo apt install ca-certificates curl apt-transport-https -y
```

### Download da chave pública do Helm

```shell
curl https://baltocdn.com/helm/signing.asc | gpg --dearmor | sudo tee /usr/share/keyrings/helm.gpg > /dev/null
```

### Adicionando o repositório do Helm

```shell
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/helm.gpg] https://baltocdn.com/helm/stable/debian/ all main" | sudo tee /etc/apt/sources.list.d/helm-stable-debian.list
```

### Instalando o Helm

```shell
sudo apt update && sudo apt install helm -y
```

---

Documentação Oficial do Helm: [Link](https://helm.sh/docs/)