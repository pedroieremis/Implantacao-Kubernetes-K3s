<h1 align = "center"> Instalação Longhorn </h1>

<h2 align = "center"> Nas máquinas do Cluster </h2>

<h3>Instalando os Pré-Requisitos</h3>
    
    sudo apt update && sudo apt install -y open-iscsi nfs-common

<h2 align = "center"> Na máquina do administrador do Cluster </h2>

<h2> Instalando Longhorn </h2>

1 - Adicionando Longhorn no repositório Helm

    helm repo add longhorn https://charts.longhorn.io

2 - Atualizando o repositório Helm

    helm repo update

3 - Instalando Longhorn

    helm install longhorn longhorn/longhorn --namespace longhorn --create-namespace --set persistence.reclaimPolicy=Retain
