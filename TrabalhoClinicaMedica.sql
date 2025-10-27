drop database TrabalhoClinicaMedica;
create database TrabalhoClinicaMedica ;
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
foreign key(idEspecialidade) references Espeialidade(idEspecialidade);

alter table Consulta 
add column idMédico int not null,
add constraint idMédico_fk
foreign key(idMédico) references Médico(idMédico);

alter table Consulta 
add column idPaciente int not null,
add constraint idPaciente_fk
foreign key(idPaciente) references Médico(idPaciente);

alter table Exame
add column idPaciente int not null,
add constraint idPaciente_fk
foreign key(idPaciente) references Médico(idPaciente);

alter table Exame
add column idMédico int not null,
add constraint idMédico_fk
foreign key(idMédico) references Médico(idMédico);

alter table Exame
add column idConsulta int not null,
add constraint idConsulta_fk
foreign key(idConsulta) references Exame(idConsulta);

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
('Balneário Camboriú', 'SC');

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
('2026-01-27', '17:55', 'AIDS');

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
('QSaúde', '364.868.290-36', 'Cobertura Total');

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
('Diagnóstico por Imagem');

insert into Exame(Data_Exame, Nome, Diagnóstico) value
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
('2022-08-12', 'PET-CT,', 'Fornecer imagens detalhadas para diagnóstico preciso');

INSERT INTO Médico (Nome, Crm, Telefone, Email, Cpf) VALUES
('Dr. João Silva', 'CRM12345SP', '(11) 91234-5678', 'joao.silva@clinicavida.com', '123.456.789-00'),
('Dra. Maria Oliveira', 'CRM67890RJ', '(21) 99876-5432', 'maria.oliveira@saudebem.com', '234.567.890-11'),
('Dr. Pedro Santos', 'CRM11223MG', '(31) 98765-4321', 'pedro.santos@hospitalcentral.com', '345.678.901-22'),
('Dra. Ana Costa', 'CRM33445RS', '(51) 92345-6789', 'ana.costa@clinicageral.com', '456.789.012-33'),
('Dr. Lucas Pereira', 'CRM55667BA', '(71) 98877-6655', 'lucas.pereira@coracaoemdia.com', '567.890.123-44'),
('Dra. Carla Mendes', 'CRM77889PR', '(41) 99788-5544', 'carla.mendes@vidasaude.com', '678.901.234-55'),
('Dr. Rafael Lima', 'CRM99001PE', '(81) 91234-4433', 'rafael.lima@neurocenter.com', '789.012.345-66'),
('Dra. Beatriz Rocha', 'CRM22334SC', '(48) 99654-3322', 'beatriz.rocha@pediatriabrasil.com', '890.123.456-77'),
('Dr. Fernando Alves', 'CRM44556GO', '(62) 98543-2211', 'fernando.alves@ortoclinic.com', '901.234.567-88'),
('Dra. Juliana Ribeiro', 'CRM66778CE', '(85) 99911-2200', 'juliana.ribeiro@mulheresaude.com', '012.345.678-99');

INSERT INTO Paciente (Nome, Cpf, Data_Nascimento, Sexo, Telefone, Email, Endereço, Bairro) VALUES
('João Pedro da Silva', '123.456.789-00', '1990-03-15', 'M', '(11) 91234-5678', 'joao.silva@email.com', 'Rua das Flores, 123', 'Centro'),
('Maria Fernanda Alves', '234.567.890-11', '1985-07-22', 'F', '(21) 99876-5432', 'maria.alves@email.com', 'Av. Atlântica, 456', 'Copacabana'),
('Carlos Eduardo Lima', '345.678.901-22', '1978-12-05', 'M', '(31) 98765-4321', 'carlos.lima@email.com', 'Rua dos Andradas, 789', 'Savassi'),
('Ana Paula Rocha', '456.789.012-33', '1992-09-18', 'F', '(51) 92345-6789', 'ana.rocha@email.com', 'Rua Bento Gonçalves, 55', 'Cidade Baixa'),
('Lucas Henrique Souza', '567.890.123-44', '1995-02-10', 'M', '(71) 98877-6655', 'lucas.souza@email.com', 'Rua Bahia, 890', 'Pituba'),
('Beatriz Mendes Costa', '678.901.234-55', '1988-05-30', 'F', '(41) 99788-5544', 'beatriz.costa@email.com', 'Rua XV de Novembro, 300', 'Batel'),
('Rafael Tavares Moreira', '789.012.345-66', '1980-10-12', 'M', '(81) 91234-4433', 'rafael.moreira@email.com', 'Rua Aurora, 210', 'Boa Vista'),
('Juliana Pereira Lima', '890.123.456-77', '1993-01-25', 'F', '(48) 99654-3322', 'juliana.lima@email.com', 'Rua das Acácias, 45', 'Trindade'),
('Fernando Carvalho Nunes', '901.234.567-88', '1986-06-09', 'M', '(62) 98543-2211', 'fernando.nunes@email.com', 'Rua Goiás, 12', 'Setor Oeste'),
('Camila Ribeiro Duarte', '012.345.678-99', '1998-11-03', 'F', '(85) 99911-2200', 'camila.duarte@email.com', 'Av. Beira Mar, 789', 'Meireles');

/*Criar 3 UPDATES em quaisquer das tabelas.
Criar 3 UPDATES com Where em quaisquer das tabelas.
Criar 3 ALTER TABLE em quaisquer das tabelas, podendo utilizar change ou modify.
Criar 10 SELECT com Where (LIKE, IN, BETWEEN ETC)
Criar 5 SELECT que contenham ORDER BY*/

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

select * from Cidade;
select * from Consulta;
select * from Convênio;
select * from Especialidade;
select * from Exame;
select * from Médico;
select * from Paciente;