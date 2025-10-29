drop database TrabalhoClinicaMedica;
create database TrabalhoClinicaMedica;
use TrabalhoClinicaMedica;

create table Cidade (
idCidade int not null auto_increment primary key,
    Nome varchar(100) not null,
    UF varchar(100)
);

create table Paciente (
idPaciente int not null auto_increment primary key,
    Nome varchar(100) not null,
    Cpf varchar(100) not null,
    Data_Nascimento varchar(100) not null,
    Sexo char(1),
    Telefone varchar(100),
    Email varchar(100),
    Endereço varchar(100) not null,
    Bairro varchar(100) not null
);

create table Convênio (
idConvênio int not null auto_increment primary key,
    Nome varchar(100),
    Cpf varchar(100),
    Plano varchar(100)
);

create table Médico (
idMédico int not null auto_increment primary key,
    Nome varchar(100) not null,
    Crm varchar(100) not null,
    Telefone varchar(100) not null,
    Email varchar(100) not null,
    Cpf varchar(100) not null
);

create table Especialidade (
idEspecialidade int not null auto_increment primary key,
    Nome varchar(100) not null
);

create table Consulta (
idConsulta int not null auto_increment primary key,
    Data_Consulta date not null,
    Hora time not null,
    Observações varchar(100),
    Diagnóstico varchar(100) not null
);

create table Exame (
idExame int not null auto_increment primary key,
    Data_Exame date not null,
    Nome varchar(100) not null,
    Diagnóstico varchar(100) not null
);

alter table Paciente
add column idConvênio int not null,
add constraint idConvênio_fk
foreign key(idConvênio) references Convênio(idConvênio);

alter table Paciente
add column idCidade int not null,
add constraint idCidade_fk
foreign key(idCidade) references Cidade(idCidade);

alter table Médico
add column idEspecialidade int not null,
add constraint idEspecialidade_fk
foreign key(idEspecialidade) references Especialidade(idEspecialidade);

alter table Consulta
add column idMédico int not null,
add constraint idMédico_fk
foreign key(idMédico) references Médico(idMédico);

alter table Consulta
add column idPaciente int not null,
add constraint idPaciente_fk
foreign key(idPaciente) references Paciente(idPaciente);

alter table Exame
add column idPaciente int not null,
add constraint idPaciente_fk
foreign key(idPaciente) references Paciente(idPaciente);

alter table Exame
add column idMédico int not null,
add constraint idMédico_fk
foreign key(idMédico) references Médico(idMédico);

alter table Exame
add column idConsulta int not null,
add constraint idConsulta_fk
foreign key(idConsulta) references Exame(idConsulta);

alter table Consulta
add column idExame int not null,
add constraint idExame_fk
foreign key(idExame) references Exame(idExame);

alter table Convênio
add column idPaciente int not null,
add constraint idPaciente_fk
foreign key(idPaciente) references Exame(idPaciente);

insert into Cidade(Nome,UF) values
('Erechim', 'RS'),
('Aratiba', 'RS'),
('Rio de Janeiro', 'RJ'),
('São Paulo', 'SP'),
('Foz do Iguaçu', 'SC'),
('Machadinho', 'RS'),
('Ariquemes', 'RO'),
('Salvador', 'BA'),
('Campinas', 'SP'),
('Belo Horizonte', 'MG'),
('Manaus', 'AM'),
('Florianópolis', 'SC'),
('Itapema', 'SC'),
('Balneário Camboriú', 'SC'),
('Porto Alegre', 'RS'),
('Curitiba', 'PR'),
('Vitória', 'ES'),
('Fortaleza', 'CE'),
('Recife', 'PE'),
('Goiânia', 'GO'),
('Cuiabá', 'MT'),
('Belém', 'PA');

alter table Cidade
add column Regiao varchar (20) after UF;

update Cidade set Regiao = case
when uf = "MG" or uf ="RJ" or uf = "SP" or uf = "ES" then "Sudeste"
when uf = "BA" or uf = "RN" or uf = "PI" or uf = "MA" or uf = "CE" or uf = "PB" or uf = "SE" or uf = "AL" or uf = "PE" then "Nordeste"
when uf = "MT" or uf = "MS" or uf = "GO" then "Centro-Oeste"
when uf = "AC" or uf = "AM" or uf = "RO" or uf = "PA" or uf = "TO" or uf = "AP" or uf = "RR" then "Norte"
when uf = "RS" or uf = "SC" or uf = "PR" then "Sul"
end;

insert into Consulta(Data_Consulta, Hora, Diagnóstico) values
('2022-01-01', '7:35', 'Covid-19'),
('2022-03-10', '7:50', 'Influenza-A'),
('2022-07-20', '8:35', 'H1N1'),
('2022-11-30', '10:45', 'H3N2'),
('2023-01-01', '6:30', 'H3N2'),
('2023-04-10', '14:35', 'Influenza-B'),
('2023-07-20', '21:10', 'Influenza-C'),
('2024-02-26', '16:40', 'Influenza-D'),
('2024-03-15', '10:20', 'Dengue'),
('2024-05-10', '15:35', 'Sarampo'),
('2024-06-12', '12:00', 'Catapora'),
('2024-10-1', '17:50', 'Chikungunya'),
('2025-08-27', '7:55', 'HPV'),
('2025-08-30', '9:40', 'Miningite'),
('2025-10-07', '11:10', 'Tuberculose'),
('2025-11-03', '7:10', 'Caxumba'),
('2025-12-09', '14:45', 'Rubéola'),
('2026-01-27', '17:55', 'AIDS'),
('2023-02-14', '08:30', 'Gripe comum'),
('2023-05-19', '09:00', 'Dengue'),
('2023-09-01', '10:15', 'Sinusite'),
('2024-01-22', '13:00', 'Alergia respiratória'),
('2024-04-30', '16:45', 'Diabetes tipo 2'),
('2024-07-10', '18:20', 'Hipertensão'),
('2025-03-05', '07:40', 'Bronquite'),
('2025-09-25', '11:10', 'Covid-19 leve');

insert into Convênio(Nome, CPF, Plano) values
('IPE', '805.961.830-03', 'Cobertura Total'),
('Unimed', '616.671.400-94', 'Cobertura Parcial em todos Procedimentos'),
('Unimed', '519.638.330-15', 'Cobertura Total'),
('Bradesco Saúde', '751.799.270-80', 'Cobertura Total para Consultas'),
('Hapvida', '851.820.230-22', 'Cobertura Parcial em Consultas'),
('SulAmérica', '199.311.260-00', 'Cobertura Total em Cirurgias'),
('IPE', '967.362.670-72', 'Cobertura Total'),
('Care Plus', '271.037.220-72', 'Cobertura Parcial em Consultas'),
('Greenline Saúde', '713.245.180-49', 'Cobertura Parcial em todos Procedimentos'),
('QSaúde', '364.868.290-36', 'Cobertura Total'),
('Unimed', '123.123.123-12', 'Cobertura Total'),
('Bradesco Saúde', '234.234.234-23', 'Cobertura Parcial'),
('SulAmérica', '345.345.345-34', 'Cobertura Total'),
('Amil', '456.456.456-45', 'Cobertura Parcial em Consultas'),
('Hapvida', '567.567.567-56', 'Cobertura Total'),
('NotreDame Intermédica', '678.678.678-67', 'Cobertura Parcial'),
('Porto Seguro Saúde', '789.789.789-78', 'Cobertura Total'),
('Care Plus', '890.890.890-89', 'Cobertura Total em Cirurgias');

insert into Especialidade(Nome) values
('Demartologia'),
('Cardiologia'),
('Endocrinologia'),
('Ginecologia'),
('Obstetrícia'),
('Neurologia'),
('Ortopedia'),
('Traumatologia'),
('Pediatria'),
('Psiquiatria'),
('Radiologia'),
('Diagnóstico por Imagem'),
('Urologia'),
('Oftalmologia'),
('Oncologia'),
('Imunologia'),
('Hematologia'),
('Gastroenterologia'),
('Reumatologia'),
('Pneumologia');

insert into Exame(Data_Exame, Nome, Diagnóstico) values
('2022-01-01', 'Dermatoscopia', 'Câncer de Pele'),
('2022-02-03', 'Eletrocardiograma', 'Insuficiência Cardíaca'),
('2022-03-02', 'Glicemia', 'Avaliar metabolismo'),
('2022-03-15', 'Colposcopia', 'Avaliar colo do útero, útero e ovários'),
('2022-04-7', 'Ultrassonografia Obstétrica', 'Monitorar o desenvolvimento do feto e a saúde materna'),
('2022-04-21', 'Ressonância magnética', 'AVC'),
('2022-05-30', 'Tomografia', 'Avaliar ossos, articulações, ligamentos e cartilagens'),
('2022-06-04', 'Raio-X', 'Diagnosticar fraturas, luxações e lesões de tecidos moles'),
('2022-06-12', 'Exames de sangue, urina e fezes', 'Monitorar desenvolvimento, detectar infecções e deficiências'),
('2022-07-01', 'Avaliação clínica e psicológica,', 'Diagnosticar transtornos mentais e excluir causas orgânicas'),
('2022-07-10', 'Ultrassom', 'Visualizar órgãos e estruturas internas'),
('2022-08-12', 'PET-CT,', 'Fornecer imagens detalhadas para diagnóstico preciso'),
('2023-02-10', 'Hemograma Completo', 'Anemia leve'),
('2023-03-18', 'Ultrassonografia Abdominal', 'Cálculo renal'),
('2023-06-25', 'Ecocardiograma', 'Insuficiência cardíaca leve'),
('2023-08-05', 'Endoscopia', 'Gastrite crônica'),
('2024-01-14', 'Colonoscopia', 'Pólipos intestinais'),
('2024-03-21', 'Raio-X do Tórax', 'Bronquite'),
('2024-08-09', 'Ressonância do Crânio', 'Sinusite'),
('2025-02-27', 'Teste de Covid-19', 'Negativo');

insert into Médico (Nome, Crm, Telefone, Email, Cpf) values
('Dr. João Silva', 'CRM12345SP', '(11) 91234-5678', 'joao.silva@clinicavida.com', '123.456.789-00'),
('Dra. Maria Oliveira', 'CRM67890RJ', '(21) 99876-5432', 'maria.oliveira@saudebem.com', '234.567.890-11'),
('Dr. Pedro Santos', 'CRM11223MG', '(31) 98765-4321', 'pedro.santos@hospitalcentral.com', '345.678.901-22'),
('Dra. Ana Costa', 'CRM33445RS', '(51) 92345-6789', 'ana.costa@clinicageral.com', '456.789.012-33'),
('Dr. Lucas Pereira', 'CRM55667BA', '(71) 98877-6655', 'lucas.pereira@coracaoemdia.com', '567.890.123-44'),
('Dra. Carla Mendes', 'CRM77889PR', '(41) 99788-5544', 'carla.mendes@vidasaude.com', '678.901.234-55'),
('Dr. Rafael Lima', 'CRM99001PE', '(81) 91234-4433', 'rafael.lima@neurocenter.com', '789.012.345-66'),
('Dra. Beatriz Rocha', 'CRM22334SC', '(48) 99654-3322', 'beatriz.rocha@pediatriabrasil.com', '890.123.456-77'),
('Dr. Gustavo Martins', 'CRM88990RS', '(51) 98123-1111', 'gustavo.martins@clinicars.com', '101.202.303-44'),
('Dra. Helena Souza', 'CRM99112SP', '(11) 93456-2222', 'helena.souza@saudesp.com', '202.303.404-55'),
('Dr. André Carvalho', 'CRM11223RJ', '(21) 94567-3333', 'andre.carvalho@hospitalrj.com', '303.404.505-66'),
('Dra. Patrícia Gomes', 'CRM22334MG', '(31) 97654-4444', 'patricia.gomes@clinicabh.com', '404.505.606-77'),
('Dr. Felipe Costa', 'CRM33445BA', '(71) 99876-5555', 'felipe.costa@bahiasaude.com', '505.606.707-88'),
('Dra. Larissa Almeida', 'CRM44556PE', '(81) 98765-6666', 'larissa.almeida@neuroclinic.com', '606.707.808-99'),
('Dr. Thiago Ribeiro', 'CRM55667SC', '(48) 95678-7777', 'thiago.ribeiro@medfloripa.com', '707.808.909-10'),
('Dra. Amanda Farias', 'CRM66778PR', '(41) 95432-8888', 'amanda.farias@vidaparnaiba.com', '808.909.010-11');

insert into Paciente (Nome, Cpf, Data_Nascimento, Sexo, Telefone, Email, Endereço, Bairro) values
('João Pedro da Silva', '123.456.789-00', '1990-03-15', 'M', '(11) 91234-5678', 'joao.silva@email.com', 'Rua das Flores, 123', 'Centro'),
('Maria Fernanda Alves', '234.567.890-11', '1985-07-22', 'F', '(21) 99876-5432', 'maria.alves@email.com', 'Av. Atlântica, 456', 'Copacabana'),
('Carlos Eduardo Lima', '345.678.901-22', '1978-12-05', 'M', '(31) 98765-4321', 'carlos.lima@email.com', 'Rua dos Andradas, 789', 'Savassi'),
('Ana Paula Rocha', '456.789.012-33', '1992-09-18', 'F', '(51) 92345-6789', 'ana.rocha@email.com', 'Rua Bento Gonçalves, 55', 'Cidade Baixa'),
('Lucas Henrique Souza', '567.890.123-44', '1995-02-10', 'M', '(71) 98877-6655', 'lucas.souza@email.com', 'Rua Bahia, 890', 'Pituba'),
('Beatriz Mendes Costa', '678.901.234-55', '1988-05-30', 'F', '(41) 99788-5544', 'beatriz.costa@email.com', 'Rua XV de Novembro, 300', 'Batel'),
('Rafael Tavares Moreira', '789.012.345-66', '1980-10-12', 'M', '(81) 91234-4433', 'rafael.moreira@email.com', 'Rua Aurora, 210', 'Boa Vista'),
('Juliana Pereira Lima', '890.123.456-77', '1993-01-25', 'F', '(48) 99654-3322', 'juliana.lima@email.com', 'Rua das Acácias, 45', 'Trindade'),
('Fernando Carvalho Nunes', '901.234.567-88', '1986-06-09', 'M', '(62) 98543-2211', 'fernando.nunes@email.com', 'Rua Goiás, 12', 'Setor Oeste'),
('Camila Ribeiro Duarte', '012.345.678-99', '1998-11-03', 'F', '(85) 99911-2200', 'camila.duarte@email.com', 'Av. Beira Mar, 789', 'Meireles'),
('Pedro Henrique Ramos', '111.222.333-44', '1991-04-12', 'M', '(11) 97777-1111', 'pedro.ramos@email.com', 'Rua Aroeiras, 20', 'Jardim Paulista'),
('Larissa Nogueira Lopes', '222.333.444-55', '1987-09-09', 'F', '(21) 98888-2222', 'larissa.lopes@email.com', 'Av. Copacabana, 120', 'Ipanema'),
('Ricardo Lima Santos', '333.444.555-66', '1979-01-28', 'M', '(31) 97777-3333', 'ricardo.santos@email.com', 'Rua Ouro Preto, 500', 'Savassi'),
('Juliana Costa Pereira', '444.555.666-77', '1994-06-17', 'F', '(51) 95678-4444', 'juliana.pereira@email.com', 'Rua Osório, 80', 'Moinhos de Vento');

/*Criar 3 UPDATES em quaisquer das tabelas..
Criar 3 UPDATES com Where em quaisquer das tabelas..
Criar 3 ALTER TABLE em quaisquer das tabelas, podendo utilizar change ou modify..
Criar 10 SELECT com Where (LIKE, IN, BETWEEN ETC)..
Criar 5 SELECT que contenham ORDER BY*/


/*Criar 3 UPDATES com Where em quaisquer das tabelas.*/

update Paciente
set Endereço = "Rua Evaristo De Castro, 190"
where Nome = "Carlos Eduardo Lima";

update Médico
set Telefone = "(54) 999823617"
where Cpf = "456.789.012-33";

update Exame 
set Diagnóstico = "Ressonância"
where Nome = "Ultrassom";

update Convênio 
set Nome = "IPE"
where Cpf = "616.671.400-94";

update Consulta
set Diagnóstico = "Influenza"
where Data_Consulta = "2022-01-01";

update Cidade
set Nome = "Marcelino Ramos"
where Nome = "Erechim";

/*Criar 3 ALTER TABLE em quaisquer das tabelas, podendo utilizar change ou modify.*/

alter table Convênio
add column RG varchar(100);

/* 1º update */

UPDATE Convênio SET RG = '123456789' WHERE Cpf = '805.961.830-03';
UPDATE Convênio SET RG = '234567890' WHERE Cpf = '616.671.400-94';
UPDATE Convênio SET RG = '345678901' WHERE Cpf = '519.638.330-15';
UPDATE Convênio SET RG = '456789012' WHERE Cpf = '751.799.270-80';
UPDATE Convênio SET RG = '567890123' WHERE Cpf = '851.820.230-22';
UPDATE Convênio SET RG = '678901234' WHERE Cpf = '199.311.260-00';
UPDATE Convênio SET RG = '789012345' WHERE Cpf = '967.362.670-72';
UPDATE Convênio SET RG = '890123456' WHERE Cpf = '271.037.220-72';
UPDATE Convênio SET RG = '901234567' WHERE Cpf = '713.245.180-49';
UPDATE Convênio SET RG = '012345678' WHERE Cpf = '364.868.290-36';
UPDATE Convênio SET RG = '111222333' WHERE Cpf = '123.123.123-12';
UPDATE Convênio SET RG = '222333444' WHERE Cpf = '234.234.234-23';
UPDATE Convênio SET RG = '333444555' WHERE Cpf = '345.345.345-34';
UPDATE Convênio SET RG = '444555666' WHERE Cpf = '456.456.456-45';
UPDATE Convênio SET RG = '555666777' WHERE Cpf = '567.567.567-56';
UPDATE Convênio SET RG = '666777888' WHERE Cpf = '678.678.678-67';
UPDATE Convênio SET RG = '777888999' WHERE Cpf = '789.789.789-78';
UPDATE Convênio SET RG = '888999000' WHERE Cpf = '890.890.890-89';

alter table Consulta
add column Sala varchar(20);

/* 2º Update */

update Consulta set Sala = case
when Diagnóstico = "Covid-19" or Diagnóstico ="H1N1" or Diagnóstico = "H3N2" or Diagnóstico = "Covid-19 leve"  then "Sala 301"
when Diagnóstico = "Influenza-A" or Diagnóstico = "Influenza-B" or Diagnóstico = "Influenza-C" or Diagnóstico = "Influenza-D" or Diagnóstico = "Influenza" then "Sala 319"
when Diagnóstico = "Dengue" or Diagnóstico = "Sarampo" or Diagnóstico = "Catapora" or Diagnóstico = "Chikungunya" or Diagnóstico = "AIDS" then "Sala 329"
when Diagnóstico = "HPV" or Diagnóstico = "Miningite" or Diagnóstico = "Tuberculose" or Diagnóstico = "Caxumba" or Diagnóstico = "Rubéola" or Diagnóstico = "Gripe comum" or Diagnóstico = "Bronquite" then "Sala 281"
when Diagnóstico = "Hipertensão" or Diagnóstico = "Diabetes tipo 2" or Diagnóstico = "Alergia respiratória" or Diagnóstico = "Sinusite" then "Sala 269"
end;

/*3º Update */

UPDATE Consulta
SET Data_Consulta = '2023-05-02', Hora = '11:21'
WHERE idConsulta = '9';

ALTER TABLE Consulta
MODIFY COLUMN Sala VARCHAR(100)
AFTER Diagnóstico;

ALTER TABLE Convênio
CHANGE RG RG VARCHAR(20)
AFTER CPF;

/*Criar 10 SELECT com Where (LIKE, IN, BETWEEN ETC)*/

SELECT Nome, Cpf, Email FROM Paciente WHERE Nome LIKE 'J%';
SELECT Nome, UF, Regiao FROM Cidade WHERE UF IN ('RS', 'SC', 'PR');
SELECT Data_Consulta, Hora, Diagnóstico FROM Consulta WHERE Data_Consulta BETWEEN '2023-01-01' AND '2024-12-31';
SELECT Data_Consulta, Diagnóstico, Sala FROM Consulta WHERE Diagnóstico LIKE '%Influenza%';
SELECT Nome FROM Especialidade WHERE Nome IN ('Cardiologia', 'Neurologia', 'Pediatria');
SELECT Nome, Crm, Email FROM Médico WHERE idMédico BETWEEN 5 AND 10;
SELECT Nome, Telefone, Email FROM Médico WHERE Email LIKE '%@clinicavida.com';
SELECT Nome, Plano FROM Convênio WHERE Plano IN ('Cobertura Total', 'Cobertura Parcial em Consultas');
SELECT Data_Exame, Nome, Diagnóstico FROM Exame WHERE Data_Exame BETWEEN '2022-01-01' AND '2023-12-31';
SELECT Nome, Endereço, Bairro FROM Paciente WHERE Bairro LIKE '%Centro%';

/*Criar 5 SELECT que contenham ORDER BY*/

SELECT Nome, Cpf, Data_Nascimento, Sexo FROM Paciente ORDER BY Nome ASC;
SELECT Data_Consulta, Hora, Diagnóstico, Sala FROM Consulta ORDER BY Data_Consulta DESC;
SELECT Nome, Crm, Telefone, Email FROM Médico ORDER BY Crm ASC;
SELECT Data_Exame, Nome, Diagnóstico FROM Exame ORDER BY Data_Exame ASC;
SELECT Nome, UF, Regiao FROM Cidade ORDER BY Regiao ASC, Nome ASC;

/* 5x Inner join */

SELECT exame.Data_Exame, consulta.Data_Consulta
FROM Exame
INNER JOIN Consulta
ON exame.Data_Exame = consulta.Data_Consulta;

SELECT Paciente.Nome AS Nome_Paciente, Paciente.Email, Cidade.Nome AS Cidade, Cidade.UF, Cidade.Regiao
FROM Paciente
INNER JOIN Cidade ON Paciente.idCidade = Cidade.idCidade;

SELECT Paciente.Nome AS Nome_Paciente, Paciente.Cpf, Convênio.Nome AS Convenio, Convênio.Plano
FROM Paciente
INNER JOIN Convênio ON Paciente.idConvênio = Convênio.idConvênio;

SELECT Médico.Nome AS Nome_Medico, Médico.Crm, Especialidade.Nome AS Especialidade
FROM Médico
INNER JOIN Especialidade ON Médico.idEspecialidade = Especialidade.idEspecialidade;

SELECT Consulta.Data_Consulta, Consulta.Hora, Consulta.Diagnóstico, Paciente.Nome AS Nome_Paciente, Médico.Nome AS Nome_Medico
FROM Consulta
INNER JOIN Paciente ON Consulta.idPaciente = Paciente.idPaciente
INNER JOIN Médico ON Consulta.idMédico = Médico.idMédico;

SELECT Exame.Data_Exame, Exame.Nome AS Nome_Exame, Exame.Diagnóstico AS Diagnostico_Exame, Consulta.Data_Consulta, Paciente.Nome AS Nome_Paciente, Médico.Nome AS Nome_Medico
FROM Exame
INNER JOIN Consulta ON Exame.idConsulta = Consulta.idConsulta
INNER JOIN Paciente ON Exame.idPaciente = Paciente.idPaciente
INNER JOIN Médico ON Exame.idMédico = Médico.idMédico;

/* 3x Left join */

SELECT Consulta.Data_Consulta, Consulta.Hora, Consulta.Diagnóstico, Exame.Nome AS Nome_Exame, Exame.Diagnóstico AS Diagnostico_Exame
FROM Consulta
LEFT JOIN Exame ON Consulta.idExame = Exame.idExame;

SELECT Médico.Nome AS Nome_Medico, Médico.Crm, Especialidade.Nome AS Especialidade
FROM Médico
LEFT JOIN Especialidade ON Médico.idEspecialidade = Especialidade.idEspecialidade;

SELECT Paciente.Nome AS Nome_Paciente, Paciente.Email, Cidade.Nome AS Cidade
FROM Paciente
LEFT JOIN Cidade ON Paciente.idCidade = Cidade.idCidade


/* select * from Cidade;
select * from Consulta;
select * from Convênio;
select * from Especialidade;
select * from Exame;
select * from Médico;
select * from Paciente; */
