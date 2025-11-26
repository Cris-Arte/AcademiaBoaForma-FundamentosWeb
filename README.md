USE academiadb;
  CREATE TABLE clientes (
  id INT primary KEY auto_increment,
  nome varchar(100) not NULL,
  telefone varchar(20),
  plano varchar(50)
);
