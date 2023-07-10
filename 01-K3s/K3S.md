## **Instalação e Configuração do Cluster K3S - Máquinas do Cluster**

### Pré-Requisitos

- SO com cache atualizado
- curl
- ca-certificates

---
### Atualizar o sistema e instalar pacotes necessários

```shell
sudo apt update && sudo apt install ca-certificates curl -y
```

### Provisionamento K3s ***Node Master 01*** com Banco de Dados ***Interno***

```shell
curl -sfL https://get.k3s.io |  sh -s - server --node-taint CriticalAddonsOnly=true:NoExecute --disable traefik --disable servicelb --cluster-init
```

### Provisionamento K3s ***Node Master 01*** com Banco de Dados ***Externo***

```shell
curl -sfL https://get.k3s.io |  sh -s - server --datastore-endpoint="mysql://<User>:<Password>@tcp(<IP ou hostname do servidor banco de dados>:3306)/<Name Database>" --node-taint CriticalAddonsOnly=true:NoExecute --disable traefik --disable servicelb
```

- _--node-taint CriticalAddonsOnly=true:NoExecute_ - Permitirá um plano de controle dedicado, sem utilização de carga de usuário
- _--disable traefik_ - Desabilitando o traefik interno padrão
- _--disable servicelb_ - Desabilitando o loadbalancer interno padrão
- _--cluster-init_ - Declaração para inicializar o cluster com Etcd

### Obter o Token do **Node Master 01**

```shell
sudo cat /var/lib/rancher/k3s/server/node-token
```

### Outro(s) ***Node(s) Master(s)*** com Banco de Dados ***Interno***

```shell
curl -sfL https://get.k3s.io |  sh -s - server --node-taint CriticalAddonsOnly=true:NoExecute --disable traefik --disable servicelb --cluster-init --token=SECRET
```

### Outro(s) ***Node(s) Master(s)*** com Banco de Dados ***Externo***

```shell
curl -sfL https://get.k3s.io |  sh -s - server --datastore-endpoint="mysql://<User>:<Password>@tcp(<IP ou hostname do servidor banco de dados>:3306)/<Name Database>" --node-taint CriticalAddonsOnly=true:NoExecute --disable traefik --disable servicelb --token=SECRET
```

### Provisionamento do(s) **Node(s) Worker(s)**

```shell
curl -sfL https://get.k3s.io | K3S_URL=https://<IP ou hostname do Node Master>:6443 K3S_TOKEN=<Token do Master> sh -
```

---

Documentação Oficial do K3S: [Link](https://docs.k3s.io/)
