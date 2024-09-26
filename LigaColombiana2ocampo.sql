create database LigaColombiana;
USE LigaColombiana;

-- TABLA JUGADORES --
create table Jugadores (
idJugador INT AUTO_INCREMENT PRIMARY KEY,
NombreJugador varchar(100)  NOT NULL,
ApellidosJugador varchar(100) NOT NULL,
FechaNacimiento DATE NOT NULL,
EdadJugador INT,
EstaturaJugador INT,
PesoJugador INT,
CelJugador varchar(30),
DireccionJugador varchar(100),
Posicion enum('PORTERO', 'DEFENSA', 'MEDIOCENTRO', 'CARRILERO', 'VOLANTE', 'MEDIAPUNTA', 'DELANTEROS')
);

-- TABLA EQUIPO --
create table Equipo (
idEquipo int AUTO_INCREMENT PRIMARY KEY,
NombreEquipo varchar(100)  NOT NULL,
FechaCreacion varchar(100)  NOT NULL,
Ciudad varchar(100)  NOT NULL
);


-- TABLA CAMPEONATO --
create table Campeonato (
idCampeonato int AUTO_INCREMENT PRIMARY KEY,
TipoCampeonato enum('LIGA PROFESIONAL', 'TORNEO ASCENSO', 'COPA COLOMBIA', 'COPA LIBERTADORES','COPA SUDAMERICANA')
);


-- TABLA ESTADIOS --
create table Estadio (
idEstadio int AUTO_INCREMENT PRIMARY KEY,
NombreEstadio varchar(100)  NOT NULL,
CiudadEstadio varchar(100)  NOT NULL,
DireccionEstadio varchar(100)  NOT NULL
);


-- TABLA ARBITRO --
create table Arbitro (
idArbitro int AUTO_INCREMENT PRIMARY KEY,
NombreArbitro varchar(100)  NOT NULL,
ApellidosArbitro varchar(100)  NOT NULL,
FechaNacimiento INT,
EdadArbitro INT,
CelularArbitro varchar(30),
DireccionArbitro varchar(100)  NOT NULL,
EmailArbitro varchar(100)  NOT NULL,
TipoArbitro enum('JUEZ DE LÍNEA1', 'JUEZ DE LÍNEA2', 'JUEZ DE CENTRAL', 'JUEZ DE SUPLENTE')
);

-- TABLA PLANTILLA --
create table Plantilla (
idPlantilla int AUTO_INCREMENT PRIMARY KEY,
ClasePlantilla enum('A', 'B', 'C'),
idJugador INT,
idEquipo INT,
FOREIGN KEY (idJugador) REFERENCES Jugadores(idJugador) ON DELETE CASCADE,
FOREIGN KEY (idEquipo) REFERENCES Equipo(idEquipo) ON DELETE CASCADE
);


-- TABLA PARTIDO --
create table Partido (
idPartido int AUTO_INCREMENT PRIMARY KEY,
idEstadio INT,
idEquipo INT,
idCampeonato INT,
idArbitro INT,
Hora INT,
Resultado INT,
Goles INT,
FOREIGN KEY (idEstadio) REFERENCES Estadio(idEstadio) ON DELETE SET NULL,
FOREIGN KEY (idEquipo) REFERENCES Equipo(idEquipo) ON DELETE CASCADE,
FOREIGN KEY (idCampeonato) REFERENCES Campeonato(idCampeonato) ON DELETE SET NULL,
FOREIGN KEY (idArbitro) REFERENCES Arbitro(idArbitro) ON DELETE SET NULL
);

INSERT INTO Jugadores (NombreJugador, ApellidosJugador, FechaNacimiento, EdadJugador, EstaturaJugador, PesoJugador, CelJugador, DireccionJugador, Posicion)
VALUES
('Carlos', 'Rodríguez', '1990-05-12', 34, 180, 75, 3001234567, 'Calle 123, Bogotá', 'DEFENSA'),
('Juan', 'Pérez', '1992-09-20', 32, 175, 70, 3002234567, 'Carrera 45, Medellín', 'PORTERO'),
('Andrés', 'Gómez', '1995-11-11', 29, 183, 77, 3003234567, 'Avenida 12, Cali', 'DELANTEROS'),
('David', 'Martínez', '1988-02-04', 36, 178, 72, 3004234567, 'Calle 67, Bucaramanga', 'VOLANTE'),
('Jorge', 'Torres', '1993-07-19', 31, 182, 74, 3005234567, 'Carrera 98, Barranquilla', 'MEDIOCENTRO'),
('Luis', 'Suárez', '1994-08-22', 30, 176, 76, 3006234567, 'Calle 30, Cartagena', 'CARRILERO'),
('Miguel', 'Álvarez', '1991-01-15', 33, 184, 78, 3007234567, 'Avenida 99, Cúcuta', 'DEFENSA'),
('Santiago', 'Díaz', '1996-10-13', 28, 185, 79, 3008234567, 'Carrera 5, Manizales', 'MEDIAPUNTA'),
('Felipe', 'Ramírez', '1997-03-25', 27, 179, 73, 3009234567, 'Calle 8, Santa Marta', 'PORTERO'),
('Oscar', 'Morales', '1998-12-10', 26, 180, 74, 3001234877, 'Carrera 22, Tunja', 'DELANTEROS'),
('Daniel', 'Ortiz', '1989-04-03', 35, 177, 71, 3011234567, 'Avenida 77, Pereira', 'VOLANTE'),
('Cristian', 'López', '1993-06-28', 31, 183, 75, 3012234567, 'Calle 48, Ibagué', 'DEFENSA'),
('José', 'Hernández', '1994-02-14', 30, 181, 76, 3013234567, 'Carrera 11, Neiva', 'CARRILERO'),
('Mario', 'Ruiz', '1992-09-17', 32, 180, 74, 3014234567, 'Calle 55, Pasto', 'MEDIOCENTRO'),
('Pablo', 'Cárdenas', '1990-01-29', 34, 182, 76, 3015234567, 'Carrera 15, Villavicencio', 'VOLANTE'),
('Manuel', 'Salazar', '1991-05-19', 33, 179, 75, 3016234567, 'Avenida 12, Montería', 'DELANTEROS'),
('Ricardo', 'Fernández', '1995-07-05', 29, 178, 74, 3017234567, 'Calle 79, Popayán', 'MEDIAPUNTA'),
('Adrián', 'Serrano', '1997-08-21', 27, 184, 78, 3018234567, 'Carrera 99, Armenia', 'PORTERO'),
('Jonathan', 'Mendoza', '1998-03-10', 26, 180, 75, 3019234567, 'Avenida 33, Buenaventura', 'DEFENSA'),
('Fernando', 'Vargas', '1989-11-06', 35, 182, 77, 3021234567, 'Calle 11, Florencia', 'CARRILERO'),
('Sebastián', 'Rivera', '1993-12-25', 31, 176, 72, 3022234567, 'Carrera 88, Sincelejo', 'VOLANTE'),
('Ramiro', 'Cruz', '1991-08-09', 33, 178, 73, 3023234567, 'Calle 9, Valledupar', 'DELANTEROS'),
('Álvaro', 'Moreno', '1996-01-20', 28, 185, 79, 3024234567, 'Avenida 21, Duitama', 'DEFENSA'),
('Gabriel', 'Acosta', '1994-04-27', 30, 182, 76, 3025234567, 'Carrera 55, Chía', 'MEDIOCENTRO'),
('Raúl', 'Gil', '1988-10-11', 36, 177, 74, 3026234567, 'Calle 13, Yopal', 'PORTERO'),
('Camilo', 'Castaño', '1992-03-07', 32, 178, 75, 3027234567, 'Carrera 19, Ipiales', 'VOLANTE'),
('Alejandro', 'Muñoz', '1990-06-02', 34, 181, 77, 3028234567, 'Avenida 34, Facatativá', 'CARRILERO'),
('Mauricio', 'Peña', '1997-07-18', 27, 180, 73, 3029234567, 'Calle 99, Girardot', 'MEDIAPUNTA'),
('Eduardo', 'Orozco', '1991-11-23', 33, 182, 75, 3031234567, 'Carrera 44, Cartago', 'DEFENSA'),
('Esteban', 'Navarro', '1996-02-08', 28, 179, 74, 3032234567, 'Avenida 16, Soacha', 'PORTERO'),
('Federico', 'Rojas', '1993-05-15', 31, 183, 76, 3033234567, 'Calle 6, Zipaquirá', 'VOLANTE'),
('Héctor', 'Campos', '1994-08-12', 30, 180, 73, 3034234567, 'Carrera 91, Sogamoso', 'DELANTEROS'),
('Iván', 'Pacheco', '1990-09-14', 34, 182, 76, 3035234567, 'Avenida 88, Rionegro', 'DEFENSA'),
('Leonardo', 'Chávez', '1989-11-22', 35, 178, 75, 3036234567, 'Calle 47, La Dorada', 'CARRILERO'),
('Carlos', 'Mejía', '1995-04-29', 29, 179, 74, 3037234567, 'Carrera 18, Maicao', 'MEDIOCENTRO'),
('Francisco', 'Valencia', '1992-02-10', 32, 176, 72, 3038234567, 'Avenida 77, Leticia', 'VOLANTE'),
('Simón', 'Bermúdez', '1991-06-06', 33, 181, 75, 3039234567, 'Calle 22, Ocaña', 'PORTERO'),
('Jaime', 'Fuentes', '1987-12-30', 36, 180, 74, 3041234567, 'Carrera 2, Pitalito', 'DEFENSA'),
('Tomás', 'Maya', '1990-08-28', 34, 178, 72, 3042234567, 'Avenida 99, Quibdó', 'MEDIAPUNTA'),
('Gerardo', 'Parra', '1993-07-22', 31, 183, 76, 3043234567, 'Calle 33, San Gil', 'CARRILERO'),
('Aníbal', 'Cortés', '1995-01-19', 29, 179, 73, 3044234567, 'Carrera 13, Tuluá', 'DELANTEROS');

select *from Jugadores;

INSERT INTO Equipo (NombreEquipo, FechaCreacion, Ciudad) VALUES
('Atlético Nacional', '1947-01-01', 'Medellín'),
('Millonarios', '1946-01-01', 'Bogotá'),
('América de Cali', '1927-01-01', 'Cali'),
('Independiente Santa Fe', '1941-01-01', 'Bogotá'),
('Deportivo Cali', '1912-01-01', 'Cali'),
('Junior', '1924-01-01', 'Barranquilla'),
('Once Caldas', '1961-01-01', 'Manizales'),
('Deportes Tolima', '1954-01-01', 'Ibagué'),
('Atlético Bucaramanga', '1949-01-01', 'Bucaramanga'),
('Cúcuta Deportivo', '1924-01-01', 'Cúcuta'),
('Envigado FC', '1989-01-01', 'Envigado'),
('Deportivo Pasto', '1949-01-01', 'Pasto'),
('Rionegro Águilas', '2016-01-01', 'Rionegro'),
('La Equidad', '2003-01-01', 'Bogotá'),
('Independiente Medellín', '1913-01-01', 'Medellín'),
('Once Caldas', '1961-01-01', 'Manizales'),
('Atlético Huila', '1990-01-01', 'Neiva'),
('Real Cartagena', '2003-01-01', 'Cartagena'),
('Cortuluá', '1967-01-01', 'Cortuluá'),
('Patriotas Boyacá', '2010-01-01', 'Tunja');


select *from Equipo;

INSERT INTO Campeonato (TipoCampeonato) VALUES 
('LIGA PROFESIONAL'),
('TORNEO ASCENSO'),
('COPA COLOMBIA'),
('COPA LIBERTADORES'),
('COPA SUDAMERICANA');


select *from Campeonato;


INSERT INTO Estadio (NombreEstadio, CiudadEstadio, DireccionEstadio) VALUES
('Estadio El Campín', 'Bogotá', 'Avenida de las Américas, Bogotá'),
('Estadio Metropolitano', 'Barranquilla', 'Calle 68, Barranquilla'),
('Estadio Atanasio Girardot', 'Medellín', 'Calle 50, Medellín'),
('Estadio Palmaseca', 'Cali', 'Calle 12, Cali'),
('Estadio La Independencia', 'Tunja', 'Carrera 15, Tunja'),
('Estadio Alfonso López', 'Bucaramanga', 'Calle 36, Bucaramanga'),
('Estadio El Campín', 'Bogotá', 'Calle 57, Bogotá'),
('Estadio Manuel Murillo Toro', 'Ibagué', 'Avenida Ferrocarril, Ibagué'),
('Estadio Hernán Ramírez Villegas', 'Pereira', 'Carrera 8, Pereira'),
('Estadio El Gran Estadio', 'Cúcuta', 'Calle 8, Cúcuta'),
('Estadio Jaraguay', 'Montería', 'Carrera 2, Montería'),
('Estadio Metropolitano de Techo', 'Bogotá', 'Carrera 80, Bogotá'),
('Estadio de Palmaseca', 'Cali', 'Calle 1, Cali'),
('Estadio Polideportivo Sur', 'Envigado', 'Calle 42, Envigado'),
('Estadio Olímpico Pascual Guerrero', 'Cali', 'Calle 2, Cali'),
('Estadio La Libertad', 'Pasto', 'Avenida 10, Pasto'),
('Estadio El Alcoraz', 'Manizales', 'Calle 25, Manizales'),
('Estadio Los Zorros', 'Cali', 'Calle 44, Cali'),
('Estadio El Libertador', 'Valledupar', 'Calle 14, Valledupar'),
('Estadio El Tigrillo', 'Bello', 'Calle 30, Bello');


select *from Estadio;


INSERT INTO Arbitro (NombreArbitro, ApellidosArbitro, FechaNacimiento, EdadArbitro, CelularArbitro, DireccionArbitro, EmailArbitro, TipoArbitro) VALUES
('Carlos', 'González', 1980, 44, 3001234567, 'Calle 1, Bogotá', 'carlos.gonzalez@email.com', 'JUEZ DE CENTRAL'),
('Juan', 'Martínez', 1985, 39, 3002234567, 'Calle 2, Medellín', 'juan.martinez@email.com', 'JUEZ DE LÍNEA1'),
('Andrés', 'López', 1990, 34, 3003234567, 'Calle 3, Cali', 'andres.lopez@email.com', 'JUEZ DE LÍNEA2'),
('David', 'Rodríguez', 1983, 41, 3004234567, 'Calle 4, Barranquilla', 'david.rodriguez@email.com', 'JUEZ DE CENTRAL'),
('Jorge', 'Torres', 1988, 36, 3005234567, 'Calle 5, Bucaramanga', 'jorge.torres@email.com', 'JUEZ DE SUPLENTE'),
('Luis', 'Suárez', 1992, 32, 3006234567, 'Calle 6, Cartagena', 'luis.suarez@email.com', 'JUEZ DE LÍNEA1'),
('Miguel', 'Álvarez', 1981, 43, 3007234567, 'Calle 7, Cúcuta', 'miguel.alvarez@email.com', 'JUEZ DE LÍNEA2'),
('Santiago', 'Díaz', 1995, 29, 3008234567, 'Calle 8, Manizales', 'santiago.diaz@email.com', 'JUEZ DE CENTRAL'),
('Felipe', 'Ramírez', 1987, 37, 3009234567, 'Calle 9, Santa Marta', 'felipe.ramirez@email.com', 'JUEZ DE SUPLENTE'),
('Oscar', 'Morales', 1989, 35, 3001234877, 'Calle 10, Pasto', 'oscar.morales@email.com', 'JUEZ DE LÍNEA1'),
('Daniel', 'Ortiz', 1993, 31, 3011234567, 'Calle 11, Pereira', 'daniel.ortiz@email.com', 'JUEZ DE LÍNEA2'),
('Cristian', 'López', 1991, 33, 3012234567, 'Calle 12, Ibagué', 'cristian.lopez@email.com', 'JUEZ DE CENTRAL'),
('José', 'Hernández', 1986, 38, 3013234567, 'Calle 13, Neiva', 'jose.hernandez@email.com', 'JUEZ DE SUPLENTE'),
('Mario', 'Ruiz', 1984, 40, 3014234567, 'Calle 14, Villavicencio', 'mario.ruiz@email.com', 'JUEZ DE LÍNEA1'),
('Pablo', 'Cárdenas', 1994, 30, 3015234567, 'Calle 15, Quibdó', 'pablo.cardenas@email.com', 'JUEZ DE LÍNEA2'),
('Manuel', 'Salazar', 1982, 42, 3016234567, 'Calle 16, Cartagena', 'manuel.salazar@email.com', 'JUEZ DE CENTRAL'),
('Ricardo', 'Fernández', 1990, 34, 3017234567, 'Calle 17, Popayán', 'ricardo.fernandez@email.com', 'JUEZ DE SUPLENTE'),
('Adrián', 'Serrano', 1988, 36, 3018234567, 'Calle 18, Armenia', 'adrian.serrano@email.com', 'JUEZ DE LÍNEA1'),
('Jonathan', 'Mendoza', 1985, 39, 3019234567, 'Calle 19, Buenaventura', 'jonathan.mendoza@email.com', 'JUEZ DE LÍNEA2'),
('Fernando', 'Vargas', 1981, 43, 3021234567, 'Calle 20, Florencia', 'fernando.vargas@email.com', 'JUEZ DE CENTRAL'),
('Sebastián', 'Rivera', 1992, 32, 3022234567, 'Calle 21, Sincelejo', 'sebastian.rivera@email.com', 'JUEZ DE SUPLENTE'),
('Ramiro', 'Cruz', 1983, 41, 3023234567, 'Calle 22, Valledupar', 'ramiro.cruz@email.com', 'JUEZ DE LÍNEA1'),
('Álvaro', 'Moreno', 1990, 34, 3024234567, 'Calle 23, Duitama', 'alvaro.moreno@email.com', 'JUEZ DE LÍNEA2'),
('Gabriel', 'Acosta', 1986, 38, 3025234567, 'Calle 24, Chía', 'gabriel.acosta@email.com', 'JUEZ DE CENTRAL'),
('Raúl', 'Gil', 1989, 35, 3026234567, 'Calle 25, Yopal', 'raul.gil@email.com', 'JUEZ DE SUPLENTE'),
('Camilo', 'Castaño', 1993, 31, 3027234567, 'Calle 26, Ipiales', 'camilo.castano@email.com', 'JUEZ DE LÍNEA1'),
('Alejandro', 'Muñoz', 1982, 42, 3028234567, 'Calle 27, Facatativá', 'alejandro.munoz@email.com', 'JUEZ DE LÍNEA2'),
('Mauricio', 'Peña', 1995, 29, 3029234567, 'Calle 28, Girardot', 'mauricio.pena@email.com', 'JUEZ DE CENTRAL'),
('Eduardo', 'Orozco', 1984, 40, 3031234567, 'Calle 29, Cartago', 'eduardo.orozco@email.com', 'JUEZ DE SUPLENTE'),
('Esteban', 'Navarro', 1990, 34, 3032234567, 'Calle 30, Soacha', 'esteban.navarro@email.com', 'JUEZ DE LÍNEA1');

select *from Arbitro;


INSERT INTO Plantilla (ClasePlantilla, idJugador, idEquipo) VALUES
('A', 1, 1),
('B', 2, 1),
('C', 3, 1),
('A', 4, 2),
('B', 5, 2),
('C', 6, 2),
('A', 7, 3),
('B', 8, 3),
('C', 9, 3),
('A', 10, 4),
('B', 11, 4),
('C', 12, 4),
('A', 13, 5),
('B', 14, 5),
('C', 15, 5),
('A', 16, 6),
('B', 17, 6),
('C', 18, 6),
('A', 19, 7),
('B', 20, 7);

select *from Plantilla;

INSERT INTO Partido (idEstadio, idEquipo, idCampeonato, idArbitro, Hora, Resultado, Goles) VALUES
(1, 1, 1, 1, 1800, NULL, NULL),
(2, 2, 2, 2, 1900, NULL, NULL),
(3, 3, 3, 3, 2000, NULL, NULL),
(4, 4, 4, 4, 2100, NULL, NULL),
(5, 5, 5, 5, 2200, NULL, NULL),
(6, 6, 1, 6, 2300, NULL, NULL),
(7, 7, 2, 7, 2400, NULL, NULL),
(8, 8, 3, 8, 2500, NULL, NULL),
(9, 9, 4, 9, 2600, NULL, NULL),
(10, 10, 5, 10, 2700, NULL, NULL),
(11, 11, 1, 11, 2800, NULL, NULL),
(12, 12, 2, 12, 2900, NULL, NULL),
(13, 13, 3, 13, 3000, NULL, NULL),
(14, 14, 4, 14, 3100, NULL, NULL),
(15, 15, 5, 15, 3200, NULL, NULL),
(16, 16, 1, 16, 3300, NULL, NULL),
(17, 17, 2, 17, 3400, NULL, NULL),
(18, 18, 3, 18, 3500, NULL, NULL),
(19, 19, 4, 19, 3600, NULL, NULL),
(20, 20, 5, 20, 3700, NULL, NULL),
(1, 1, 1, 21, 1800, NULL, NULL),
(2, 2, 2, 22, 1900, NULL, NULL),
(3, 3, 3, 23, 2000, NULL, NULL),
(4, 4, 4, 24, 2100, NULL, NULL),
(5, 5, 5, 25, 2200, NULL, NULL),
(6, 6, 1, 26, 2300, NULL, NULL),
(7, 7, 2, 27, 2400, NULL, NULL),
(8, 8, 3, 28, 2500, NULL, NULL),
(9, 9, 4, 29, 2600, NULL, NULL),
(10, 10, 5, 30, 2700, NULL, NULL),
(11, 11, 1, 1, 2800, NULL, NULL),
(12, 12, 2, 2, 2900, NULL, NULL),
(13, 13, 3, 3, 3000, NULL, NULL),
(14, 14, 4, 4, 3100, NULL, NULL),
(15, 15, 5, 5, 3200, NULL, NULL),
(16, 16, 1, 6, 3300, NULL, NULL),
(17, 17, 2, 7, 3400, NULL, NULL),
(18, 18, 3, 8, 3500, NULL, NULL),
(19, 19, 4, 9, 3600, NULL, NULL),
(20, 20, 5, 10, 3700, NULL, NULL),
(1, 1, 1, 11, 1800, NULL, NULL),
(2, 2, 2, 12, 1900, NULL, NULL),
(3, 3, 3, 13, 2000, NULL, NULL),
(4, 4, 4, 14, 2100, NULL, NULL),
(5, 5, 5, 15, 2200, NULL, NULL),
(6, 6, 1, 16, 2300, NULL, NULL),
(7, 7, 2, 17, 2400, NULL, NULL),
(8, 8, 3, 18, 2500, NULL, NULL),
(9, 9, 4, 19, 2600, NULL, NULL),
(10, 10, 5, 20, 2700, NULL, NULL);

select *from Partido;