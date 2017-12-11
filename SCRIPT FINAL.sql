---CREACIÓN DE LA BASE DE DATOS---
CREATE DATABASE HorarioFinal
GO
USE HorarioFinal
GO
--
CREATE TABLE Carreras(
Id INT IDENTITY PRIMARY KEY,
NombreCarrera VARCHAR(50) UNIQUE 
)

-----------------------------------------------------------------
CREATE TABLE Profesores(
ClaveProfesor VARCHAR(20)PRIMARY KEY ,
ApPaterno VARCHAR(20) NOT NULL,
ApMaterno VARCHAR(20) NOT NULL,
Nombre VARCHAR(50) NOT NULL,
HorasPSemana INT NOT NULL,
Contraseña VARCHAR(20) NOT NULL DEFAULT('1234'),
Administrador BIT NOT NULL,
HorasAsignadas INT DEFAULT 0

)
-----------------------------------------------------------------
CREATE TABLE Materias(
Id INT IDENTITY(1,1) PRIMARY KEY,
Clave VARCHAR(8) NOT NULL,
Nombre VARCHAR(60) NOT NULL ,
HorasSemanales INT NOT NULL,
Semestre INT NOT NULL,
IdCarrera INT NOT NULL,
)

ALTER TABLE Materias
ADD CONSTRAINT FK_Materias
FOREIGN KEY (IdCarrera) REFERENCES CARRERAS(Id)
ON UPDATE CASCADE 
----------------------------------------------------------
GO
CREATE TABLE AsignMaterias
(
IdOperacion INT IDENTITY(1,1)PRIMARY KEY,
IdProfesor VARCHAR(20) NOT NULL,
Id		   INT  NOT NULL,
HorasRes   INT NOT NULL,
Cargada  INT DEFAULT 0

)
ALTER TABLE AsignMaterias
ADD CONSTRAINT FK_Asignacion
FOREIGN KEY (IdProfesor) REFERENCES Profesores(ClaveProfesor),
FOREIGN KEY (Id) REFERENCES Materias(Id)
ON UPDATE CASCADE 

CREATE TABLE Aulas(
Id INT IDENTITY PRIMARY KEY ,
NombreAula VARCHAR(6) UNIQUE 

)
GO
-----------------------------------------

CREATE TABLE Horario(
Id INT IDENTITY(1,1) PRIMARY KEY ,
Hora VARCHAR(20) NOT NULL,
Lunes INT NOT NULL,
Martes INT NOT NULL,
Miercoles INT NOT NULL,
Jueves INT NOT NULL,
Viernes INT NOT NULL

)
GO
-----------------------------------------
CREATE TABLE CargasF(
Id INT IDENTITY(1,1) PRIMARY KEY,
IdAula INT NOT NULL,
IdHorario INT NOT NULL,
Disponible VARCHAR(2) DEFAULT 'SI',
AsignacionOperacion INT DEFAULT 0
)

ALTER TABLE CargasF
ADD CONSTRAINT FK_Carga
FOREIGN KEY (IdAula) REFERENCES Aulas(Id),
FOREIGN KEY (IdHorario) REFERENCES Horario(Id)
ON UPDATE CASCADE 

GO
--------------------------
CREATE TABLE LugarDescarga(
Id INT IDENTITY(1,1) PRIMARY KEY,
Nombre VARCHAR(30)
)
GO
CREATE TABLE Descargas(
Id INT IDENTITY(1,1) PRIMARY KEY,
operacion INT FOREIGN KEY REFERENCES AsignMaterias(IdOperacion),
IdLugar INT FOREIGN KEY REFERENCES LugarDescarga(Id),
IdHora INT FOREIGN KEY REFERENCES Horario(Id)
)
GO

INSERT INTO Horario VALUES('07:00-07:50',1,0,0,0,0)
INSERT INTO Horario VALUES('07:50-08:40',1,0,0,0,0)
INSERT INTO Horario VALUES('08:40-09:30',1,0,0,0,0)
INSERT INTO Horario VALUES('09:30-10:20',1,0,0,0,0)
INSERT INTO Horario VALUES('10:20-11:10',1,0,0,0,0)
INSERT INTO Horario VALUES('11:10-12:00',1,0,0,0,0)
INSERT INTO Horario VALUES('12:00-12:50',1,0,0,0,0)
INSERT INTO Horario VALUES('12:50-13:40',1,0,0,0,0)
INSERT INTO Horario VALUES('13:40-14:30',1,0,0,0,0)
INSERT INTO Horario VALUES('14:30-15:20',1,0,0,0,0)
INSERT INTO Horario VALUES('15:20-16:10',1,0,0,0,0)
INSERT INTO Horario VALUES('16:10-17:00',1,0,0,0,0)
INSERT INTO Horario VALUES('17:00-17:50',1,0,0,0,0)
INSERT INTO Horario VALUES('17:50-18:40',1,0,0,0,0)
INSERT INTO Horario VALUES('18:40-19:30',1,0,0,0,0)
INSERT INTO Horario VALUES('19:30-20:20',1,0,0,0,0)
INSERT INTO Horario VALUES('20:20-21:10',1,0,0,0,0)
INSERT INTO Horario VALUES('21:10-22:00',1,0,0,0,0)
INSERT INTO Horario VALUES('22:00-22:50',1,0,0,0,0)

GO

INSERT INTO Horario VALUES('07:00-07:50',0,1,0,0,0)
INSERT INTO Horario VALUES('07:50-08:40',0,1,0,0,0)
INSERT INTO Horario VALUES('08:40-09:30',0,1,0,0,0)
INSERT INTO Horario VALUES('09:30-10:20',0,1,0,0,0)
INSERT INTO Horario VALUES('10:20-11:10',0,1,0,0,0)
INSERT INTO Horario VALUES('11:10-12:00',0,1,0,0,0)
INSERT INTO Horario VALUES('12:00-12:50',0,1,0,0,0)
INSERT INTO Horario VALUES('12:50-13:40',0,1,0,0,0)
INSERT INTO Horario VALUES('13:40-14:30',0,1,0,0,0)
INSERT INTO Horario VALUES('14:30-15:20',0,1,0,0,0)
INSERT INTO Horario VALUES('15:20-16:10',0,1,0,0,0)
INSERT INTO Horario VALUES('16:10-17:00',0,1,0,0,0)
INSERT INTO Horario VALUES('17:00-17:50',0,1,0,0,0)
INSERT INTO Horario VALUES('17:50-18:40',0,1,0,0,0)
INSERT INTO Horario VALUES('18:40-19:30',0,1,0,0,0)
INSERT INTO Horario VALUES('19:30-20:20',0,1,0,0,0)
INSERT INTO Horario VALUES('20:20-21:10',0,1,0,0,0)
INSERT INTO Horario VALUES('21:10-22:00',0,1,0,0,0)
INSERT INTO Horario VALUES('22:00-22:50',0,1,0,0,0)

GO
INSERT INTO Horario VALUES('07:00-07:50',0,0,1,0,0)
INSERT INTO Horario VALUES('07:50-08:40',0,0,1,0,0)
INSERT INTO Horario VALUES('08:40-09:30',0,0,1,0,0)
INSERT INTO Horario VALUES('09:30-10:20',0,0,1,0,0)
INSERT INTO Horario VALUES('10:20-11:10',0,0,1,0,0)
INSERT INTO Horario VALUES('11:10-12:00',0,0,1,0,0)
INSERT INTO Horario VALUES('12:00-12:50',0,0,1,0,0)
INSERT INTO Horario VALUES('12:50-13:40',0,0,1,0,0)
INSERT INTO Horario VALUES('13:40-14:30',0,0,1,0,0)
INSERT INTO Horario VALUES('14:30-15:20',0,0,1,0,0)
INSERT INTO Horario VALUES('15:20-16:10',0,0,1,0,0)
INSERT INTO Horario VALUES('16:10-17:00',0,0,1,0,0)
INSERT INTO Horario VALUES('17:00-17:50',0,0,1,0,0)
INSERT INTO Horario VALUES('17:50-18:40',0,0,1,0,0)
INSERT INTO Horario VALUES('18:40-19:30',0,0,1,0,0)
INSERT INTO Horario VALUES('19:30-20:20',0,0,1,0,0)
INSERT INTO Horario VALUES('20:20-21:10',0,0,1,0,0)
INSERT INTO Horario VALUES('21:10-22:00',0,0,1,0,0)
INSERT INTO Horario VALUES('22:00-22:50',0,0,1,0,0)

GO

INSERT INTO Horario VALUES('07:00-07:50',0,0,0,1,0)
INSERT INTO Horario VALUES('07:50-08:40',0,0,0,1,0)
INSERT INTO Horario VALUES('08:40-09:30',0,0,0,1,0)
INSERT INTO Horario VALUES('09:30-10:20',0,0,0,1,0)
INSERT INTO Horario VALUES('10:20-11:10',0,0,0,1,0)
INSERT INTO Horario VALUES('11:10-12:00',0,0,0,1,0)
INSERT INTO Horario VALUES('12:00-12:50',0,0,0,1,0)
INSERT INTO Horario VALUES('12:50-13:40',0,0,0,1,0)
INSERT INTO Horario VALUES('13:40-14:30',0,0,0,1,0)
INSERT INTO Horario VALUES('14:30-15:20',0,0,0,1,0)
INSERT INTO Horario VALUES('15:20-16:10',0,0,0,1,0)
INSERT INTO Horario VALUES('16:10-17:00',0,0,0,1,0)
INSERT INTO Horario VALUES('17:00-17:50',0,0,0,1,0)
INSERT INTO Horario VALUES('17:50-18:40',0,0,0,1,0)
INSERT INTO Horario VALUES('18:40-19:30',0,0,0,1,0)
INSERT INTO Horario VALUES('19:30-20:20',0,0,0,1,0)
INSERT INTO Horario VALUES('20:20-21:10',0,0,0,1,0)
INSERT INTO Horario VALUES('21:10-22:00',0,0,0,1,0)
INSERT INTO Horario VALUES('22:00-22:50',0,0,0,1,0)

GO

INSERT INTO Horario VALUES('07:00-07:50',0,0,0,0,1)
INSERT INTO Horario VALUES('07:50-08:40',0,0,0,0,1)
INSERT INTO Horario VALUES('08:40-09:30',0,0,0,0,1)
INSERT INTO Horario VALUES('09:30-10:20',0,0,0,0,1)
INSERT INTO Horario VALUES('10:20-11:10',0,0,0,0,1)
INSERT INTO Horario VALUES('11:10-12:00',0,0,0,0,1)
INSERT INTO Horario VALUES('12:00-12:50',0,0,0,0,1)
INSERT INTO Horario VALUES('12:50-13:40',0,0,0,0,1)
INSERT INTO Horario VALUES('13:40-14:30',0,0,0,0,1)
INSERT INTO Horario VALUES('14:30-15:20',0,0,0,0,1)
INSERT INTO Horario VALUES('15:20-16:10',0,0,0,0,1)
INSERT INTO Horario VALUES('16:10-17:00',0,0,0,0,1)
INSERT INTO Horario VALUES('17:00-17:50',0,0,0,0,1)
INSERT INTO Horario VALUES('17:50-18:40',0,0,0,0,1)
INSERT INTO Horario VALUES('18:40-19:30',0,0,0,0,1)
INSERT INTO Horario VALUES('19:30-20:20',0,0,0,0,1)
INSERT INTO Horario VALUES('20:20-21:10',0,0,0,0,1)
INSERT INTO Horario VALUES('21:10-22:00',0,0,0,0,1)
INSERT INTO Horario VALUES('22:00-22:50',0,0,0,0,1)

GO


INSERT INTO Aulas VALUES('A1')
INSERT INTO Aulas VALUES('A2')
INSERT INTO Aulas VALUES('A3')
INSERT INTO Aulas VALUES('A4')
INSERT INTO Aulas VALUES('A5')
INSERT INTO Aulas VALUES('A6')
INSERT INTO Aulas VALUES('A7')
INSERT INTO Aulas VALUES('A8')
INSERT INTO Aulas VALUES('A9')
INSERT INTO Aulas VALUES('A10')
INSERT INTO Aulas VALUES('Lab FQ')
INSERT INTO Aulas VALUES('B1')
INSERT INTO Aulas VALUES('B2')
INSERT INTO Aulas VALUES('B3')
INSERT INTO Aulas VALUES('B4')
INSERT INTO Aulas VALUES('B5')
INSERT INTO Aulas VALUES('B6')
INSERT INTO Aulas VALUES('B7')
INSERT INTO Aulas VALUES('B8')
INSERT INTO Aulas VALUES('Cim')
INSERT INTO Aulas VALUES('L3')
INSERT INTO Aulas VALUES('C1')
INSERT INTO Aulas VALUES('C2')


GO

INSERT INTO Carreras VALUES('Ingeniería en Gestión Empresarial')
INSERT INTO Carreras VALUES('Ingeniería en Logística')
INSERT Carreras VALUES('Ingeniería en Sistemas Computacionales')
INSERT INTO Carreras VALUES('Ingeniería Industrial')

GO
----MATERIAS DE GESTIÓN ----------
--------- PRIMER SEMESTRE 
INSERT INTO Materias VALUES('ACC-0906','Fundamentos de Investigación',4,1,1)
INSERT INTO Materias VALUES('ACF-0901','Cálculo Diferencia',5,1,1)
INSERT INTO Materias VALUES('GEC-0906','Desarrollo Humano',4,1,1)
INSERT INTO Materias VALUES('AEF-1074','Fundamentos de Gestión Empresarial',5,1,1)
INSERT INTO Materias VALUES('GEC-0909','Fundamentos de Física',4,1,1)
INSERT INTO Materias VALUES('GEF-0910','Fundamentos de Química ',5,1,1)
INSERT INTO Materias VALUES('TUT-0902','Tutoria 1 ',1,1,1)
GO
---------SEGUNDO SEMESTRE----------
INSERT INTO Materias VALUES('AEB-1082','Software de Aplicación Ejecutivo',5,2,1)
INSERT INTO Materias VALUES('ACF-0902','Cálculo Integral',5,2,1)
INSERT INTO Materias VALUES('GED-0903','Contabilidad Orientada a los Negocios',5,2,1)
INSERT INTO Materias VALUES('AEC-1014','Dinámica Social',4,2,1)
INSERT INTO Materias VALUES('ACA-0907','Taller de Ética ',4,2,1)
INSERT INTO Materias VALUES('GEE-0918','Legislación Laboral ',4,2,1)
INSERT INTO Materias VALUES('TUT-0902','Tutoria 2',1,2,1)
GO
---------TERCER SEMESTRE-----------
INSERT INTO Materias VALUES('AEC-1078','Marco Legal de las Organizaciones',4,3,1)
INSERT INTO Materias VALUES('GED-0921','Probabilidad y Estadística Descriptiva',5,3,1)
INSERT INTO Materias VALUES('GED-0904','Costos Empresariales',5,3,1)
INSERT INTO Materias VALUES('GEC-0913','Habilidades Directivas I',4,3,1)
INSERT INTO Materias VALUES('AEF-1071','Economía Empresarial',5,3,1)
INSERT INTO Materias VALUES('ACF-0903','Álgebra Lineal ',5,3,1)
INSERT INTO Materias VALUES('TUT-0902','Tutoria 3',1,3,1)
GO
--------CUARTO SEMESTRE------------
INSERT INTO Materias VALUES('GEF-0916','Ingeniería Económica',5,4,1)
INSERT INTO Materias VALUES('GEG-0907','Estadística Inferencial I',6,4,1)
INSERT INTO Materias VALUES('GED-0917','Instrumentos de Presupuestación Empresaria',5,4,1)
INSERT INTO Materias VALUES('GEC-0914','Habilidades Directivas II',4,4,1)
INSERT INTO Materias VALUES('GEF-0906','Entorno Macroeconómico',5,4,1)
INSERT INTO Materias VALUES('AEF-1076','Investigación de Operaciones',5,4,1)
INSERT INTO Materias VALUES('TUT-0902','Tutoria 4',1,4,1)
GO
-------QUINTO SEMESTRE-------------
INSERT INTO Materias VALUES('AEF-1073','Finanzas en las Organizaciones',5,5,1)
INSERT INTO Materias VALUES('GEG-0908','Estadística Inferencial II',6,5,1)
INSERT INTO Materias VALUES('GEF-0915','Ingeniería de Procesos',5,5,1)
INSERT INTO Materias VALUES('AEG-1075','Gestión del Capital Humano',6,5,1)
INSERT INTO Materias VALUES('ACA-0909','Taller de Investigación I',4,5,1)
INSERT INTO Materias VALUES('GEF-0919','Mercadotecnia',5,5,1)
INSERT INTO Materias VALUES('TUT-0902','Tutoria 5',1,5,1)

GO
-------SEXTO SEMESTRE------------
INSERT INTO Materias VALUES('GEF-0901','Admon de la Salud y Seguridad Ocupacional',5,6,1)
INSERT INTO Materias VALUES('AED-1072','El Emprendedor y la Innovación ',5,6,1)
INSERT INTO Materias VALUES('GEC-0911','Gestión de la Producción I',4,6,1)
INSERT INTO Materias VALUES('AED-1015','Diseño Organizacional',5,6,1)
INSERT INTO Materias VALUES('ACA-0910','Taller de Investigación II',4,6,1)
INSERT INTO Materias VALUES('GED-0922','Sistemas de Información de la Mercadotecnia',5,6,1)
INSERT INTO Materias VALUES('DNH-1101','Taller de Relaciones Públicas',4,6,1)
INSERT INTO Materias VALUES('TUT-0902','Tutoria 6',1,6,1)
GO
------SEPTIMO SEMESTRE----------
INSERT INTO Materias VALUES('AED-1069','Calidad Aplicada a la Gestión Empresarial ',5,7,1)
INSERT INTO Materias VALUES('GED-0920','Plan de Negocios',5,7,1)
INSERT INTO Materias VALUES('GEC-0912','Gestión de la Producción II',4,7,1)
INSERT INTO Materias VALUES('AED-1035','Gestión Estratégica',5,7,1)
INSERT INTO Materias VALUES('ACD-0908','Desarrollo Sustentable',5,7,1)
INSERT INTO Materias VALUES('AEB-1045','Mercadotecnia Electrónica',5,7,1)
INSERT INTO Materias VALUES('DNM-1102','La Tecnología y su entorno',6,7,1)
GO
-------OCTAVO SEMESTRE---------
INSERT INTO Materias VALUES('DNM-1103','Desarrollo de Nuevos Productos',6,8,1)
INSERT INTO Materias VALUES('GEF-0902','Cadena de Suministros',5,8,1)
INSERT INTO Materias VALUES('DNM-1104','Decisiones Mercadológicas',6,8,1)
INSERT INTO Materias VALUES('DNQ-1105','Taller de Destrezas Directivas',3,8,1)
INSERT INTO Materias VALUES('DND-1106','Trámites Legales y Gestión del Financiamiento',5,8,1)
INSERT INTO Materias VALUES('ASS-0903','Asesoria ',1,0,1)
INSERT INTO Materias VALUES('INV-0904','Investigacion ',1,0,1)
INSERT INTO Materias VALUES('GDC-0905','Gestion del curso ',1,0,1)
INSERT INTO Materias VALUES('ACD-0906','Acreditacion',1,0,1)
INSERT INTO Materias VALUES('HDF-0907','Horas de oficina',1,0,1)
INSERT INTO Materias VALUES('TUD-0908','Tutoria de descarga ',1,0,1)
-----MATERIAS DE LOGISTICA ----------
--------- PRIMER SEMESTRE ---------
INSERT INTO Materias VALUES('LOC-0919','Introducción a la ingeniería en logística',4,1,2)
INSERT INTO Materias VALUES('ACF-0901','Calculo Diferencial',5,1,2)
INSERT INTO Materias VALUES('ACA-0907','Taller de Ética ',4,1,2)
INSERT INTO Materias VALUES('LOC-0913','Fundamentos de Administración',4,1,2)
INSERT INTO Materias VALUES('ACC-0906','Fundamentos de Investigación',4,1,2)
INSERT INTO Materias VALUES('AEC-1018','Economía',4,1,2)
INSERT INTO Materias VALUES('TUT-0902','Tutoria 1',1,1,2)
GO
--------- SEGUNDO SEMESTRE ---------
INSERT INTO Materias VALUES('LOC-0903','Cadena de Suministro',4,2,2)
INSERT INTO Materias VALUES('ACF-0902','Calculo Integral',5,2,2)
INSERT INTO Materias VALUES('LOH-0909','Dibujo Asistido por Computadora',4,2,2)
INSERT INTO Materias VALUES('LOC-0914','Fundamentos de Derecho',4,2,2)
INSERT INTO Materias VALUES('LOC-0927','Química',4,2,2)
INSERT INTO Materias VALUES('AEF-1042','Mecánica Clásica',5,2,2)
INSERT INTO Materias VALUES('TUT-0902','Tutoria 2',1,2,2)
GO
--------- TERCER SEMESTRE ---------
INSERT INTO Materias VALUES('LOC-0905','Compras',4,3,2)
INSERT INTO Materias VALUES('ACF-0903','Algebra Lineal',5,3,2)
INSERT INTO Materias VALUES('AEC-1053','Probabilidad y Estadística',4,3,2)
INSERT INTO Materias VALUES('LOC-0911','Entorno Económico',4,3,2)
INSERT INTO Materias VALUES('AED-1044','Mercadotecnica',5,3,2)
INSERT INTO Materias VALUES('LOF-0930','Tópicos de Ingeniería Mecánica',5,3,2)
INSERT INTO Materias VALUES('TUT-0902','Tutoria 3',1,3,2)
GO
--------- CUARTO SEMESTRE ---------
INSERT INTO Materias VALUES('LOE-0920','Inventarios',4,4,2)
INSERT INTO Materias VALUES('LOC-0928','Servicio al Cliente',4,4,2)
INSERT INTO Materias VALUES('AEF-1024','Estadística Inferencial I',5,4,2)
INSERT INTO Materias VALUES('LOD-0923','Legislación Aduanera',5,4,2)
INSERT INTO Materias VALUES('LOC-0929','Tipología del Producto',4,4,2)
INSERT INTO Materias VALUES('LOH-0902','Bases de Datos',4,4,2)
INSERT INTO Materias VALUES('TUT-0902','Tutoria 4',1,4,2)
GO
--------- QUINTO SEMESTRE ---------
INSERT INTO Materias VALUES('LOF-0901','Almacenes',5,5,2)
INSERT INTO Materias VALUES('LOE-0921','Investigación de Operaciones I',4,5,2)
INSERT INTO Materias VALUES('AEF-1025','Estadística Inferencial II',5,5,2)
INSERT INTO Materias VALUES('LOC-0908','Desarrollo Humano y Organizacional',4,5,2)
INSERT INTO Materias VALUES('LOC-0910','Empaque, Envase y Embalaje',4,5,2)
INSERT INTO Materias VALUES('LOD-0906','Contabilidad y Costos',5,5,2)
INSERT INTO Materias VALUES('DOF-1101','Administración Estratégica',5,5,2)
INSERT INTO Materias VALUES('TUT-0902','Tutoria 5',1,5,2)

--------- SEXTO SEMESTRE ---------
INSERT INTO Materias VALUES('LOF-0931','Trafico y Transporte',5,6,2)
INSERT INTO Materias VALUES('LOE-0922','Investigación de Operaciones II',4,6,2)
INSERT INTO Materias VALUES('LOJ-0917','Higiene y Seguridad',6,6,2)
INSERT INTO Materias VALUES('AEC-1037','Ingeniería Económica',4,6,2)
INSERT INTO Materias VALUES('ACA-0909','Taller de Investigación I',4,6,2)
INSERT INTO Materias VALUES('LOF-0912','Finanzas',5,6,2)
INSERT INTO Materias VALUES('DOF-1102','Planeación y Diseño de Instalaciones',5,6,2)
INSERT INTO Materias VALUES('TUT-0902','Tutoria 6',1,6,2)
GO
--------- SEPTIMO SEMESTRE ---------
INSERT INTO Materias VALUES('LOC-0925','Procesos de Fabricación y Manejo de Materiales',4,7,2)
INSERT INTO Materias VALUES('LOC-0924','Modelos de Simulación y Logística',4,7,2)
INSERT INTO Materias VALUES('LOD-0915','Geografía para el Transporte',5,7,2)
INSERT INTO Materias VALUES('LOE-0904','Comercio Internacional',4,7,2)
INSERT INTO Materias VALUES('ACA-0910','Taller de Investigación II',4,7,2)
INSERT INTO Materias VALUES('LOC-0926','Programación de Procesos Productivos',4,7,2)
INSERT INTO Materias VALUES('DOF-1103','Ingeniería de costos',5,7,2)
GO
--------- OCTAVO SEMESTRE ---------
INSERT INTO Materias VALUES('LOF-0918','Innovación',5,8,2)
INSERT INTO Materias VALUES('LOC-0907','Cultura de Calidad',4,8,2)
INSERT INTO Materias VALUES('AED-1030','Formulación y Evaluación de Proyectos',5,8,2)
INSERT INTO Materias VALUES('ACD-0908','Desarrollo Sustentable',5,8,2)
INSERT INTO Materias VALUES('LOC-0916','Gestión de Proyectos',4,8,2)
INSERT INTO Materias VALUES('DOF-1104','Tecnologías en la Logística',5,8,2)
INSERT INTO Materias VALUES('DOF-1105','Administración de Centros de Distribución, CEDIS',5,8,2)
INSERT INTO Materias VALUES('ASS-0903','Asesoria ',1,0,2)
INSERT INTO Materias VALUES('INV-0904','Investigacion ',1,0,2)
INSERT INTO Materias VALUES('GDC-0905','Gestion del curso ',1,0,2)
INSERT INTO Materias VALUES('ACD-0906','Acreditacion',1,0,2)
INSERT INTO Materias VALUES('HDF-0907','Horas de oficina',1,0,2)
INSERT INTO Materias VALUES('TUD-0908','Tutoria de descarga ',1,0,2)
-----MATERIAS DE SISTEMAS ----------
--------- PRIMER SEMESTRE ---------
INSERT INTO Materias VALUES('ACF-0901','Cálculo Diferencia',5,1,3)
INSERT INTO Materias VALUES('SCD-1008','Fundamentos de Programación',5,1,3)
INSERT INTO Materias VALUES('ACA-0907','Taller de Ética',4,1,3)
INSERT INTO Materias VALUES('AEF-1041','Matemáticas Discretas',5,1,3)
INSERT INTO Materias VALUES('SCH-1024','Taller de Administración',4,1,3)
INSERT INTO Materias VALUES('ACC-0906','Fundamentos de Investigación',4,1,3)
INSERT INTO Materias VALUES('TUT-0902','Tutoria 1',1,1,3)
GO
--------- SEGUNDO SEMESTRE ---------
INSERT INTO Materias VALUES('ACF-0902','Cálculo Integral',5,2,3)
INSERT INTO Materias VALUES('SCD-1020','Programación Orientada a Objetos',5,2,3)
INSERT INTO Materias VALUES('AEC-1008','Contabilidad Financiera',4,2,3)
INSERT INTO Materias VALUES('AEC-1058','Química',4,2,3)
INSERT INTO Materias VALUES('SCF-1006','Física General',5,2,3)
INSERT INTO Materias VALUES('AEF-1052','Probabilidad y Estadística',5,2,3)
INSERT INTO Materias VALUES('TUT-0902','Tutoria 2',1,2,3)
GO
--------- TERCER SEMESTRE ---------
INSERT INTO Materias VALUES('ACF-0904','Cálculo Vectorial',5,3,3)
INSERT INTO Materias VALUES('AED-1026','Estructura de Datos',5,3,3)
INSERT INTO Materias VALUES('SCC-1005','Cultura Empresarial',4,3,3)
INSERT INTO Materias VALUES('SCC-1013','Investigación de Operaciones',4,3,3)
INSERT INTO Materias VALUES('AEC-1061','Sistemas Operativos',4,3,3)
INSERT INTO Materias VALUES('ACF-0903','Álgebra Lineal',5,3,3)
INSERT INTO Materias VALUES('TUT-0902','Tutoria 3',1,3,3)
GO
--------- CUARTO SEMESTRE ---------
INSERT INTO Materias VALUES('ACF-0905','Ecuaciones Diferenciales',5,4,3)
INSERT INTO Materias VALUES('SCD-1027','Tópicos Avanzados de Programación',5,4,3)
INSERT INTO Materias VALUES('SCC-1017','Métodos Numéricos',4,4,3)
INSERT INTO Materias VALUES('AEF-1031','Fundamentos de Bases de Datos',4,4,3)
INSERT INTO Materias VALUES('SCA-1026','Taller de Sistemas Operativo',4,4,3)
INSERT INTO Materias VALUES('SCD-1018','Principios Eléctricos y Aplic. Digitales',5,4,3)
INSERT INTO Materias VALUES('TUT-0902','Tutoria 4',1,4,3)
GO

--------- QUINTO SEMESTRE ---------
INSERT INTO Materias VALUES('ACD-0908','Desarrollo Sustentable',5,5,3)
INSERT INTO Materias VALUES('AEC-1034','Fundamentos de Telecomunicaciones',4,5,3)
INSERT INTO Materias VALUES('SCD-1022','Simulación',5,5,3)
INSERT INTO Materias VALUES('SCA-1025','Taller de Bases de Datos',4,5,3)
INSERT INTO Materias VALUES('SCC-1007','Fundamentos de Ingeniería de Software',4,5,3)
INSERT INTO Materias VALUES('SCD-1003','Arquitectura de Computadoras',5,5,3)
INSERT INTO Materias VALUES('TUT-0902','Tutoria 5',1,5,3)
GO
--------- SEXTO SEMESTRE ---------
INSERT INTO Materias VALUES('SCD-1015','Lenguajes Autómatas I',5,6,3)
INSERT INTO Materias VALUES('SCD-1021','Redes de Computadora',5,6,3)
INSERT INTO Materias VALUES('SCB-1001','Administración de Bases de Datos',5,6,3)
INSERT INTO Materias VALUES('SCC-1010','Graficación',4,6,3)
INSERT INTO Materias VALUES('SCD-1011','Ingeniería de Software',5,6,3)
INSERT INTO Materias VALUES('SCC-1014','Lenguajes de Interfaz',4,6,3)
INSERT INTO Materias VALUES('BDM-1201','PROGRAMACION DE BASE DE DATOS',6,6,3)
INSERT INTO Materias VALUES('TUT-0902','Tutoria 6',1,6,3)
GO
--------- SEPTIMO SEMESTRE ---------
INSERT INTO Materias VALUES('SCD-1016','Lenguajes Autómatas II',5,7,3)
INSERT INTO Materias VALUES('SCD-1004','Conmutación y Enrutamiento de Redes de Datos',5,7,3)
INSERT INTO Materias VALUES('ACA-0909','Taller de Investigación I',4,7,3)
INSERT INTO Materias VALUES('BDM-1202','Administración de Servidores',7,7,3)
INSERT INTO Materias VALUES('SCG-1009','Gestión de Proyectos de Software',6,7,3)
INSERT INTO Materias VALUES('SCD-1023','Sistemas Programables',5,7,3)
INSERT INTO Materias VALUES('BDM-1203','Sistemas Gestores de Base de Datos',6,7,3)
GO
--------- OCTAVO SEMESTRE ---------
INSERT INTO Materias VALUES('SCC-1019','Programación Lógica Funcional',4,8,3)
INSERT INTO Materias VALUES('SCA-1002','Administración de Redes',4,8,3)
INSERT INTO Materias VALUES('ACA-0910','Taller de Investigación II',4,8,3)
INSERT INTO Materias VALUES('BDM-1204','Base de Datos para Dispositivos Móviles',6,8,3)
INSERT INTO Materias VALUES('AEB-1055','Programación Web',5,8,3)
INSERT INTO Materias VALUES('SCC-1012','Inteligencia',4,8,3)
INSERT INTO Materias VALUES('ASS-0903','Asesoria ',1,0,3)
INSERT INTO Materias VALUES('INV-0904','Investigacion ',1,0,3)
INSERT INTO Materias VALUES('GDC-0905','Gestion del curso ',1,0,3)
INSERT INTO Materias VALUES('ACD-0906','Acreditacion',1,0,3)
INSERT INTO Materias VALUES('HDF-0907','Horas de oficina',1,0,3)
INSERT INTO Materias VALUES('TUD-0908','Tutoria de descarga ',1,0,3)
GO
-------Industrial----------
------semestre 1----------
INSERT INTO Materias VALUES('ACC-0906','Fundamentos de Investigación',4,1,4)
INSERT INTO Materias VALUES('ACA-0907','Taller de Etica',4,1,4)
INSERT INTO Materias VALUES('ACF-0901','Calculo Diferencial',4,1,4)
INSERT INTO Materias VALUES('INH-1029','Taller de Herramietas Intelectuales',4,1,4)
INSERT INTO Materias VALUES('INC-1025','Quimica',4,1,4)
INSERT INTO Materias VALUES('INN-1008','Dibujo Industrial',6,1,4)
INSERT INTO Materias VALUES('INN-1008','Dibujo Industrial',6,1,4)
INSERT INTO Materias VALUES('TUT-0902','Tutoria 1',1,1,4)
GO
------semestre 2----------
INSERT INTO Materias VALUES('INC-1009','Electricidad y Electromica Industrial',4,2,4)
INSERT INTO Materias VALUES('INC-1024','Propiedades de la materia',4,2,4)
INSERT INTO Materias VALUES('ACf-0902','Calculo Integral',5,2,4)
INSERT INTO Materias VALUES('INR-1017','Ingenieria de Sistemas',3,2,4)
INSERT INTO Materias VALUES('AEC-1053','Probabilidad y estadistica',4,2,4)
INSERT INTO Materias VALUES('INQ-1006','Analicis de la Realidad Nacional',3,2,4)
INSERT INTO Materias VALUES('INC-1030','Taller de Liderazgo',4,2,4)
INSERT INTO Materias VALUES('TUT-0902','Tutoria 2',1,2,4)
GO
------semestre 3----------
INSERT INTO Materias VALUES('AEC-1048','Metodologia y normalizacion',4,3,4)
INSERT INTO Materias VALUES('ACF-0903','Algebra Lineal',5,3,4)
INSERT INTO Materias VALUES('ACF-0904','Calculo Vectorial',5,3,4)
INSERT INTO Materias VALUES('AEC-1018','Economia',4,3,4)
INSERT INTO Materias VALUES('AEF-1024','Estadistica Inferencial I',5,3,4)
INSERT INTO Materias VALUES('INJ-1011','Estudio del Trabajo I',6,3,4)
INSERT INTO Materias VALUES('TUT-0902','Tutoria 3',1,3,4)
GO
------semestre 4----------
INSERT INTO Materias VALUES('INC-1023','Procesos de Fabricacion',4,4,4)
INSERT INTO Materias VALUES('INC-1018','Investigacion de Operaciones I',4,4,4)
INSERT INTO Materias VALUES('INC-1005','Algoritmos y Lenguages de Programacion',4,4,4)
INSERT INTO Materias VALUES('INC-1013','Fisica',4,4,4)
INSERT INTO Materias VALUES('AEF-1025','Estadistica Inferencial II',5,4,4)
INSERT INTO Materias VALUES('INJ-1012','Estudio del Trabajo II',6,4,4)
INSERT INTO Materias VALUES('INF-1016','Higiene y Segurid Industrial',5,4,4)
INSERT INTO Materias VALUES('TUT-0902','Tutoria 4',1,4,4)

GO
------semestre 5----------
INSERT INTO Materias VALUES('INR-1003','Administracion de Proyectos',3,5,4)
INSERT INTO Materias VALUES('INC-1019','Investigacion de Operaciones II',4,5,4)
INSERT INTO Materias VALUES('INC-1001','Administracion de OperacionesI',4,5,4)
INSERT INTO Materias VALUES('INC-1014','Gestion de Costos',4,5,4)
INSERT INTO Materias VALUES('INF-1007','Control Estadistico de la Calidad',5,5,4)
INSERT INTO Materias VALUES('INF-1010','Ergonomia',5,5,4)
INSERT INTO Materias VALUES('ACD-0908','Desarrollo Sustentable',5,5,4)
INSERT INTO Materias VALUES('TUT-0902','Tutoria 5',1,5,4)
GO
------semestre 6----------
INSERT INTO Materias VALUES('AEC-1037','Ingenieria Economica',4,6,4)
INSERT INTO Materias VALUES('ACA-0909','Taller de Investigacio I',4,6,4)
INSERT INTO Materias VALUES('AEC-1037','Ingenieria Economica',4,6,4)
INSERT INTO Materias VALUES('INC-1002','Administracion de Operaciones II',4,6,4)
INSERT INTO Materias VALUES('INC-1027','Simulacion',4,6,4)
INSERT INTO Materias VALUES('INC-1004','Administracion del mantenimiento',4,6,4)
INSERT INTO Materias VALUES('AEd-1022','Mercadotecnia',5,6,4)
INSERT INTO Materias VALUES('CPF-1201','Ingenieria de Calidad',5,6,4)
INSERT INTO Materias VALUES('TUT-0902','Tutoria 6',1,6,4)
GO

------semestre 7----------
INSERT INTO Materias VALUES('ACA-0910','Taller de InvestigacioII',4,7,4)
INSERT INTO Materias VALUES('INC-1021','Planeacion Financiera',4,7,4)
INSERT INTO Materias VALUES('INC-1022','Planeacion y diseño de Instalacion',4,7,4)
INSERT INTO Materias VALUES('INf-1028','Sistema Manofactura',4,7,4)
INSERT INTO Materias VALUES('INH-1020','Logistica y Cadena de Suministro',4,7,4)
INSERT INTO Materias VALUES('INC-1015','Gestion de los sistemas de calidad',4,7,4)
GO
------semestre 8----------
INSERT INTO Materias VALUES('AED-1030','Formulacion y Evaluacion de Proyectos',5,8,4)
INSERT INTO Materias VALUES('INC-1026','Relaciones Industriales',4,8,4)
INSERT INTO Materias VALUES('CPF-1205','Medicion y Mejoramiento de la Productividad',5,8,4)
INSERT INTO Materias VALUES('CPM-1206','Productividad Aplicada',6,8,4)
INSERT INTO Materias VALUES('AED-1204','Temas Selectos de Ingenieria Industrial ',6,8,4)
INSERT INTO Materias VALUES('AED-1202','Productividad Humana',4,8,4)
INSERT INTO Materias VALUES('AED-1203','Gestion de los sistemas de Calidad Aplicada',5,8,4)
INSERT INTO Materias VALUES('ASS-0903','Asesoria ',1,0,4)
INSERT INTO Materias VALUES('INV-0904','Investigacion ',1,0,4)
INSERT INTO Materias VALUES('GDC-0905','Gestion del curso ',1,0,4)
INSERT INTO Materias VALUES('ACD-0906','Acreditacion',1,0,4)
INSERT INTO Materias VALUES('HDF-0907','Horas de oficina',1,0,4)
INSERT INTO Materias VALUES('TUD-0908','Tutoria de descarga ',1,0,4)
GO



INSERT INTO CargasF([IdAula],[IdHorario]) VALUES(1,1),(1,2),(1,3),(1,4),(1,5),(1,6),(1,7),(1,8),(1,9),(1,10);
INSERT INTO CargasF([IdAula],[IdHorario]) VALUES(1,11),(1,12),(1,13),(1,14),(1,15),(1,16),(1,17),(1,18),(1,19),(1,20);
INSERT INTO CargasF([IdAula],[IdHorario]) VALUES(1,21),(1,22),(1,23),(1,24),(1,25),(1,26),(1,27),(1,28),(1,29),(1,30);
INSERT INTO CargasF([IdAula],[IdHorario]) VALUES(1,31),(1,32),(1,33),(1,34),(1,35),(1,36),(1,37),(1,38),(1,39),(1,40);
INSERT INTO CargasF([IdAula],[IdHorario]) VALUES(1,41),(1,42),(1,43),(1,44),(1,45),(1,46),(1,47),(1,48),(1,49),(1,50);
INSERT INTO CargasF([IdAula],[IdHorario]) VALUES(1,51),(1,52),(1,53),(1,54),(1,55),(1,56),(1,57),(1,58),(1,59),(1,60);
INSERT INTO CargasF([IdAula],[IdHorario]) VALUES(1,61),(1,62),(1,63),(1,64),(1,65),(1,66),(1,67),(1,68),(1,69),(1,70);
INSERT INTO CargasF([IdAula],[IdHorario]) VALUES(1,71),(1,72),(1,73),(1,74),(1,75),(1,76),(1,77),(1,78),(1,79),(1,80);
INSERT INTO CargasF([IdAula],[IdHorario]) VALUES(1,81),(1,82),(1,83),(1,84),(1,85),(1,86),(1,87),(1,88),(1,89),(1,90);
INSERT INTO CargasF([IdAula],[IdHorario]) VALUES(1,91),(1,92),(1,93),(1,94),(1,95)

GO
INSERT INTO CargasF([IdAula],[IdHorario]) VALUES(2,1),(2,2),(2,3),(2,4),(2,5),(2,6),(2,7),(2,8),(2,9),(2,10);
INSERT INTO CargasF([IdAula],[IdHorario]) VALUES(2,11),(2,12),(2,13),(2,14),(2,15),(2,16),(2,17),(2,18),(2,19),(2,20);
INSERT INTO CargasF([IdAula],[IdHorario]) VALUES(2,21),(2,22),(2,23),(2,24),(2,25),(2,26),(2,27),(2,28),(2,29),(2,30);
INSERT INTO CargasF([IdAula],[IdHorario]) VALUES(2,31),(2,32),(2,33),(2,34),(2,35),(2,36),(2,37),(2,38),(2,39),(2,40);
INSERT INTO CargasF([IdAula],[IdHorario]) VALUES(2,41),(2,42),(2,43),(2,44),(2,45),(2,46),(2,47),(2,48),(2,49),(2,50);
INSERT INTO CargasF([IdAula],[IdHorario]) VALUES(2,51),(2,52),(2,53),(2,54),(2,55),(2,56),(2,57),(2,58),(2,59),(2,60);
INSERT INTO CargasF([IdAula],[IdHorario]) VALUES(2,61),(2,62),(2,63),(2,64),(2,65),(2,66),(2,67),(2,68),(2,69),(2,70);
INSERT INTO CargasF([IdAula],[IdHorario]) VALUES(2,71),(2,72),(2,73),(2,74),(2,75),(2,76),(2,77),(2,78),(2,79),(2,80);
INSERT INTO CargasF([IdAula],[IdHorario]) VALUES(2,81),(2,82),(2,83),(2,84),(2,85),(2,86),(2,87),(2,88),(2,89),(2,90);
INSERT INTO CargasF([IdAula],[IdHorario]) VALUES(2,91),(2,92),(2,93),(2,94),(2,95)

GO
INSERT INTO CargasF([IdAula],[IdHorario]) VALUES(3,1),(3,2),(3,3),(3,4),(3,5),(3,6),(3,7),(3,8),(3,9),(3,10);
INSERT INTO CargasF([IdAula],[IdHorario]) VALUES(3,11),(3,12),(3,13),(3,14),(3,15),(3,16),(3,17),(3,18),(3,19),(3,20);
INSERT INTO CargasF([IdAula],[IdHorario]) VALUES(3,21),(3,22),(3,23),(3,24),(3,25),(3,26),(3,27),(3,28),(3,29),(3,30);
INSERT INTO CargasF([IdAula],[IdHorario]) VALUES(3,31),(3,32),(3,33),(3,34),(3,35),(3,36),(3,37),(3,38),(3,39),(3,40);
INSERT INTO CargasF([IdAula],[IdHorario]) VALUES(3,41),(3,42),(3,43),(3,44),(3,45),(3,46),(3,47),(3,48),(3,49),(3,50);
INSERT INTO CargasF([IdAula],[IdHorario]) VALUES(3,51),(3,52),(3,53),(3,54),(3,55),(3,56),(3,57),(3,58),(3,59),(3,60);
INSERT INTO CargasF([IdAula],[IdHorario]) VALUES(3,61),(3,62),(3,63),(3,64),(3,65),(3,66),(3,67),(3,68),(3,69),(3,70);
INSERT INTO CargasF([IdAula],[IdHorario]) VALUES(3,71),(3,72),(3,73),(3,74),(3,75),(3,76),(3,77),(3,78),(3,79),(3,80);
INSERT INTO CargasF([IdAula],[IdHorario]) VALUES(3,81),(3,82),(3,83),(3,84),(3,85),(3,86),(3,87),(3,88),(3,89),(3,90);
INSERT INTO CargasF([IdAula],[IdHorario]) VALUES(3,91),(3,92),(3,93),(3,94),(3,95)

GO
INSERT INTO CargasF([IdAula],[IdHorario]) VALUES(4,1),(4,2),(4,3),(4,4),(4,5),(4,6),(4,7),(4,8),(4,9),(4,10);
INSERT INTO CargasF([IdAula],[IdHorario]) VALUES(4,11),(4,12),(4,13),(4,14),(4,15),(4,16),(4,17),(4,18),(4,19),(4,20);
INSERT INTO CargasF([IdAula],[IdHorario]) VALUES(4,21),(4,22),(4,23),(4,24),(4,25),(4,26),(4,27),(4,28),(4,29),(4,30);
INSERT INTO CargasF([IdAula],[IdHorario]) VALUES(4,31),(4,32),(4,33),(4,34),(4,35),(4,36),(4,37),(4,38),(4,39),(4,40);
INSERT INTO CargasF([IdAula],[IdHorario]) VALUES(4,41),(4,42),(4,43),(4,44),(4,45),(4,46),(4,47),(4,48),(4,49),(4,50);
INSERT INTO CargasF([IdAula],[IdHorario]) VALUES(4,51),(4,52),(4,53),(4,54),(4,55),(4,56),(4,57),(4,58),(4,59),(4,60);
INSERT INTO CargasF([IdAula],[IdHorario]) VALUES(4,61),(4,62),(4,63),(4,64),(4,65),(4,66),(4,67),(4,68),(4,69),(4,70);
INSERT INTO CargasF([IdAula],[IdHorario]) VALUES(4,71),(4,72),(4,73),(4,74),(4,75),(4,76),(4,77),(4,78),(4,79),(4,80);
INSERT INTO CargasF([IdAula],[IdHorario]) VALUES(4,81),(4,82),(4,83),(4,84),(4,85),(4,86),(4,87),(4,88),(4,89),(4,90);
INSERT INTO CargasF([IdAula],[IdHorario]) VALUES(4,91),(4,92),(4,93),(4,94),(4,95)

GO
INSERT INTO CargasF([IdAula],[IdHorario]) VALUES(5,1),(5,2),(5,3),(5,4),(5,5),(5,6),(5,7),(5,8),(5,9),(5,10);
INSERT INTO CargasF([IdAula],[IdHorario]) VALUES(5,11),(5,12),(5,13),(5,14),(5,15),(5,16),(5,17),(5,18),(5,19),(5,20);
INSERT INTO CargasF([IdAula],[IdHorario]) VALUES(5,21),(5,22),(5,23),(5,24),(5,25),(5,26),(5,27),(5,28),(5,29),(5,30);
INSERT INTO CargasF([IdAula],[IdHorario]) VALUES(5,31),(5,32),(5,33),(5,34),(5,35),(5,36),(5,37),(5,38),(5,39),(5,40);
INSERT INTO CargasF([IdAula],[IdHorario]) VALUES(5,41),(5,42),(5,43),(5,44),(5,45),(5,46),(5,47),(5,48),(5,49),(5,50);
INSERT INTO CargasF([IdAula],[IdHorario]) VALUES(5,51),(5,52),(5,53),(5,54),(5,55),(5,56),(5,57),(5,58),(5,59),(5,60);
INSERT INTO CargasF([IdAula],[IdHorario]) VALUES(5,61),(5,62),(5,63),(5,64),(5,65),(5,66),(5,67),(5,68),(5,69),(5,70);
INSERT INTO CargasF([IdAula],[IdHorario]) VALUES(5,71),(5,72),(5,73),(5,74),(5,75),(5,76),(5,77),(5,78),(5,79),(5,80);
INSERT INTO CargasF([IdAula],[IdHorario]) VALUES(5,81),(5,82),(5,83),(5,84),(5,85),(5,86),(5,87),(5,88),(5,89),(5,90);
INSERT INTO CargasF([IdAula],[IdHorario]) VALUES(5,91),(5,92),(5,93),(5,94),(5,95)

GO
INSERT INTO CargasF([IdAula],[IdHorario]) VALUES(6,1),(6,2),(6,3),(6,4),(6,5),(6,6),(6,7),(6,8),(6,9),(6,10);
INSERT INTO CargasF([IdAula],[IdHorario]) VALUES(6,11),(6,12),(6,13),(6,14),(6,15),(6,16),(6,17),(6,18),(6,19),(6,20);
INSERT INTO CargasF([IdAula],[IdHorario]) VALUES(6,21),(6,22),(6,23),(6,24),(6,25),(6,26),(6,27),(6,28),(6,29),(6,30);
INSERT INTO CargasF([IdAula],[IdHorario]) VALUES(6,31),(6,32),(6,33),(6,34),(6,35),(6,36),(6,37),(6,38),(6,39),(6,40);
INSERT INTO CargasF([IdAula],[IdHorario]) VALUES(6,41),(6,42),(6,43),(6,44),(6,45),(6,46),(6,47),(6,48),(6,49),(6,50);
INSERT INTO CargasF([IdAula],[IdHorario]) VALUES(6,51),(6,52),(6,53),(6,54),(6,55),(6,56),(6,57),(6,58),(6,59),(6,60);
INSERT INTO CargasF([IdAula],[IdHorario]) VALUES(6,61),(6,62),(6,63),(6,64),(6,65),(6,66),(6,67),(6,68),(6,69),(6,70);
INSERT INTO CargasF([IdAula],[IdHorario]) VALUES(6,71),(6,72),(6,73),(6,74),(6,75),(6,76),(6,77),(6,78),(6,79),(6,80);
INSERT INTO CargasF([IdAula],[IdHorario]) VALUES(6,81),(6,82),(6,83),(6,84),(6,85),(6,86),(6,87),(6,88),(6,89),(6,90);
INSERT INTO CargasF([IdAula],[IdHorario]) VALUES(6,91),(6,92),(6,93),(6,94),(6,95)
GO
INSERT INTO CargasF([IdAula],[IdHorario]) VALUES(7,1),(7,2),(7,3),(7,4),(7,5),(7,6),(7,7),(7,8),(7,9),(7,10);
INSERT INTO CargasF([IdAula],[IdHorario]) VALUES(7,11),(7,12),(7,13),(7,14),(7,15),(7,16),(7,17),(7,18),(7,19),(7,20);
INSERT INTO CargasF([IdAula],[IdHorario]) VALUES(7,21),(7,22),(7,23),(7,24),(7,25),(7,26),(7,27),(7,28),(7,29),(7,30);
INSERT INTO CargasF([IdAula],[IdHorario]) VALUES(7,31),(7,32),(7,33),(7,34),(7,35),(7,36),(7,37),(7,38),(7,39),(7,40);
INSERT INTO CargasF([IdAula],[IdHorario]) VALUES(7,41),(7,42),(7,43),(7,44),(7,45),(7,46),(7,47),(7,48),(7,49),(7,50);
INSERT INTO CargasF([IdAula],[IdHorario]) VALUES(7,51),(7,52),(7,53),(7,54),(7,55),(7,56),(7,57),(7,58),(7,59),(7,60);
INSERT INTO CargasF([IdAula],[IdHorario]) VALUES(7,61),(7,62),(7,63),(7,64),(7,65),(7,66),(7,67),(7,68),(7,69),(7,70);
INSERT INTO CargasF([IdAula],[IdHorario]) VALUES(7,71),(7,72),(7,73),(7,74),(7,75),(7,76),(7,77),(7,78),(7,79),(7,80);
INSERT INTO CargasF([IdAula],[IdHorario]) VALUES(7,81),(7,82),(7,83),(7,84),(7,85),(7,86),(7,87),(7,88),(7,89),(7,90);
INSERT INTO CargasF([IdAula],[IdHorario]) VALUES(7,91),(7,92),(7,93),(7,94),(7,95)

GO

INSERT INTO CargasF([IdAula],[IdHorario]) VALUES(8,1),(8,2),(8,3),(8,4),(8,5),(8,6),(8,7),(8,8),(8,9),(8,10);
INSERT INTO CargasF([IdAula],[IdHorario]) VALUES(8,11),(8,12),(8,13),(8,14),(8,15),(8,16),(8,17),(8,18),(8,19),(8,20);
INSERT INTO CargasF([IdAula],[IdHorario]) VALUES(8,21),(8,22),(8,23),(8,24),(8,25),(8,26),(8,27),(8,28),(8,29),(8,30);
INSERT INTO CargasF([IdAula],[IdHorario]) VALUES(8,31),(8,32),(8,33),(8,34),(8,35),(8,36),(8,37),(8,38),(8,39),(8,40);
INSERT INTO CargasF([IdAula],[IdHorario]) VALUES(8,41),(8,42),(8,43),(8,44),(8,45),(8,46),(8,47),(8,48),(8,49),(8,50);
INSERT INTO CargasF([IdAula],[IdHorario]) VALUES(8,51),(8,52),(8,53),(8,54),(8,55),(8,56),(8,57),(8,58),(8,59),(8,60);
INSERT INTO CargasF([IdAula],[IdHorario]) VALUES(8,61),(8,62),(8,63),(8,64),(8,65),(8,66),(8,67),(8,68),(8,69),(8,70);
INSERT INTO CargasF([IdAula],[IdHorario]) VALUES(8,71),(8,72),(8,73),(8,74),(8,75),(8,76),(8,77),(8,78),(8,79),(8,80);
INSERT INTO CargasF([IdAula],[IdHorario]) VALUES(8,81),(8,82),(8,83),(8,84),(8,85),(8,86),(8,87),(8,88),(8,89),(8,90);
INSERT INTO CargasF([IdAula],[IdHorario]) VALUES(8,91),(8,92),(8,93),(8,94),(8,95)

GO
INSERT INTO CargasF([IdAula],[IdHorario]) VALUES(9,1),(9,2),(9,3),(9,4),(9,5),(9,6),(9,7),(9,8),(9,9),(9,10);
INSERT INTO CargasF([IdAula],[IdHorario]) VALUES(9,11),(9,12),(9,13),(9,14),(9,15),(9,16),(9,17),(9,18),(9,19),(9,20);
INSERT INTO CargasF([IdAula],[IdHorario]) VALUES(9,21),(9,22),(9,23),(9,24),(9,25),(9,26),(9,27),(9,28),(9,29),(9,30);
INSERT INTO CargasF([IdAula],[IdHorario]) VALUES(9,31),(9,32),(9,33),(9,34),(9,35),(9,36),(9,37),(9,38),(9,39),(9,40);
INSERT INTO CargasF([IdAula],[IdHorario]) VALUES(9,41),(9,42),(9,43),(9,44),(9,45),(9,46),(9,47),(9,48),(9,49),(9,50);
INSERT INTO CargasF([IdAula],[IdHorario]) VALUES(9,51),(9,52),(9,53),(9,54),(9,55),(9,56),(9,57),(9,58),(9,59),(9,60);
INSERT INTO CargasF([IdAula],[IdHorario]) VALUES(9,61),(9,62),(9,63),(9,64),(9,65),(9,66),(9,67),(9,68),(9,69),(9,70);
INSERT INTO CargasF([IdAula],[IdHorario]) VALUES(9,71),(9,72),(9,73),(9,74),(9,75),(9,76),(9,77),(9,78),(9,79),(9,80);
INSERT INTO CargasF([IdAula],[IdHorario]) VALUES(9,81),(9,82),(9,83),(9,84),(9,85),(9,86),(9,87),(9,88),(9,89),(9,90);
INSERT INTO CargasF([IdAula],[IdHorario]) VALUES(9,91),(9,92),(9,93),(9,94),(9,95)
GO

INSERT INTO CargasF([IdAula],[IdHorario]) VALUES(10,1),(10,2),(10,3),(10,4),(10,5),(10,6),(10,7),(10,8),(10,9),(10,10);
INSERT INTO CargasF([IdAula],[IdHorario]) VALUES(10,11),(10,12),(10,13),(10,14),(10,15),(10,16),(10,17),(10,18),(10,19),(10,20);
INSERT INTO CargasF([IdAula],[IdHorario]) VALUES(10,21),(10,22),(10,23),(10,24),(10,25),(10,26),(10,27),(10,28),(10,29),(10,30);
INSERT INTO CargasF([IdAula],[IdHorario]) VALUES(10,31),(10,32),(10,33),(10,34),(10,35),(10,36),(10,37),(10,38),(10,39),(10,40);
INSERT INTO CargasF([IdAula],[IdHorario]) VALUES(10,41),(10,42),(10,43),(10,44),(10,45),(10,46),(10,47),(10,48),(10,49),(10,50);
INSERT INTO CargasF([IdAula],[IdHorario]) VALUES(10,51),(10,52),(10,53),(10,54),(10,55),(10,56),(10,57),(10,58),(10,59),(10,60);
INSERT INTO CargasF([IdAula],[IdHorario]) VALUES(10,61),(10,62),(10,63),(10,64),(10,65),(10,66),(10,67),(10,68),(10,69),(10,70);
INSERT INTO CargasF([IdAula],[IdHorario]) VALUES(10,71),(10,72),(10,73),(10,74),(10,75),(10,76),(10,77),(10,78),(10,79),(10,80);
INSERT INTO CargasF([IdAula],[IdHorario]) VALUES(10,81),(10,82),(10,83),(10,84),(10,85),(10,86),(10,87),(10,88),(10,89),(10,90);
INSERT INTO CargasF([IdAula],[IdHorario]) VALUES(10,91),(10,92),(10,93),(10,94),(10,95)

GO
INSERT INTO CargasF([IdAula],[IdHorario]) VALUES(11,1),(11,2),(11,3),(11,4),(11,5),(11,6),(11,7),(11,8),(11,9),(11,10);
INSERT INTO CargasF([IdAula],[IdHorario]) VALUES(11,11),(11,12),(11,13),(11,14),(11,15),(11,16),(11,17),(11,18),(11,19),(11,20);
INSERT INTO CargasF([IdAula],[IdHorario]) VALUES(11,21),(11,22),(11,23),(11,24),(11,25),(11,26),(11,27),(11,28),(11,29),(11,30);
INSERT INTO CargasF([IdAula],[IdHorario]) VALUES(11,31),(11,32),(11,33),(11,34),(11,35),(11,36),(11,37),(11,38),(11,39),(11,40);
INSERT INTO CargasF([IdAula],[IdHorario]) VALUES(11,41),(11,42),(11,43),(11,44),(11,45),(11,46),(11,47),(11,48),(11,49),(11,50);
INSERT INTO CargasF([IdAula],[IdHorario]) VALUES(11,51),(11,52),(11,53),(11,54),(11,55),(11,56),(11,57),(11,58),(11,59),(11,60);
INSERT INTO CargasF([IdAula],[IdHorario]) VALUES(11,61),(11,62),(11,63),(11,64),(11,65),(11,66),(11,67),(11,68),(11,69),(11,70);
INSERT INTO CargasF([IdAula],[IdHorario]) VALUES(11,71),(11,72),(11,73),(11,74),(11,75),(11,76),(11,77),(11,78),(11,79),(11,80);
INSERT INTO CargasF([IdAula],[IdHorario]) VALUES(11,81),(11,82),(11,83),(11,84),(11,85),(11,86),(11,87),(11,88),(11,89),(11,90);
INSERT INTO CargasF([IdAula],[IdHorario]) VALUES(11,91),(11,92),(11,93),(11,94),(11,95)

GO

INSERT INTO CargasF([IdAula],[IdHorario]) VALUES(12,1),(12,2),(12,3),(12,4),(12,5),(12,6),(12,7),(12,8),(12,9),(12,10);
INSERT INTO CargasF([IdAula],[IdHorario]) VALUES(12,11),(12,12),(12,13),(12,14),(12,15),(12,16),(12,17),(12,18),(12,19),(12,20);
INSERT INTO CargasF([IdAula],[IdHorario]) VALUES(12,21),(12,22),(12,23),(12,24),(12,25),(12,26),(12,27),(12,28),(12,29),(12,30);
INSERT INTO CargasF([IdAula],[IdHorario]) VALUES(12,31),(12,32),(12,33),(12,34),(12,35),(12,36),(12,37),(12,38),(12,39),(12,40);
INSERT INTO CargasF([IdAula],[IdHorario]) VALUES(12,41),(12,42),(12,43),(12,44),(12,45),(12,46),(12,47),(12,48),(12,49),(12,50);
INSERT INTO CargasF([IdAula],[IdHorario]) VALUES(12,51),(12,52),(12,53),(12,54),(12,55),(12,56),(12,57),(12,58),(12,59),(12,60);
INSERT INTO CargasF([IdAula],[IdHorario]) VALUES(12,61),(12,62),(12,63),(12,64),(12,65),(12,66),(12,67),(12,68),(12,69),(12,70);
INSERT INTO CargasF([IdAula],[IdHorario]) VALUES(12,71),(12,72),(12,73),(12,74),(12,75),(12,76),(12,77),(12,78),(12,79),(12,80);
INSERT INTO CargasF([IdAula],[IdHorario]) VALUES(12,81),(12,82),(12,83),(12,84),(12,85),(12,86),(12,87),(12,88),(12,89),(12,90);
INSERT INTO CargasF([IdAula],[IdHorario]) VALUES(12,91),(12,92),(12,93),(12,94),(12,95)

GO

INSERT INTO CargasF([IdAula],[IdHorario]) VALUES(13,1),(13,2),(13,3),(13,4),(13,5),(13,6),(13,7),(13,8),(13,9),(13,10);
INSERT INTO CargasF([IdAula],[IdHorario]) VALUES(13,11),(13,12),(13,13),(13,14),(13,15),(13,16),(13,17),(13,18),(13,19),(13,20);
INSERT INTO CargasF([IdAula],[IdHorario]) VALUES(13,21),(13,22),(13,23),(13,24),(13,25),(13,26),(13,27),(13,28),(13,29),(13,30);
INSERT INTO CargasF([IdAula],[IdHorario]) VALUES(13,31),(13,32),(13,33),(13,34),(13,35),(13,36),(13,37),(13,38),(13,39),(13,40);
INSERT INTO CargasF([IdAula],[IdHorario]) VALUES(13,41),(13,42),(13,43),(13,44),(13,45),(13,46),(13,47),(13,48),(13,49),(13,50);
INSERT INTO CargasF([IdAula],[IdHorario]) VALUES(13,51),(13,52),(13,53),(13,54),(13,55),(13,56),(13,57),(13,58),(13,59),(13,60);
INSERT INTO CargasF([IdAula],[IdHorario]) VALUES(13,61),(13,62),(13,63),(13,64),(13,65),(13,66),(13,67),(13,68),(13,69),(13,70);
INSERT INTO CargasF([IdAula],[IdHorario]) VALUES(13,71),(13,72),(13,73),(13,74),(13,75),(13,76),(13,77),(13,78),(13,79),(13,80);
INSERT INTO CargasF([IdAula],[IdHorario]) VALUES(13,81),(13,82),(13,83),(13,84),(13,85),(13,86),(13,87),(13,88),(13,89),(13,90);
INSERT INTO CargasF([IdAula],[IdHorario]) VALUES(13,91),(13,92),(13,93),(13,94),(13,95)

GO
INSERT INTO CargasF([IdAula],[IdHorario]) VALUES(14,1),(14,2),(14,3),(14,4),(14,5),(14,6),(14,7),(14,8),(14,9),(14,10);
INSERT INTO CargasF([IdAula],[IdHorario]) VALUES(14,11),(14,12),(14,13),(14,14),(14,15),(14,16),(14,17),(14,18),(14,19),(14,20);
INSERT INTO CargasF([IdAula],[IdHorario]) VALUES(14,21),(14,22),(14,23),(14,24),(14,25),(14,26),(14,27),(14,28),(14,29),(14,30);
INSERT INTO CargasF([IdAula],[IdHorario]) VALUES(14,31),(14,32),(14,33),(14,34),(14,35),(14,36),(14,37),(14,38),(14,39),(14,40);
INSERT INTO CargasF([IdAula],[IdHorario]) VALUES(14,41),(14,42),(14,43),(14,44),(14,45),(14,46),(14,47),(14,48),(14,49),(14,50);
INSERT INTO CargasF([IdAula],[IdHorario]) VALUES(14,51),(14,52),(14,53),(14,54),(14,55),(14,56),(14,57),(14,58),(14,59),(14,60);
INSERT INTO CargasF([IdAula],[IdHorario]) VALUES(14,61),(14,62),(14,63),(14,64),(14,65),(14,66),(14,67),(14,68),(14,69),(14,70);
INSERT INTO CargasF([IdAula],[IdHorario]) VALUES(14,71),(14,72),(14,73),(14,74),(14,75),(14,76),(14,77),(14,78),(14,79),(14,80);
INSERT INTO CargasF([IdAula],[IdHorario]) VALUES(14,81),(14,82),(14,83),(14,84),(14,85),(14,86),(14,87),(14,88),(14,89),(14,90);
INSERT INTO CargasF([IdAula],[IdHorario]) VALUES(14,91),(14,92),(14,93),(14,94),(14,95)

GO
INSERT INTO CargasF([IdAula],[IdHorario]) VALUES(15,1),(15,2),(15,3),(15,4),(15,5),(15,6),(15,7),(15,8),(15,9),(15,10);
INSERT INTO CargasF([IdAula],[IdHorario]) VALUES(15,11),(15,12),(15,13),(15,14),(15,15),(15,16),(15,17),(15,18),(15,19),(15,20);
INSERT INTO CargasF([IdAula],[IdHorario]) VALUES(15,21),(15,22),(15,23),(15,24),(15,25),(15,26),(15,27),(15,28),(15,29),(15,30);
INSERT INTO CargasF([IdAula],[IdHorario]) VALUES(15,31),(15,32),(15,33),(15,34),(15,35),(15,36),(15,37),(15,38),(15,39),(15,40);
INSERT INTO CargasF([IdAula],[IdHorario]) VALUES(15,41),(15,42),(15,43),(15,44),(15,45),(15,46),(15,47),(15,48),(15,49),(15,50);
INSERT INTO CargasF([IdAula],[IdHorario]) VALUES(15,51),(15,52),(15,53),(15,54),(15,55),(15,56),(15,57),(15,58),(15,59),(15,60);
INSERT INTO CargasF([IdAula],[IdHorario]) VALUES(15,61),(15,62),(15,63),(15,64),(15,65),(15,66),(15,67),(15,68),(15,69),(15,70);
INSERT INTO CargasF([IdAula],[IdHorario]) VALUES(15,71),(15,72),(15,73),(15,74),(15,75),(15,76),(15,77),(15,78),(15,79),(15,80);
INSERT INTO CargasF([IdAula],[IdHorario]) VALUES(15,81),(15,82),(15,83),(15,84),(15,85),(15,86),(15,87),(15,88),(15,89),(15,90);
INSERT INTO CargasF([IdAula],[IdHorario]) VALUES(15,91),(15,92),(15,93),(15,94),(15,95)

GO
INSERT INTO CargasF([IdAula],[IdHorario]) VALUES(16,1),(16,2),(16,3),(16,4),(16,5),(16,6),(16,7),(16,8),(16,9),(16,10);
INSERT INTO CargasF([IdAula],[IdHorario]) VALUES(16,11),(16,12),(16,13),(16,14),(16,15),(16,16),(16,17),(16,18),(16,19),(16,20);
INSERT INTO CargasF([IdAula],[IdHorario]) VALUES(16,21),(16,22),(16,23),(16,24),(16,25),(16,26),(16,27),(16,28),(16,29),(16,30);
INSERT INTO CargasF([IdAula],[IdHorario]) VALUES(16,31),(16,32),(16,33),(16,34),(16,35),(16,36),(16,37),(16,38),(16,39),(16,40);
INSERT INTO CargasF([IdAula],[IdHorario]) VALUES(16,41),(16,42),(16,43),(16,44),(16,45),(16,46),(16,47),(16,48),(16,49),(16,50);
INSERT INTO CargasF([IdAula],[IdHorario]) VALUES(16,51),(16,52),(16,53),(16,54),(16,55),(16,56),(16,57),(16,58),(16,59),(16,60);
INSERT INTO CargasF([IdAula],[IdHorario]) VALUES(16,61),(16,62),(16,63),(16,64),(16,65),(16,66),(16,67),(16,68),(16,69),(16,70);
INSERT INTO CargasF([IdAula],[IdHorario]) VALUES(16,71),(16,72),(16,73),(16,74),(16,75),(16,76),(16,77),(16,78),(16,79),(16,80);
INSERT INTO CargasF([IdAula],[IdHorario]) VALUES(16,81),(16,82),(16,83),(16,84),(16,85),(16,86),(16,87),(16,88),(16,89),(16,90);
INSERT INTO CargasF([IdAula],[IdHorario]) VALUES(16,91),(16,92),(16,93),(16,94),(16,95)

GO
INSERT INTO CargasF([IdAula],[IdHorario]) VALUES(17,1),(17,2),(17,3),(17,4),(17,5),(17,6),(17,7),(17,8),(17,9),(17,10);
INSERT INTO CargasF([IdAula],[IdHorario]) VALUES(17,11),(17,12),(17,13),(17,14),(17,15),(17,16),(17,17),(17,18),(17,19),(17,20);
INSERT INTO CargasF([IdAula],[IdHorario]) VALUES(17,21),(17,22),(17,23),(17,24),(17,25),(17,26),(17,27),(17,28),(17,29),(17,30);
INSERT INTO CargasF([IdAula],[IdHorario]) VALUES(17,31),(17,32),(17,33),(17,34),(17,35),(17,36),(17,37),(17,38),(17,39),(17,40);
INSERT INTO CargasF([IdAula],[IdHorario]) VALUES(17,41),(17,42),(17,43),(17,44),(17,45),(17,46),(17,47),(17,48),(17,49),(17,50);
INSERT INTO CargasF([IdAula],[IdHorario]) VALUES(17,51),(17,52),(17,53),(17,54),(17,55),(17,56),(17,57),(17,58),(17,59),(17,60);
INSERT INTO CargasF([IdAula],[IdHorario]) VALUES(17,61),(17,62),(17,63),(17,64),(17,65),(17,66),(17,67),(17,68),(17,69),(17,70);
INSERT INTO CargasF([IdAula],[IdHorario]) VALUES(17,71),(17,72),(17,73),(17,74),(17,75),(17,76),(17,77),(17,78),(17,79),(17,80);
INSERT INTO CargasF([IdAula],[IdHorario]) VALUES(17,81),(17,82),(17,83),(17,84),(17,85),(17,86),(17,87),(17,88),(17,89),(17,90);
INSERT INTO CargasF([IdAula],[IdHorario]) VALUES(17,91),(17,92),(17,93),(17,94),(17,95)

GO
INSERT INTO CargasF([IdAula],[IdHorario]) VALUES(18,1),(18,2),(18,3),(18,4),(18,5),(18,6),(18,7),(18,8),(18,9),(18,10);
INSERT INTO CargasF([IdAula],[IdHorario]) VALUES(18,11),(18,12),(18,13),(18,14),(18,15),(18,16),(18,17),(18,18),(18,19),(18,20);
INSERT INTO CargasF([IdAula],[IdHorario]) VALUES(18,21),(18,22),(18,23),(18,24),(18,25),(18,26),(18,27),(18,28),(18,29),(18,30);
INSERT INTO CargasF([IdAula],[IdHorario]) VALUES(18,31),(18,32),(18,33),(18,34),(18,35),(18,36),(18,37),(18,38),(18,39),(18,40);
INSERT INTO CargasF([IdAula],[IdHorario]) VALUES(18,41),(18,42),(18,43),(18,44),(18,45),(18,46),(18,47),(18,48),(18,49),(18,50);
INSERT INTO CargasF([IdAula],[IdHorario]) VALUES(18,51),(18,52),(18,53),(18,54),(18,55),(18,56),(18,57),(18,58),(18,59),(18,60);
INSERT INTO CargasF([IdAula],[IdHorario]) VALUES(18,61),(18,62),(18,63),(18,64),(18,65),(18,66),(18,67),(18,68),(18,69),(18,70);
INSERT INTO CargasF([IdAula],[IdHorario]) VALUES(18,71),(18,72),(18,73),(18,74),(18,75),(18,76),(18,77),(18,78),(18,79),(18,80);
INSERT INTO CargasF([IdAula],[IdHorario]) VALUES(18,81),(18,82),(18,83),(18,84),(18,85),(18,86),(18,87),(18,88),(18,89),(18,90);
INSERT INTO CargasF([IdAula],[IdHorario]) VALUES(18,91),(18,92),(18,93),(18,94),(18,95)

GO
INSERT INTO CargasF([IdAula],[IdHorario]) VALUES(19,1),(19,2),(19,3),(19,4),(19,5),(19,6),(19,7),(19,8),(19,9),(19,10);
INSERT INTO CargasF([IdAula],[IdHorario]) VALUES(19,11),(19,12),(19,13),(19,14),(19,15),(19,16),(19,17),(19,18),(19,19),(19,20);
INSERT INTO CargasF([IdAula],[IdHorario]) VALUES(19,21),(19,22),(19,23),(19,24),(19,25),(19,26),(19,27),(19,28),(19,29),(19,30);
INSERT INTO CargasF([IdAula],[IdHorario]) VALUES(19,31),(19,32),(19,33),(19,34),(19,35),(19,36),(19,37),(19,38),(19,39),(19,40);
INSERT INTO CargasF([IdAula],[IdHorario]) VALUES(19,41),(19,42),(19,43),(19,44),(19,45),(19,46),(19,47),(19,48),(19,49),(19,50);
INSERT INTO CargasF([IdAula],[IdHorario]) VALUES(19,51),(19,52),(19,53),(19,54),(19,55),(19,56),(19,57),(19,58),(19,59),(19,60);
INSERT INTO CargasF([IdAula],[IdHorario]) VALUES(19,61),(19,62),(19,63),(19,64),(19,65),(19,66),(19,67),(19,68),(19,69),(19,70);
INSERT INTO CargasF([IdAula],[IdHorario]) VALUES(19,71),(19,72),(19,73),(19,74),(19,75),(19,76),(19,77),(19,78),(19,79),(19,80);
INSERT INTO CargasF([IdAula],[IdHorario]) VALUES(19,81),(19,82),(19,83),(19,84),(19,85),(19,86),(19,87),(19,88),(19,89),(19,90);
INSERT INTO CargasF([IdAula],[IdHorario]) VALUES(19,91),(19,92),(19,93),(19,94),(19,95)
GO
INSERT INTO CargasF([IdAula],[IdHorario]) VALUES(20,1),(20,2),(20,3),(20,4),(20,5),(20,6),(20,7),(20,8),(20,9),(20,10);
INSERT INTO CargasF([IdAula],[IdHorario]) VALUES(20,11),(20,12),(20,13),(20,14),(20,15),(20,16),(20,17),(20,18),(20,19),(20,20);
INSERT INTO CargasF([IdAula],[IdHorario]) VALUES(20,21),(20,22),(20,23),(20,24),(20,25),(20,26),(20,27),(20,28),(20,29),(20,30);
INSERT INTO CargasF([IdAula],[IdHorario]) VALUES(20,31),(20,32),(20,33),(20,34),(20,35),(20,36),(20,37),(20,38),(20,39),(20,40);
INSERT INTO CargasF([IdAula],[IdHorario]) VALUES(20,41),(20,42),(20,43),(20,44),(20,45),(20,46),(20,47),(20,48),(20,49),(20,50);
INSERT INTO CargasF([IdAula],[IdHorario]) VALUES(20,51),(20,52),(20,53),(20,54),(20,55),(20,56),(20,57),(20,58),(20,59),(20,60);
INSERT INTO CargasF([IdAula],[IdHorario]) VALUES(20,61),(20,62),(20,63),(20,64),(20,65),(20,66),(20,67),(20,68),(20,69),(20,70);
INSERT INTO CargasF([IdAula],[IdHorario]) VALUES(20,71),(20,72),(20,73),(20,74),(20,75),(20,76),(20,77),(20,78),(20,79),(20,80);
INSERT INTO CargasF([IdAula],[IdHorario]) VALUES(20,81),(20,82),(20,83),(20,84),(20,85),(20,86),(20,87),(20,88),(20,89),(20,90);
INSERT INTO CargasF([IdAula],[IdHorario]) VALUES(20,91),(20,92),(20,93),(20,94),(20,95)
GO

INSERT INTO CargasF([IdAula],[IdHorario]) VALUES(21,1),(21,2),(21,3),(21,4),(21,5),(21,6),(21,7),(21,8),(21,9),(21,10);
INSERT INTO CargasF([IdAula],[IdHorario]) VALUES(21,11),(21,12),(21,13),(21,14),(21,15),(21,16),(21,17),(21,18),(21,19),(21,20);
INSERT INTO CargasF([IdAula],[IdHorario]) VALUES(21,21),(21,22),(21,23),(21,24),(21,25),(21,26),(21,27),(21,28),(21,29),(21,30);
INSERT INTO CargasF([IdAula],[IdHorario]) VALUES(21,31),(21,32),(21,33),(21,34),(21,35),(21,36),(21,37),(21,38),(21,39),(21,40);
INSERT INTO CargasF([IdAula],[IdHorario]) VALUES(21,41),(21,42),(21,43),(21,44),(21,45),(21,46),(21,47),(21,48),(21,49),(21,50);
INSERT INTO CargasF([IdAula],[IdHorario]) VALUES(21,51),(21,52),(21,53),(21,54),(21,55),(21,56),(21,57),(21,58),(21,59),(21,60);
INSERT INTO CargasF([IdAula],[IdHorario]) VALUES(21,61),(21,62),(21,63),(21,64),(21,65),(21,66),(21,67),(21,68),(21,69),(21,70);
INSERT INTO CargasF([IdAula],[IdHorario]) VALUES(21,71),(21,72),(21,73),(21,74),(21,75),(21,76),(21,77),(21,78),(21,79),(21,80);
INSERT INTO CargasF([IdAula],[IdHorario]) VALUES(21,81),(21,82),(21,83),(21,84),(21,85),(21,86),(21,87),(21,88),(21,89),(21,90);
INSERT INTO CargasF([IdAula],[IdHorario]) VALUES(21,91),(21,92),(21,93),(21,94),(21,95)
GO
INSERT INTO CargasF([IdAula],[IdHorario]) VALUES(22,1),(22,2),(22,3),(22,4),(22,5),(22,6),(22,7),(22,8),(22,9),(22,10);
INSERT INTO CargasF([IdAula],[IdHorario]) VALUES(22,11),(22,12),(22,13),(22,14),(22,15),(22,16),(22,17),(22,18),(22,19),(22,20);
INSERT INTO CargasF([IdAula],[IdHorario]) VALUES(22,21),(22,22),(22,23),(22,24),(22,25),(22,26),(22,27),(22,28),(22,29),(22,30);
INSERT INTO CargasF([IdAula],[IdHorario]) VALUES(22,31),(22,32),(22,33),(22,34),(22,35),(22,36),(22,37),(22,38),(22,39),(22,40);
INSERT INTO CargasF([IdAula],[IdHorario]) VALUES(22,41),(22,42),(22,43),(22,44),(22,45),(22,46),(22,47),(22,48),(22,49),(22,50);
INSERT INTO CargasF([IdAula],[IdHorario]) VALUES(22,51),(22,52),(22,53),(22,54),(22,55),(22,56),(22,57),(22,58),(22,59),(22,60);
INSERT INTO CargasF([IdAula],[IdHorario]) VALUES(22,61),(22,62),(22,63),(22,64),(22,65),(22,66),(22,67),(22,68),(22,69),(22,70);
INSERT INTO CargasF([IdAula],[IdHorario]) VALUES(22,71),(22,72),(22,73),(22,74),(22,75),(22,76),(22,77),(22,78),(22,79),(22,80);
INSERT INTO CargasF([IdAula],[IdHorario]) VALUES(22,81),(22,82),(22,83),(22,84),(22,85),(22,86),(22,87),(22,88),(22,89),(22,90);
INSERT INTO CargasF([IdAula],[IdHorario]) VALUES(22,91),(22,92),(22,93),(22,94),(22,95)

GO
INSERT INTO CargasF([IdAula],[IdHorario]) VALUES(23,1),(23,2),(23,3),(23,4),(23,5),(23,6),(23,7),(23,8),(23,9),(23,10);
INSERT INTO CargasF([IdAula],[IdHorario]) VALUES(23,11),(23,12),(23,13),(23,14),(23,15),(23,16),(23,17),(23,18),(23,19),(23,20);
INSERT INTO CargasF([IdAula],[IdHorario]) VALUES(23,21),(23,22),(23,23),(23,24),(23,25),(23,26),(23,27),(23,28),(23,29),(23,30);
INSERT INTO CargasF([IdAula],[IdHorario]) VALUES(23,31),(23,32),(23,33),(23,34),(23,35),(23,36),(23,37),(23,38),(23,39),(23,40);
INSERT INTO CargasF([IdAula],[IdHorario]) VALUES(23,41),(23,42),(23,43),(23,44),(23,45),(23,46),(23,47),(23,48),(23,49),(23,50);
INSERT INTO CargasF([IdAula],[IdHorario]) VALUES(23,51),(23,52),(23,53),(23,54),(23,55),(23,56),(23,57),(23,58),(23,59),(23,60);
INSERT INTO CargasF([IdAula],[IdHorario]) VALUES(23,61),(23,62),(23,63),(23,64),(23,65),(23,66),(23,67),(23,68),(23,69),(23,70);
INSERT INTO CargasF([IdAula],[IdHorario]) VALUES(23,71),(23,72),(23,73),(23,74),(23,75),(23,76),(23,77),(23,78),(23,79),(23,80);
INSERT INTO CargasF([IdAula],[IdHorario]) VALUES(23,81),(23,82),(23,83),(23,84),(23,85),(23,86),(23,87),(23,88),(23,89),(23,90);
INSERT INTO CargasF([IdAula],[IdHorario]) VALUES(23,91),(23,92),(23,93),(23,94),(23,95)

GO
INSERT INTO LugarDescarga values ('Biblioteca')
INSERT INTO LugarDescarga values ('Oficina')


