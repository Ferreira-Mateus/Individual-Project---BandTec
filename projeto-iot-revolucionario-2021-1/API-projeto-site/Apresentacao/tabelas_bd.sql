create database LStats;

use LStats;

create table usuario (
id int primary key auto_increment,
nome varchar(60),
login varchar(60),
senha varchar(30)
);

select * from usuario;

create table publicacao (
id int primary key auto_increment,
descricao varchar(100),
fkUsuario int
);

select * from publicacao;


create table campeoes (
idChamp int primary key auto_increment,
nomeChamp varchar(45),
classeChamp varchar(45)
);

select * from campeoes;

insert into campeoes values 
(null, 'Yasuo', 'Lutador'),
(null, 'Thresh', 'Tank'),
(null, 'Lee Sin', 'Lutador'),
(null, 'Morgana', 'Mago'),
(null, 'Vayne', 'Atirador');


create table lanes (
idLane int primary key auto_increment,
nomeLane varchar(3),
mapa varchar(45)
);

insert into lanes values 
(null, 'Top', 'Summoners Rift'),
(null, 'Jg', 'Summoners Rift'),
(null, 'Mid', 'Summoners Rift'),
(null, 'Adc', 'Summoners Rift'),
(null, 'Sup', 'Summoners Rift');

select * from lanes;

create table CampeoesLanes (
fkChamp int,
fkLane int,
dataChamp date,
primary key (fkChamp, fkLane),
foreign key (fkChamp) references campeoes (idChamp),
foreign key (fkLane) references lanes (idLane)
);

insert into CampeoesLanes values
(1, 1, '2021-05-29'),
(1, 3, '2021-05-30'),
(2, 5, '2021-05-28'),
(3, 1, '2021-05-30'),
(3, 2, '2021-04-28'),
(4, 2, '2021-05-30'),
(4, 3, '2021-04-28'),
(4, 5, '2021-05-28'),
(5, 1, '2021-05-27'),
(5, 4, '2021-05-29');


select campeoes.nomeChamp as 'Nome do campeão', lanes.nomeLane as 'Lane', CampeoesLanes.dataChamp as 'Data Partida' from campeoes
	inner join CampeoesLanes on fkChamp = idChamp inner join lanes on fkLane = idLane;
    
select campeoes.nomeChamp as 'Nome do campeão', lanes.nomeLane as 'Lane', CampeoesLanes.dataChamp as 'Data Partida' from campeoes
	inner join CampeoesLanes on fkChamp = idChamp inner join lanes on fkLane = idLane where dataChamp between '2021-05-28' and '2021-05-30'
		order by dataChamp;











