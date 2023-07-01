## **Instalação Traefik - Máquina do(a) DevOps**

### Adicionando Traefik no repositório Helm

```shell
helm repo add traefik https://helm.traefik.io/traefik
```

### Atualizando o repositório Helm

```shell
helm repo update
```

### Instalando Traefik

```shell
helm install traefik traefik/traefik --namespace traefik --create-namespace
```

---

Documentação Oficial do Traefik: [Link](https://doc.traefik.io/traefik/)