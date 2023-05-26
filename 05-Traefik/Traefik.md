<h1 align = "center"> Instalação Traefik </h1>

<h2 align = "center"> Na máquina do administrador do Cluster </h2>

<h2> Instalando Traefik </h2>

1 - Adicionando Traefik no repositório Helm

    helm repo add traefik https://helm.traefik.io/traefik

2 - Atualizando o repositório Helm

    helm repo update

3 - Instalando Traefik

    helm install traefik traefik/traefik --namespace traefik --create-namespace