//Configuracion tablas: Delete cascade 
alter table playlist_cancion drop constraint  SYS_C008429;

SELECT constraint_name
FROM user_constraints
WHERE table_name = 'PLAYLIST'
AND constraint_type = 'R';

alter table playlist drop constraint SYS_C008427;

alter table playlist 
add constraint FK_playlist_usuario
foreign key (id_usuario)references usuario(id_usuario) on delete cascade; 

SELECT constraint_name
FROM user_constraints
WHERE table_name = 'PLAYLIST_CANCION' AND constraint_type = 'R';

alter table playlist_cancion drop constraint  SYS_C00842;
alter table playlist_cancion drop constraint  SYS_C008430;

alter table playlist_cancion 
add constraint FK_playlist_cancion_playlist
foreign key (id_playlist)references playlist(id_playlist) on delete cascade;

alter table playlist_cancion 
add constraint FK_playlist_cancion_cancion
foreign key (id_cancion)references cancion(id_cancion) on delete cascade;

SELECT constraint_name
FROM user_constraints
WHERE table_name = 'VALORACION' AND constraint_type = 'R';

alter table valoracion drop constraint  SYS_C008436;
alter table valoracion drop constraint  SYS_C008437;

alter table valoracion
add constraint FK_valoracion_usuario
foreign key (id_usuario)references usuario(id_usuario) on delete cascade;

alter table valoracion
add constraint FK_valoracion_cancion
foreign key (id_cancion)references cancion (id_cancion) on delete cascade;


