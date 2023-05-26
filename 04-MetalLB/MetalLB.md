<h1 align = "center"> Instalação e Configuração MetalLB </h1>

<h2 align = "center"> Na máquina do administrador do Cluster </h2>

<h2> Instalando MetalLB </h2>

1 - Adicionando MetalLB no repositório Helm

    helm repo add metallb https://metallb.github.io/metallb

2 - Atualizando o repositório Helm

    helm repo update

3 - Instalando MetalLB

    helm install metallb metallb/metallb --namespace metallb --create-namespace

<h2> Configurando MetalLB </h2>

1 - Criando arquivo `metallb-pool.yml`

    touch metallb-pool.yml

2 - Configurando o arquivo `metallb-pool.yml`

    apiVersion: metallb.io/v1beta1
    kind: IPAddressPool
    metadata:
        name: <Nome da configuração: Ex: metallb-pool>
        namespace: metallb
    spec:
        addresses:
        - <Ranger de IPs. Ex: 192.168.0.1-192.168.0.10>

3 - Criando arquivo `metallb-l2.yml`

    touch metallb-l2.yml

4 - Configurando o arquivo `metallb-l2.yml`

    apiVersion: metallb.io/v1beta1
    kind: L2Advertisement
    metadata:
        name: <Nome da configuração: Ex: metallb-l2>
        namespace: metallb

5 - Aplicando configurações dos arquivos `metallb-pool.yml` e `metallb-l2.yml`

    kubectl apply -f metallb-pool.yml -f metallb-l2.yml 