use victimasJULIO2021;

select * from inegiCDMX i inner join julio2021 j on i.nombre = j.AlcaldiaHechos;

select * from inegiCDMX;


create view NivelCuatro_NivelTres_CategoriaCompetenciaSexoCalidadJuridicaHoradiaAlcaldiaColonia as
select Categoria, Competencia, Sexo, CalidadJuridica, HoraHecho, diaHecho, AlcaldiaHechos, ColoniaHechos, Habitantes_1970, 
Habitantes_1990, Habitantes_1995, Habitantes_2000, Habitantes_2005, Habitantes_2010, Habitantes_2020, superficie, densidad_hab_ini, 
densidad_hab_fin, count(*) as Cant from (inegiCDMX i inner join julio2021 j on i.nombre = j.AlcaldiaHechos) group by Categoria, 
Competencia, Sexo, CalidadJuridica, HoraHecho, diaHecho, AlcaldiaHechos, ColoniaHechos, Habitantes_1970, Habitantes_1990, 
Habitantes_1995, Habitantes_2000, Habitantes_2005, Habitantes_2010, Habitantes_2020, superficie, densidad_hab_ini, densidad_hab_fin;

create view NivelCuatro_NivelTres_DelitoCompetenciaSexoEdadsemanaHechodiaHecholongitudlatitud as
select Delito, Competencia, Sexo, Edad, semanaHecho, diaHecho, longitud, latitud, Habitantes_1970, Habitantes_1990, Habitantes_1995,
Habitantes_2000, Habitantes_2005, Habitantes_2010, Habitantes_2020, superficie, densidad_hab_ini, densidad_hab_fin, count(*) as 
Cant from (inegiCDMX i inner join julio2021 j on i.nombre = j.AlcaldiaHechos) group by Delito, Competencia, Sexo, Edad, semanaHecho, 
diaHecho, longitud, latitud, Habitantes_1970, Habitantes_1990, Habitantes_1995, Habitantes_2000, Habitantes_2005, Habitantes_2010, 
Habitantes_2020, superficie, densidad_hab_ini, densidad_hab_fin;

create view NivelCuatro_NivelTres_DelitoCompetenciaSexoEdadsemanaHechodiaHechoAlcaldiaColonia as
select Delito, Competencia, Sexo, Edad, semanaHecho, diaHecho, AlcaldiaHechos, ColoniaHechos, Habitantes_1970, Habitantes_1990, 
Habitantes_1995, Habitantes_2000, Habitantes_2005, Habitantes_2010, Habitantes_2020, superficie, densidad_hab_ini, 
densidad_hab_fin, count(*) as Cant from (inegiCDMX i inner join julio2021 j on i.nombre = j.AlcaldiaHechos) group by Delito, 
Competencia, Sexo, Edad, semanaHecho, diaHecho, AlcaldiaHechos, ColoniaHechos, Habitantes_1970, Habitantes_1990, Habitantes_1995, 
Habitantes_2000, Habitantes_2005, Habitantes_2010, Habitantes_2020, superficie, densidad_hab_ini, densidad_hab_fin;

create view NivelCuatro_NivelTres_DelitoCategoriaTipoPersonaCalJurAñoMesAlcaldiaColonia as
select Delito, Categoria, TipoPersona, CalidadJuridica, Año_hecho, Mes_hecho, AlcaldiaHechos, ColoniaHechos, 
Habitantes_1970, Habitantes_1990, Habitantes_1995, Habitantes_2000, Habitantes_2005, Habitantes_2010,
Habitantes_2020, superficie, densidad_hab_ini, densidad_hab_fin, count(*) as Cant
from (inegiCDMX i inner join julio2021 j on i.nombre = j.AlcaldiaHechos) group by Delito, Categoria, TipoPersona, CalidadJuridica, 
Año_hecho, Mes_hecho, AlcaldiaHechos, ColoniaHechos, Habitantes_1970, Habitantes_1990, Habitantes_1995, Habitantes_2000,
Habitantes_2005, Habitantes_2010, Habitantes_2020, superficie, densidad_hab_ini, densidad_hab_fin;







create view NivelTresCategoriaCompetenciaSexoCalidadJuridicaHoradiaAlcaldiaColonia as
select Categoria, Competencia, Sexo, CalidadJuridica, HoraHecho, diaHecho, AlcaldiaHechos, ColoniaHechos, count(*) as Cant
from julio2021 group by Categoria, Competencia, Sexo, CalidadJuridica, HoraHecho, diaHecho, AlcaldiaHechos, ColoniaHechos;

create view NivelTresDelitoCompetenciaSexoEdadsemanaHechodiaHecholongitudlatitud as
select Delito, Competencia, Sexo, Edad, semanaHecho, diaHecho, longitud, latitud, count(*) as Cant from
julio2021 group by Delito, Competencia, Sexo, Edad, semanaHecho, diaHecho, longitud, latitud;

create view NivelTresDelitoCompetenciaSexoEdadsemanaHechodiaHechoAlcaldiaColonia as
select Delito, Competencia, Sexo, Edad, semanaHecho, diaHecho, AlcaldiaHechos, ColoniaHechos, count(*) as Cant from
julio2021 group by Delito, Competencia, Sexo, Edad, semanaHecho, diaHecho, AlcaldiaHechos, ColoniaHechos;


create view NivelTresDelitoCategoriaTipoPersonaCalJurAñoMesAlcaldiaColonia as
select Delito, Categoria, TipoPersona, CalidadJuridica, Año_hecho, Mes_hecho, AlcaldiaHechos, ColoniaHechos, count(*) as Cant
from julio2021 group by Delito, Categoria, TipoPersona, CalidadJuridica, Año_hecho, Mes_hecho, AlcaldiaHechos, ColoniaHechos;







create view NivelDosDelitoCalJurSemanaDiaLatitud as
select Delito, CalidadJuridica, semanaHecho, diaHecho, latitud, count(*) as Cant 
from julio2021 group by Delito, CalidadJuridica, semanaHecho, diaHecho, latitud;

create view NivelDosCompetenciaTipoPerHoraLongitud as
select Competencia, TipoPersona, HoraHecho, longitud, count(*) as Cant from julio2021 group by
Competencia, TipoPersona, HoraHecho, longitud;

create view NivelDosCategoriaEdadMesColonia as
select Categoria, Edad, Mes_hecho, ColoniaHechos, count(*) as Cant from julio2021 group by Categoria, Edad, Mes_hecho, ColoniaHechos;

create view NivelDosDelitoSexoAñoAlcaldia as
select Delito, Sexo, Año_hecho, AlcaldiaHechos, count(*) as Cant from julio2021 group by Delito, Sexo, Año_hecho, AlcaldiaHechos;







create view NivelUnoColoniaHechos as
select ColoniaHechos, count(*) as cantColoniaHechos from julio2021 group by ColoniaHechos having ColoniaHechos is not null;

create view NivelUnoAlcaldiaHechos as
select AlcaldiaHechos, count(*) as cantAlcaldiaHechos from julio2021 group by AlcaldiaHechos having AlcaldiaHechos is not null;

create view NivelUnodiaHecho as
select diaHecho, count(*) as cantdiaHecho from julio2021 group by diaHecho having diaHecho is not null;

create view NivelUnosemanaHecho as
select semanaHecho, count(*) as cantsemanaHecho from julio2021 group by semanaHecho having semanaHecho is not null;

create view NivelUnoHoraHecho as
select HoraHecho, count(*) as cantHoraHecho from julio2021 group by HoraHecho having HoraHecho is not null;

create view NivelUnoMes_hecho as
select Mes_hecho, count(*) as cantMes_hecho from julio2021 group by Mes_hecho having Mes_hecho is not null;

create view NivelUnoAño_hecho as
select Año_hecho, count(*) as cantAño_hecho from julio2021 group by Año_hecho having Año_hecho is not null;

create view NivelUnoAño_hecho as
select Año_hecho, count(*) as cantAño_hecho from julio2021 group by Año_hecho having Año_hecho is not null;

create view NivelUnoCalidadJuridica as
select CalidadJuridica, count(*) as cantCalidadJuridica from julio2021 group by CalidadJuridica having CalidadJuridica is not null;

create view NivelUnoTipoPersona as
select TipoPersona, count(*) as cantTipoPersona from julio2021 group by TipoPersona having TipoPersona is not null;

create view NivelUnoEdad as
select Edad, count(*) as cantEdad from julio2021 group by Edad having Edad is not null;

create view NivelUnoSexo as
select Sexo, count(*) as cantSexo from julio2021 group by Sexo having Sexo is not null;

create view NivelUnoCompetencia as
select competencia, count(*) as cantcompetencia from julio2021 group by competencia having competencia is not null;

create view NivelUnoCategoria as
select Categoria, count(*) as cantCategoria from julio2021 group by Categoria having Categoria is not null;

create view NivelUnoDelito as
select Delito, count(*) as cantDelitos from julio2021 group by Delito having Delito is not null;

select * from julio2021;