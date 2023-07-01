## **Instalação e Configuração MetalLB - Máquina do(a) DevOps**

### Adicionando repositório do MetalLB no Helm

```shell
helm repo add metallb https://metallb.github.io/metallb
```

### Atualizando o repositório Helm

```shell
helm repo update
```

### Instalando MetalLB

```shell
helm install metallb metallb/metallb --namespace metallb --create-namespace
```

---

## **Configurando MetalLB**

### Criando arquivo `metallb-pool.yml`

```shell
touch metallb-pool.yml
```

### Configurando o arquivo `metallb-pool.yml`

```shell
apiVersion: metallb.io/v1beta1
kind: IPAddressPool
metadata:
    name: <Nome da configuração: Ex: metallb-pool>
    namespace: metallb
spec:
    addresses:
    - <Ranger de IPs. Ex: 192.168.0.1-192.168.0.10>
```

### Criando arquivo `metallb-l2.yml`

```shell
touch metallb-l2.yml
```

### Configurando o arquivo `metallb-l2.yml`

```shell
apiVersion: metallb.io/v1beta1
kind: L2Advertisement
metadata:
    name: <Nome da configuração: Ex: metallb-l2>
    namespace: metallb
```

### Aplicando configurações dos arquivos `metallb-pool.yml` e `metallb-l2.yml`

```shell
kubectl apply -f metallb-pool.yml -f metallb-l2.yml 
```

---

Documentação Oficial do MetaLLB: [Link](https://metallb.universe.tf/)