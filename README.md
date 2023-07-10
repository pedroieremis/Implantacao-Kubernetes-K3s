## **IMPLANTAÇÃO DE CLUSTER KUBERNETES DISTRIBUIÇÃO K3s**

### Recursos que podem ser Implementados

- Kubectl
- Helm
- Metallb
- Traefik
- Longhorn
- Let's Encrypt
- Rancher (Adicional)

---

#### **Basta seguir os arquivos Markdown em Ordem destacada no repositório que tudo tende a dar certo!!**

**Obs:** Note que foi usado como base para esta documentação o sistema operacional [Linux Debian](https://www.debian.org/), porém também pode ser tomada como referência para distribuições derivadas do mesmo. Contudo, se o seu caso for de uma distribuição com uma vertente diferente da estipulada, consulte a documentação das ferramentas para o provisionamento. Em cada um dos passos, ao final do arquivo tem o Link para a documentação oficial do recurso.

---

Repositório tomado como Base para este meu Repositório: [Rijkaard Melo](https://github.com/rijkaardmelo/Cluster-K3S)

### Clone este Projeto

Clone o repositório

```shell
git clone https://github.com/pedroieremis/Implantacao-Kubernetes-K3s.git
```

Acesse a pasta clonada

```shell
cd Implantacao-Kubernetes-K3s/
```

Caso tenha, abra com o VsCode

```shell
code .
```