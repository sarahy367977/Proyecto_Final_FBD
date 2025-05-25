import oracledb
import datetime

def conexion(user, password, dsn):
    return oracledb.connect(user=user, password=password, dsn=dsn)


def query_one(cursor, query):
    cursor.execute(query)
    row =  cursor.fetchone()
    print(row)


def query_all(cursor, query):
    cursor.execute(query)
    rows =  cursor.fetchall()
    print(rows)

    for row in rows:
        print(row)


#CRUD usuario
def insert_usuario(cursor, nombre, email, contrasena):
    cursor.execute("select count(*) from usuario where email = :1", [email])
    if cursor.fetchone()[0] > 0:
        return {'success': False, 'error': 'El correo ya está registrado.'}
    
    cursor.execute("insert into  usuario ( nombre, email, contrasena) values (:1, :2, :3)", [nombre, email, contrasena])
    return {'success': True}

def read_usuario(cursor, id_usuario):
    cursor.execute("select nombre, email, fecha_registro from usuario where id_usuario = :1", [ id_usuario] )
    return cursor.fetchone()

def update_usuario(cursor, id_usuario, nuevo_nombre, nuevo_email, nueva_contrasena):
    cursor.execute( "select count(*) from usuario where email = :1 and id_usuario != :2", [nuevo_email, id_usuario])
    email_duplicado = cursor.fetchone()[0]

    if email_duplicado > 0:
        return { 'success' : False, 'Error': 'Correo resgitrado por otro usuario'}
    cursor.execute("update usuario set nombre = :1, email = :2, contrasena = :3 where id_usuario = :4", [ nuevo_nombre, nuevo_email, nueva_contrasena, id_usuario])

    if cursor.rowcount == 0:
        return {'success': False, 'error': 'Usuario no encontrado.'}
    
    return {'success': True}

def delete_usuario(cursor, id_usuario):
    cursor.execute("delete from usuario where id_usuario = :1", [id_usuario])
    if cursor.rowcount == 0:
        return {'success': False, 'message': 'No se encontró el usuario.'}
    else:
        return {'success': True, 'message': 'Usuario eliminado correctamente.'}

# CRUD Artista
def insert_artista(cursor, nombre, pais, genero_principal):
    cursor.execute("insert into artista (nombre, pais, genero_principal) values (:1, :2, :3)", [nombre, pais, genero_principal])
    cursor.execute("select seq_artista.currval from dual")
    id_generado = cursor.fetchone()[0]
    return {'success': True, 'id_artista': id_generado}

def read_artista(cursor, id_artista):
    cursor.execute("select nombre, pais, genero_principal from artista where id_artista = :1", [id_artista ])
    return cursor.fetchone()
    
def delete_artista(cursor, id_artista):
    cursor.execute("delete from artista where id_artista = :1", [id_artista])
    if cursor.rowcount == 0:
        return {'success': False, 'error': 'Artista no encontrado.'}
    return {'success': True}

def update_artista(cursor, id_artista, nuevo_nombre, nuevo_genero_principal):
    cursor.execute("update artista set nombre = :1, genero_principal = :2 where id_artista = :3", [nuevo_nombre, nuevo_genero_principal, id_artista])
    if cursor.rowcount == 0:
        return {'success': False, 'error': 'Artista no encontrado.'}
    return {'success': True}

# CRUD genero
def insert_genero(cursor, nombre):
    cursor.execute("select count (*) from genero  where lower (nombre) = lower (:1)", [nombre])
    if cursor.fetchone()[0] > 0:
        return {'success': False, 'error': 'El género ya existe.'}
    
    cursor.execute("insert into genero (nombre) VALUES (:1)", [nombre])
    return {'success': True, 'message': 'Género insertado correctamente.'}

def read_genero(cursor, id_genero):
    cursor.execute("select nombre from genero where id_genero = :1", [id_genero])
    return cursor.fetchone()

def update_genero(cursor, id_genero, nuevo_nombre):
    cursor.execute("select count (*) from genero where lower(nombre) = lower(:1) and id_genero != :2", [nuevo_nombre, id_genero])
    if cursor.fetchone()[0] > 0:
        return {'success': False, 'error': 'Ya existe otro género con ese nombre.'}
    
    cursor.execute("update genero set nombre = :1 where id_genero = :2", [nuevo_nombre, id_genero])
    if cursor.rowcount == 0:
        return {'success': False, 'error': 'No se encontró el género.'}
    
    return {'success': True, 'message': 'El género actualizado correctamente.'}

def delete_genero(cursor, id_genero):
    cursor.execute("delete from genero where id_genero = :1", [id_genero])
    if cursor.rowcount == 0:
        return {'success': False, 'error': 'El género no encontrado.'}
    return {'success': True, 'message': 'El género eliminado correctamente.'}

# cancion
def insert_cancion(cursor, titulo, id_album, id_genero, duracion):
    if id_album is None:
        cursor.execute( "select count(*) from cancion Where titulo = :1 and id_album is null",[titulo])
    else:
        cursor.execute("select count(*) from cancion where titulo = :1 and id_album = :2", [titulo, id_album])
        
    cursor.execute("insert into cancion (titulo, id_album, id_genero, duracion) values (:1, :2, :3, :4)", [titulo, id_album, id_genero, duracion])
    return {'success': True, 'message': 'Canción insertada correctamente.'}

def read_cancion(cursor, id_cancion):
    cursor.execute("select titulo, id_album, id_genero, duracion from cancion where id_cancion = :1", [id_cancion])
    return cursor.fetchone()

def update_cancion(cursor, id_cancion, nuevo_titulo, nueva_duracion):
    cursor.execute("update cancion set titulo = :1, duracion = :2 where id_cancion = :3", [nuevo_titulo, nueva_duracion, id_cancion])
    if cursor.rowcount == 0:
        return {'success': False, 'error': 'No se encontró la canción.'}
    return {'success': True, 'message': 'Canción actualizada.'}

def delete_cancion(cursor, id_cancion):
    cursor.execute("delete from cancion where id_cancion = :1", [id_cancion])
    if cursor.rowcount == 0:
        return {'success': False, 'error': 'Canción no encontrada.'}
    return {'success': True, 'message': 'Canción eliminada.'}

# CRUD playlist
def insert_playlist(cursor, nombre, id_usuario):
    cursor.execute("insert into playlist (nombre, id_usuario) values (:1, :2)", [nombre, id_usuario])

def read_playlist(cursor, id_playlist):
    cursor.execute("select nombre, fecha_creacion, id_usuario from playlist where id_playlist = :1", [id_playlist])
    return cursor.fetchone()

def update_playlist(cursor, id_playlist, nuevo_nombre):
    cursor.execute("update playlist set nombre = :1 where id_playlist = :2", [nuevo_nombre, id_playlist])

def delete_playlist(cursor, id_playlist):
    cursor.execute("delete from playlist where id_playlist = :1", [id_playlist])
    return {'success': True, 'message': 'Playlist eliminada'}

#Playlista cancion
def insert_playlist_cancion(cursor, id_playlist, id_cancion):
    cursor.execute("select 1 from playlist_cancion where id_playlist = :1 and id_cancion = :2", [id_playlist, id_cancion])
    if cursor.fetchone():
        return "La canción ya está en la playlist"
    try:
        cursor.execute("insert into playlist_cancion (id_playlist, id_cancion) values (:1, :2)", [id_playlist, id_cancion])
        return "Canción insertada en la playlist"
    except Exception as e:
        return f"Error al insertar canción: {e}"

def delete_playlist_cancion(cursor, id_playlist, id_cancion):
    try:
        cursor.execute( "delete from playlist_cancion where id_playlist = :1 and id_cancion = :2", [id_playlist, id_cancion] )
        if cursor.rowcount > 0:
            return "Canción eliminada de la playlist"
        else:
            return "No se encontró la canción en la playlist"
    except Exception as e:
        return f"Error al eliminar canción: {e}"
    
# CRUD reproduccion
def insert_reproduccion(cursor, id_usuario, id_cancion):
    cursor.execute("insert into reproduccion (id_usuario, id_cancion) values (:1, :2)", [id_usuario, id_cancion])
    return {'success': True, 'message': 'Reproducción insertada'}

def read_all_reproducciones(cursor):
    cursor.execute("select * from reproduccion")
    return cursor.fetchall()

def delete_reproduccion(cursor, id_reproduccion):
    cursor.execute("delete from reproduccion where id_reproduccion = :1", [id_reproduccion])
    if cursor.rowcount > 0:
        return {'success': True, 'message': 'Reproducción eliminada'}
    else:
        return {'success': False, 'message': 'No se encontró la reproducción'}
    
#CRUD album
def insert_album(cursor, id_artista, titulo, anio_lanzamiento):
    cursor.execute("insert into album (id_artista, titulo, anio_lanzamiento) values (:1, :2, :3)", [id_artista, titulo, anio_lanzamiento])
    return {'success': True, 'message': 'Álbum insertado'}


def read_album(cursor, id_album):
    cursor.execute("select * from Album where id_album = :1", [id_album])
    album = cursor.fetchone()
    if album:
        return album
    else:
        return {'success': False, 'message': 'Álbum no encontrado'}

def update_album(cursor, id_artista, titulo, anio_lanzamiento, id_album):
    cursor.execute("update album set id_artista = :1, titulo = :2, anio_lanzamiento = :3 where id_album = :4", [id_artista, titulo, anio_lanzamiento, id_album])
    return {'success': True, 'message': 'Álbum actualizado'}

def delete_album(cursor, id_album):
    cursor.execute("delete from album where id_album = :1", [id_album])
    if cursor.rowcount > 0:
        return {'success': True, 'message': 'Álbum eliminado'}
    else:
        return {'success': False, 'message': 'Álbum no encontrado'}
    
#CRUD valoracion
def get_valoracion_id(cursor, id_usuario, id_cancion):
    cursor.execute( "select id_valoracion from valoracion where id_usuario = :1 and id_cancion = :2", [id_usuario, id_cancion] )
    row = cursor.fetchone()
    if row:
        return row[0]
    else:
        return None

def insert_valoracion(cursor, puntuacion, comentario, id_cancion, id_usuario):
    try:
        cursor.execute("insert into valoracion (puntuacion, comentario, id_cancion, id_usuario) values (:1, :2, :3, :4)", [puntuacion, comentario, id_cancion, id_usuario])
    except oracledb.IntegrityError as e:
        if "unique_usuario_cancion" in str(e):
            id_valoracion = get_valoracion_id(cursor, id_usuario, id_cancion)
            if id_valoracion:
                cursor.execute("update valoracion set puntuacion = :1, comentario = :2 where id_valoracion = :3", [puntuacion, comentario, id_valoracion])
            else:
                raise
def read_valoracion(cursor, id_valoracion):
    cursor.execute("select puntuacion, comentario from valoracion where id_valoracion = :1", [id_valoracion])
    return cursor.fetchone()

def delete_valoracion(cursor, id_valoracion):
    cursor.execute("delete from valoracion where id_valoracion = :1", [id_valoracion])


if __name__ == "__main__":
    cnx = conexion("proyecto", "sj", "localhost/xepdb1")
    cursor = cnx.cursor()

    try:
        # Consultas
        query_one(cursor, "select * from usuario WHERE id_usuario = 1")
        query_all(cursor, "select * from artista")

        # prueba usuario
        insert_usuario(cursor, "JuanaPerez", "jn@example.com", "12378647")
        cnx.commit()


        update_usuario(cursor, 1008, "Juanita", "jana@example.com", "83571121")
        cnx.commit()


        delete_usuario(cursor, 1029)
        cnx.commit()

        #prueba artista
        insert_artista(cursor, "Artista_prueba", "México", "Pop")
        cnx.commit()

        update_result = update_artista(cursor, 1000, "Artista M", "Pop")
        print("Resultado actualización artista:", update_result)
        cnx.commit()

        delete_result = delete_artista(cursor, 1031)
        print("Resultado eliminación artista:", delete_result)
        cnx.commit()
        
        #Prueba genero
        resultado_insert = insert_genero(cursor, "Jazz")
        print("Insertar género:", resultado_insert)
        cnx.commit()

        resultado_update = update_genero(cursor, 1, "Reggae")
        print("Actualizar género:", resultado_update)
        cnx.commit()

        resultado_delete = delete_genero(cursor, 5)
        print("Eliminar género:", resultado_delete)
        cnx.commit()


        #Canciones
        resultado_insert = insert_cancion(cursor, "Mi Canción Test", 1009, 3 , 375)
        print("Insertar canción:", resultado_insert)
        cnx.commit()

        resultado_update = update_cancion(cursor, 1007, "Canción Actualizada Test", 220)
        print("Actualizar canción:", resultado_update)
        cnx.commit()

        resultado_delete = delete_cancion(cursor, 1034)
        print("Eliminar canción:", resultado_delete)
        cnx.commit()

        #playlist
        insert_playlist(cursor, "Mi Playlistt", 1027)
        print("Insertar playlist: OK")
        cnx.commit()

        update_playlist(cursor,1007, "Nombre Playlist Actualizado2")
        print("Actualizar playlist: OK")
        cnx.commit()

        delete_playlist(cursor, 1020)
        print("Eliminar playlist: OK")
        cnx.commit()

        #playlist_cancion
        resultado_insert = insert_playlist_cancion(cursor, 1021, 1026)
        print("Insertar canción en playlist:", resultado_insert)
        cnx.commit()

        resultado_delete = delete_playlist_cancion(cursor, 1007, 1024)
        print("Eliminar canción de playlist:", resultado_delete)
        cnx.commit()

        # Reproduccion
        resultado_insert = insert_reproduccion(cursor, 1008, 1018)
        print("Insertar reproducción:", resultado_insert)
        cnx.commit()
        
        resultado_delete = delete_reproduccion(cursor, 1007)
        print("Eliminar reproducción:", resultado_delete)
        cnx.commit()

        # Álbum
        resultado_insert = insert_album(cursor, 1013, "Mi Álbum Test", datetime.date(2023, 5, 25))
        print("Insertar álbum:", resultado_insert)
        cnx.commit()

        resultado_read = read_album(cursor, 1006)
        print("Leer álbum", resultado_read)
        cnx.commit()

        album_actualizado= update_album(cursor, 1008, "Álbum modificado", datetime.date(2025, 1, 1), 1010)
        print("album actualizado", album_actualizado)
        cnx.commit()

        album_eliminado = delete_album(cursor, 1003)
        print("Album eliminado", album_eliminado)
        cnx.commit()

        #Valoracion
        resultado_insert = insert_valoracion(cursor, 4, "Muy buena", 1013, 1009)
        print("Insertar valoración:", resultado_insert)
        cnx.commit()

        resultado_leer = read_valoracion(cursor, 1006)
        print("Leer valoración:", resultado_leer)

        resultado_delete = delete_valoracion(cursor, 1004)
        print("Eliminar valoración:", resultado_delete)
        cnx.commit()


        query_all(cursor, "select * from artista")
        query_all(cursor, "select * from usuario")
        query_all(cursor, "select * from genero")
    except Exception as e:
        print("Error durante la ejecucion :", e)
        cnx.rollback()
    finally:
        cursor.close()
        cnx.close()