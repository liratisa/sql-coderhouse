INSERT INTO tipo(nome) VALUES
('Notebook'),
('Ultrabook'),
('Monitor'),
('Switch'),
('Microcomputador'),
('Tablet'),
('Impressora');

INSERT INTO tipo(nome) VALUES
('HD'),
('Gravador de DVD'),
('Servidor'),
('SSD'),
('Webcam'),
('Microfone');

INSERT INTO tipo (nome) VALUES
('Desktop'),
('Mini PC'),
('All-in-One'),
('Servidor Torre'),
('Servidor Rack'),
('Servidor Blade'),
('Monitor LED'),
('Monitor LCD'),
('Monitor Ultrawide'),
('Monitor Curvo'),
('Impressora Jato de Tinta'),
('Impressora Laser'),
('Impressora Multifuncional'),
('Impressora Térmica'),
('Switch Gerenciável'),
('Switch Não Gerenciável'),
('Roteador'),
('Firewall'),
('Access Point'),
('Tablet Corporativo'),
('Smartphone Corporativo'),
('No-break'),
('UPS'),
('Estabilizador'),
('Leitor de Código de Barras'),
('Storage'),
('NAS'),
('SAN'),
('HD Externo'),
('SSD Externo'),
('Headset'),
('TV Corporativa'),
('Patch Panel'),
('Rack de Rede'),
('Rack Servidor'),
('Placa de Rede'),
('Placa de Vídeo'),
('Placa Mãe'),
('Fonte de Alimentação'),
('Memória RAM'),
('Processador');


ALTER TABLE tipo
	MODIFY COLUMN nome VARCHAR(30);

INSERT INTO marca (nome) VALUES
('MSI'),
('VAIO'),
('Toshiba'),
('Fujitsu'),
('IBM'),
('Supermicro'),
('Philips'),
('BenQ'),
('ViewSonic'),
('Epson'),
('Canon'),
('Brother'),
('Ricoh'),
('Xerox'),
('Lexmark'),
('Ubiquiti'),
('TP-Link'),
('MikroTik'),
('Juniper'),
('Aruba'),
('D-Link'),
('Fortinet'),
('Sophos'),
('Western Digital'),
('Kingston'),
('SanDisk'),
('Crucial'),
('ADATA'),
('AMD'),
('NVIDIA'),
('Corsair'),
('Gigabyte'),
('ASRock'),
('Cooler Master'),
('APC'),
('SMS'),
('Ragtech'),
('TS Shara');

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

INSERT INTO marca(nome) VALUES
('Seagate'),
('ASUS'),
('WD'),
('Logitech'),
('AOC'),
('Acer');

INSERT INTO modelo (id_marca, nome, id_tipo) VALUES
(4, 'HP Spectre x360', 2),
(7, 'Dell XPS 13', 2),
(1, 'Lenovo ThinkPad X1 Carbon', 2),
(8, 'Samsung Galaxy Book Pro', 2),
(6, 'Apple MacBook Air M2', 2),
(4, 'HP EliteBook 840 G9', 1),
(7, 'Dell Latitude 5440', 1),
(1, 'Lenovo ThinkPad T14', 1),
(2, 'iPad 11 A16', 6),
(8, 'Samsung Galaxy Tab S9', 6),
(5, 'Huawei MatePad Pro', 6),
(15, 'LG UltraWide 29WQ600', 3),
(15, 'LG 27UL500', 3),
(8, 'Samsung Odyssey G5', 3),
(16, 'AOC 24G2', 3),
(17, 'Philips 241V8', 3),
(3, 'HP LaserJet Pro M404dn', 7),
(18, 'Epson EcoTank L3250', 7),
(19, 'Canon Pixma G6010', 7),
(20, 'Brother HL-L2350DW', 7),
(22, 'Cisco Catalyst 2960', 4),
(23, 'Intelbras SG 2404 MR', 4),
(24, 'Ubiquiti UniFi Switch 24', 4),
(25, 'TP-Link TL-SG3428', 4),
(1, 'Lenovo ThinkCentre M70s', 5),
(7, 'Dell OptiPlex 7010', 5),
(4, 'HP ProDesk 400 G9', 5),
(7, 'Dell PowerEdge R740', 8),
(4, 'HP ProLiant DL380 Gen10', 8),
(14, 'Supermicro SYS-6029P', 8);

ALTER TABLE modelo
	MODIFY COLUMN nome VARCHAR(30);

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

SELECT * FROM responsavel; 

INSERT INTO responsavel (id_orgao, matricula, nome) VALUES
(1, '12355', 'Ana Paula Souza'),
(1, '12356', 'Carlos Eduardo Lima'),
(1, '12357', 'Fernanda Ribeiro'),
(1, '12358', 'João Victor Alves'),
(1, '12359', 'Mariana Costa'),
(1, '12360', 'Rafael Moreira'),
(1, '12361', 'Patrícia Nogueira'),
(1, '12362', 'Lucas Fernandes'),
(1, '12363', 'Juliana Rocha'),
(2, '12364', 'Bruno Martins'),
(2, '12365', 'Camila Pacheco'),
(2, '12366', 'Diego Farias'),
(2, '12367', 'Renata Teixeira'),
(2, '12368', 'Thiago Barros'),
(2, '12369', 'Aline Guedes'),
(2, '12370', 'Eduardo Batista'),
(2, '12371', 'Larissa Freitas'),
(2, '12372', 'Felipe Araujo'),
(2, '12373', 'Natalia Moura');

INSERT INTO localizacao(id_orgao, id_responsavel, nome, sigla_orgao) VALUES
(1, 1, 'Coordenação de Atendimento Local', 'COATLO'),
(2, 2, 'Seção de Suporte Operacional', 'SESOP'),
(1, 3, 'Divisão de Tecnologia da Informação', 'DITI'),
(2, 4, 'Núcleo de Infraestrutura e Redes', 'NIR'),
(1, 5, 'Gerência de Ativos Patrimoniais', 'GEAP'),
(2, 6, 'Setor de Manutenção de Equipamentos', 'SEMEQ'),
(1, 7, 'Coordenação de Comunicação Interna', 'COCIN'),
(2, 8, 'Unidade de Processamento de Dados', 'UPD'),
(1, 9, 'Seção de Gestão Documental', 'SEGED'),
(2, 10, 'Coordenação de Suporte Técnico', 'COSTEC');

INSERT INTO localizacao (id_orgao, id_responsavel, nome, sigla_orgao) VALUES
(1, 1, 'Coordenação de Tecnologia da Informação', 'COTI'),
(1, 3, 'Seção de Suporte Técnico', 'SST'),
(2, 4, 'Divisão de Infraestrutura de TI', 'DITI'),
(1, 5, 'Gerência Administrativa', 'GERAD'),
(2, 6, 'Núcleo de Redes e Comunicação', 'NRC'),
(1, 7, 'Setor de Patrimônio de TI', 'SPTI'),
(2, 8, 'Coordenação de Sistemas', 'COSIS'),
(1, 9, 'Arquivo e Documentação', 'ARQD'),
(2, 10, 'Gabinete da Direção', 'GABDIR');

UPDATE localizacao
SET nome = 'Coordenadoria de Atendimento Local'
WHERE id = 1;

SELECT * FROM patrimonio;

INSERT INTO movimentacao
(id_local_atual, id_local_anterior, responsavel_movimentacao, id_patrimonio) VALUES
(2, 1, 8, 28),
(3, 2, 12, 29),
(4, 3, 5, 30),
(5, 4, 20, 31),
(6, 5, 17, 32),
(7, 6, 9, 33),
(8, 7, 25, 34),
(9, 8, 14, 35),
(10, 9, 30, 21),
(1, 10, 6, 22),
(2, 1, 11, 23),
(3, 2, 18, 24),
(4, 3, 22, 25),
(5, 4, 7, 26),
(6, 5, 19, 27),
(50, 1, 33, 28),
(51, 50, 34, 29),
(52, 51, 35, 30),
(53, 52, 36, 31),
(54, 53, 37, 32),
(55, 54, 38, 33),
(56, 55, 39, 34),
(57, 56, 40, 35),
(58, 57, 41, 21),
(1, 58, 42, 22),
(2, 50, 43, 23),
(3, 51, 44, 24),
(4, 52, 45, 25),
(5, 53, 46, 26),
(6, 54, 47, 27),
(7, 55, 48, 28),
(8, 56, 49, 29),
(9, 57, 50, 30);

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

SELECT * FROM localizacao;


UPDATE responsavel
SET ativo = TRUE;

SELECT * FROM responsavel;

INSERT INTO movimentacao(id_local_atual, id_local_anterior, responsavel_movimentacao) VALUES
(3, 1, 1);

SELECT * FROM movimentacao;

ALTER TABLE movimentacao 
	ADD COLUMN id_patrimonio INT,
    ADD CONSTRAINT FOREIGN KEY (id_patrimonio) REFERENCES patrimonio(id);

UPDATE movimentacao
SET id_patrimonio = 25;



