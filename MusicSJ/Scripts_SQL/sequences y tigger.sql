--sequences y trigger
create sequence seq_usuario start with 1000 increment by 1 minvalue 1000 maxvalue 9999 nocache nocycle;

create or replace trigger usuario_id
before insert on usuario
for each ROW 
 when(new.id_usuario is null)
begin
select seq_usuario.NEXTVAL into :new.id_usuario from dual;
 if :new.fecha_registro is null then :new.fecha_registro := sysdate;
end if;
end;
/



create sequence seq_album start with 1000 increment by 1 minvalue 1000 maxvalue 9999 nocache nocycle;

create or replace trigger album_id
before insert on album
for each ROW 
begin
if :new.id_album is null then 
select seq_album.nextval into :new.id_album from dual;
end if;
end;
/



create sequence seq_artista start with 1000 increment by 1 minvalue 1000 maxvalue 9999 nocache nocycle;

create or replace trigger artista_id
before insert on artista
for each ROW 
begin
if :new.id_artista is null then 
select seq_artista.nextval into :new.id_artista from dual;
end if;
end;
/


create sequence seq_cancion start with 1000 increment by 1 minvalue 1000 maxvalue 9999 nocache nocycle;

create or replace trigger cancion_id
before insert on cancion
for each row
begin
if :new.id_cancion is null then 
select seq_cancion.nextval into :new.id_cancion from dual;
end if;
end;
/



create sequence seq_genero start with 1000 increment by 1 minvalue 1000 maxvalue 9999 nocache nocycle;

create or replace trigger genero_id
before insert on genero
for each ROW 
begin
if :new.id_genero is null then 
select seq_genero.nextval into :new.id_genero from dual;
end if;
end;
/


create sequence seq_playlist start with 1000 increment by 1 minvalue 1000 maxvalue 9999 nocache nocycle;

create or replace trigger playlist_id
before insert on playlist
for each ROW 
begin
if :new.id_playlist is null then 
select seq_playlist.nextval into :new.id_playlist from dual;
end if;
if :new.fecha_creacion is null then 
:new.fecha_creacion := sysdate;
end if;
end;
/



create or replace trigger playlist_cancion_fecha
before insert on playlist_cancion
for each ROW 
begin
if :new.fecha_agregado is null then 
:new.fecha_agregado := sysdate;
end if;
end;
/


create sequence seq_reproduccion start with 1000 increment by 1 minvalue 1000 maxvalue 9999 nocache nocycle;

create or replace trigger reproduccion_id
before insert on reproduccion
for each ROW 
begin
if :new.id_reproduccion is null then 
select seq_reproduccion.nextval into :new.id_reproduccion from dual;
end if;
if :new.fecha_hora is null then 
:new.fecha_hora := sysdate;
end if;
end;
/

create sequence seq_valoracion start with 1000 increment by 1 minvalue 1000 maxvalue 9999 nocache nocycle;

create or replace trigger valoracion_id
before insert on valoracion
for each ROW 
begin
if :new.id_valoracion is null then 
select seq_valoracion.nextval into :new.id_valoracion from dual;
end if;
end;



