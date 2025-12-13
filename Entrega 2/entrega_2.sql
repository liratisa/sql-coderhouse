INSERT INTO tipo(nome) VALUES
('Notebook'),
('Ultrabook'),
('Monitor'),
('Switch'),
('Microcomputador'),
('Tablet'),
('Impressora');

INSERT INTO marca(nome) VALUES
('Lenovo'),
('Apple'),
('Samsung'),
('HP'),
('Huawei'),
('Intelbras'),
('Dell'),
('LG'),
('Intel');

INSERT INTO modelo(id_marca, nome, id_tipo) VALUES
(4, 'HP Spectre x360', 2),
(2, 'iPad 11 A16', 6),
(1, 'IdeaPad Slim 5', 1),
(3, 'Galaxy Tab S11 Ultra', 6),
(7, 'Desktop Slim', 5),
(7, 'Desktop Tower Plus', 5),
(7, 'Pro Max Tower T2', 5),
(7, 'Inspiron 15', 1),
(6, 'Smart Hi-PoE', 4);

INSERT INTO situacao_fisica(nome) VALUES
('Ótimo'),
('Bom'),
('Regular'),
('Ruim'),
('Péssimo'),
('Antieconômico'),
('Irrecuperável');

INSERT INTO orgao(nome) VALUES
('TRF2'),
('SJRJ'),
('SJES');

INSERT INTO responsavel(id_orgao, matricula, nome) VALUES
(1, '12345', 'Isabela Telles'),
(2, '12346', 'Ana Silva'),
(1, '12347', 'João Pereira'),
(2, '12348', 'Mariana Rocha'),
(1, '12349', 'Carlos Eduardo'),
(2, '12350', 'Fernanda Gomes'),
(1, '12351', 'Ricardo Alves'),
(2, '12352', 'Beatriz Melo'),
(1, '12353', 'Juliana Freitas'),
(2, '12354', 'Gabriel Nunes');

INSERT INTO localizacao(id_orgao, id_responsavel, nome, sigla_orgao) VALUES
(1, 1, 'Coordenação de Atendimento Local', 'COATLO'),
(2, 2, 'Seção de Suporte Operacional', 'SESOP'),
(3, 3, 'Divisão de Tecnologia da Informação', 'DITI'),
(1, 4, 'Núcleo de Infraestrutura e Redes', 'NIR'),
(2, 5, 'Gerência de Ativos Patrimoniais', 'GEAP'),
(3, 6, 'Setor de Manutenção de Equipamentos', 'SEMEQ'),
(1, 7, 'Coordenação de Comunicação Interna', 'COCIN'),
(2, 8, 'Unidade de Processamento de Dados', 'UPD'),
(3, 9, 'Seção de Gestão Documental', 'SEGED'),
(1, 10, 'Coordenação de Suporte Técnico', 'COSTEC');

INSERT INTO movimentacao(id_local_atual, id_local_anterior, responsavel_movimentacao) VALUES
(2, 1, 8),
(5, 3, 2),
(7, 4, 9),
(1, 2, 5),
(10, 6, 3),
(4, 7, 1),
(6, 5, 10),
(3, 8, 4),
(9, 10, 7),
(8, 9, 6);

UPDATE movimentacao
SET data = '2025-10-12';

INSERT INTO patrimonio(id_tipo, id_marca, id_modelo, id_situacao_fisica, id_localizacao, data_aquisicao, valor_compra, data_inicio_garantia, data_fim_garantia) VALUES
(3, 5, 10, 4, 7, '2025-01-10', 3500, '2025-01-10', '2026-01-10'),
(1, 2, 11, 3, 4, '2024-11-25', 9800, '2024-11-25', '2025-11-25'),
(6, 8, 12, 6, 2, '2025-03-15', 1200, '2025-03-15', '2026-03-15'),
(4, 1, 13, 2, 9, '2024-08-03', 4500, '2024-08-03', '2025-08-03'),
(2, 9, 14, 5, 1, '2025-06-20', 7800, '2025-06-20', '2026-06-20'),
(7, 3, 15, 7, 10, '2023-12-01', 11000, '2023-12-01', '2024-12-01'),
(5, 4, 16, 1, 8, '2025-09-12', 2600, '2025-09-12', '2026-09-12'),
(3, 6, 17, 4, 6, '2024-04-29', 5400, '2024-04-29', '2025-04-29'),
(1, 7, 18, 2, 3, '2025-12-01', 8700, '2025-12-01', '2026-12-01'),
(6, 2, 10, 6, 5, '2024-09-17', 1300, '2024-09-17', '2025-09-17');

UPDATE responsavel
SET ativo = TRUE;

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

CREATE VIEW vw_movimentacoes AS
SELECT r.nome, COUNT(m.id) AS total_movimentacoes
FROM movimentacao m
LEFT JOIN responsavel r
ON m.responsavel_movimentacao = r.id
GROUP BY r.nome;

CREATE VIEW vw_equipamentosPorUnidade AS
SELECT m.nome, COUNT(p.id) AS total_equipamentos
FROM modelo m 
LEFT JOIN patrimonio p
ON m.id = p.id_modelo
GROUP BY m.nome;

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
