use mi_mascota;
/*1. Listado de personas de la clínica*/
   SELECT * FROM Persona;
/*2.Listado de mascotas con el nombre de la persona ordenados por nombre de la mascota*/
SELECT Mascota.NOMBRE_MASC, Persona.nombre AS nombre_persona FROM Mascota INNER JOIN Persona ON Mascota.ID_RESP = Persona.ID_PERS ORDER BY Mascota.NOMBRE_MASC;
/*3.Listado de mascotas con el nombre de la persona ordenados por fecha de registro*/
SELECT Mascotas.nombre, Personas.nombre AS nombre_persona FROM Mascotas INNER JOIN Personas ON Mascotas.id_persona = Personas.id ORDER BY Mascotas.fecha_registro;
/*4.Listado de citas de una mascota*/
SELECT * FROM Citas WHERE ID_MASCO = 1;
/*5.Listado de citas de las mascotas de una persona*/
SELECT citas.* FROM citas INNER JOIN mascota  ON Citas.ID_MASCO = mascota.ID_MASC WHERE mascota.ID_RESP = 1;
/*6.Listado de citas en un mes específico*/
 SELECT * FROM Citas WHERE MONTH(fecha) = 5;
/*7. Listado de citas en un día específico ordenados por fecha y hora*/
SELECT * FROM Citas WHERE DATE(fecha) = '2021-05-05' and time(hora)='09:30:00' ORDER BY fecha;
/*8. Mascota que más citas ha tenido**/
SELECT Mascota.NOMBRE_MASC, COUNT(Citas.ID_citas) AS cantidad_citas FROM Mascota INNER JOIN Citas ON Mascota.ID_MASC = Citas.ID_MASCO GROUP BY Mascota.NOMBRE_MASC ORDER BY cantidad_citas DESC LIMIT 1;
/*9. Mascota que más ha faltado*/
SELECT Mascota.NOMBRE_MASC, COUNT(Citas.ID_citas) AS cantidad_citas FROM Mascota INNER JOIN Citas ON Mascota.ID_MASC = Citas.ID_MASCO WHERE Citas.Presentacion = 'no' GROUP BY Mascota.ID_MASC ORDER BY cantidad_citas DESC LIMIT 1;
/*10. Listado de personas con la cantidad de mascotas que tiene registradas en la clínica*/
SELECT Persona.nombre, COUNT(Mascota.ID_MASC) AS cantidad_mascotas FROM Persona INNER JOIN Mascota ON Persona.ID_PERS = Mascota.ID_RESP GROUP BY Persona.nombre;
/*11. *Tratamientos asociados a una mascota*/
SELECT Tratamientos.* FROM Tratamientos INNER JOIN Citas ON Tratamientos.id_cita = Citas.ID_citas WHERE Citas.ID_MASCO = 1;
/*12. Total de dinero en tratamientos por mascota de una personmascotaa específica*/
SELECT Mascota.NOMBRE_MASC, SUM(Tratamientos.costo) AS total_costo_tratamientos FROM Mascota INNER JOIN Citas ON Mascota.ID_MASC = Citas.ID_MASCO INNER JOIN Tratamientos ON Citas.ID_citas = Tratamientos.id_cita WHERE Mascota.ID_RESP = 1 GROUP BY Mascota.NOMBRE_MASC

