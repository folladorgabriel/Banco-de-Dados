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
    Cpf varchar(100)
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
    Diagnóstico varchar(100) not null,
    valor varchar(100)
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

/* 1º alter */
alter table Cidade
add column Regiao varchar (20) after UF;

update Cidade set Regiao = case
when uf = "MG" or uf ="RJ" or uf = "SP" or uf = "ES" then "Sudeste"
when uf = "BA" or uf = "RN" or uf = "PI" or uf = "MA" or uf = "CE" or uf = "PB" or uf = "SE" or uf = "AL" or uf = "PE" then "Nordeste"
when uf = "MT" or uf = "MS" or uf = "GO" then "Centro-Oeste"
when uf = "AC" or uf = "AM" or uf = "RO" or uf = "PA" or uf = "TO" or uf = "AP" or uf = "RR" then "Norte"
when uf = "RS" or uf = "SC" or uf = "PR" then "Sul"
end;


INSERT INTO Consulta (Data_Consulta, Hora, Diagnóstico, Valor, idPaciente, idMédico) VALUES
('2022-01-01', '7:35', 'Covid-19', 'R$220.00', 1, 1),
('2022-03-10', '7:50', 'Influenza-A', 'R$175.00', 2, 2),
('2022-07-20', '8:35', 'H1N1', 'R$210.00', 3, 3),
('2022-11-30', '10:45', 'H3N2', 'R$185.00', 4, 4),
('2023-01-01', '6:30', 'H3N2', 'R$185.00', 5, 5),
('2023-04-10', '14:35', 'Influenza-B', 'R$190.00', 6, 6),
('2023-07-20', '21:10', 'Influenza-C', 'R$200.00', 7, 7),
('2023-04-10', '14:35', 'Influenza-B', 'R$190.00', 8, 8),
('2024-03-15', '10:20', 'Dengue', 'R$260.00', 9, 9),
('2024-05-10', '15:35', 'Sarampo', 'R$230.00', 10, 10),
('2024-06-12', '12:00', 'Catapora', 'R$160.00', 11, 11),
('2024-10-01', '17:50', 'Chikungunya', 'R$240.00', 12, 12),
('2025-08-27', '7:55', 'HPV', 'R$300.00', 13, 13),
('2025-08-30', '9:40', 'Miningite', 'R$290.00', 14, 14),
('2025-10-07', '11:10', 'Tuberculose', 'R$270.00', 15, 15),
('2025-11-03', '7:10', 'Caxumba', 'R$175.00', 16, 16),
('2025-12-09', '14:45', 'Rubéola', 'R$160.00', 17, 17),
('2026-01-27', '17:55', 'AIDS', 'R$310.00', 18, 18),
('2023-02-14', '08:30', 'Gripe comum', 'R$110.00', 19, 19),
('2023-05-19', '09:00', 'Dengue', 'R$260.00', 20, 20),
('2023-09-01', '10:15', 'Sinusite', 'R$130.00', 21, 21),
('2024-01-22', '13:00', 'Alergia respiratória', 'R$180.00', 22, 22),
('2024-04-30', '16:45', 'Diabetes tipo 2', 'R$260.00', 23, 23),
('2024-07-10', '18:20', 'Hipertensão', 'R$195.00', 24, 24),
('2025-03-05', '07:40', 'Bronquite', 'R$165.00', 25, 25),
('2025-09-30', '11:10', 'Covid-19 leve', 'R$220.00', 1, 26),
('2025-10-10', '17:50', 'Influenza-A', 'R$175.00', 2, 27),
('2025-11-10', '14:35', 'Influenza-B', 'R$190.00', 3, 28),
('2025-11-12', '14:35', 'Influenza-B', 'R$190.00', 4, 29),
('2025-12-22', '7:55', 'HPV', 'R$300.00', 5, 1),
('2025-12-30', '9:40', 'Miningite', 'R$290.00', 6, 2),
('2026-01-27', '17:55', 'AIDS', 'R$310.00', 7, 3),
('2026-02-22', '17:55', 'AIDS', 'R$310.00', 8, 4),
('2026-03-21', '7:35', 'Covid-19', 'R$220.00', 9, 5),
('2026-03-23', '11:10', 'Tuberculose', 'R$270.00', 10, 6),
('2026-04-22', '13:00', 'Alergia respiratória', 'R$180.00', 11, 7),
('2026-04-30', '16:45', 'Diabetes tipo 2', 'R$260.00', 12, 8),
('2026-05-10', '18:20', 'Hipertensão', 'R$195.00', 13, 9),
('2026-06-30', '10:45', 'H3N2', 'R$185.00', 14, 10),
('2026-09-01', '6:30', 'H3N2', 'R$185.00', 15, 11),
('2026-10-07', '11:10', 'Tuberculose', 'R$270.00', 16, 12),
('2026-11-03', '7:10', 'Caxumba', 'R$175.00', 17, 13),
('2027-01-01', '14:45', 'Rubéola', 'R$160.00', 18, 14),
('2027-01-09', '10:15', 'Sinusite', 'R$130.00', 19, 15),
('2027-02-22', '13:00', 'Alergia respiratória', 'R$180.00', 20, 16),
('2027-04-30', '16:45', 'Diabetes tipo 2', 'R$260.00', 21, 17),
('2027-06-12', '08:30', 'Covid-19', 'R$220.00', 22, 18),
('2027-07-18', '09:50', 'Dengue', 'R$260.00', 23, 19),
('2027-08-25', '11:20', 'H3N2', 'R$185.00', 24, 20),
('2027-09-30', '13:10', 'Hipertensão', 'R$195.00', 25, 21),
('2027-10-12', '15:35', 'Bronquite', 'R$165.00', 1, 22),
('2027-11-01', '17:00', 'Influenza-A', 'R$175.00', 2, 23),
('2027-11-15', '08:25', 'Influenza-B', 'R$190.00', 3, 23),
('2027-11-20', '10:40', 'Covid-19 leve', 'R$220.00', 4, 25),
('2027-12-05', '12:55', 'Gripe comum', 'R$110.00', 5, 26),
('2027-12-10', '14:45', 'Diabetes tipo 2', 'R$260.00', 6, 19),
('2027-12-15', '16:20', 'AIDS', 'R$310.00', 7, 28),
('2027-12-22', '18:10', 'Sinusite', 'R$130.00', 8, 29),
('2027-12-30', '19:45', 'Caxumba', 'R$175.00', 9, 1),
('2027-12-31', '21:00', 'Tuberculose', 'R$270.00', 10, 2);
 
insert into Convênio(Nome, idPaciente) values
('IPE', 1),
('Unimed', 0),
('Bradesco Saúde', 2),
('Hapvida', 4),
('SulAmérica', 3),
('Care Plus', 5),
('Greenline Saúde', 6),
('QSaúde', 7),
('Amil', 8),
('NotreDame Intermédica', 9),
('Porto Seguro Saúde', 10);

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

INSERT INTO Exame (Data_Exame, Nome, Diagnóstico, idPaciente, idMédico, idConsulta) VALUES
('2020-01-15', 'Dermatoscopia', 'Lesão benigna removida com sucesso', 1, 2, 3),
('2020-03-22', 'Eletrocardiograma', 'Arritmia leve detectada', 0, 1, 2),
('2020-05-10', 'Glicemia', 'Níveis normais de glicose', 2, 3, 4),
('2020-06-18', 'Colposcopia', 'Inflamação leve do colo uterino', 3, 4, 5),
('2020-09-03', 'Ultrassonografia Obstétrica', 'Gestação de 12 semanas', 4, 5, 6),
('2021-02-14', 'Ressonância magnética', 'Sem alterações cerebrais', 5, 6, 7),
('2021-04-07', 'Tomografia', 'Fratura óssea identificada', 2, 1, 0),
('2021-07-12', 'Raio-X', 'Lesão leve na clavícula', 3, 2, 1),
('2021-08-21', 'Exames de sangue, urina e fezes', 'Deficiência de ferro detectada', 4, 2, 1),
('2021-10-30', 'Avaliação clínica e psicológica', 'Transtorno de ansiedade leve', 5, 7, 9),
('2022-01-11', 'Ultrassom', 'Órgãos abdominais normais', 10, 4, 2),
('2022-02-25', 'PET-CT', 'Atividade tumoral ausente', 9, 4, 2),
('2022-03-14', 'Hemograma Completo', 'Leucócitos ligeiramente elevados', 0, 1, 2),
('2022-04-09', 'Ultrassonografia Abdominal', 'Fígado levemente aumentado', 1, 2, 3),
('2022-06-05', 'Ecocardiograma', 'Função cardíaca preservada', 2, 3, 4),
('2022-07-17', 'Endoscopia', 'Refluxo gastroesofágico moderado', 3, 4, 5),
('2022-09-13', 'Colonoscopia', 'Pólipos benignos removidos', 4, 5, 6),
('2022-10-08', 'Raio-X do Tórax', 'Sem alterações pulmonares', 5, 6, 7),
('2022-12-21', 'Ressonância do Crânio', 'Desvio de septo nasal detectado', 6, 7, 8),
('2023-01-16', 'Teste de Covid-19', 'Negativo', 7, 8, 9),
('2023-03-28', 'Eletrocardiograma', 'Isquemia leve identificada', 8, 9, 10),
('2023-04-22', 'Hemograma Completo', 'Plaquetas normais', 9, 10, 0),
('2023-06-15', 'Dermatoscopia', 'Nevos sem risco de malignidade', 10, 0, 1),
('2023-08-03', 'Glicemia', 'Pré-diabetes controlado', 0, 1, 2),
('2023-09-20', 'Ultrassom', 'Rins com leve retenção líquida', 1, 2, 3),
('2023-11-11', 'Colposcopia', 'Exame normal', 2, 3, 4),
('2024-01-10', 'Raio-X do Tórax', 'Bronquite leve', 3, 4, 5),
('2024-02-18', 'Ressonância do Crânio', 'Sinusite frontal detectada', 4, 5, 6),
('2024-04-29', 'Endoscopia', 'Gastrite leve', 5, 6, 7),
('2024-06-12', 'Teste de Covid-19', 'Positivo', 6, 7, 8),
('2024-07-23', 'Ecocardiograma', 'Insuficiência cardíaca leve', 7, 8, 9),
('2024-09-14', 'Tomografia', 'Lesão óssea cicatrizada', 8, 9, 10),
('2024-10-28', 'Eletrocardiograma', 'Ritmo sinusal normal', 9, 10, 0),
('2024-11-19', 'Ressonância magnética', 'Compressão lombar moderada', 10, 0, 1),
('2025-01-07', 'Ultrassonografia Abdominal', 'Cisto renal simples', 0, 1, 2),
('2025-02-15', 'Raio-X', 'Pulmões limpos', 1, 2, 3),
('2025-03-10', 'Exames de sangue, urina e fezes', 'Resultados dentro da normalidade', 2, 3, 4),
('2025-04-06', 'Ultrassonografia Obstétrica', 'Gestação saudável, 24 semanas', 3, 4, 5),
('2025-05-17', 'Dermatoscopia', 'Eczema tratado', 4, 5, 6),
('2025-06-29', 'Endoscopia', 'Úlcera cicatrizada', 5, 6, 7);


insert into Médico (Nome, Crm, Telefone, Email, Cpf, idEspecialidade) values
('Dr. João Silva', 'CRM12345SP', '(11) 91234-5678', 'joao.silva@clinicavida.com', '123.456.789-00', '1'), /* Botar especilidade do medico*/
('Dra. Maria Oliveira', 'CRM67890RJ', '(21) 99876-5432', 'maria.oliveira@saudebem.com', '234.567.890-11', '0'),
('Dr. Pedro Santos', 'CRM11223MG', '(31) 98765-4321', 'pedro.santos@hospitalcentral.com', '345.678.901-22', '3'),
('Dra. Ana Costa', 'CRM33445RS', '(51) 92345-6789', 'ana.costa@clinicageral.com', '456.789.012-33', '2'),
('Dr. Lucas Pereira', 'CRM55667BA', '(71) 98877-6655', 'lucas.pereira@coracaoemdia.com', '567.890.123-44', '6'),
('Dra. Carla Mendes', 'CRM77889PR', '(41) 99788-5544', 'carla.mendes@vidasaude.com', '678.901.234-55', '4'),
('Dr. Rafael Lima', 'CRM99001PE', '(81) 91234-4433', 'rafael.lima@neurocenter.com', '789.012.345-66', '5'),
('Dra. Beatriz Rocha', 'CRM22334SC', '(48) 99654-3322', 'beatriz.rocha@pediatriabrasil.com', '890.123.456-77', '8'),
('Dr. Gustavo Martins', 'CRM88990RS', '(51) 98123-1111', 'gustavo.martins@clinicars.com', '101.202.303-44', '7' ),
('Dra. Helena Souza', 'CRM99112SP', '(11) 93456-2222', 'helena.souza@saudesp.com', '202.303.404-55', '10'),
('Dr. André Carvalho', 'CRM11223RJ', '(21) 94567-3333', 'andre.carvalho@hospitalrj.com', '303.404.505-66', '9'),
('Dra. Patrícia Gomes', 'CRM22334MG', '(31) 97654-4444', 'patricia.gomes@clinicabh.com', '404.505.606-77', '13'),
('Dr. Felipe Costa', 'CRM33445BA', '(71) 99876-5555', 'felipe.costa@bahiasaude.com', '505.606.707-88', '12'),
('Dra. Larissa Almeida', 'CRM44556PE', '(81) 98765-6666', 'larissa.almeida@neuroclinic.com', '606.707.808-99', '11'),
('Dr. Thiago Ribeiro', 'CRM55667SC', '(48) 95678-7777', 'thiago.ribeiro@medfloripa.com', '707.808.909-10', '15'),
('Dra. Amanda Farias', 'CRM66778PR', '(41) 95432-8888', 'amanda.farias@vidaparnaiba.com', '808.909.010-11' ,'14'),
('Dra. Sara Bertolla', 'CRM12334RS', '(54) 99456-3251', 'sara.cbertollas@hospitalcaridade.com', '153.687.917-11', '5'),
('Dr. Gabriel Follador', 'CRM36781SC', '(48) 99456-6578', 'gabriel.follador@hospitalbrasil.com', '456.692.510-55', '7'),
('Dra. Luciane Agliardi', 'CRM75290PR', '(81) 94580-3379', 'luciane.agliardi@vidasaude.com', '582.511.582-77', '2'),
('Dr. Henrique Duarte', 'CRM88101SP', '(11) 91122-3344', 'henrique.duarte@clinicavida.com', '111.222.333-44', '1'),
('Dra. Camila Freitas', 'CRM77220RJ', '(21) 92233-4455', 'camila.freitas@saudebem.com', '222.333.444-55', '3'),
('Dr. Marcos Vinícius', 'CRM66331MG', '(31) 93344-5566', 'marcos.vinicius@hospitalcentral.com', '333.444.555-66', '4'),
('Dra. Fernanda Lopes', 'CRM55442RS', '(51) 94455-6677', 'fernanda.lopes@clinicageral.com', '444.555.666-77', '2'),
('Dr. Eduardo Nunes', 'CRM44553BA', '(71) 95566-7788', 'eduardo.nunes@coracaoemdia.com', '555.666.777-88', '6'),
('Dra. Juliana Prado', 'CRM33664PR', '(41) 96677-8899', 'juliana.prado@vidasaude.com', '666.777.888-99', '5'),
('Dr. Mateus Barreto', 'CRM22775PE', '(81) 97788-9900', 'mateus.barreto@neurocenter.com', '777.888.999-00', '7'),
('Dra. Isabela Torres', 'CRM11886SC', '(48) 98899-0011', 'isabela.torres@pediatriabrasil.com', '888.999.000-11', '8'),
('Dr. Vinícius Cardoso', 'CRM99007RS', '(51) 99900-1122', 'vinicius.cardoso@clinicars.com', '999.000.111-22', '9'),
('Dra. Letícia Moraes', 'CRM88118SP', '(11) 90011-2233', 'leticia.moraes@saudesp.com', '000.111.222-33', '10');

insert into Paciente (Nome, Cpf, Data_Nascimento, Sexo, Telefone, Email, Endereço, Bairro, idConvênio, idCidade) values 
('João Pedro da Silva', '123.456.789-00', '1990-03-15', 'M', '(11) 91234-5678', 'joao.silva@email.com', 'Rua das Flores, 123', 'Centro', '2', '1'), /*Adiciona o convênio e cidade, tem um exemplo nessa linha*/
('Maria Fernanda Alves', '234.567.890-11', '1985-07-22', 'F', '(21) 99876-5432', 'maria.alves@email.com', 'Av. Atlântica, 456', 'Copacabana', '1', '0'),
('Carlos Eduardo Lima', '345.678.901-22', '1978-12-05', 'M', '(31) 98765-4321', 'carlos.lima@email.com', 'Rua dos Andradas, 789', 'Savassi', '0', '0'),
('Ana Paula Rocha', '456.789.012-33', '1992-09-18', 'F', '(51) 92345-6789', 'ana.rocha@email.com', 'Rua Bento Gonçalves, 55', 'Cidade Baixa', '3', '10'),
('Lucas Henrique Souza', '567.890.123-44', '1995-02-10', 'M', '(71) 98877-6655', 'lucas.souza@email.com', 'Rua Bahia, 890', 'Pituba', '4', '11'),
('Beatriz Mendes Costa', '678.901.234-55', '1988-05-30', 'F', '(41) 99788-5544', 'beatriz.costa@email.com', 'Rua XV de Novembro, 300', 'Batel', '5', '4'),
('Rafael Tavares Moreira', '789.012.345-66', '1980-10-12', 'M', '(81) 91234-4433', 'rafael.moreira@email.com', 'Rua Aurora, 210', 'Boa Vista','6','3'),
('Juliana Pereira Lima', '890.123.456-77', '1993-01-25', 'F', '(48) 99654-3322', 'juliana.lima@email.com', 'Rua das Acácias, 45', 'Trindade', '7', '2'),
('Fernando Carvalho Nunes', '901.234.567-88', '1986-06-09', 'M', '(62) 98543-2211', 'fernando.nunes@email.com', 'Rua Goiás, 12', 'Setor Oeste','8', '6'),
('Camila Ribeiro Duarte', '012.345.678-99', '1998-11-03', 'F', '(85) 99911-2200', 'camila.duarte@email.com', 'Av. Beira Mar, 789', 'Meireles','9', '5'),
('Pedro Henrique Ramos', '111.222.333-44', '1991-04-12', 'M', '(11) 97777-1111', 'pedro.ramos@email.com', 'Rua Aroeiras, 20', 'Jardim Paulista','10', '7'),
('Larissa Nogueira Lopes', '222.333.444-55', '1987-09-09', 'F', '(21) 98888-2222', 'larissa.lopes@email.com', 'Av. Copacabana, 120', 'Ipanema', '10', '8'),
('Ricardo Lima Santos', '333.444.555-66', '1979-01-28', 'M', '(31) 97777-3333', 'ricardo.santos@email.com', 'Rua Ouro Preto, 500', 'Savassi','8','7'),
('Juliana Costa Pereira', '444.555.666-77', '1994-06-17', 'F', '(51) 95678-4444', 'juliana.pereira@email.com', 'Rua Osório, 80', 'Moinhos de Vento', '0', '4'),
('Maria Cecilia Cardoso', '012.572.159-11', '2000-04-22', 'F', '(54) 99865-5576', 'maria.cardoso@email.com', 'Av. Paulista, 478', 'Santos', '3', '5'),
('Paulo Henrique Andrade', '555.666.777-88', '1983-08-14', 'M', '(31) 98844-5566', 'paulo.andrade@email.com', 'Rua dos Girassóis, 345', 'Funcionários', '2', '7'),
('Tatiane Moraes Silva', '666.777.888-99', '1997-03-27', 'F', '(21) 98777-6655', 'tatiane.silva@email.com', 'Av. das Américas, 800', 'Barra da Tijuca', '5', '8'),
('Marcelo Augusto Pires', '777.888.999-00', '1989-11-10', 'M', '(11) 91222-3344', 'marcelo.pires@email.com', 'Rua das Palmeiras, 110', 'Moema', '1', '1'),
('Carolina Bastos Faria', '888.999.000-11', '1996-02-08', 'F', '(48) 99123-7788', 'carolina.faria@email.com', 'Rua Florianópolis, 78', 'Centro', '4', '2'),
('Rodrigo Almeida Cunha', '999.000.111-22', '1981-09-25', 'M', '(85) 98812-9988', 'rodrigo.cunha@email.com', 'Av. Santos Dumont, 250', 'Aldeota', '6', '22'),
('Fernanda Gomes Barros', '101.112.131-41', '1990-01-30', 'F', '(71) 99198-3344', 'fernanda.barros@email.com', 'Rua das Gaivotas, 65', 'Rio Vermelho', '7', '11'),
('Eduardo Marques Pinto', '121.314.151-61', '1977-05-12', 'M', '(41) 99222-4433', 'eduardo.pinto@email.com', 'Av. Curitiba, 980', 'Centro', '9', '21'),
('Gabriela Teles Monteiro', '141.516.171-81', '1995-12-21', 'F', '(62) 98777-5544', 'gabriela.monteiro@email.com', 'Rua Tocantins, 305', 'Setor Bueno', '8', '18'),
('Leonardo Vieira Castro', '161.718.192-01', '1984-07-03', 'M', '(51) 99345-6677', 'leonardo.castro@email.com', 'Av. Ipiranga, 1000', 'Menino Deus', '10', '17'),
('Patrícia Nunes Rocha', '181.920.212-23', '1992-10-19', 'F', '(54) 99678-8899', 'patricia.rocha@email.com', 'Rua Bento Gonçalves, 455', 'Centro', '3', '16');


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
/* 1º alter na linha 131 */
alter table Convênio
add column RG varchar(100);

alter table Consulta
add column Sala varchar(20);

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

/* Outros alter table */

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
SELECT Data_Exame, Nome, Diagnóstico FROM Exame WHERE Data_Exame BETWEEN '2022-01-01' AND '2023-12-31';
SELECT Nome, Endereço, Bairro FROM Paciente WHERE Bairro LIKE '%Centro%';

/*Criar 5 SELECT que contenham ORDER BY*/

SELECT Nome, Cpf, Data_Nascimento, Sexo FROM Paciente ORDER BY Nome ASC;
SELECT Data_Consulta, Hora, Diagnóstico, Sala FROM Consulta ORDER BY Data_Consulta DESC;
SELECT Nome, Crm, Telefone, Email FROM Médico ORDER BY Crm ASC;
SELECT Data_Exame, Nome, Diagnóstico FROM Exame ORDER BY Data_Exame ASC;
SELECT Nome, UF, Regiao FROM Cidade ORDER BY Regiao ASC, Nome ASC;

/* 5x Group by (3 funções com agregação)
5x Inner join
3x Left join
2x Subconsultas */

/* 5x Group by (3 funções com agregação) */
		
SELECT médico.Nome 'Nome_Medico', COUNT(exame.idExame) 'Total_Exames', MIN(exame.Data_Exame) 'Primeiro_Exame', MAX(exame.Data_Exame) 'Ultimo_Exame'
FROM Exame
INNER JOIN Médico ON exame.idMédico = médico.idMédico
GROUP BY médico.Nome
ORDER BY Total_Exames DESC;

SELECT cidade.Nome 'Cidade', paciente.Sexo, COUNT(paciente.Sexo) 'Total sexo'
FROM Paciente
INNER JOIN Cidade ON paciente.idCidade = cidade.idCidade
GROUP BY cidade.Nome, paciente.Sexo;

SELECT paciente.Nome 'Nome_Paciente', COUNT(exame.idExame) 'Total_Exames', MIN(exame.Data_Exame) 'Primeiro_Exame', MAX(exame.Data_Exame) 'Ultimo_Exame'
FROM Exame
INNER JOIN Paciente ON exame.idPaciente = paciente.idPaciente
GROUP BY paciente.Nome
ORDER BY Ultimo_Exame DESC;

SELECT consulta.Diagnóstico 'Diagnóstico', COUNT(consulta.Diagnóstico) 'Número_Diagnósticos'
FROM consulta
GROUP BY consulta.Diagnóstico
ORDER BY Número_Diagnósticos DESC;

SELECT YEAR(exame.Data_Exame) 'Ano', COUNT(exame.idExame) 'Total_Exames', MIN(exame.Data_Exame) 'Primeiro_Exame_Ano', MAX(exame.Data_Exame) 'Ultimo_Exame_Ano' /* vai pegar os exames feitos no ano e as primeiras e as ultimas datas do exame*/
FROM Exame 
GROUP BY YEAR(exame.Data_Exame)
ORDER BY Ano;


/* 5x Inner join */

SELECT paciente.Nome 'Nome_Paciente', paciente.Email, cidade.Nome 'Cidade', cidade.UF, cidade.Regiao
FROM Paciente
INNER JOIN Cidade ON paciente.idCidade = cidade.idCidade;

SELECT paciente.Nome 'Nome_Paciente', paciente.Cpf, convênio.Nome 'Nome_Convenio'
FROM Paciente 
INNER JOIN Convênio ON paciente.idConvênio = convênio.idConvênio;

SELECT médico.Nome 'Nome_Medico', médico.Crm, especialidade.Nome 'Especialidade'
FROM Médico
INNER JOIN Especialidade ON médico.idEspecialidade = especialidade.idEspecialidade;

SELECT consulta.Diagnóstico, COUNT(consulta.idPaciente) 'Número_De_Vezes_Registrados'
FROM consulta
INNER JOIN exame ON exame.idConsulta = consulta.Diagnóstico
GROUP BY consulta.Diagnóstico;

SELECT  paciente.Nome 'idPaciente', convênio.Nome 'Convênio' 
from paciente
INNER JOIN convênio on convênio.idConvênio = paciente.idConvênio
Where paciente.Nome like '%A'
Order by paciente.idPaciente desc;


/* 3x Left join */


SELECT médico.Nome 'Nome_Medico', médico.Crm, especialidade.Nome 'Especialidade'
FROM Médico
LEFT JOIN Especialidade ON médico.idEspecialidade = especialidade.idEspecialidade;

SELECT paciente.Nome 'Nome_Paciente', paciente.Email, cidade.Nome 'Cidade', cidade.UF
FROM Paciente 
LEFT JOIN Cidade ON paciente.idCidade = cidade.idCidade;

SELECT consulta.idConsulta, consulta.Data_Consulta, paciente.Nome 'Nome_Paciente', consulta.Valor
FROM Consulta
LEFT JOIN Paciente ON consulta.idPaciente = paciente.idPaciente
ORDER BY consulta.Data_Consulta;

/* 2x Subconsultas */

SELECT paciente.Nome 'Nome_do_Paciente', cidade.Nome 'Nome_Cidade', cidade.UF 'UF_da_Cidade'
FROM paciente
right JOIN cidade ON cidade.idCidade = paciente.idCidade
where cidade.Nome in(select Nome from cidade where Nome like '%a'); 						

SELECT Nome
from Paciente
where idPaciente in (select idPaciente from Consulta where Diagnóstico like '%Covid%');


/*select * from Cidade;
select * from Consulta;
select * from Convênio;
select * from Especialidade;
select * from Exame;
select * from Médico;
select * from Paciente; 
select * from Médico;
select * from Paciente; */
