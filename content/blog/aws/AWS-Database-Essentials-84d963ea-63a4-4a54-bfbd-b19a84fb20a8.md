+++
author = "siorellana"
categories = ["AWS" , "DB", "Cloud", "RDS"]
date = "2019-06-09"
description = "Conceptos básicos sobre Bases de Datos"
featured = "unplash-database.jpg"
featuredalt = "Databases"
featuredpath = "date"
linktitle = ""
title = "AWS Database Essentials"
type = "post"

+++

# AWS Database Essentials
Cuando se trabaja con bases de datos, existen una serie de términos y conceptos que son necesarios para poder entender las diferencias entre los distintos productos o servicios que se encuentran disponibles en AWS. En este post, revisaremos algunos de estos conceptos para un mejor entendimiento de los post que vengan en el futuro.

# Terminología

## Base de datos relacional

- Datos se encuentran estructurados con esquemas.
- La información se encuentra normalizada y distribuida a través de multiples tablas.
- Utiliza lenguaje SQL.
- Cumple con ACID (Atomicidad, Consistencia, Aislamiento (Isolation) y Durabilidad).
- Se escala de forma vertical, es decir, se agregan mas recursos a una misma máquina.
- Se pueden agregar réplicas de sólo lectura para no colapsar el servidor principal.
- Puede ser OLTP (Optimizado para insertar y actualizar información) o OLAP (Optimizado para consultas de lectura).
- Ejemplos: Oracle, SQL Server, MySQL, PostgreSQL .

## Base de datos NoSQL

- Datos semi estructurados sin esquemas.
- Se utilizan consultas a través de API.
- Mejor rendimiento en las transacciones.
- Escalamiento horizontal, es decir, se agregan mas máquinas.
- Existen cuatro tipos: Columnas, KEy-Value, Documentos y Graph.
- Ejemplos: MongoDB, CouchDB, HBase, Cassandra.

{{< fancybox path="/img/2019/06" file="Untitled-c0522d3a-e690-4d44-9b1c-3212f01aa99c.png" caption="Distintos tipos de bases de datos." gallery="Gallery Name" >}}

## Servicios autoadministrados de bases de datos

AWS provee servicios de bases de datos que son administrados por ellos mismos y permiten que los clientes puedan utilizar un motor de base de datos sin la necesidad de preocuparse por la mantención del sistema operativo, actualizaciones de parches de seguridad, licenciamiento, etc.

Dentro de este grupo, existen herramientas como:

- Amazon RDS.
- Amazon Redshift.
- Amazon DynamoDB.
- Amazon ElasticCache.
- Amazon Neptune.
- HBase sobre EMR.

## **DDL (Data Definition Language):**

Permite crear y modificar la estructura de una **base de datos**.

- **CREATE:** Utilizado para crear nuevas tablas, campos e índices.
- **ALTER:** Utilizado para modificar las tablas agregando campos o cambiando la definición de los campos.
- **DROP:** Empleado para eliminar tablas e índices.
- **TRUNCATE:** Empleado para eliminar todos los registros de una tabla.
- **COMMENT:** Utilizado para agregar comentarios al diccionario de datos.
- **RENAME:** Tal como su nombre lo indica es utilizado para renombrar objetos.

## **DML (Data Manipulation Language):**

Permite recuperar, almacenar, modificar, eliminar, insertar y actualizar datos de una **base de datos**.

- **SELECT:** Utilizado para consultar registros de la **base de datos** que satisfagan un criterio determinado.
- **INSERT:** Utilizado para cargar de datos en la **base de datos** en una única operación.
- **UPDATE:** Utilizado para modificar los valores de los campos y registros especificados
- **DELETE:** Utilizado para eliminar registros de una tabla de una **base de datos**.

## **DCL (Data Control Language):**

Permite crear roles, permisos e integridad referencial, así como el control al acceso a la **base de datos**.

- **GRANT:** Usado para otorgar privilegios de acceso de usuario a la **base de datos**.
- **REVOKE:** Utilizado para retirar privilegios de acceso otorgados con el comando GRANT.

## **TCL (Transactional Control Language):**

Permite administrar diferentes transacciones que ocurren dentro de una **base de datos**.

- **COMMIT:** Empleado para guardar el trabajo hecho.
- **ROLLBACK:** Utilizado para deshacer la modificación que hice desde el último COMMIT.

