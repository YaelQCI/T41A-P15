import psycopg2
import pytest

DB_CONFIG = {
    "dbname": "test_db",
    "user": "postgres",
    "password": "postgres",
    "host": "localhost",
    "port": 5432
}

@pytest.fixture(scope="module")
def db_connection():
    conn = psycopg2.connect(**DB_CONFIG)
    yield conn
    conn.close()

def fetch_scalar(conn, query, params=()):
    with conn.cursor() as cur:
        cur.execute(query, params)
        return cur.fetchone()[0]

def fetch_all(conn, query, params=()):
    with conn.cursor() as cur:
        cur.execute(query, params)
        return cur.fetchall()

def test_calcular_descuento(conn):
    precio_1 = fetch_scalar(conn, "SELECT calcular_descuento(%s, %s)", (100.0, 25.0))
    assert precio_1 == pytest.approx(75.0)

def test_validar_correo(conn):
    assert fetch_scalar(conn, "SELECT validar_correo('test@example.com')") == True
    assert fetch_scalar(conn, "SELECT validar_correo('invalido')") == False

def test_productos_stock_menor(conn):
    query = "SELECT * FROM productos_stock_menor(%s)"
    result = fetch_all(conn, query, (50,))
    productos = {row[0] for row in result}
    assert productos == {"Pantalla", "Alfombra", "HUB"}

def test_get_dia_by_fecha(conn):
    query = "SELECT get_dia_by_fecha(%s::date)"
    dia = fetch_scalar(conn, query, ("2025-01-01",))
    assert dia in ("Miércoles", "Wednesday")

def test_get_cantidad_empleados_departamento(conn):
    query = "SELECT get_cantidad_empleados_departamento(%s)"
    cantidad_ing = fetch_scalar(conn, query, (2,))
    assert cantidad_ing == 2
    cantidad_ventas = fetch_scalar(conn, query, (1,))
    assert cantidad_ventas == 2
