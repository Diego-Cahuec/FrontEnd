create database Mi_Mascota;
use Mi_Mascota;

create table Persona(
ID_PERS int not null auto_increment,
NIT INT (8) NOT NULL,
NOMBRE  varchar (40) not null,
DIRECCION varchar (60) 	not null,
TELEFONO INT (8) not null,
primary key (ID_PERS)
);

create table Mascota(
ID_MASC int not null auto_increment,
ID_RESP int not null,
NOMBRE_MASC varchar (40) not null,
FECHA_NA DATE not null,
FECHA_RE DATE not null,
primary key (ID_MASC)
);


CREATE TABLE citas (
    ID_citas INT  not null AUTO_INCREMENT PRIMARY KEY,
    ID_MASCO int not null,
	ID_RESPO int not null,
    Fecha DATE,
    Hora TIME,
    Descripcion VARCHAR(255),
    Presentacion ENUM('Si', 'No'),
    Fecha_Siguiente DATE
);

create table tratamientos(
id_tratamientos int not null auto_increment primary key,
id_cita int not null,
Descripcion VARCHAR(255),
costo int 
);

ALTER TABLE citas DROP COLUMN Responsable;
alter table mascota add constraint fk_ID_RESP foreign key (ID_RESP)
references 	persona (ID_PERS) on delete cascade on update cascade;

alter table citas add constraint fk_ID_MASCO foreign key (ID_MASCO)
references 	mascota (ID_MASC) on delete cascade on update cascade;
alter table citas add constraint fk_ID_RESPO foreign key (ID_RESPO)
references 	persona (ID_PERS) on delete cascade on update cascade;

alter table tratamientos add constraint fk_id_cita foreign key (id_cita)
references 	citas (ID_CITAS) on delete cascade on update cascade;

