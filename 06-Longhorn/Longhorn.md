## **Instalação e Configuração do Longhorn - Máquinas do Cluster**


### Pré-Requisitos - Máquinas do Cluster

- SO com cache atualizado
- open-iscsi
- nfs-common

### Atualizar o sistema e instalar os Pacotes

```shell
sudo apt update && sudo apt install -y open-iscsi nfs-common
```

---

## **Instalando o Longhorn - Máquina do(a) DevOps**

### Adicionando Longhorn no repositório Helm

```shell
helm repo add longhorn https://charts.longhorn.io
```

### Atualizando o repositório Helm

```shell
helm repo update
```

### Instalando o Longhorn

```
helm install longhorn longhorn/longhorn --namespace longhorn-system --create-namespace --set persistence.reclaimPolicy=Retain
```

---

Documentação Oficial do Longhorn: [Link](https://longhorn.io/docs/1.4.2/)