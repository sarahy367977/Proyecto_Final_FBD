from flask import Flask, render_template, request, redirect, url_for, session, flash
from werkzeug.security import generate_password_hash, check_password_hash
from datetime import timedelta
from datetime import datetime
import oracledb
import secrets
import os

BASE_DIR = os.path.abspath(os.path.dirname(__file__))
TEMPLATE_DIR = os.path.abspath(os.path.join(BASE_DIR, '..', 'frontend')) # Asegúrate que esta ruta sea válida

app = Flask(__name__, template_folder=TEMPLATE_DIR)
print("Template dir:", TEMPLATE_DIR)
app.secret_key = secrets.token_hex(16)
app.permanent_session_lifetime = timedelta(seconds=3600)   # 1 hora


def obtener_conexion():
    try:
        return oracledb.connect(
            user="proyecto",
            password="sj",
            dsn="localhost/xepdb1"
        )
    except Exception as e:
        print(f"Error de conexión: {e}")
        return None
    

def tuplas_a_diccionarios(cursor, rows):
    columns = [col[0].lower() for col in cursor.description]
    return [dict(zip(columns, row)) for row in rows]

def obtener_datos_comunes(user_id=None):
    conn = obtener_conexion()
    if not conn:
        return {key: [] for key in ['generos', 'artistas', 'albumes', 'canciones', 'playlists', 'usuarios']}
    
    try:
        cursor = conn.cursor()
        cursor.execute("SELECT id_genero, nombre FROM genero")
        generos = cursor.fetchall()
        
        cursor.execute("SELECT id_artista, nombre, pais FROM artista")
        rows = cursor.fetchall()
        artistas = tuplas_a_diccionarios(cursor, rows)

        cursor.execute("SELECT id_album, titulo, anio_lanzamiento FROM album")
        filas = cursor.fetchall()
        albumes = tuplas_a_diccionarios(cursor, filas)
        
        cursor.execute("""
        SELECT c.id_cancion, c.titulo, ar.nombre AS artista, c.duracion
        FROM cancion c
        JOIN album al ON c.id_album = al.id_album
        JOIN artista ar ON al.id_artista = ar.id_artista
            """)
        canciones = cursor.fetchall()

        
        if user_id is not None:
            cursor.execute("SELECT id_playlist, nombre FROM playlist WHERE id_usuario = :1", [user_id])
            playlists = [{'id': p[0], 'nombre': p[1]} for p in cursor.fetchall()]
        else:
            playlists = []

        cursor.execute("SELECT id_usuario, nombre FROM usuario")
        usuarios = cursor.fetchall()
        usuarios = tuplas_a_diccionarios(cursor, usuarios)
        
        return {
            'generos': generos,
            'artistas': artistas,
            'albumes': albumes,
            'canciones': canciones,
            'playlists': playlists,
            'usuarios': usuarios
        }
    except Exception as e:
        print(f"Error al obtener datos comunes: {e}")
        return {key: [] for key in ['generos', 'artistas', 'albumes', 'canciones', 'playlists', 'usuarios']}
    finally:
        conn.close()

@app.route('/')
def index():
    if 'user_id' not in session:
        return redirect(url_for('login'))

    user_id = session['user_id']
    user_name = session.get('user_name', 'Usuario')

    datos = obtener_datos_comunes(user_id)

    datos['usuario_id'] = user_id
    datos['usuario_nombre'] = user_name

    canciones = []
    for c in datos.get('canciones', []):
        duracion_seg = None
        duracion_str = "Duración no registrada"
        try:
            duracion_seg = int(c[3]) if c[3] is not None else None
            if duracion_seg is not None:
                minutos = duracion_seg // 60
                segundos = duracion_seg % 60
                duracion_str = f"{minutos}:{segundos:02d}"
        except (ValueError, IndexError):
            pass

        canciones.append({
            'id': c[0],
            'titulo': c[1],
            'artista': c[2],   
            'duracion': duracion_seg,
            'duracion_str': duracion_str
        })

    datos['canciones'] = canciones

    return render_template('index.html', **datos)

@app.route('/insertar_genero', methods=['POST'])
def insertar_genero():
    nombre = request.form.get('nombre')
    if not nombre:
        flash("Nombre de género requerido", "warning")
        return redirect(url_for('index'))

    conn = obtener_conexion()
    try:
        cursor = conn.cursor()
        cursor.execute("INSERT INTO genero (nombre) VALUES (:1)", [nombre])
        conn.commit()
        flash("Género insertado correctamente", "success")
    except Exception as e:
        flash(f"Error al insertar género: {e}", "danger")
    finally:
        cursor.close()
        conn.close()
    return redirect(url_for('index'))



@app.route('/insertar_album', methods=['POST'])
def insertar_album():
    titulo = request.form['titulo']
    id_artista = request.form['id_artista']
    fecha_str = request.form['anio_lanzamiento']  

    try:
        fecha_lanzamiento = datetime.strptime(fecha_str, "%Y-%m-%d")  
    except ValueError:
        flash("Fecha inválida. Intenta de nuevo.")
        return redirect(url_for('index'))

    conn = obtener_conexion()
    try:
        cursor = conn.cursor()
        cursor.execute("""
            INSERT INTO album (titulo, id_artista, anio_lanzamiento)
            VALUES (:1, :2, :3)
        """, (titulo, id_artista, fecha_lanzamiento))
        conn.commit()
        flash("Álbum agregado exitosamente.")
    except Exception as e:
        print(f"Error al insertar álbum: {e}")
        flash("Hubo un error al agregar el álbum.")
    finally:
        conn.close()

    return redirect(url_for('index'))

@app.route('/insertar_usuario', methods=['POST'])
def insertar_usuario():
    nombre = request.form.get('nombre')
    email = request.form.get('email')
    contrasena = request.form.get('contrasena')
    if not nombre or not email or not contrasena:
        flash("Todos los campos de usuario son requeridos", "warning")
        return redirect(url_for('index'))

    hash_contrasena = generate_password_hash(contrasena)

    conn = obtener_conexion()
    try:
        cursor = conn.cursor()
        cursor.execute("INSERT INTO usuario (nombre, email, contrasena) VALUES (:1, :2, :3)",[nombre, email, hash_contrasena])
        conn.commit()
        flash("Usuario insertado correctamente", "success")
    except Exception as e:
        flash(f"Error al insertar usuario: {e}", "danger")
    finally:
        cursor.close()
        conn.close()
    return redirect(url_for('index'))

@app.route('/insertar_cancion', methods=['POST'])
def insertar_cancion():
    titulo = request.form['titulo']
    id_album = request.form['id_album']
    id_genero = request.form['genero']
    duracion_str = request.form['duracion']  

    try:
        minutos, segundos = map(int, duracion_str.strip().split(':'))
        duracion_en_segundos = minutos * 60 + segundos
    except Exception:
        flash("Formato de duración inválido. Usa mm:ss (ej. 3:45).")
        return redirect(url_for('index'))

    conn = obtener_conexion()
    try:
        cursor = conn.cursor()

        print(f"Insertando: {titulo}, {id_album}, {id_genero}, {duracion_en_segundos}")

        cursor.execute("""
            INSERT INTO cancion (titulo, id_album, id_genero, duracion)
            VALUES (:1, :2, :3, :4)
        """, (titulo, id_album, id_genero, duracion_en_segundos))

        conn.commit() 

        flash("Canción agregada correctamente.")
    except Exception as e:
        print(f"Error al insertar canción: {e}")
        flash(f"Hubo un error al registrar la canción: {e}")
    finally:
        conn.close()

    return redirect(url_for('index'))

@app.route('/insertar_playlist', methods=['POST'])
def insertar_playlist():
    nombre = request.form.get('nombre')
    id_usuario = session.get('user_id') 

    if not nombre:
        flash("El nombre de la playlist es requerido", "warning")
        return redirect(url_for('index'))

    conn = obtener_conexion()
    try:
        cursor = conn.cursor()
        cursor.execute("""
            INSERT INTO playlist (nombre, id_usuario)
            VALUES (:1, :2)
        """, [nombre, id_usuario])
        conn.commit()
        flash("Playlist creada correctamente", "success")
    except Exception as e:
        flash(f"Error al crear playlist: {e}", "danger")
    finally:
        conn.close()

    return redirect(url_for('index'))

@app.route('/agregar_a_playlist', methods=['POST'])
def agregar_a_playlist():
    id_playlist = request.form.get('id_playlist')
    id_cancion = request.form.get('id_cancion')


    if not id_playlist or not id_cancion:
        flash("Playlist y Canción son requeridos", "warning")
        return redirect(url_for('form_agregar_a_playlist'))

    conn = obtener_conexion()
    try:
        cursor = conn.cursor()
        cursor.execute("""
            INSERT INTO playlist_cancion (id_playlist, id_cancion)
            VALUES (:1, :2)
        """, [id_playlist, id_cancion])
        conn.commit()
        flash("Canción agregada a la playlist correctamente", "success")
    except Exception as e:
        flash(f"Error al agregar canción a la playlist: {e}", "danger")
    finally:
        cursor.close()
        conn.close()

    return redirect(url_for('form_agregar_a_playlist'))

@app.route('/eliminar/<tabla>/<int:id_registro>', methods=['GET'])
def eliminar_registro(tabla, id_registro):
    columnas = {
        'genero': 'id_genero',
        'artista': 'id_artista',
        'album': 'id_album',
        'cancion': 'id_cancion',
        'playlist': 'id_playlist',     
        'usuario': 'id_usuario'
    }
    if tabla not in columnas:
        flash("Tabla no válida", "warning")
        return redirect(url_for('index'))

    conn = obtener_conexion()
    try:
        cursor = conn.cursor()
        query = f"DELETE FROM {tabla} WHERE {columnas[tabla]} = :1"
        cursor.execute(query, [id_registro])
        conn.commit()
        flash(f"Registro eliminado de {tabla}", "info")
    except Exception as e:
        flash(f"Error al eliminar de {tabla}: {e}", "danger")
    finally:
        cursor.close()
        conn.close()
    return redirect(url_for('index'))

@app.route('/login', methods=['GET', 'POST'])
def login():
    if request.method == 'POST':
        email = request.form['email']
        contrasena = request.form['contrasena']

        conn = obtener_conexion()
        if not conn:
            flash("Error al conectar con la base de datos", "danger")
            return redirect(url_for('login'))

        try:
            cursor = conn.cursor()
            cursor.execute("SELECT id_usuario, nombre, contrasena FROM usuario WHERE email = :1", [email])
            usuario = cursor.fetchone()
            cursor.close()
            conn.close()

            if usuario and check_password_hash(usuario[2], contrasena):
                session['user_id'] = usuario[0]
                session['user_name'] = usuario[1]
                flash('¡Has iniciado sesión correctamente!', 'success')
                return redirect(url_for('index'))
            else:
                flash('Correo o contraseña incorrectos', 'danger')
        except Exception as e:
            flash(f"Error en login: {e}", "danger")
            if conn:
                conn.close()
    return render_template('login.html')

@app.route('/insertar_valoracion', methods=['POST'])
def insertar_valoracion():
    if 'user_id' not in session:
        flash("Debes iniciar sesión para valorar", "warning")
        return redirect(url_for('login'))

    id_usuario = session['user_id']
    id_cancion = request.form.get('id_cancion')
    puntuacion = request.form.get('puntuacion')
    comentario = request.form.get('comentario', '')

    if not id_cancion or not puntuacion:
        flash("Canción y puntuación son obligatorios", "warning")
        return redirect(url_for('index'))

    try:
        puntuacion = int(puntuacion)
        if puntuacion < 1 or puntuacion > 5:
            flash("La puntuación debe estar entre 1 y 5", "warning")
            return redirect(url_for('index'))
    except ValueError:
        flash("Puntuación inválida", "warning")
        return redirect(url_for('index'))

    conn = obtener_conexion()
    if not conn:
        flash("Error al conectar con la base de datos", "danger")
        return redirect(url_for('index'))

    try:
        cursor = conn.cursor()
        cursor.execute("""
            INSERT INTO Valoracion (puntuacion, comentario, id_cancion, id_usuario)
            VALUES (:1, :2, :3, :4)
        """, (puntuacion, comentario, id_cancion, id_usuario))

        conn.commit()
        flash("Valoración guardada correctamente", "success")
    except Exception as e:
        conn.rollback()
        flash(f"Error al guardar valoración: {e}", "danger")
    finally:
        cursor.close()
        conn.close()

    return redirect(url_for('index'))

@app.route('/insertar_reproduccion', methods=['POST'])
def insertar_reproduccion():
    id_usuario = request.form.get('id_usuario')
    id_cancion = request.form.get('id_cancion')
    fecha_hora_str = request.form.get('fecha_hora')

    if not id_usuario or not id_cancion or not fecha_hora_str:
        flash("Todos los campos son obligatorios para registrar la reproducción", "warning")
        return redirect(url_for('index'))

    try:
        # Convierte string a datetime para Oracle
        fecha_hora = datetime.strptime(fecha_hora_str, '%Y-%m-%dT%H:%M')
    except ValueError:
        flash("Formato de fecha/hora inválido", "danger")
        return redirect(url_for('index'))

    conn = obtener_conexion()
    if not conn:
        flash("Error de conexión con la base de datos", "danger")
        return redirect(url_for('index'))

    try:
        cursor = conn.cursor()
        cursor.execute("""
            INSERT INTO reproduccion (id_usuario, id_cancion, fecha_hora)
            VALUES (:1, :2, :3)
        """, (id_usuario, id_cancion, fecha_hora))
        conn.commit()
        flash("Reproducción registrada correctamente", "success")
    except Exception as e:
        flash(f"Error al registrar reproducción: {e}", "danger")
    finally:
        cursor.close()
        conn.close()

    return redirect(url_for('index'))

@app.route('/registro', methods=['GET', 'POST'])
def registro():
    if request.method == 'POST':
        nombre = request.form.get('nombre')
        email = request.form.get('email')
        contrasena = request.form.get('contrasena')
        

        if not nombre or not email or not contrasena:
            flash('Todos los campos son obligatorios', 'warning')
            return redirect(url_for('registro'))

        conn = obtener_conexion()
        if not conn:
            flash("Error al conectar con la base de datos", "danger")
            return redirect(url_for('registro'))

        try:
            cursor = conn.cursor()
            cursor.execute("SELECT id_usuario FROM usuario WHERE email = :1", [email])
            existe = cursor.fetchone()
            if existe:
                flash('El correo ya está registrado', 'warning')
                cursor.close()
                conn.close()
                return redirect(url_for('registro'))

            hash_pw = generate_password_hash(contrasena)
            cursor.execute(
                "INSERT INTO usuario (nombre, email, contrasena) VALUES (:1, :2, :3)",
                [nombre, email, hash_pw]
            )
            conn.commit()
            cursor.close()
            conn.close()
            flash('Usuario registrado con éxito, ya puedes iniciar sesión', 'success')
            return redirect(url_for('login'))
        except Exception as e:
            flash(f"Error al registrar usuario: {e}", "danger")
            if conn:
                conn.close()
            return redirect(url_for('registro'))

    return render_template('registro.html')


@app.route('/logout')
def logout():
    session.pop('user_id', None)
    session.pop('user_name', None)
    flash('Has cerrado sesión', 'info')
    return redirect(url_for('login'))

if __name__ == '__main__':
    app.run(debug=True)
