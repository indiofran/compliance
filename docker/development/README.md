## Ambiente Development
* Acceder a la carpeta docker/development y desde alli correr:

  `docker-compose up`
* Partiendo de la idea que el equipo local tiene una copia de la base de datos de staging, se puede cargar los datos de la siguiente forma:
    - Si el archivo se tomó de staging hay que agregar las siguientes lineas 
en la cabecera del archivo sql (la idea es reemplazar la base de datos de staging por la local):
      ```
      CREATE DATABASE compliance_development;
      USE compliance_development;
      ```
  - Luego correr en terminal:

    `docker exec -i compliance_mysql mysql -uroot -ppassword < archivo.sql`
* Correr la migración (si hace falta):

  `docker exec -i dev_compliance bundle exec rake db:migrate`
