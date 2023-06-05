## Instalação e Configuração Kubectl

### Pré-Requisitos

- Sistema Atualizado
- Utilitário Curl

---
### Atualizar o sistema e instalar o __curl__

```shell
sudo apt update && sudo apt install -y ca-certificates curl
```

### Instalação a partir de Binário

```shell
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
```

### Caso queira, verifique o checksum

```shell
curl -LO "https://dl.k8s.io/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl.sha256"
```

### Instalação propriamente dita
```shell
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
```

---

Documentação Oficial do Kubectl bem [Aqui!](https://kubernetes.io/docs/home/)