
create database ClinicaMedica;
use ClinicaMedica;

create table Cidade (
idCidade int not null auto_increment primary key,
	Nome varchar(100) not null,
    Estado varchar(100)
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

insert into Cidade(Nome,Estado)
values('Erechim', 'RS');

insert into Consulta(Data_Consulta, Hora, Observações, Diagnóstico)
values('28/07/2025', '19:31', 'Paciente reagiu bem a medicação', 'Covid-19');

insert into Convênio(Nome, Cpf, Plano)
values('Gabriel Rorig Follador', '033185610-70', 'Unimed');

insert into Especialidade(Nome)
values('Pneumologista');

insert into Exame(Data_Exame, Nome, Diagnóstico)
values('2025/28/07', 'Exame de Sangue', 'Covid-19');

insert into Médico(Nome, Crm, Telefone, Email, Cpf)
values('Neymar Junior', '93283-323', '54999823617', 'neymarjunior@gmail.com', '045184783-69');

insert into Paciente(Nome, Cpf, Data_Nascimento, Sexo, Telefone, Email, Endereço, Bairro)
values('Gabriel Rorig Follador', '03318561070', '2008/28/07', 'M', '5499683618', 'Gabrielrorigfollador@gmail.com', 'R. Evaristo de Castro 175', 'Centro');

UPDATE Cidade
SET Estado = 'Rio grande do Sul'
WHERE Estado = 'RS';

UPDATE Médico
SET crm = '93283-369'
WHERE crm = '93283-323';

UPDATE Consulta
SET Observações = 'Paciente deu alta'
WHERE Observações = 'Paciente reagiu bem a medicação';

UPDATE Médico SET Telefone = '54999824315';

UPDATE Paciente SET Email = 'Gabrielfollador28@gmail.com';

UPDATE Convênio SET Plano = 'IPE';

select * from Cidade
where Nome = 'Erechim';

select * from Paciente
where cpf > 03318671050;

select * from Paciente 
where nome Like 'a%';

select * from Paciente 
where nome Like '%o';

SELECT * FROM Paciente
WHERE Data_Nascimento BETWEEN '2025/08/24' AND '2024/08/24';

SELECT * FROM Cidade
WHERE Nome IN ('São Paulo', 'Rio de Janeiro', 'Curitiba');

SELECT * FROM Cidade
WHERE Nome NOT IN ('Belo Horizonte', 'Porto Alegre');

SELECT * FROM Paciente
WHERE Nome LIKE '%Follador%';	

SELECT * FROM Paciente
WHERE Email LIKE '%@gmail.com';

SELECT * FROM Médico
WHERE email LIKE '%@hotmail.com';

SELECT nome FROM Paciente
ORDER BY nome ASC;

SELECT Data_Nascimento FROM Paciente
ORDER BY Data_Nascimento DESC;

SELECT crm FROM Médico
ORDER BY crm DESC;

SELECT nome, endereço FROM Paciente
ORDER BY endereço ASC, nome ASC;

SELECT cpf FROM Paciente
ORDER BY cpf DESC;
	
	

