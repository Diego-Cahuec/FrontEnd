describe tratamientos;
insert into persona(nit, nombre, direccion,telefono)values ('30121944','Andres co','coban','30893196');
insert into mascota(NOMBRE_MASC,ID_RESP, FECHA_NA, FECHA_RE)values ('PANCHO','1','2021/5/5','2021/5/5');
insert into citas(ID_MASCO,ID_RESPO,Fecha,Hora,Responsable, Presentacion,Fecha_Siguiente) values('1','2','2021/5/5','09:30:00','andres co','vacunacion','si','2021/6/3');
insert into tratamientos(id_cita,Descripcion,costo) values('1','segunda vacunacion','200');
