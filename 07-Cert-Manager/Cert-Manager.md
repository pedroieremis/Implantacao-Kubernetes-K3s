## **Instalação e Configuração Cert-Manager - Máquina do(a) DevOps**

### Instalando o Cert-Manager

### Adicionando Cert-Manager no repositório Helm

```shell
helm repo add jetstack https://charts.jetstack.io
```

### Atualizando o repositório Helm

```shell
helm repo update
```

### Instalando Cert-Manager

```shell
helm install cert-manager jetstack/cert-manager --namespace cert-manager --create-namespace --set installCRDs=true
```

---

## **Configurando o Cert-Manager**

### Criando arquivo `letsencrypt-staging.yml`

```shell
vim letsencrypt-staging.yml
```

### Configurando o arquivo `letsencrypt-staging.yml`

```shell
apiVersion: cert-manager.io/v1
kind: Issuer
metadata:
    name: letsencrypt-staging
    namespace: cert-manager
spec:
    acme:
        server: https://acme-staging-v02.api.letsencrypt.org/directory
        email: <email-address>
        privateKeySecretRef:
            name: letsencrypt-staging
        solvers:
        - http01:
            ingress:
                name: traefik
```

### Criando arquivo `letsencrypt-production.yml`

```shell
vim letsencrypt-production.yml
```

### Configurando o arquivo `letsencrypt-production.yml`

```shell
apiVersion: cert-manager.io/v1
kind: Issuer
metadata:
    name: letsencrypt-production
    namespace: cert-manager
spec:
    acme:
        server: https://acme-v02.api.letsencrypt.org/directory
        email: <email-address>
        privateKeySecretRef:
            name: letsencrypt-production
        solvers:
        - http01:
            ingress:
                name: traefik
```

### Aplicando configurações dos arquivos `letsencrypt-staging.yml` e `letsencrypt-production.yml`

```
kubectl apply -f letsencrypt-staging.yml -f letsencrypt-production.yml
```

---

Documentação Oficial do Cert-Manager: [Link](https://cert-manager.io/docs/)