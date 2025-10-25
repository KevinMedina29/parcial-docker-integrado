### Ejercicio 1
Error en el Dockerfile
cambiar la linea:
RUN npm ci
por:
RUN npm install

### Ejercicio 2 – PostgreSQL con persistencia

1. Crear volumen:
docker volume create db_data

2. Levantar contenedor con variables y volumen:
docker run -d --name parcial-db \
  -e POSTGRES_USER=admin \
  -e POSTGRES_PASSWORD=12345 \
  -e POSTGRES_DB=parcial_db \
  -v db_data:/var/lib/postgresql/data \
  -p 5432:5432 postgres:16

3. Conectar a la BD:
docker exec -it parcial-db psql -U admin -d parcial_db

4. Crear tabla y registros:
CREATE TABLE estudiantes (id SERIAL PRIMARY KEY, nombre VARCHAR(100), codigo VARCHAR(50));
INSERT INTO estudiantes (nombre, codigo) VALUES ('Kevin Medina','MM19-I04-001');

5. Verificar persistencia:
docker restart parcial-db
SELECT * FROM estudiantes;
