## **Instalação e Configuração Kubectl - Máquina do(a) DevOps**

### Pré-Requisitos

- SO com cache atualizado
- curl
- ca-certificates

---
### Atualizar o sistema e instalar pacotes necessários

```shell
sudo apt update && sudo apt install ca-certificates curl -y
```

### Instalação a partir de binário

```shell
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
```

### Caso queira, verifique o checksum

```shell
curl -LO "https://dl.k8s.io/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl.sha256"
```

### Instalação propriamente dita
```shell
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
```

---

## **Configuração de permissão do Kubectl ao Cluster**

### Acesse o **Node Master 01**

```shell
ssh user@IP-do-Node-Master-01
```

### Mova o arquivo de permissão de acesso ao cluster para o seu home no sistema (Talvez precise de escalonamento de privilégios, caso sim, use ```sudo su``` e faça como ```root```)

```shell
sudo cp /etc/rancher/k3s/k3s.yaml ~/
```

### Envie remotamente este arquivo que está no seu home, para sua máquina, também em seu home

```shell
scp -rp ~/k3s.yaml <Usuário-da-sua Máquina>@<IP-da-sua-Máquina>:~/
```

### Saia da conexão remota

```shell
exit
```

### Crie este diretório oculto, pois nele será colocado o arquivo de configuração para kubectl acessar o cluster

```shell
mkdir .kube
```

## Escalone de privilégio para maiores certezas e segurança

```shell
sudo su
```

### Mova este arquivo que foi enviado remotamente para sua máquina para dentro do diretório oculto com o nome ```config```

```shell
mv k3s.yaml .kube/config
```

### Saia do usuário root

```shell
exit
```

### Use este comando para mudar o apontamento de onde serão executados os comandos do kubectl


```shell
sed -i "s/127.0.0.1/<IP-do-Node-Master-01>/g" ~/.kube/config
```

---

Documentação Oficial do Kubectl: [Link](https://kubernetes.io/docs/tasks/tools/)