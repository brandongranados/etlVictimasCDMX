use victimasJULIO2021;

select * from julio2021 where idCarpeta is null or Año_inicio is null or Mes_inicio is null or FechaInicio IS NULL
OR Delito is null or Categoria is null OR Sexo is null or Edad is null or TipoPersona is null or CalidadJuridica is null
or competencia is null or Año_hecho is null or Mes_hecho is null or FechaHecho is null or HoraHecho is null or HoraInicio
is null or AlcaldiaHechos is null or ColoniaHechos is null or Calle_hechos is null or Calle_hechos2 is null or latitud is null
or longitud is null;

select distinct CalidadJuridica from julio2021;

select COUNT(*) from julio2021 where longitud  is null;

/**********************ANALISIS DE VALORES ATIPICOS EN EL ESPACIO************************************/
select * from julio2021 where (latitud is null and longitud is null) or(ColoniaHechos is null and AlcaldiaHechos is null);
//son lo mismo este de arriba y abajo
select * from julio2021 where (latitud is null and longitud is null) or(ColoniaHechos is null and AlcaldiaHechos is null)
or (ColoniaHechos is not null and AlcaldiaHechos is null);

select * from julio2021 where (ColoniaHechos is null and AlcaldiaHechos is null) or (ColoniaHechos is not null 
and AlcaldiaHechos is null);
//son lo mismo este de arriba y abajo


select * from julio2021 where ColoniaHechos is null and AlcaldiaHechos is null;
DELETE FROM julio2021 where ColoniaHechos is null and AlcaldiaHechos is null;


/**********************************************************/


/**********************ANALISIS DE VALORES ATIPICOS EN EL TIEMPO************************************/

select * from julio2021 where Año_hecho IS NULL AND Mes_hecho IS NULL AND FechaHecho IS NULL AND HoraHecho IS NULL;

delete from julio2021 where Año_hecho IS NULL AND Mes_hecho IS NULL AND FechaHecho IS NULL AND HoraHecho IS NULL;

SELECT FechaHecho FROM julio2021;

select * from julio2021 where Año_hecho IS NULL AND Mes_hecho IS NULL and FechaHecho IS NULL;

delete from julio2021 where Año_hecho IS NULL AND Mes_hecho IS NULL and FechaHecho IS NULL;

//SE ELIMINARAN ESTOS REGISTROS QUE TIENEN VALORES ATIPICOS DE TIEMPO

/****************************ANALISIS DE DATAWAREHOUSE******************************/
SELECT * FROM julio2021;


/**********************************************************/