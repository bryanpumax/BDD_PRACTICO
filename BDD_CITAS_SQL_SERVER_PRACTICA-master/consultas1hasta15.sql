--Parte 4: Resolver las siguientes consultas
--1) CUANTOS AFILIADOS HAY? INDIQUE 2 MANERAS DE VISUALIZAR ESE DATO 
SELECT  count(*) as "AFILIADOS"
  FROM [CITAS_MEDICAS].[dbo].[AFILIADO]

  SELECT  sum(1) as "Total Afiliados"
  FROM [CITAS_MEDICAS].[dbo].[AFILIADO]


--2) SELECCIONE LOS CAMPOS HCL, NOMBRES, CEDULA DE LA TABLA AFILIADO, USE UN ALIAS EN LA TABLA

SELECT a.HCL
      ,a.NOMBRE_APELLIDOS
      ,a.CEDULA
    
  FROM AFILIADO as a


--3) SELECCIONE LOS AFILIADOS QUE TIENEN UN HCL>250000 Y TELEFONO1 O TELEFONO2 = 0

 
SELECT *    
  FROM AFILIADO 
  where  HCL>250000 and (TELF_1='0' or TELF_2='0')

--4) SELECCIONE LOS AFILIADOS DE APELLIDO CHAVEZ O QUE EMPIECEN CON LA LETRA O
SELECT        HCL, NOMBRE_APELLIDOS, CEDULA, TELF_1, TELF_2
FROM            AFILIADO
WHERE        NOMBRE_APELLIDOS like '%CHAVEZ%' or  left(NOMBRE_APELLIDOS,1) = 'O'

--5) SELECCIONE LOS AFILIADOS QUE EMPIEZAN CON CEDULA 17 Y TERMINAN CON 33
/****** Script for SelectTopNRows command from SSMS  ******/
SELECT        HCL, NOMBRE_APELLIDOS, CEDULA, TELF_1, TELF_2
FROM            AFILIADO
WHERE         left(CEDULA,2) = '17' and RIGHT(CEDULA,2) = '33'
--6) SELECCIONE LOS AFILIADOS QUE TENGAN UN NOMBRE LUIS
/****** Script for SelectTopNRows command from SSMS  ******/
SELECT        HCL, NOMBRE_APELLIDOS, CEDULA, TELF_1, TELF_2
FROM            AFILIADO

 where RIGHT(NOMBRE_APELLIDOS,14)like '%LUIS%'

--7) SELECCIONE LOS AFILIADOS CON HCL 3006 Y 30007
SELECT *    
  FROM AFILIADO 
  where  HCL>=3006 and HCL<=30007

--8) SAQUE UN RESPALDO DE LA BDD CITAS_MEDICAS DE FORMA GUI Y
--GUARDELA CON EL NOMBRE BACKUP_BDD_CITAS_MEDICAS_11FEB2022 EN LA CARPETA POR
--DEFAULT, Y OTRO RESPALDO USANDO SQL CON EL NOMBRE
--BACKUP_BDD_CITAS_MEDICAS_11FEB2022_OP2 EN UNA CARPETA TEMPORAL DE LA RAIZ C
USE CITAS_MEDICAS
GO
BACKUP DATABASE CITAS_MEDICAS
TO  DISK = N'C:\BACKUP_BDD_CITAS_MEDICAS_11FEB2022_OP2\BACKUP_BDD_CITAS_MEDICAS_11FEB2022_OP2.bak'
WITH CHECKSUM;


 
--9) CONTAR LAS 10 PRIMERAS CITAS 
 
SELECT top 10 [ID_CITA]
      ,[FECHA]
      ,[HORA_CITA]
      ,[HORA_ATENCION]
      ,[MINUTOS]
      ,[ID_ESPECIALIDAD]
      ,[ID_ESTADO]
      ,[HCL]
      ,[ID_MED_TRAT]
      ,[ID_USUARIO_CREADOR]
  FROM [dbo].[CITA]
--10) SUMAR LOS MINUTOS DE ATENCION QUE DIO EL MEDICO TRATANTE CON ID=2
 
SELECT  sum([MINUTOS]) 
  FROM [dbo].[CITA]
  where [ID_MED_TRAT]=2
 

--11) SACAR EL PROMEDIO DE LOS MINUTOS QUE DIO ATENCION EL MEDICO CON ID=2
 
SELECT  AVG([MINUTOS]) 
  FROM [dbo].[CITA]
  where [ID_MED_TRAT]=2
 
--12) LISTE TODOS LOS ID_ESPECIALIDAD USANDO GROUP BY
 

SELECT NOMBRE_ESPECIALIDAD, ID_ESPECIALIDAD, ID_NIVEL
FROM            dbo.ESPECIALIDAD
ORDER BY NOMBRE_ESPECIALIDAD
--13) CONTAR EL NUMERO TOTAL DE CITAS POR CADA ID_ESPECIALIDAD
SELECT NOMBRE_ESPECIALIDAD,(
 SELECT COUNT(*) from CITA where ESPECIALIDAD.ID_ESPECIALIDAD=CITA.ID_ESPECIALIDAD  GROUP BY ID_ESPECIALIDAD ) as Cantidad
  FROM ESPECIALIDAD
  
--14) SUMAR EL NUMERO TOTAL DE MINUTOS ATENDIDOS POR CADA ID_MED_TRATANTE


 SELECT NOMBRE_MEDICO_TRATANTE,(
 SELECT sum(MINUTOS) from CITA where MEDICO_TRATANTE.ID_MED_TRAT=CITA.ID_MED_TRAT  GROUP BY ID_MED_TRAT ) as TOTAL_MINUTOS
  FROM MEDICO_TRATANTE
  

--15) SELECCIONE EN CADA ID_MED_TRAT LA CITA MAS LARGA

 SELECT top 5 NOMBRE_MEDICO_TRATANTE,(
 SELECT sum(MINUTOS) from CITA where MEDICO_TRATANTE.ID_MED_TRAT=CITA.ID_MED_TRAT  GROUP BY ID_MED_TRAT ) as TOTAL_MINUTOS
  FROM MEDICO_TRATANTE
  order by TOTAL_MINUTOS desc