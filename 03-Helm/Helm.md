<h1 align = "center"> Instalação Helm </h1>

<h2 align = "center"> Na máquina do administrador do Cluster </h2>

<h3>Pré-Requisitos</h3>

* Curl
    
        sudo apt update && sudo apt install -y ca-certificates curl apt-transport-https --yes

1 - Download da chave pública

    curl https://baltocdn.com/helm/signing.asc | gpg --dearmor | sudo tee /usr/share/keyrings/helm.gpg > /dev/null

2 - Adicionando helm no repositório 

    echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/helm.gpg] https://baltocdn.com/helm/stable/debian/ all main" | sudo tee /etc/apt/sources.list.d/helm-stable-debian.list

3 - Instalando o helm

    sudo apt update && sudo apt install -y helm