--generos, artistas, plylist _canciones
SET DEFINE OFF;
--Generos musicales 
insert into genero (nombre) values ('Pop');
insert into genero (nombre) values ('Rock');
insert into genero (nombre) values ('Hip hop');
insert into genero (nombre) values ('Electrónica');
insert into genero (nombre) values ('R&B');
insert into genero (nombre) values ('Reggaetón');
insert into genero (nombre) values ('Jazz');
insert into genero (nombre) values ('Clásica');
insert into genero (nombre) values ('Salsa');
insert into genero (nombre) values ('Metal');
insert into genero (nombre) values ('K-pop');
insert into genero (nombre) values ('Corridos');
insert into genero (nombre) values ('Sierreño');
insert into genero (nombre) values ('Banda');
insert into genero (nombre) values ('Cumbia');
insert into genero (nombre) values ('Bolero');
insert into genero (nombre) values ('Folk');
insert into genero (nombre) values ('Indie');
insert into genero (nombre) values ('Reggae');
insert into genero (nombre) values ('Blues');

SET DEFINE ON;
--Artistas
insert into artista (nombre, pais, genero_principal)
    values ('Bad Bunny', 'Puerto Rico', 'Reggaetón');

insert into artista (nombre, pais, genero_principal)
    values ('Los Tigres del Norte', 'México', 'Norteño');

insert into artista (nombre, pais, genero_principal)
    values ('Virlán García', 'México', 'Corridos');
    
insert into artista (nombre, pais, genero_principal)
    values ('Alfredo Olivas', 'México', 'Corridos');

insert into artista (nombre, pais, genero_principal)
    values ('Julión Álvarez', 'México', 'Banda');
    
insert into artista (nombre, pais, genero_principal)
    values ('Los Ángeles Azules', 'México', 'Cumbia');

insert into artista (nombre, pais, genero_principal)
    values ('Los Tucanes de Tijuana', 'México', 'Norteño');

insert into artista (nombre, pais, genero_principal)
    values ('Chalino Sánchez', 'México', 'Corridos');
    
insert into artista (nombre, pais, genero_principal)
    values ('Los Cadetes de Linares', 'México', 'Norteño');

insert into artista (nombre, pais, genero_principal)
    values ('Los Tigrillos', 'México', 'Sierreño');
    
insert into artista (nombre, pais, genero_principal)
    values ('Los Tigrillos', 'México', 'Sierreño');

insert into artista (nombre, pais, genero_principal)
    values ('Taylor Swift', 'Estados Unidos', 'Pop');

insert into artista (nombre, pais, genero_principal)
    values ('The Beatles', 'Reino Unido', 'Rock');
    
insert into artista (nombre, pais, genero_principal)
    values ('Mozart', 'Austria', 'Clásica');

insert into artista (nombre, pais, genero_principal)
    values ('Daft Punk', 'Francia', 'Electrónica');
--
insert into artista (nombre, pais, genero_principal)
    values ('Kendrick Lamar', 'Estados Unidos', 'Hip Hop');

insert into artista (nombre, pais, genero_principal)
    values ('BTS', 'Corea del Sur', 'K-pop');

insert into artista (nombre, pais, genero_principal)
    values ('BLACKPINK', 'Corea del Sur', 'K-pop');
    
insert into artista (nombre, pais, genero_principal)
    values ('PLAVE', 'Corea del Sur', 'K-pop');

insert into artista (nombre, pais, genero_principal)
    values ('Stray Kids', 'Corea del Sur', 'K-pop');
    
insert into artista (nombre, pais, genero_principal)
    values ('Metallica', 'Estados Unidos', 'Metal');

insert into artista (nombre, pais, genero_principal)
    values ('Shakira', 'Colombia', 'Pop');

insert into artista (nombre, pais, genero_principal)
    values ('Soda Stereo', 'Argentina', 'Rock');
    
insert into artista (nombre, pais, genero_principal)
    values ('Los Perdidos de Sinaloa', 'México', 'Corridos');

insert into artista (nombre, pais, genero_principal)
    values ('J-Hope', 'Corea del Sur', 'Electrónica');
    
-- usuarios 
insert into usuario (nombre, email, contrasena) 
    values ('Carlos Pérez', 'carlos@email.com', 'Pass1234');
    
insert into usuario (nombre, email, contrasena) 
    values ('Ana Gómez', 'ana.g@mail.com', 'Ana2021!');
    
insert into usuario (nombre, email, contrasena) 
    values ('Luis Martínez', 'luis.mtz@correo.com', 'Luis1234');
    
insert into usuario (nombre, email, contrasena)     
    values ('María López', 'maria.l@email.com', 'Maria123');
    
insert into usuario (nombre, email, contrasena) 
    values ('Juan Díaz', 'juan.diaz@mail.com', 'Juan2020');
    
insert into usuario (nombre, email, contrasena) 
    values ('Sofía Kim', 'sofia.k@mail.com', 'Sofi1234');
    
insert into usuario (nombre, email, contrasena) 
    values ('Minji Park', 'minji.p@email.com', 'Minji123');
    
insert into usuario (nombre, email, contrasena) 
    values ('Alejandro Ruiz', 'ale.ruiz@correo.com', 'Ale1234!');
    
insert into usuario (nombre, email, contrasena) 
    values ('Fernanda Lee', 'fer.lee@mail.com', 'Fer12345');
    
insert into usuario (nombre, email, contrasena) 
    values ('Ricardo Sánchez', 'ricky.s@email.com', 'Ricky123');
    
insert into usuario (nombre, email, contrasena) 
    values ('Daniela Choi', 'dani.choi@mail.com', 'Dani1234');
    
insert into usuario (nombre, email, contrasena) 
    values ('Javier Kim', 'javi.kim@email.com', 'Javi1234');
    
insert into usuario (nombre, email, contrasena) 
    values ('Patricia Lim', 'paty.lim@mail.com', 'Paty1234');
    
insert into usuario (nombre, email, contrasena) 
    values ('Roberto Yang', 'roberto.y@email.com', 'Robert12');
    
insert into usuario (nombre, email, contrasena) 
    values ('Lucía Wong', 'lu.wong@mail.com', 'Lucia123');
    
insert into usuario (nombre, email, contrasena) 
    values ('Oscar Torres', 'oscar.t@email.com', 'Oscar12!');
    
insert into usuario (nombre, email, contrasena) 
    values ('Adriana Park', 'adri.park@mail.com', 'Adri1234');
    
insert into usuario (nombre, email, contrasena) 
    values ('Gerardo Moon', 'gera.moon@email.com', 'Gera1234');
    
insert into usuario (nombre, email, contrasena)     
    values ('Valeria Sun', 'vale.sun@mail.com', 'Vale1234');
    
insert into usuario (nombre, email, contrasena)     
    values ('Héctor Star', 'hector.s@email.com', 'Hector12');
    
-- Álbumes

insert into album (titulo, anio_lanzamiento, id_artista) 
values ('Map of the Soul: 7', TO_DATE('19-02-2020', 'DD-MM-YYYY'), 
        (select id_artista from artista where nombre = 'BTS'));

insert into album (titulo, anio_lanzamiento, id_artista) 
values ('THE ALBUM', TO_DATE('02-10-2020', 'DD-MM-YYYY'),
        (select id_artista from artista where nombre = 'BLACKPINK'));

insert into album (titulo, anio_lanzamiento, id_artista)
values ('ASTERUM: The Shape of Things', TO_DATE('11-05-2023', 'DD-MM-YYYY'),
        (select id_artista from artista where nombre = 'PLAVE'));

insert into album (titulo, anio_lanzamiento, id_artista) 
values ('MAXIDENT', TO_DATE('07-10-2022', 'DD-MM-YYYY'), 
        (select id_artista from artista where nombre = 'Stray Kids'));

insert into album (titulo, anio_lanzamiento, id_artista)
values ('Proof', TO_DATE('10-06-2022', 'DD-MM-YYYY'), 
        (select id_artista from artista where nombre = 'BTS'));

insert into album (titulo, anio_lanzamiento, id_artista) 
values ('Génesis', TO_DATE('15-07-2022', 'DD-MM-YYYY'), 
        (select id_artista from artista where nombre = 'Virlán García'));

insert into album (titulo, anio_lanzamiento, id_artista)
values ('El Patrón', TO_DATE('01-01-2014', 'DD-MM-YYYY'),
        (select id_artista from artista where nombre = 'Alfredo Olivas'));

insert into album (titulo, anio_lanzamiento, id_artista) 
values ('Tu Amigo Nada Más', TO_DATE('01-01-2013', 'DD-MM-YYYY'),
        (select id_artista from artista where nombre = 'Julión Álvarez'));

insert into album (titulo, anio_lanzamiento, id_artista) 
values ('Corridos de Alto Calibre', TO_DATE('01-01-2019', 'DD-MM-YYYY'),
        (select id_artista from artista where nombre = 'Los Perdidos de Sinaloa'));

insert into album (titulo, anio_lanzamiento, id_artista) 
values ('Recordando a Chalino', TO_DATE('01-01-1995', 'DD-MM-YYYY'),
        (select id_artista from artista where nombre = 'Chalino Sánchez'));

insert into album (titulo, anio_lanzamiento, id_artista)
values ('Un Verano Sin Ti', TO_DATE('06-05-2022', 'DD-MM-YYYY'),
        (select id_artista from artista where nombre = 'Bad Bunny'));

insert into album (titulo, anio_lanzamiento, id_artista)
values ('El Dorado', TO_DATE('26-05-2017', 'DD-MM-YYYY'),
        (select id_artista from artista where nombre = 'Shakira'));

insert into album (titulo, anio_lanzamiento, id_artista)
values ('Jack In The Box', TO_DATE('15-07-2022', 'DD-MM-YYYY'),
        (select id_artista from artista where nombre = 'J-Hope'));

insert into album (titulo, anio_lanzamiento, id_artista)
values ('Cómo Te Voy a Olvidar', TO_DATE('01-01-1996', 'DD-MM-YYYY'), 
        (select id_artista from artista where nombre = 'Los Ángeles Azules'));

insert into album (titulo, anio_lanzamiento, id_artista)
values ('Jefe de Jefes', TO_DATE('01-01-1997', 'DD-MM-YYYY'),
        (select id_artista from artista where nombre = 'Los Tucanes de Tijuana'));

insert into album (titulo, anio_lanzamiento, id_artista)
values ('Midnights', TO_DATE('21-10-2022', 'DD-MM-YYYY'),
        (select id_artista from artista where nombre = 'Taylor Swift'));

insert into album (titulo, anio_lanzamiento, id_artista)
values ('Abbey Road', TO_DATE('26-09-1969', 'DD-MM-YYYY'),
        (select id_artista from artista where nombre = 'The Beatles'));

insert into album (titulo, anio_lanzamiento, id_artista) 
values ('Random Access Memories', TO_DATE('17-05-2013', 'DD-MM-YYYY'),
        (select id_artista from artista where nombre = 'Daft Punk'));

insert into album (titulo, anio_lanzamiento, id_artista) 
values ('DAMN.', TO_DATE('14-04-2017', 'DD-MM-YYYY'),
        (select id_artista from artista where nombre = 'Kendrick Lamar'));

insert into album (titulo, anio_lanzamiento, id_artista)
values ('Master of Puppets', TO_DATE('03-03-1986', 'DD-MM-YYYY'), 
        (select id_artista from artista where nombre = 'Metallica'));

insert into album (titulo, anio_lanzamiento, id_artista) 
values ('Canción Animal', TO_DATE('01-01-1990', 'DD-MM-YYYY'), 
        (select id_artista from artista where nombre = 'Soda Stereo'));

insert into album (titulo, anio_lanzamiento, id_artista)
values ('Sinfonía No. 40', TO_DATE('01-01-1788', 'DD-MM-YYYY'), 
        (select id_artista from artista where nombre = 'Mozart'));

insert into album (titulo, anio_lanzamiento, id_artista) 
values ('Puros Corridos Macizos', TO_DATE('01-01-2005', 'DD-MM-YYYY'), 
        (select id_artista from artista where nombre = 'Los Tigres del Norte'));

insert into album (titulo, anio_lanzamiento, id_artista)
values ('Pa'' Que Sientas Lo Que Siento', TO_DATE('01-01-2018', 'DD-MM-YYYY'),
        (select id_artista from artista where nombre = 'Los Plebes del Rancho'));

insert into album (titulo, anio_lanzamiento, id_artista)
values ('Tributo a Chalino', TO_DATE('01-01-2008', 'DD-MM-YYYY'),
        (select id_artista from artista where nombre = 'Los Tigrillos' and ROWNUM = 1));    


--canciones
insert into cancion (titulo, id_album, id_genero, duracion) 
     values ('Dynamite', (select id_album from album where titulo = 'Map of the Soul: 7'),
    (select id_genero from genero where nombre = 'K-pop'), 199);
   
insert into cancion (titulo, id_album, id_genero, duracion) 
    values ('Butter', (select id_album from album where titulo = 'Map of the Soul: 7'), 
    (select id_genero from genero where nombre = 'K-pop'), 164);
   
 insert into cancion (titulo, id_album, id_genero, duracion) 
    values ('How You Like That', (select id_album from album where titulo = 'THE ALBUM'),
    (select id_genero from genero where nombre = 'K-pop'), 182);
   
insert into cancion (titulo, id_album, id_genero, duracion)
    values ('Lovesick Girls', (select id_album from album where titulo = 'THE ALBUM'),
    (select id_genero from genero where nombre = 'K-pop'), 193);
   
insert into cancion (titulo, id_album, id_genero, duracion)
    values ('Wait for You', (select id_album from album where titulo = 'ASTERUM: The Shape of Things'), 
    (select id_genero from genero where nombre = 'K-pop'), 205);
   
insert into cancion (titulo, id_album, id_genero, duracion)
    values ('The 6th Summer', (select id_album from album where titulo = 'ASTERUM: The Shape of Things'),
    (select id_genero from genero where nombre = 'K-pop'), 198);
   
insert into cancion (titulo, id_album, id_genero, duracion) 
    values ('Case 143', (select id_album from album where titulo = 'MAXIDENT'), 
    (select id_genero from genero where nombre = 'K-pop'), 213);
   
insert into cancion (titulo, id_album, id_genero, duracion)
    values ('Maniac', (select id_album from album where titulo = 'MAXIDENT'), 
    (select id_genero from genero where nombre = 'K-pop'), 187);
   
insert into cancion (titulo, id_album, id_genero, duracion) 
    values ('Yet To Come', (select id_album from album where titulo = 'Proof'),
    (select id_genero from genero where nombre = 'K-pop'), 189);
   
insert into cancion (titulo, id_album, id_genero, duracion) 
    values ('Run BTS', (select id_album from album where titulo = 'Proof'),
    (select id_genero from genero where nombre = 'K-pop'), 213);

insert into cancion (titulo, id_album, id_genero, duracion)
    values ('El Güero', (select id_album from album where titulo = 'Génesis'), 
    (select id_genero from genero where nombre = 'Corridos'), 187);
   
insert into cancion (titulo, id_album, id_genero, duracion)
    values ('El Karma', (select id_album from album where titulo = 'Génesis'), 
    (select id_genero from genero where nombre = 'Corridos'), 203);
   
insert into cancion (titulo, id_album, id_genero, duracion)
    values ('El Paciente', (select id_album from album where titulo = 'El Patrón'),
    (select id_genero from genero where nombre = 'Corridos'), 195);
   
insert into cancion (titulo, id_album, id_genero, duracion)
    values ('Tus Lágrimas', (select id_album from album where titulo = 'El Patrón'),
    (select id_genero from genero where nombre = 'Corridos'), 213);
   
insert into cancion (titulo, id_album, id_genero, duracion) 
    values ('Te Hubieras Ido Antes', (select id_album from album where titulo = 'Tu Amigo Nada Más'),
    (select id_genero from genero where nombre = 'Banda'), 181);
   
insert into cancion (titulo, id_album, id_genero, duracion)
    values ('Olvídame', (select id_album from album where titulo = 'Tu Amigo Nada Más'), 
    (select id_genero from genero where nombre = 'Banda'), 193);
   
insert into cancion (titulo, id_album, id_genero, duracion) 
    values ('El de los Lentes Gucci', (select id_album from album where titulo = 'Corridos de Alto Calibre'),
    (select id_genero from genero where nombre = 'Corridos'), 176);
   
insert into cancion (titulo, id_album, id_genero, duracion)
    values ('El 09', (select id_album from album where titulo = 'Corridos de Alto Calibre'), 
    (select id_genero from genero where nombre = 'Corridos'), 189);
   
insert into cancion (titulo, id_album, id_genero, duracion)
    values ('Nieves de Enero', (select id_album from album where titulo = 'Recordando a Chalino'), 
    (select id_genero from genero where nombre = 'Corridos'), 201);
   
insert into cancion (titulo, id_album, id_genero, duracion) 
    values ('Alma Enamorada', (select id_album from album where titulo = 'Recordando a Chalino'), 
    (select id_genero from genero where nombre = 'Corridos'), 195);
   
insert into cancion (titulo, id_album, id_genero, duracion) 
    values ('Tití Me Preguntó', (select id_album from album where titulo = 'Un Verano Sin Ti'), 
    (select id_genero from genero where nombre = 'Reggaetón'), 242);
   
insert into cancion (titulo, id_album, id_genero, duracion) 
    values ('Ojitos Lindos', (select id_album from album where titulo = 'Un Verano Sin Ti'), 
    (select id_genero from genero where nombre = 'Reggaetón'), 258);
   
insert into cancion (titulo, id_album, id_genero, duracion) 
    values ('Chantaje', (select id_album from album where titulo = 'El Dorado'),
    (select id_genero from genero where nombre = 'Pop'), 193);
   
insert into cancion (titulo, id_album, id_genero, duracion)
    values ('La Bicicleta', (select id_album from album where titulo = 'El Dorado'),
    (select id_genero from genero where nombre = 'Pop'), 203);
   
insert into cancion (titulo, id_album, id_genero, duracion)
    values ('More', (select id_album from album where titulo = 'Jack In The Box'), 
    (select id_genero from genero where nombre = 'K-pop'), 187);
   
insert into cancion (titulo, id_album, id_genero, duracion)
    values ('Arson', (select id_album from album where titulo = 'Jack In The Box'),
    (select id_genero from genero where nombre = 'K-pop'), 209);
   
insert into cancion (titulo, id_album, id_genero, duracion)
    values ('Cómo Te Voy a Olvidar', (select id_album from album where titulo = 'Cómo Te Voy a Olvidar'), 
    (select id_genero from genero where nombre = 'Cumbia'), 183);
   
insert into cancion (titulo, id_album, id_genero, duracion)
    values ('Entrega de Amor', (select id_album from album where titulo = 'Cómo Te Voy a Olvidar'),
    (select id_genero from genero where nombre = 'Cumbia'), 176);
   
insert into cancion (titulo, id_album, id_genero, duracion) 
    values ('La Chona', (select id_album from album where titulo = 'Jefe de Jefes'),
    (select id_genero from genero where nombre = 'Banda'), 189);
   
insert into cancion (titulo, id_album, id_genero, duracion)
    values ('Secuestro de Amor', (select id_album from album where titulo = 'Jefe de Jefes'), 
    (select id_genero from genero where nombre = 'Banda'), 195);
   
insert into cancion (titulo, id_album, id_genero, duracion) 
    values ('Anti-Hero', (select id_album from album where titulo = 'Midnights'),
    (select id_genero from genero where nombre = 'Pop'), 201);
   
insert into cancion (titulo, id_album, id_genero, duracion)
    values ('Lavender Haze', (select id_album from album where titulo = 'Midnights'),
    (select id_genero from genero where nombre = 'Pop'), 202);
   
insert into cancion (titulo, id_album, id_genero, duracion) 
    values ('Come Together', (select id_album from album where titulo = 'Abbey Road'),
    (select id_genero from genero where nombre = 'Rock'), 259);
   
insert into cancion (titulo, id_album, id_genero, duracion)
    values ('Here Comes the Sun', (select id_album from album where titulo = 'Abbey Road'),
    (select id_genero from genero where nombre = 'Rock'), 185);
   
insert into cancion (titulo, id_album, id_genero, duracion)
    values ('Get Lucky', (select id_album from album where titulo = 'Random Access Memories'), 
    (select id_genero from genero where nombre = 'Electrónica'), 369);
   
insert into cancion (titulo, id_album, id_genero, duracion) 
    values ('Instant Crush', (select id_album from album where titulo = 'Random Access Memories'),
    (select id_genero from genero where nombre = 'Electrónica'), 337);
   
insert into cancion (titulo, id_album, id_genero, duracion)
    values ('HUMBLE.', (select id_album from album where titulo = 'DAMN.'), 
    (select id_genero from genero where nombre = 'Hip Hop'), 177);
   
insert into cancion (titulo, id_album, id_genero, duracion)
    values ('DNA.', (select id_album from album where titulo = 'DAMN.'),
    (select id_genero from genero where nombre = 'Hip Hop'), 185);
   
insert into cancion (titulo, id_album, id_genero, duracion) 
    values ('Master of Puppets', (select id_album from album where titulo = 'Master of Puppets'),
    (select id_genero from genero where nombre = 'Metal'), 515);
   
insert into cancion (titulo, id_album, id_genero, duracion)
    values ('Battery', (select id_album from album where titulo = 'Master of Puppets'), 
    (select id_genero from genero where nombre = 'Metal'), 312);
    
 --Playlist   
insert into playlist (nombre, id_usuario)
values ('K-pop Hits', (select id_usuario from usuario where nombre = 'Sofía Kim'));

insert into playlist (nombre, id_usuario)
values ('Corridos Perrones', (select id_usuario from usuario where nombre = 'Alejandro Ruiz'));

insert into playlist (nombre, id_usuario)
values ('Sierreño Vibes', (select id_usuario from usuario where nombre = 'Fernanda Lee'));

insert into playlist (nombre, id_usuario)
values ('BTS Essentials', (select id_usuario from usuario where nombre = 'Minji Park'));

insert into playlist (nombre, id_usuario)
values ('Éxitos Mexicanos', (select id_usuario from usuario where nombre = 'Ricardo Sánchez'));

insert into playlist (nombre, id_usuario)
values ('Workout Mix', (select id_usuario from usuario where nombre = 'Daniela Choi'));

insert into playlist (nombre, id_usuario)
values ('Relaxing K-pop', (select id_usuario from usuario where nombre = 'Javier Kim'));

insert into playlist (nombre, id_usuario)
values ('Fiesta Sierreña', (select id_usuario from usuario where nombre = 'Patricia Lim'));

insert into playlist (nombre, id_usuario)
values ('BLACKPINK Complete', (select id_usuario from usuario where nombre = 'Roberto Yang'));

insert into playlist (nombre, id_usuario)
values ('Corridos Clásicos', (select id_usuario from usuario where nombre = 'Lucía Wong'));

insert into playlist (nombre, id_usuario)
values ('PLAVE Discovery', (select id_usuario from usuario where nombre = 'Oscar Torres'));

insert into playlist (nombre, id_usuario)
values ('Regional Mix', (select id_usuario from usuario where nombre = 'Adriana Park'));

insert into playlist (nombre, id_usuario) 
values ('K-pop Bangers', (select id_usuario from usuario where nombre = 'Gerardo Moon'));

insert into playlist (nombre, id_usuario) 
values ('Virlán García Top', (select id_usuario from usuario where nombre = 'Valeria Sun'));

insert into playlist (nombre, id_usuario) 
values ('Stray Kids Playlist', (select id_usuario from usuario where nombre = 'Héctor Star'));

insert into playlist (nombre, id_usuario) 
values ('Julión Álvarez Favorites', (select id_usuario from usuario where nombre = 'Carlos Pérez'));

insert into playlist (nombre, id_usuario) 
values ('Chalino Sánchez Legacy', (select id_usuario from usuario where nombre = 'Ana Gómez'));

insert into playlist (nombre, id_usuario)
values ('Los Plebes del Rancho', (select id_usuario from usuario where nombre = 'Luis Martínez'));

insert into playlist (nombre, id_usuario)
values ('K-pop Ballads', (select id_usuario from usuario where nombre = 'María López'));

insert into playlist (nombre, id_usuario)
values ('Corridos Tumbados', (select id_usuario from usuario where nombre = 'Juan Díaz'));
    
    
    -- Relaciones entre playlists y canciones 
insert into playlist_cancion (id_playlist, id_cancion) values 
        ((select id_playlist from playlist where nombre = 'K-pop Hits'), 
         (select id_cancion from cancion where titulo = 'Dynamite'));
    
insert into playlist_cancion (id_playlist, id_cancion) values 
        ((select id_playlist from playlist where nombre = 'K-pop Hits'), 
         (select id_cancion from cancion where titulo = 'How You Like That'));
    
insert into playlist_cancion (id_playlist, id_cancion) values 
        ((select id_playlist from playlist where nombre = 'Corridos Perrones'), 
         (select id_cancion from cancion where titulo = 'El Güero'));
    
insert into playlist_cancion (id_playlist, id_cancion) values 
        ((select id_playlist from playlist where nombre = 'Corridos Perrones'), 
         (select id_cancion from cancion where titulo = 'El Paciente'));
    
insert into playlist_cancion (id_playlist, id_cancion) values 
        ((select id_playlist from playlist where nombre = 'Sierreño Vibes'), 
         (select id_cancion from cancion where titulo = 'Nieves de Enero'));
    
insert into playlist_cancion (id_playlist, id_cancion) values 
        ((select id_playlist from playlist where nombre = 'BTS Essentials'), 
         (select id_cancion from cancion where titulo = 'Dynamite'));
    
insert into playlist_cancion (id_playlist, id_cancion) values 
        ((select id_playlist from playlist where nombre = 'BTS Essentials'), 
         (select id_cancion from cancion where titulo = 'Butter'));

insert into playlist_cancion (id_playlist, id_cancion) values 
        ((select id_playlist from playlist where nombre = 'Éxitos Mexicanos'), 
         (select id_cancion from cancion where titulo = 'Cómo Te Voy a Olvidar'));
    
insert into playlist_cancion (id_playlist, id_cancion) values 
        ((select id_playlist from playlist where nombre = 'Éxitos Mexicanos'), 
         (select id_cancion from cancion where titulo = 'La Chona'));
    
insert into playlist_cancion (id_playlist, id_cancion) values 
        ((select id_playlist from playlist where nombre = 'Workout Mix'), 
         (select id_cancion from cancion where titulo = 'Dynamite'));
    
insert into playlist_cancion (id_playlist, id_cancion) values 
        ((select id_playlist from playlist where nombre = 'Workout Mix'), 
         (select id_cancion from cancion where titulo = 'HUMBLE.'));

insert into playlist_cancion (id_playlist, id_cancion) values 
        ((select id_playlist from playlist where nombre = 'K-pop Hits'), 
         (select id_cancion from cancion where titulo = 'More'));
    
insert into playlist_cancion (id_playlist, id_cancion) values 
        ((select id_playlist from playlist where nombre = 'Workout Mix'), 
         (select id_cancion from cancion where titulo = 'Arson'));

    
insert into playlist_cancion (id_playlist, id_cancion) values 
        ((select id_playlist from playlist where nombre = 'BLACKPINK Complete'), 
         (select id_cancion from cancion where titulo = 'How You Like That'));
    
insert into playlist_cancion (id_playlist, id_cancion) values 
        ((select id_playlist from playlist where nombre = 'Corridos Clásicos'), 
         (select id_cancion from cancion where titulo = 'Nieves de Enero'));
    
insert into playlist_cancion (id_playlist, id_cancion) values 
        ((select id_playlist from playlist where nombre = 'PLAVE Discovery'), 
         (select id_cancion from cancion where titulo = 'Wait for You'));
    
insert into playlist_cancion (id_playlist, id_cancion) values 
        ((select id_playlist from playlist where nombre = 'Regional Mix'), 
         (select id_cancion from cancion where titulo = 'El Güero'));

 --reproduccion  


insert into reproduccion (id_usuario, id_cancion) values 
        ((select id_usuario from usuario where nombre = 'Sofía Kim'), 
         (select id_cancion from cancion where titulo = 'Dynamite'));
    
insert into reproduccion (id_usuario, id_cancion) values 
        ((select id_usuario from usuario where nombre = 'Sofía Kim'), 
         (select id_cancion from cancion where titulo = 'How You Like That'));
    
insert into reproduccion (id_usuario, id_cancion) values 
        ((select id_usuario from usuario where nombre = 'Minji Park'), 
         (select id_cancion from cancion where titulo = 'Dynamite'));

insert into reproduccion (id_usuario, id_cancion) values 
        ((select id_usuario from usuario where nombre = 'Daniela Choi'), 
         (select id_cancion from cancion where titulo = 'More'));
    
insert into reproduccion (id_usuario, id_cancion) values 
        ((select id_usuario from usuario where nombre = 'Javier Kim'), 
         (select id_cancion from cancion where titulo = 'Arson'));
    
insert into reproduccion (id_usuario, id_cancion) values 
        ((select id_usuario from usuario where nombre = 'Alejandro Ruiz'), 
         (select id_cancion from cancion where titulo = 'El Güero'));
    
insert into reproduccion (id_usuario, id_cancion) values 
        ((select id_usuario from usuario where nombre = 'Alejandro Ruiz'), 
         (select id_cancion from cancion where titulo = 'El Paciente'));
    
insert into reproduccion (id_usuario, id_cancion) values 
        ((select id_usuario from usuario where nombre = 'Ricardo Sánchez'), 
         (select id_cancion from cancion where titulo = 'Nieves de Enero'));

insert into reproduccion (id_usuario, id_cancion) values 
        ((select id_usuario from usuario where nombre = 'Fernanda Lee'), 
         (select id_cancion from cancion where titulo = 'El Paciente'));


insert into reproduccion (id_usuario, id_cancion) values 
        ((select id_usuario from usuario where nombre = 'Patricia Lim'), 
         (select id_cancion from cancion where titulo = 'La Chona'));

insert into reproduccion (id_usuario, id_cancion) values 
        ((select id_usuario from usuario where nombre = 'Roberto Yang'), 
         (select id_cancion from cancion where titulo = 'Anti-Hero'));
    
insert into reproduccion (id_usuario, id_cancion) values 
        ((select id_usuario from usuario where nombre = 'Lucía Wong'), 
         (select id_cancion from cancion where titulo = 'Come Together'));

insert into reproduccion (id_usuario, id_cancion) values 
        ((select id_usuario from usuario where nombre = 'Oscar Torres'), 
         (select id_cancion from cancion where titulo = 'La Chona'));

insert into reproduccion (id_usuario, id_cancion) values 
        ((select id_usuario from usuario where nombre = 'Adriana Park'), 
         (select id_cancion from cancion where titulo = 'HUMBLE.'));
    
insert into reproduccion (id_usuario, id_cancion) values 
        ((select id_usuario from usuario where nombre = 'Gerardo Moon'), 
         (select id_cancion from cancion where titulo = 'Master of Puppets'));
    
insert into reproduccion (id_usuario, id_cancion) values 
        ((select id_usuario from usuario where nombre = 'Valeria Sun'), 
         (select id_cancion from cancion where titulo = 'Cómo Te Voy a Olvidar'));
    
insert into reproduccion (id_usuario, id_cancion) values 
        ((select id_usuario from usuario where nombre = 'Héctor Star'), 
         (select id_cancion from cancion where titulo = 'Arson'));

    
insert into reproduccion (id_usuario, id_cancion) values 
        ((select id_usuario from usuario where nombre = 'Carlos Pérez'), 
         (select id_cancion from cancion where titulo = 'Te Hubieras Ido Antes'));
    
insert into reproduccion (id_usuario, id_cancion) values 
        ((select id_usuario from usuario where nombre = 'Ana Gómez'), 
         (select id_cancion from cancion where titulo = 'Olvídame'));
    
insert into reproduccion (id_usuario, id_cancion) values 
        ((select id_usuario from usuario where nombre = 'Luis Martínez'), 
         (select id_cancion from cancion where titulo = 'Arson'));
         

--Valoraciones

insert into valoracion (puntuacion, comentario, id_cancion, id_usuario) values 
        (5, 'BTS nunca falla!', 
        (select id_cancion from cancion where titulo = 'Dynamite'), 
        (select id_usuario from usuario where nombre = 'Sofía Kim'));
    
insert into valoracion (puntuacion, comentario, id_cancion, id_usuario) 
values (4, 'Butter es muy pegajosa', 
        (select id_cancion from cancion where titulo = 'Butter'), 
        (select id_usuario from usuario where nombre = 'Minji Park'));
  
insert into valoracion (puntuacion, comentario, id_cancion, id_usuario)
values  (5, 'J-Hope demuestra su talento como solista', 
        (select id_cancion from cancion where titulo = 'More'), 
        (select id_usuario from usuario where nombre = 'Daniela Choi'));
    
insert into valoracion (puntuacion, comentario, id_cancion, id_usuario) 
values (5, 'Arson es una obra maestra del hip-hop', 
        (select id_cancion from cancion where titulo = 'Arson'), 
        (select id_usuario from usuario where nombre = 'Javier Kim'));

insert into valoracion (puntuacion, comentario, id_cancion, id_usuario) 
values (5, 'Puro corrido perrón', 
        (select id_cancion from cancion where titulo = 'El Güero'), 
        (select id_usuario from usuario where nombre = 'Alejandro Ruiz'));
    
insert into valoracion (puntuacion, comentario, id_cancion, id_usuario)
values (4, 'Letras que cuentan historias reales', 
        (select id_cancion from cancion where titulo = 'El Paciente'), 
        (select id_usuario from usuario where nombre = 'Ricardo Sánchez'));
    
insert into valoracion (puntuacion, comentario, id_cancion, id_usuario)
values  (5, 'La Chona nunca pasa de moda', 
        (select id_cancion from cancion where titulo = 'La Chona'), 
        (select id_usuario from usuario where nombre = 'Patricia Lim'));
    
insert into valoracion (puntuacion, comentario, id_cancion, id_usuario) 
values (4, 'Cumbia clásica que alegra el alma', 
        (select id_cancion from cancion where titulo = 'Cómo Te Voy a Olvidar'), 
        (select id_usuario from usuario where nombre = 'Valeria Sun'));

insert into valoracion (puntuacion, comentario, id_cancion, id_usuario)
values (5, 'Taylor Swift lo ha vuelto a hacer', 
        (select id_cancion from cancion where titulo = 'Anti-Hero'), 
        (select id_usuario from usuario where nombre = 'Roberto Yang'));
    
insert into valoracion (puntuacion, comentario, id_cancion, id_usuario)
values  (5, 'Clásico de los Beatles que nunca envejece', 
        (select id_cancion from cancion where titulo = 'Come Together'), 
        (select id_usuario from usuario where nombre = 'Lucía Wong'));
        
   commit;     
