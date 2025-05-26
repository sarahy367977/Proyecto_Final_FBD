--pruebas y consultas  de datos 


-- usuarios
insert into usuario (nombre, email, contrasena)
values ('usuario prueba', 'test@example.com', 'password123');

insert into usuario (nombre, email, contrasena)
values ('usuario 1', 'user1@test.com', 'clave1234');

-- artistas
insert into artista (nombre, pais, genero_principal)
values ('artista prueba', 'méxico', 'rock');

insert into artista (nombre, pais, genero_principal)
values ('artista prueba', 'méxico', 'jazz');

-- géneros
insert into genero (id_genero, nombre) values (5, 'rock');
insert into genero (id_genero, nombre) values (3, 'ranchera');
insert into genero (nombre) values ('pop');

-- álbumes
insert into album (titulo, anio_lanzamiento, id_artista)
values ('álbum3', 2025,
    (select id_artista from artista where nombre = 'artista prueba' and rownum = 1));

insert into album (titulo, anio_lanzamiento, id_artista)
values ('álbum 4', to_date('01-01-2025', 'dd-mm-yyyy'), 
        (select id_artista from artista where nombre = 'artista prueba' and rownum = 1));

-- canciones
insert into cancion (titulo, duracion, id_album, id_genero)
select 'mi canción de prueba2', 225, a.id_album, g.id_genero
from album a, genero g
where a.titulo = 'álbum prueba' and g.nombre = 'rock' and rownum = 1;

insert into cancion (titulo, id_album, id_genero, duracion)
values ('canción sin álbum', null, (select id_genero from genero where nombre = 'rock'), 180);

insert into cancion (titulo, id_album, id_genero, duracion)
values ('canción', 1001, (select id_genero from genero where nombre = 'rock'), 180);

insert into cancion (titulo, id_album, id_genero, duracion)
values ('sin álbum', 1004, (select id_genero from genero where nombre = 'rock'), 180);

insert into cancion (titulo, id_album, id_genero, duracion)
values ('canción sin álbum', 1003, (select id_genero from genero where nombre = 'jazz'), 180);

insert into cancion (titulo, id_album, id_genero, duracion)
values ('mi canción de prueba2', 1005, (select id_genero from genero where nombre = 'rock'), 180);

-- playlists
insert into playlist (nombre, id_usuario)
values ('mi playlist favorita', (select id_usuario from usuario where nombre = 'usuario 1' and rownum = 1));

insert into playlist (nombre, id_usuario)
values ('mi playlist', (select id_usuario from usuario where nombre = 'usuario 1' and rownum = 1));

insert into playlist (nombre, id_usuario)
values ('mi playlist2', (select id_usuario from usuario where nombre = 'usuario 1' and rownum = 1));

-- reproducciones
insert into reproduccion (fecha_hora, id_usuario, id_cancion)
values (sysdate,
  (select id_usuario from usuario where nombre = 'usuario 1' and rownum = 1),
  (select id_cancion from cancion where titulo = 'mi canción de prueba2' and rownum = 1));

-- playlist_cancion
insert into playlist_cancion (fecha_agregado, id_playlist, id_cancion)
values (sysdate,
  (select id_playlist from playlist where nombre = 'mi playlist2' and rownum = 1),
  (select id_cancion from cancion where titulo = 'mi canción de prueba2' and rownum = 1));

-- valoraciones
insert into valoracion (puntuacion, comentario, id_usuario, id_cancion)
values (
  5, '¡excelente canción!',
  (select id_usuario from usuario where nombre = 'usuario 1' and rownum = 1),
  (select id_cancion from cancion where titulo = 'mi canción de prueba2' and rownum = 1));


select * from usuario;
select * from artista;
select * from genero;
select * from album;
select * from cancion;
select * from playlist;
select * from playlist_cancion;
select * from reproduccion;
select * from valoracion;

--Eliminacion

delete from valoracion where id_usuario in (
 select id_usuario from usuario where nombre = 'usuario 1');

delete from playlist
where nombre = 'mi playlist favorita'
  and id_usuario = (select id_usuario from usuario where nombre = 'usuario 1');

delete from cancion where titulo = 'canción sin álbum';

delete from genero where nombre = 'jazz';

delete from album where titulo = 'álbum prueba';

delete from artista where nombre = 'artista_prueba';

delete from usuario where nombre = 'juan perez';

commit;
