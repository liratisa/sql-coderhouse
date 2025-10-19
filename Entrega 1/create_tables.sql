CREATE TABLE tipo(
  id INT AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(50) NOT NULL
);

CREATE TABLE marca(
  id INT AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(50) NOT NULL
);

CREATE TABLE modelo(
  id INT AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(20) NOT NULL,
  id_marca INT NOT NULL,
  FOREIGN KEY (id_marca) REFERENCES marca(id)
);

CREATE TABLE situacao_fisica(
  id INT AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(20) NOT NULL
);

CREATE TABLE orgao(
  id INT AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(5) NOT NULL
);

CREATE TABLE unidade_administrativa(
  id INT AUTO_INCREMENT PRIMARY KEY,
  nome varchar(50) NOT NULL,
  endereco varchar(100) NOT NULL,
  complemento VARCHAR(20),
  bairro VARCHAR(20) NOT NULL,
  cidade VARCHAR(20) NOT NULL,
  estado VARCHAR(2) NOT NULL,
  pais varchar(10) NOT NULL,
  cep varchar(8) NOT NULL
);

CREATE TABLE localizacao(
  id INT AUTO_INCREMENT PRIMARY KEY,
  id_orgao INT NOT NULL,
  id_unidade_adm INT NOT NULL,
  FOREIGN KEY (id_orgao) REFERENCES orgao(id),
  FOREIGN KEY (id_unidade_adm) REFERENCES unidade_administrativa(id)
);

CREATE TABLE responsavel(
  id INT AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(50) NOT NULL,
  matricula VARCHAR(7) NOT NULL,
  sigla VARCHAR(3) NOT NULL,
  id_lotacao INT NOT NULL,
  FOREIGN KEY (id_lotacao) REFERENCES localizacao(id)
);

CREATE TABLE movimentacao(
  id INT AUTO_INCREMENT PRIMARY KEY,
  id_local_origem INT NOT NULL,
  id_local_destino INT NOT NULL,
  FOREIGN KEY (id_local_origem) REFERENCES localizacao(id),
  FOREIGN KEY (id_local_destino) REFERENCES localizacao(id),
  data DATETIME NOT NULL,
  id_responsavel INT NOT NULL,
  FOREIGN KEY (id_responsavel) REFERENCES responsavel(id)
);

CREATE TABLE patrimonio(
  id INT AUTO_INCREMENT PRIMARY KEY,
  id_tipo INT NOT NULL,
  id_marca INT NOT NULL,
  id_modelo INT NOT NULL,
  id_situacao_fisica INT NOT NULL,
  id_local INT NOT NULL,
  FOREIGN KEY (id_tipo) REFERENCES tipo(id),
  FOREIGN KEY (id_marca) REFERENCES marca(id),
  FOREIGN KEY (id_modelo) REFERENCES modelo(id),
  FOREIGN KEY (id_situacao_fisica) REFERENCES situacao_fisica(id),
  FOREIGN KEY (id_local) REFERENCES localizacao(id)
);