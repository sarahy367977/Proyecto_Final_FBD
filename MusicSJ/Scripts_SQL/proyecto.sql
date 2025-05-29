CREATE TABLE Artista (
    id_artista INTEGER PRIMARY KEY,
    nombre VARCHAR2(50)NOT NULL,
    pais VARCHAR2(20),
    genero_principal VARCHAR2(20)
);

CREATE TABLE Genero (
    id_genero INTEGER PRIMARY KEY,
    nombre VARCHAR2(20)
);
--Tabla padre
CREATE TABLE Usuario (
    id_usuario INTEGER PRIMARY KEY,
    nombre VARCHAR2(20)NOT NULL,
    email VARCHAR2(50) NOT NULL,
    fecha_registro DATE NOT NULL,
    contrasena VARCHAR2(8) NOT NULL,
    CONSTRAINT ck_contrasena CHECK(
    REGEXP_LIKE (contrasena, '^(?=.*[A-Za-z])(?=.*[0-9])[A-Za-z0-9@#$!%*?&]{8}$') 
    ),
    CONSTRAINT chk_email CHECK (
    REGEXP_LIKE (email, '[a-zA-Z0-9._%-]+@[a-zA-Z0-9._%-]+\.[a-zA-Z]{2,4}')
    )
);

CREATE TABLE Album (
    id_album INTEGER PRIMARY KEY,
    titulo VARCHAR2(20) NOT NULL,
    anio_lanzamiento DATE,
    id_artista INTEGER,
    FOREIGN KEY (id_artista) REFERENCES Artista(id_artista) ON DELETE SET NULL
);

CREATE TABLE Cancion (
    id_cancion INTEGER PRIMARY KEY,
    titulo VARCHAR2(20),
    id_album INTEGER,
    id_genero INTEGER,
    duracion NUMBER,
    FOREIGN KEY (id_album) REFERENCES Album(id_album) ON DELETE SET NULL,
    FOREIGN KEY (id_genero) REFERENCES Genero(id_genero) ON DELETE SET NULL
);

CREATE TABLE Playlist (
    id_playlist INTEGER PRIMARY KEY,
    nombre VARCHAR2(20),
    fecha_creacion DATE,
    id_usuario INTEGER,
    FOREIGN KEY (id_usuario) REFERENCES Usuario(id_usuario) ON DELETE SET NULL
);

CREATE TABLE Playlist_cancion (
    fecha_agregado DATE,
    id_playlist INTEGER,
    id_cancion INTEGER,
    PRIMARY KEY (id_playlist, id_cancion),
    FOREIGN KEY (id_playlist) REFERENCES Playlist(id_playlist),
    FOREIGN KEY (id_cancion) REFERENCES Cancion(id_cancion)
);

CREATE TABLE Reproduccion (
    id_reproduccion INTEGER PRIMARY KEY,
    fecha_hora DATE,
    id_usuario INTEGER,
    id_cancion INTEGER,
    FOREIGN KEY (id_usuario) REFERENCES Usuario(id_usuario) ON DELETE SET NULL,
    FOREIGN KEY (id_cancion) REFERENCES Cancion(id_cancion) ON DELETE SET NULL
);

CREATE TABLE Valoracion (
    id_valoracion INTEGER PRIMARY KEY,
    puntuacion NUMBER(1) CHECK (puntuacion BETWEEN 1 AND 5),
    comentario VARCHAR2(500),
    id_cancion INTEGER,
    id_usuario INTEGER,
    FOREIGN KEY (id_cancion) REFERENCES Cancion(id_cancion) ON DELETE SET NULL,
    FOREIGN KEY (id_usuario) REFERENCES Usuario(id_usuario) ON DELETE SET NULL
);
ALTER TABLE valoracion ADD CONSTRAINT unique_usuario_cancion UNIQUE(id_usuario, id_cancion);
ALTER TABLE playlist  MODIFY nombre VARCHAR2(100);
ALTER TABLE Album MODIFY (anio_lanzamiento DATE)
ALTER TABLE album DROP COLUMN anio_lanzamiento;
ALTER TABLE album ADD anio_lanzamiento NUMBER(4);
ALTER TABLE Cancion MODIFY titulo VARCHAR2(50);
ALTER TABLE Usuario ADD CONSTRAINT ck_contrasena CHECK (LENGTH(contrasena) >= 8);



SELECT constraint_name, search_condition 
FROM user_constraints 
WHERE table_name = 'USUARIO' AND constraint_type = 'C';
ALTER TABLE Usuario DROP CONSTRAINT ck_contrasena;