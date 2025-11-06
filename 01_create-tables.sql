CREATE TABLE productos(
  id SERIAL PRIMARY KEY,
  nombre TEXT NOT NULL,
  precio FLOAT NOT NULL,
  stock INTEGER NOT NULL
);

CREATE TABLE empleados(
  id SERIAL PRIMARY KEY,
  nombre TEXT NOT NULL
);

CREATE TABLE departamento(
  id SERIAL PRIMARY KEY,
  nombre TEXT NOT NULL
);

CREATE TABLE empleados_departamento(
  id_departamento INTEGER REFERENCES departamento(id),
  id_empleado INTEGER REFERENCES empleados(id),
  PRIMARY KEY(id_departamento, id_empleado)
);
