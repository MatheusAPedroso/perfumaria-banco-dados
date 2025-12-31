

- INNER JOIN
- LEFT JOIN
- RIGHT JOIN

- Utilizar também os comandos Count(*), Distinct, Order By e Group By




DROP DATABASE IF EXISTS escola;
CREATE DATABASE escola;
USE escola;

# Criação de Tabela - Primeiro lado 1 da cardinalidade
# Só tenho chaves primárias

DROP TABLE IF EXISTS enderecos; 
CREATE TABLE enderecos
( 
  cod_endereco int not null PRIMARY KEY,
  logradouro varchar(400) not null,
  numero int,
  complemento varchar(400),
  bairro varchar(400) not null,
  cidade varchar(400) not null,
  estado enum ('SP', 'RJ', 'MG', 'AL', 'RE', 'DF') 
);

DROP TABLE IF EXISTS professores; 
CREATE TABLE professores
( 
  id_professor int PRIMARY KEY,
  nome varchar(200) not null,
  data_de_nascimento datetime,  
  cod_endereco int null,
  FOREIGN KEY (cod_endereco) REFERENCES enderecos(cod_endereco)  
);

SELECT * FROM enderecos;
SELECT * FROM professores;

# Primeiro lado 1 da minha cardinalidade 
INSERT INTO enderecos
(cod_endereco, logradouro, numero, complemento, bairro, cidade, estado)
VALUES
(1, 'Rua X', 36, 'ALA A', 'Socorro', 'SP', 'SP'),
(2, 'Rua Y', 23, 'Bloco 1', 'Socorro', 'SP', 'SP'),
(3, 'Rua C', 53, 'Bloco 2', 'Lapa', 'SP', 'SP'),
(4, 'Rua D', 64, 'Bloco 4', 'Morumbi', 'SP', 'SP'),
(5, 'Rua E', 55, '25 and', 'Paraiso', 'RJ', 'RJ'),
(6, 'Rua F', 49, null, 'Copacabana', 'RJ', 'RJ'),
(7, 'Rua G', 33, null, 'Leblon', 'RJ', 'RJ'),
(8, 'Rua H', 77, null, 'Pajuçara', 'AL', 'AL'),
(9, 'Rua I', 88, null, 'Ponta Verde', 'AL', 'AL'),
(10, 'Rua J', 897, null, 'Centro', 'MG', 'MG');

INSERT INTO professores
(id_professor, nome, data_de_nascimento, cod_endereco)
VALUES
(1, 'Alberto Silva', '2024-05-06 19:47:35', 1),
(2, 'Joao Abreu', '2000-05-08 19:47:35', 1),
(3, 'Cristina Santos', '1999-05-06 19:47:35', 2),
(4, 'Zagalo Oliveira', '1980-05-06 19:47:35', 2),
(5, 'Jose Luiz', '1900-05-06 19:47:35', null),
(6, 'Fernando Zaskowiski', '2001-05-06 19:47:35', null),
(7, 'Fernanda Zaskowiski', '2022-05-06 19:47:35', null),
(8, 'Zenaide Zenoide', '2024-05-06 19:47:35', null);

## INNER JOIN

SELECT * FROM enderecos;
SELECT * FROM professores;

SELECT * FROM professores p, enderecos e
 WHERE p.cod_endereco = e.cod_endereco;

SELECT * FROM professores p INNER JOIN enderecos e
    ON p.cod_endereco = e.cod_endereco;

SELECT * FROM professores p RIGHT JOIN enderecos e
ON p.cod_endereco = e.cod_endereco;

SELECT * FROM professores p LEFT JOIN enderecos e
    ON p.cod_endereco = e.cod_endereco;

*******************************************************


SELECT COUNT(*) FROM enderecos;

SELECT * FROM enderecos
ORDER BY cod_endereco;

SELECT * FROM enderecos
ORDER BY cod_endereco DESC;

SELECT * FROM enderecos
ORDER BY bairro;

SELECT DISTINCT cidade FROM enderecos;

SELECT estado, COUNT(*) FROM enderecos
GROUP BY estado;

/*
Exercício
Criar um Database
Usar o Database
Criar pelo menos 2 tabelas
Inserir pelo menos uns 10 registros / linhas em cada uma delas
Utilizar os comandos dados
- INNER JOIN
- LEFT JOIN
- RIGHT JOIN
- Utilizar também os comandos Count(*), Distinct, Order By e Group By
*/

