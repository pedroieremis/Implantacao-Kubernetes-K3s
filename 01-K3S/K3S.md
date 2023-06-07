# Instalação e Configuração do Cluster K3S

### Pré-Requisitos:

- Sistema Atualizado
- Utilitário Curl

---
### Atualizar o sistema e instalar o __curl__

```shell
sudo apt update && sudo apt install -y ca-certificates curl
```

### Instalação de Node Master 01

```shell
curl -sfL https://get.k3s.io |  sh -s - server --datastore-endpoint="mysql://<User>:<Password>@tcp(<IP ou hostname do servidor banco de dados>:<Port>)/<Name Database>" --node-taint CriticalAddonsOnly=true:NoExecute --disable traefik --disable servicelb --cluster-init
```

- _--node-taint CriticalAddonsOnly=true:NoExecute_ - Permitirá um plano de controle dedicado, sem utilização de carga de usuário
- _--disable traefik_ - Desabilitando o traefik interno padrão
- _--disable servicelb_ - Desabilitando o loadbalancer interno padrão
- _--cluster-init_ - Declaração para inicializar o cluster

### Localizar Token do Master Inicial

```shell
cat /var/lib/rancher/k3s/server/node-token
```

### Node Master X

```shell
curl -sfL https://get.k3s.io |  sh -s - server --datastore-endpoint="mysql://<User>:<Password>@tcp(<IP ou hostname do servidor banco de dados>:<Port>)/<Name Database>" --node-taint CriticalAddonsOnly=true:NoExecute --disable traefik --disable servicelb --cluster-init --token=SECRET
```

### Node Worker X

```shell
curl -sfL https://get.k3s.io | K3S_URL=https://<IP ou hostname do Node Master>:6443 K3S_TOKEN=<Token do Master> sh -
```

---

Documentação Oficial do K3S bem [Aqui!](https://docs.k3s.io/)
