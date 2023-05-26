<h1 align = "center"> Instalação e Configuração Cert-Manager </h1>

<h2 align = "center"> Na máquina do administrador do Cluster </h2>

<h2> Instalando Cert-Manager </h2>

1 - Adicionando Cert-Manager no repositório Helm

    helm repo add jetstack https://charts.jetstack.io

2 - Atualizando o repositório Helm

    helm repo update

3 - Instalando Cert-Manager

    helm install cert-manager jetstack/cert-manager --namespace cert-manager --create-namespace --set installCRDs=true

<h2> Configurando Cert-Manager </h2>

1 - Criando arquivo `letsencrypt-staging.yml`

    touch letsencrypt-staging.yml

2 - Configurando o arquivo `letsencrypt-staging.yml`

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

3 - Criando arquivo `letsencrypt-production.yml`

    touch letsencrypt-production.yml

4 - Configurando o arquivo `letsencrypt-production.yml`

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

5 - Aplicando configurações dos arquivos `letsencrypt-staging.yml` e `letsencrypt-production.yml`

    kubectl apply -f letsencrypt-staging.yml -f letsencrypt-production.yml