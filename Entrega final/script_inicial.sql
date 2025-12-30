-- Criação de schema e tabelas

CREATE SCHEMA ativos_ti;

CREATE TABLE tipo(
	id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(20) NOT NULL
);

CREATE TABLE marca(
	id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(20) NOT NULL
);

CREATE TABLE modelo(
	id INT AUTO_INCREMENT PRIMARY KEY,
    id_tipo INT NOT NULL,
    id_marca INT NOT NULL,
    nome VARCHAR(20) NOT NULL,
    FOREIGN KEY (id_tipo) REFERENCES tipo(id),
    FOREIGN KEY (id_marca) REFERENCES marca(id)
);

CREATE TABLE situacao_fisica(
	id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(20) NOT NULL
);

CREATE TABLE orgao(
	id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(4)
);

CREATE TABLE responsavel(
	id INT AUTO_INCREMENT PRIMARY KEY,
    id_orgao INT NOT NULL,
    matricula VARCHAR(5) NOT NULL,
    nome VARCHAR(30),
    ativo BOOLEAN,
	FOREIGN KEY (id_orgao) REFERENCES orgao(id)
);

CREATE TABLE localizacao(
	id INT AUTO_INCREMENT PRIMARY KEY,
    id_orgao INT NOT NULL,
    id_responsavel INT NOT NULL,
    nome VARCHAR(50) NOT NULL,
    sigla_orgao VARCHAR(10) NOT NULL, 
    FOREIGN KEY (id_orgao) REFERENCES orgao(id),
    FOREIGN KEY (id_responsavel) REFERENCES responsavel(id)
);

CREATE TABLE movimentacao(
	id INT AUTO_INCREMENT PRIMARY KEY,
    id_local_atual INT NOT NULL,
    id_local_anterior INT NOT NULL,
    responsavel_movimentacao INT NOT NULL,
    data DATE NOT NULL,
    FOREIGN KEY (id_local_atual) REFERENCES localizacao(id),
    FOREIGN KEY (id_local_anterior) REFERENCES localizacao(id),
    FOREIGN KEY (responsavel_movimentacao) REFERENCES responsavel(id)
);

CREATE TABLE patrimonio(
	id INT AUTO_INCREMENT PRIMARY KEY,
    id_tipo INT NOT NULL,
    id_marca INT NOT NULL,
    id_modelo INT,
    id_situacao_fisica INT,
    id_localizacao INT NOT NULL,
    data_aquisicao DATE NOT NULL,
    valor_compra INT,
    data_inicio_garantia DATE,
    data_fim_garantia DATE,
    FOREIGN KEY (id_tipo) REFERENCES tipo(id),
    FOREIGN KEY (id_marca) REFERENCES marca(id),
    FOREIGN KEY (id_modelo) REFERENCES modelo(id),
    FOREIGN KEY (id_situacao_fisica) REFERENCES situacao_fisica(id),
    FOREIGN KEY (id_localizacao) REFERENCES localizacao(id)
);

ALTER TABLE movimentacao
	ADD COLUMN id_patrimonio INT NOT NULL,
    ADD CONSTRAINT FOREIGN KEY (id_patrimonio) REFERENCES patrimonio(id);

-- Views

CREATE VIEW vw_movimentacoes AS
SELECT r.nome, COUNT(m.id) AS total_movimentacoes
FROM movimentacao m
LEFT JOIN responsavel r
ON m.responsavel_movimentacao = r.id
GROUP BY r.nome;

CREATE VIEW vw_equipamentosPorModelo AS
SELECT m.nome, COUNT(p.id) AS total_equipamentos
FROM modelo m 
LEFT JOIN patrimonio p
ON m.id = p.id_modelo
GROUP BY m.nome;

CREATE VIEW vw_equipamentosPorMarca AS
SELECT m.nome, COUNT(p.id) AS total_equipamentos
FROM marca m 
LEFT JOIN patrimonio p
ON m.id = p.id_marca
GROUP BY m.nome;

CREATE VIEW vw_ServidoresPorOrgao AS
SELECT o.nome, COUNT(r.id) AS total_servidores
FROM orgao o
LEFT JOIN responsavel r
ON o.id = r.id_orgao
GROUP BY o.nome;

CREATE VIEW vw_TotalEquipamentos AS
SELECT COUNT(*) AS total_equipamentos FROM patrimonio;

-- Stored Procedures

DELIMITER $$

CREATE PROCEDURE calcular_depreciacao(
    IN p_id_equipamento INT
)
BEGIN
    SELECT 
        id,
        valor_aquisicao,
        ROUND(valor_aquisicao / 5, 2) AS depreciacao_anual
    FROM equipamento
    WHERE id = p_id_equipamento;
END$$

DELIMITER ;

DELIMITER $$

CREATE PROCEDURE calcular_idade_equipamento(
    IN p_id_equipamento INT
)
BEGIN
    SELECT 
        id,
        data_aquisicao,
        TIMESTAMPDIFF(YEAR, data_aquisicao, CURDATE()) AS idade_em_anos
    FROM equipamento
    WHERE id = p_id_equipamento;
END$$

DELIMITER ;

-- Triggers

DELIMITER $$
CREATE TRIGGER define_situacao_fisica BEFORE INSERT ON patrimonio
FOR EACH ROW
BEGIN
	IF NEW.id_situacao_fisica IS NULL OR NEW.id_situacao_fisica = '' 
    THEN
    SET NEW.id_situacao_fisica = 1;
    
    END IF;
END $$

DELIMITER $$
CREATE TRIGGER checa_usuarios_duplicados BEFORE INSERT ON responsavel
FOR EACH ROW
BEGIN
	IF (EXISTS(SELECT 1 FROM responsavel WHERE matricula = NEW.matricula)) THEN
		SIGNAL SQLSTATE VALUE '45000' SET MESSAGE_TEXT = 'Usuário já existe na tabela';
    END IF;
END$$

DELIMITER $$
CREATE TRIGGER usuarios_ativos BEFORE INSERT ON responsavel
FOR EACH ROW
BEGIN
	IF NEW.ativo IS NULL or NEW.ativo = ''
    THEN
    SET NEW.ativo = true;
    
    END IF;
END $$

-- Functions

DELIMITER $$
CREATE FUNCTION calculo_depreciacao_anual(valor INT)
RETURNS INT
READS SQL DATA
DETERMINISTIC
BEGIN
	RETURN valor / 5;
END;

DELIMITER $$
CREATE FUNCTION movimentacao_por_servidor(id_servidor INT)
RETURNS INT
DETERMINISTIC
READS SQL DATA
BEGIN
    DECLARE total INT;

    SELECT COUNT(*)
    INTO total
    FROM movimentacao m
    WHERE m.responsavel_movimentacao = id_servidor;

    RETURN total;
END$$
DELIMITER ;




