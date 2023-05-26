-- Criando usuário
create user 'admin'@'%' identified by 'admin';

-- Privilégio total ao usuário
grant all privileges on * . * to 'admin'@'%';

-- Aplicando privilégio
flush privileges;

-- Verificando tamanho do cluster
show status like 'wsrep_cluster_size';

