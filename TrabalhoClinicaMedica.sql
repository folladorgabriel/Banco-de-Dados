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


select * from Cidade;
select * from Consulta;
select * from Convênio;
select * from Especialidade;
select * from Exame;
select * from Médico;
select * from Paciente;






