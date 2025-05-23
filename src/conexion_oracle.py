import oracledb

cnx = oracledb.connect(
    user="proyecto",
    password = "sj",
    dsn = "localhost/xepdb1"
)

cursor = cnx.cursor()

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


def insert_usuario(cursor, nombre, email, contrasena):
    cursor.execute("insert into  usuario ( name, email, contrasena) values (:1, :2, :3)", [nombre, email, contrasena])


def Read_usuario(cursor, id_usuario):
    cursor.execute("select name, email, fecha_registro from usuario where id_usuario = :1", [ id_usuario] )
    return cursor.fetchone()

def update_usuario(cursor,id_usuario, nuevo_nombre, nuevo_email, nueva_contrasena): 
    cursor.execute( "update usuario  set name = :1, email= :2, contrasena= :3  where id_usuario= :4", [nuevo_nombre, nuevo_email, nueva_contrasena, id_usuario])

def delete_usuario(cursor, id_usuario):
    cursor.execute("delete from usuario where id_usuario = :1", [id_usuario])

def insert_artista(cursor, nombre, pais, genero_principal):
    cursor.execute("insert into artista (nombre, pais, genero_principal) values (:1, :2, :3)", [nombre, pais, genero_principal])

def read_artista(cursor, id_artista):
    cursor.execute("select nombre, pais, genero_principal from artista where id_artista = :1", [id_artista ])

def delete_artista(cursor, id_artista):
    cursor.execute("delete from artista where id_artista = :1", [id_artista])

def update_artista(cursor, id_artista, nuevo_nombre, nuevo_genero_principal):
    cursor.execute ("update artista set nombre = :1, genero_principal = :2 where id_artista = :3", [nuevo_nombre, nuevo_genero_principal, id_artista])

def insert_