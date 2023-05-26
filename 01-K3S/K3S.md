<h1 align = "center"> Instalação e Configuração do Cluster K3S </h1>

<h3>Pré-Requisitos</h3>

* Curl

        sudo apt update && sudo apt install -y ca-certificates curl

* Configuração DNS (Registro A e CNAME)

        SRV-K8S-MASTER        IN        A            <IP do Master 01>
        SRV-K8S-MASTER        IN        A            <IP do Master XX>
        SRV-K8S-DATABASE      IN        A            <IP do Database>

        master                IN        CNAME        SRV-K8S-MASTER
        database              IN        CNAME        SRV-K8S-DATABASE    

<h3> Node Master 01 </h3>

    curl -sfL https://get.k3s.io |  sh -s - server --datastore-endpoint = "<mysql|postgres>://<User>:<Password>@tcp(https://<IP ou hostname do database>:<Port>)/<Name Database> --node-taint CriticalAddonsOnly=true:NoExecute --disable traefik --disable servicelb --cluster-init

<h3> Node Master XX </h3>

    curl -sfL https://get.k3s.io | K3S_TOKEN=<Token do Master> sh -s - server --server https://<IP ou hostname do Node Master>:6443

<h3> Node Worker XX </h3>

    curl -sfL https://get.k3s.io | K3S_URL=https://<IP ou hostname do Node Master>:6443 K3S_TOKEN=<Token do Master> sh -

* Obs: Token do Master se localiza `/var/lib/rancher/k3s/server/node-token`
