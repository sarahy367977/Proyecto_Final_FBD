import oracledb
import datetime

def conexion(user, password, dsn):
    return oracledb.connect(user=user, password=password, dsn=dsn)

def obtener_conexion():
    try:
        conn = oracledb.connect(user="proyecto", password="sj", dsn="localhost/xepdb1")
        return conn
    except Exception as e:
        print(f"Error al conectar a la base de datos: {e}")
        return None


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
    cursor.connection.commit()
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
    cursor.connection.commit()
    return {'success': True}

def delete_usuario(cursor, id_usuario):
    cursor.execute("delete from usuario where id_usuario = :1", [id_usuario])
    if cursor.rowcount == 0:
        return {'success': False, 'message': 'No se encontró el usuario.'}
    else:
        cursor.connection.commit()
        return {'success': True, 'message': 'Usuario eliminado correctamente.'}

# CRUD Artista
def insert_artista(cursor, nombre, pais, genero_principal):
    cursor.execute("insert into artista (nombre, pais, genero_principal) values (:1, :2, :3)", [nombre, pais, genero_principal])
    cursor.connection.commit()
    cursor.execute("select seq_artista.currval from dual")
    id_generado = cursor.fetchone()[0]
    return {'success': True, 'id_artista': id_generado}

def read_artista(cursor, id_artista):
    cursor.execute("select nombre, pais, genero_principal from artista where id_artista = :1", [id_artista ])
    return cursor.fetchone()

def read_all_artistas(cursor):
    cursor.execute("SELECT id_artista, nombre FROM artista")
    return cursor.fetchall()
    
def delete_artista(cursor, id_artista):
    cursor.execute("delete from artista where id_artista = :1", [id_artista])
    if cursor.rowcount == 0:
        return {'success': False, 'error': 'Artista no encontrado.'}
    cursor.connection.commit()
    return {'success': True}

def update_artista(cursor, id_artista, nuevo_nombre, nuevo_genero_principal):
    cursor.execute("update artista set nombre = :1, genero_principal = :2 where id_artista = :3", [nuevo_nombre, nuevo_genero_principal, id_artista])
    if cursor.rowcount == 0:
        return {'success': False, 'error': 'Artista no encontrado.'}
    cursor.connection.commit()
    return {'success': True}

# CRUD genero
def insert_genero(cursor, nombre):
    cursor.execute("select count (*) from genero  where lower (nombre) = lower (:1)", [nombre])
    if cursor.fetchone()[0] > 0:
        return {'success': False, 'error': 'El género ya existe.'}
    
    cursor.execute("insert into genero (nombre) VALUES (:1)", [nombre])
    cursor.connection.commit()
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
    cursor.connection.commit()
    return {'success': True, 'message': 'El género actualizado correctamente.'}

def delete_genero(cursor, id_genero):
    cursor.execute("delete from genero where id_genero = :1", [id_genero])
    if cursor.rowcount == 0:
        return {'success': False, 'error': 'El género no encontrado.'}
    cursor.connection.commit()
    return {'success': True, 'message': 'El género eliminado correctamente.'}

# cancion
def insert_cancion(cursor, titulo, id_album, id_genero, duracion):
    if id_album is None:
        cursor.execute( "select count(*) from cancion Where titulo = :1 and id_album is null",[titulo])
    else:
        cursor.execute("select count(*) from cancion where titulo = :1 and id_album = :2", [titulo, id_album])
        
    cursor.execute("insert into cancion (titulo, id_album, id_genero, duracion) values (:1, :2, :3, :4)", [titulo, id_album, id_genero, duracion])
    cursor.connection.commit()
    return {'success': True, 'message': 'Canción insertada correctamente.'}

def read_cancion(cursor, id_cancion):
    cursor.execute("select titulo, id_album, id_genero, duracion from cancion where id_cancion = :1", [id_cancion])
    return cursor.fetchone()

def update_cancion(cursor, id_cancion, nuevo_titulo, nueva_duracion):
    cursor.execute("update cancion set titulo = :1, duracion = :2 where id_cancion = :3", [nuevo_titulo, nueva_duracion, id_cancion])
    if cursor.rowcount == 0:
        return {'success': False, 'error': 'No se encontró la canción.'}
    cursor.connection.commit()
    return {'success': True, 'message': 'Canción actualizada.'}

def delete_cancion(cursor, id_cancion):
    cursor.execute("delete from cancion where id_cancion = :1", [id_cancion])
    if cursor.rowcount == 0:
        return {'success': False, 'error': 'Canción no encontrada.'}
    cursor.connection.commit()
    return {'success': True, 'message': 'Canción eliminada.'}

# CRUD playlist
def insert_playlist(cursor, nombre, id_usuario):
    cursor.execute("insert into playlist (nombre, id_usuario) values (:1, :2)", [nombre, id_usuario])
    cursor.connection.commit()

def read_playlist(cursor, id_playlist):
    cursor.execute("select nombre, fecha_creacion, id_usuario from playlist where id_playlist = :1", [id_playlist])
    return cursor.fetchone()

def update_playlist(cursor, id_playlist, nuevo_nombre):
    cursor.execute("update playlist set nombre = :1 where id_playlist = :2", [nuevo_nombre, id_playlist])
    cursor.connection.commit()

def delete_playlist(cursor, id_playlist):
    cursor.execute("delete from playlist where id_playlist = :1", [id_playlist])
    cursor.connection.commit()
    return {'success': True, 'message': 'Playlist eliminada'}

#Playlista cancion
def insert_playlist_cancion(cursor, id_playlist, id_cancion):
    cursor.execute("select 1 from playlist_cancion where id_playlist = :1 and id_cancion = :2", [id_playlist, id_cancion])
    if cursor.fetchone():
        return "La canción ya está en la playlist"
    try:
        cursor.execute("insert into playlist_cancion (id_playlist, id_cancion) values (:1, :2)", [id_playlist, id_cancion])
        cursor.connection.commit()
        return "Canción insertada en la playlist"
    except Exception as e:
        return f"Error al insertar canción: {e}"

def delete_playlist_cancion(cursor, id_playlist, id_cancion):
    try:
        cursor.execute( "delete from playlist_cancion where id_playlist = :1 and id_cancion = :2", [id_playlist, id_cancion] )
        if cursor.rowcount > 0:
            cursor.connection.commit()  
            return "Canción eliminada de la playlist"
        else:
            return "No se encontró la canción en la playlist"
    except Exception as e:
        return f"Error al eliminar canción: {e}"
    
# CRUD reproduccion
def insert_reproduccion(cursor, id_usuario, id_cancion):
    cursor.execute("insert into reproduccion (id_usuario, id_cancion) values (:1, :2)", [id_usuario, id_cancion])
    cursor.connection.commit()  
    return {'success': True, 'message': 'Reproducción insertada'}

def read_all_reproducciones(cursor):
    cursor.execute("select * from reproduccion")
    return cursor.fetchall()

def delete_reproduccion(cursor, id_reproduccion):
    cursor.execute("delete from reproduccion where id_reproduccion = :1", [id_reproduccion])
    if cursor.rowcount > 0:
        cursor.connection.commit()
        return {'success': True, 'message': 'Reproducción eliminada'}
    else:
        return {'success': False, 'message': 'No se encontró la reproducción'}
    
#CRUD album
def insert_album(cursor, id_artista, titulo, anio_lanzamiento):
    cursor.execute("insert into album (id_artista, titulo, anio_lanzamiento) values (:1, :2, :3)", [id_artista, titulo, anio_lanzamiento])
    cursor.connection.commit()
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
    cursor.connection.commit()
    return {'success': True, 'message': 'Álbum actualizado'}

def delete_album(cursor, id_album):
    cursor.execute("delete from album where id_album = :1", [id_album])
    if cursor.rowcount > 0:
        cursor.connection.commit()
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
                cursor.connection.commit()
            else:
                raise
def read_valoracion(cursor, id_valoracion):
    cursor.execute("select puntuacion, comentario from valoracion where id_valoracion = :1", [id_valoracion])
    return cursor.fetchone()

def delete_valoracion(cursor, id_valoracion):
    cursor.execute("delete from valoracion where id_valoracion = :1", [id_valoracion])
    if cursor.rowcount > 0:
        cursor.connection.commit()

def ejecutar_query(funcion_query, *args):
    conn = obtener_conexion()
    if not conn:
        return None
    try:
        with conn.cursor() as cursor:
            resultado = funcion_query(cursor, *args)
            return resultado
    except Exception as e:
        print(f"Error ejecutando query: {e}")
        return None
    finally:
        conn.close()