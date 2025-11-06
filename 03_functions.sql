CREATE OR REPLACE FUNCTION calcular_descuento(precio_original FLOAT, porcentaje FLOAT)
RETURNS FLOAT AS $$
BEGIN
  RETURN precio_original * ( (100-porcentaje)/100 );
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION validar_correo(correo TEXT)
RETURNS BOOLEAN AS $$
BEGIN
  RETURN correo ~ '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$';
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION productos_stock_menor(stock_minimo INTEGER)
RETURNS TABLE(producto TEXT) AS $$
BEGIN 
  RETURN QUERY SELECT nombre FROM productos WHERE stock < stock_minimo;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION get_dia_by_fecha(fecha DATE)
RETURNS TEXT AS $$
BEGIN
  RETURN TO_CHAR(fecha, 'TMDay');
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION get_cantidad_empleados_departamento(id_departamento_value INTEGER)
RETURNS INTEGER AS $$
DECLARE
  cantidad INTEGER;
BEGIN
   SELECT COUNT(*) INTO cantidad FROM empleados_departamento WHERE id_departamento=id_departamento_value;
   RETURN cantidad;
END;
$$ LANGUAGE plpgsql;
