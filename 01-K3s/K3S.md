## **Instalação e Configuração do Cluster K3s - Máquinas do Cluster**

### Dependências Ideais

- SO com cache atualizado
- curl
- ca-certificates

---
### Atualizar o sistema e instalar pacotes necessários

```shell
sudo apt update && sudo apt install ca-certificates curl -y
```

### Provisionamento K3s ***Node Master 1*** com Banco de Dados ***Etcd Interno***

```shell
curl -sfL https://get.k3s.io |  sh -s - server --node-taint CriticalAddonsOnly=true:NoExecute --disable traefik --disable servicelb --cluster-init
```

- _--node-taint CriticalAddonsOnly=true:NoExecute_ - Permitirá um plano de controle dedicado, sem utilização de carga de usuário (Definição de Master ser somente Master também)
- _--disable traefik_ - Desabilitando o traefik interno padrão (Caso deseje)
- _--disable servicelb_ - Desabilitando o loadbalancer interno padrão (Caso deseje)
- _--cluster-init_ - Declaração para inicializar o cluster com Etcd (Alta Disponbilidade. Caso deseje)

### Provisionamento K3s ***Node Master 1*** com Banco de Dados ***Externo***

```shell
curl -sfL https://get.k3s.io |  sh -s - server --datastore-endpoint="mysql://<User>:<Password>@tcp(<IP ou hostname do servidor banco de dados>:3306)/<Name Database>" --node-taint CriticalAddonsOnly=true:NoExecute --disable traefik --disable servicelb
```

- --datastore-endpoint='mysql://User:Password@tcp(IP ou hostname do servidor banco de dados:3306)/Name-Database" - Utilização de Banco de Dados externo (no exemplo: MySQL) ao cluster (Alta Disponibilidade externa)
- _--node-taint CriticalAddonsOnly=true:NoExecute_ - Permitirá um plano de controle dedicado, sem utilização de carga de usuário (Definição de Master ser somente Master também)
- _--disable traefik_ - Desabilitando o traefik interno padrão (Caso deseje)
- _--disable servicelb_ - Desabilitando o loadbalancer interno padrão (Caso deseje)

### Obter o Token do Cluster

```shell
sudo cat /var/lib/rancher/k3s/server/node-token
```

### Outro(s) ***Node(s) Master(s)*** com Banco de Dados ***Etcd Interno***

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
