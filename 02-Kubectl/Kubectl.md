<h1 align = "center"> Instalação e Configuração Kubectl </h1>

<h2 align = "center"> Na máquina do administrador do Cluster </h2>

<h2> Instalando Kubectl </h2>

<h3>Pré-Requisitos</h3>

* Curl
    
        sudo apt update && sudo apt install -y ca-certificates curl

1 - Download da chave pública

    sudo curl -fsSLo /usr/share/keyrings/kubernetes-archive-keyring.gpg https://packages.cloud.google.com/apt/doc/apt-key.gpg

2 - Adicionando kubectl no repositório 

    echo "deb [signed-by=/usr/share/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list

3 - Instalando o kubectl

    sudo apt update && sudo apt install -y kubectl

<h2> Configurando Kubectl </h2>

1 - Copiando a chave de acesso do cluster

    scp -rp <Usuário da Máquina>@<IP ou Hostname do Master>:/etc/rancher/k3s/k3s.yaml .kube/config

* Obs: Caso não exista a pasta `.kube` ou o arquivo `config`

    * Criando a pasta `.kube`

            sudo mkdir ~/.kube

    * Criando arquivo `config`

            sudo touch ~/.kube/config

2 - Configurando a chave de acesso

        sed -i 's,127.0.0.1,<IP ou Hostname do Node Master>,g' ~/.kube/config