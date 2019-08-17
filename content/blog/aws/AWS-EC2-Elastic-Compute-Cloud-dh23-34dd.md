+++
author = "siorellana"
categories = ["AWS" , "EC2", "Cloud"]
date = "2019-06-05"
description = "Principios básicos de AWS EC2"
featured = "alexandre-debieve-561298-unsplash.jpg"
featuredalt = "Photo by Alexandre Debiève on Unsplash"
featuredpath = "date"
linktitle = ""
title = "AWS Elastic Compute Cloud (EC2)"
type = "post"

+++

# AWS EC2 Elastic Compute Cloud

EC2 es el servicio de AWS que permite crear maquinas virtuales en la nube. Para efectos prácticos se llaman instancias, ya que cuando se crea una máquina virtual nueva, en realidad se crea una instancia dentro de un host. Estas instancias están diseñadas para imitar el comportamiento de una maquina física, tal como lo hace VMWare o Hyper-V, pero con la ventaja de poder ser creadas y eliminadas bajo demanda para así lograr la elasticidad, simplicidad y escalabilidad que tienen trabajar con los proveedores de servicios cloud.

En este post abordaremos los distintos conceptos claves para entender cómo funcionan las instancias EC2 en el ecosistema de AWS.

**Escalabilidad**: Capacidad de crecer bajo demanda.

**Elasticidad**: Capacidad de adaptarse a los cambios, tanto para crecer como para decrecer.

**Simplicidad**: Simple, se pueden crear instancias de EC2 utilizando una API.

## ¿Cómo funciona el servicio EC2?

AWS cuenta con servidores físicos en cada uno de sus datacenters, estos servidores físicos son llamados Host Server y en ellos se instala un software de virtualización que permite disponibilizar recursos físicos y asignarlos a máquinas virtuales. 

En cada Host los recursos son compartidos para distintos clientes de AWS, los cuales son aislados mediante grupos de políticas de seguridad y reglas de firewall.

{{< fancybox path="/img/2019/06" file="Untitled-1fdf65a5-6ad3-486b-b0ea-a2035c1c0e25.png" caption="Distribución de recursos virtuales para instancias EC2. Por Linux Academy." gallery="Gallery Name" >}}


Respecto a la virtualización, que consiste en el proceso de crear una versión virtual del hardware, Amazon Web Services trabaja con un software llamado Xen Hypervisor, el cual soporta dos tipos de virtualización:

**HVM (Hardware Virtual Machine):** Este tipo de virtualización provee la habilidad de ejecutar el sistema operativo directamente sobre la maquina virtual, logrando tener una mayor compatibilidad con el hardware del host.

**PV (Paravirtual):** No crea una maquina virtual en sí, si no que entrega una interfaz con recursos especificos para que los use el usuario. Logra tener un mayor performance, pero es limitado en cuanto a las características de compatibilidad de hardware.

> Protip: PV es cosa del pasado, la moda ahora es HVM.


## Configuración

Cada instancia puede ser creada de diferentes tipos y formas, tanto en recursos como en sistema operativo, siendo los sabores mas utilizados Linux y Windows. 

Cada instancia se encuentra compuesta de los siguientes componentes:

**Amazon Machine Image (AMI):** El sistema operativo y otras configuraciones.

**Tipo de Instancia**: Recursos que tendrá la instancia (CPU, Ram, Ancho de banda, etc.)

**Interfaces de red:** Publicas, privadas o direcciones IP elásticas.

**Storage:** El "disco duro" de la instancia, que pueden ser de dos tipos:

- **Elastic block Storage (EBS)**: Disco de red persistente.
- **Instance Store**: El cual consiste de un storage efímero (Se apaga la instancia, se borra el disco y su contenido).

## Datos de vital relevancia

- Cada vez que se cree una instancia, se debe asignar a un grupo de políticas de seguridad (security group) o también conocido como Firewall, el cual permite o denega el tráfico a través de los distintos puertos desde y hacía la instancia.
- Cada instancia debe ser incorporada en una VPC (Virtual Private Cloud), AZ (Availability Zona) y subnet.
- Existe la opción de asignar o programar la ejecución de scripts de manera automática.
- Pueden utilizarse "Tags" para ayudar a ordenar y organizar las instancias, por ambientes, proyectos, etc.
- Para autentificarse y conectarse a estas instancias, debe trabajarse con llaves encriptadas o SSH-Keys.
- Existe un límite máximo de instancias que pueden ser creadas por cada región. En caso de necesitar mas instancias, pueden solicitarse desde el portal.
- Las mantenciones de los servidores físicos y de Xen Hypervisor es manejada por AWS

A continuación revisaremos en detalle cada uno de los pasos necesarios para crear una instancia EC2.

## Paso 1: Amazon Machine Images (AMI's)

Son un paquete preconfigurado de software (template) que es requerido para crear una instancia EC2. Este paquete incluye:

- Sistema operativo.
- Paquetes de softwares
- Otras configuraciones requeridas (Storage y tipo de virtualización).

{{< fancybox path="/img/2019/06" file="Untitled-67609547-7cff-4a11-8118-1d70c48b5fee.png" caption="EC2 Maketplace." gallery="Gallery Name" >}}


Existen tres tipos de AMIs disponibles para ser usadas en la creación de instancias EC2:

- AWS Marketplace: Provee templates que se pagan por uso y que generalmente contiene uso de licencias de software.
- Community AMIs: De uso gratis, generalmente sólo provee el sistema operativo o algunas herramientas Open Source.
- AMIs propias: Se pueden crear AMIs personalizadas.

## Paso 2: Tipos de instancias EC2

Los tipos de instancias son descritos como los componentes de hardware que va a tener la instancia. Estos componentes son:

- Computer Power (procesador/vCPU)
- Memoria (RAM)
- Opciones y optimizaciones de Storage
- Rendimiento de red

Cada tipo de instancia esta diseñado para suplir distintas necesidades de computo que vayan a requerir cada aplicación que se ejecutará en la instancia.

### Características del procesador 
{{< fancybox path="/img/2019/06" file="Untitled-85c4e300-55f1-4a8e-961c-765eb798a521.png" caption="" gallery="Gallery Name" >}}

Las instancias de Amazon EC2 que cuentan con un procesador Intel pueden ofrecer acceso a las siguientes características avanzadas del procesador:

- **AVX** - Las instrucciones Intel AVX mejoran el rendimiento de aplicaciones de procesamiento de audio/vídeo e imágenes, simulaciones científicas, análisis financieros, y análisis y modelado en 3D. Estas características solo están disponibles en las instancias ejecutadas con AMI HVM.
- **AES-NI** - Cifrado que mejora el estándar AES con mayor velocidad y seguridad, sin degradación de performance.
- **Turbo Boost Technology** - Permite realizar un overclocking del procesador en base a necesidad de manera eficiente.
- **Transactional Synchronization Extensions (TSX)** - Mejor performance para transacciones multi-threaded (paralelas)

### [Tipos de instancias](https://www.notion.so/fffd28b37f1447ca919ffba90ba02d12)

|Familia|Categoria|Descripción|Casos de uso|
|----|----|----|----|
|M5|Propósito General|"Balace entre memoria, CPU y recursos de red"|Bases de datos pequeñas y medianas
|C5|Optimizado para computo|Avanzado en CPU|"Modelamiento científico, Machine Learning"|
|H1|Optimizado para alamacenamiento|Discos duros locales|"MapReduce, sistemas de archivos de por red NFS."|
|R4|Optimizado para memoria|Mas RAM por dolar|Cache en memoria|
|X1|Optimizado para memoria|TB de RAM y disco SSD|"Bases de datos en memoria (BigData), SAP HANA"|
|I3|Optimizado para I/O|Almacenamiento SSD local y mayor IOPS (Input Output per Seconds)|"Bases de datos no relacional, NoSQL"|
|G3|Optimizado para gráficos GPU|Uso intensivo de gráficos de video|"Visualización 3D, transmisión de video"|
|F1|Optimizado para cómputo GPU|Uso de cores de GPU|"Análisis financieros, Procesamiento de video en tiempo real"|
|T2|Flexible|"CPU compartida, bajo costo"|"Servidores Web, Entornos de desarrollo y prueba."|

## Paso 3: Detalles de instancia y Bootstrapping

### EC2 IP Addresses

Cada zona por defecto trae una VPC (red privada cloud), que será la red donde todas las instancias estarán conectadas entre sí. De todas formas se pueden crear VPC personalizadas. 

Adicionalmente, cada una de las VPC contiene subnets o subredes, que identificará cada una de las distintas AZ.

En la subnet que se ha elegido la creación de la instancia, a esta instancia se le asignará automáticamente una IP Privada, la cual funcionará sólo para comunicar distintas instancias dentro de una VPC de una manera privada, es decir, replicando un entorno local.

 En caso de requerir comunicar la instancia de manera pública a travez de internet, se le puede asignar también una IPV4 o IPV6 pública. Esto es necesario si se requiere acceder a la instancia EC2 desde SSH, por ejemplo.

Existe una tercera opción de IP y consiste en Elastic IP Address, la cual consiste en asignar de manera dinámica una IP Pública a una instancia u otra. Esto es útil en caso de que una maquina por ejemplo falle y necesitemos crear una nueva, a esta nueva máquina se le puede asociar la IP antigua para dar continuidad o reemplazar al servidor anterior.

### Otros detalles

**Shutdown behavior:** Permite modificar el comportamiento del servidor al apagarla. Las opciones pueden ser:

- Stop: La cual detiene la instancia cuando se apaga.
- Terminate: La cual elimina la instancia cuando se apaga.

**Enable termination protection:** Consiste en una protección que no permite que la máquina sea eliminada por error.

**Monitoring:** Habilita el monitoreo de la instancia por CloudWatch y comienzan a obtenerse métricas de la instancia.

**Tenancy:** Indica si la instancia utilizará recursos compartidos, recursos dedicados o incluso un Host dedicado. Esto obviamente con costos y cargos adicionales.

**Network interfaces:** En caso de que sea requerido contar con mas de una interfaz de red, se puede agregar en este punto. Esta segunda interfaz de red puede eliminarse o asignarse a otra instancia

### Detalle avanzados

En esta sección se pueden añadir Bootstrapping o procesos de inicio automatizados o incluso una serie de comandos sin output o salida. En este punto se pueden añadir comandos personalizados como instalación de paquetes, instalación de software, configuraciones especiales que de deba tener la instancia, entre otras configuraciones.

En la sección **User-Data** se puede añadir el código o script que se desea ejecutar en el proceso de creación de la instancia. Por ejemplo, si en la creación de la instancia se quiere instalar un servidor web como Apache, se puede añadir lo siguiente en la sección User-Data.

    #!/bin/bash
    yum update -y
    yum install -y httpd
    service httpd start

También, es posible realizar la descarga e instalación de paquetes de software o de configuración de infraestructura, permitiendo descargar el archivo, instalarlo y luego generar la configuración del software.

## Paso 4: Almacenamiento

Es importante realizar la correcta elección del almacenamiento que será previsto a la instancia. Existen tres tipos de almacenamiento que puede ser seleccionados. 

La primera es Instance Store y corresponde a un disco que se encuentra de forma local en el servidor Host o en el Storage del servidor Host.

El segundo tipo de almacenamiento corresponde a EBS Volumes (Elastic Block Storage) y es un espacio ubicado fuera del host y que puede ser asignado a distintas instancias, pero siempre a una a la vez.

En caso de que sea necesario presentar información de manera compartida, exista la tercera opción que corresponde a EFS (Elastic FileSystem), que permite montar de manera compartida un filesystem por la red con NFS.

{{< fancybox path="/img/2019/06" file="Untitled-e4ea2241-858a-4184-a2e8-3b373814139a.png" caption="Opciones de almacenamiento. Por LinuxAcademy" gallery="Gallery Name" >}}


### EBS Elastic Block Storage

Su principal característica es que son permanentes, es decir, pueden durar incluso cuando la instancia es eliminada. Son volúmenes que se disponibilizan por red, por lo que se pueden atachar y desatachar de las instancias sin mayor dificultas, sin embargo, sólo pueden estar atachados a una instancia a la vez.

Adicionalmente, los EBS tienen el beneficio de poder ser respaldados como Snapshots en buckets de S3, lo cual permite cierta movilidad de poder recuperar un EBS en otro volumen EBS.

#### Performance

El performance de los volúmenes EBS es medido por operaciones de entrada y de salida (input/output) o IOPS. IOPS es la cantidad de operaciones de entrada y salida por segundo, estos IOPS son de un tamaño máximo de 256KB, por lo que si una operación tiene un tamaño mayor, es dividido en bloques de tamaños de 256KB. Por ejemplo, una operación de 512KB contará como 2 IOPS.

Es importante conocer y entender los requerimientos de IOPS que la aplicación o la arquitectura propuesta debe tener, para no afectar el performance de la aplicación. Para esto, existen varios tipos de EBS que suplen distintos requerimientos de IOPS para los volúmenes EBS.

Cuando se crea un nuevo volumen EBS desde un snapshot, este debe ser inicializado. Este proceso de inicialización ocurre cuando el volumen es leído, durante este proceso, el performance del volumen se puede ver afectado hasta en un 50%.

> Protip: Al crear una instancia desde un EBS Snapshot, puedes crear un script que haga una lectura del disco durante inicialización para evitar degradación en el futuro y agregarlo en la sección **User-Data**.

#### Tipos de EBS

Existen principalmente dos tipos de discos: SSD y HDD. Dentro de cada una de estas categorias existen dos sabores:

- **Solid-State Drives(SSD):**
    - **Propósito general (gp2)**
        - Uso para ambientes de desarrollo y prueba.
        - Hasta 32.000 IOPS
        - Tamaño desde 1GB hasta 16TB.
    - **Provisioned IOPS SSD (io1)**
        - Idealmente para ambientes críticos que requieren alta carga de IOPS
        - Grandes cargas de bases de dato
        - Tamaños desde 4GB hasta 16TB
        - Hasta 64.000 IOPS por volumen
- **Hard Disk Drives (HDD):**
    - **Throughput Optimizado (st1)**
        - Almacenamiento de bajo costo
        - Usado para acceso frecuente de información o cargas intensivas como Streaming o BigData.
        - No puede ser utilizado como volumen de inicio.
        - Tamaño desde 500GB hasta 16TB
        - Throughput máximo de 500Mb/s
    - **Cold HHD (sc1)**
        - El mas barato de todos
        - Usado para acceso a información de forma poco frecuente
        - No puede ser usado como volumen de inicio
        - Tamaño desde 500GB hasta 16TB
        - Throughput máximo de 250 Mb/s

### Local Storage

Estos volúmenes son dispositivos virtuales que son físicamente conectados al servidor Host donde esta ejecutándose la instancia. Estos discos son mucho mas rápidos pero sólo se encuentran disponibles mientras la instancia esta en ejecución. Se la instancia es detenida o apagada, la información en el volumen es eliminada. Sin embargo, la instancia puede ser reiniciada sin perder la información.

## Paso 5: Agrega Tags

Son una herramienta opcional que tiene como fin darle una organización y clasificación de las instancias. Por ejemplo, si las instancias son de un ambiente para desarrolladores, puedes agregarle un *tag* llamado **DEV** para identificar que pertenecen a ese grupo.

## Paso 6: Security Groups

Consiste en un firewall que crea reglas de acceso de trafico desde y hacia las instancias. Un security group puede ser compartido con varias instancias.

Desde aquí por ejemplo, se pueden añadir reglas para admitir algún puerto especifico como el 22 que corresponde a SSH y desde alguna dirección IP específica y habilitar el acceso por el puerto 443 desde cualquier IP a través de internet.

Existen dos tipos de reglas que deben ser consideradas a la hora de admitir o denegar tráfico. Uno es a nivel de red considerado **stateless** o olvidadizo o no estático y es llamado Network ACL y es aplicada a cada subnet dentro de una VPC. Debe especificarle como va a fluir el tráfico a través de una VPC, es decir, si necesitamos que el tráfico pase por el puerto 80 hay que especificar una regla **allow** tanto para el el tráfico entrante **inbound** o saliente **outbound.**

La otra regla es a nivel instancia y funciona de la misma forma que lo hace un firewall. Por defecto todo el tráfico esta **Denied** al menos que haya un **Allow** explícito. Es **statefull** por que "recuerda" que si una regla es permitida en la entrada, debe ser permitida a la salida. La diferencia primordial con un NACL es que es a nivel de instancia.

### EC2 Key Pairs

Consiste en dos claves criptográficas que son utilizadas para autenticar a los clientes o usuarios cuando se conectan a una instancia EC2. Cada par de claves consisten en una llave pública y una llave privada. AWS se encarga de almacenar la llave pública y nosotros somos responsables de almacenar la llave privada. Esta llave sólo puede ser descargada cuando es creada, en caso de que no la hayas descargado o se haya perdido, debes generer un nuevo juego de llaves.

Para ingresar a una instancia EC2, se deben crear y autenticar un par de llaves, ya que las instancias con linux no tienen contraseñas y la única forma de conectarse es utilizando las llaves.

En instancias con Windows, teniendo las llaves se puede obtener la contraseña de administrador e ingresar a la instancia utilizando un cliente RDP (Remote Desktop Protocol).

Las llaves son creadas o registradas en el caso de ya contar con un par de llaves, durante el proceso de creación de la instancia. Una vez completada la creación de la instancia, se puede descargar la llave privada en formato .pem, y debe ser almacenada con los permisos adecuados. Esto se puede realizar ejecutando el siguiente comando:

    chmod 400 [llave_privada].pem

Una vez descargada la llave privada, se puede acceder a la instancia en caso de ser linux, con el siguiente comando desde alguna terminal:

    ssh -i ~/path-to-file/[llave_privada].pem ec2-user@<ip_publica>

El usuario ec2-user cuenta con permisos para hacer sudo en la instancia.

 **Una vez completados estos 6 pasos ya se cuenta con una instancia EC2 funcionando en AWS.**

----
# Otros conecptos importantes

## EBS Snapshots

Backups son una parte esencial para poder mantener en el tiempo una aplicación. Snapshot son respaldos basados en un punto de tiempo del volumen EBS y es almacenado en un bucket de S3. Estos respaldos son incrementales por defecto, por lo que solo respaldará los cambios mas recientes realizados desde el ultimo backup, reduciendo costos principalmente por almacenamiento.

Si un snapshot antiguo es eliminado, se mantendrán los bloques necesarios para recuperar otros snapshot que aun tienen una retención válida, garantizando la consistencia de los datos.

Snapshot pueden ser utilizados para dos cosas:

- Crear respaldos que permitan realizar la recuperación completa de un volumen EBS.
- Crear AMIs personalizadas.

Es recomendable realizar respaldos lo mas frecuente que requiera la trama y es importante asegurar la consistencia de los datos, deteniendo procesos de escrituras en los volúmenes.

Los snapshots quedan disponibles para ser recuperados sólo en la misma región donde fueron tomados, pero pueden copiarse a otras regiones con la opción "Copy Snapshot" a través de la consola. También, estos snapshots son por defecto privados y sólo pueden ser generados o utilizados por la cuenta o persona que es dueño del volumen, sin embargo, pueden ser compartidos entre otras cuentas.

## Placement Groups o Clusters

Son grupos de instancias ubicadas en la misma AZ que se utilizan para altas cargas de trabajo y garantizan una alta performance para las aplicaciones y ancho de banda disminuyendo también la latencia. AWS intenta colocar todas las instancias lo mas junto posible fisicamente en el datacenter para maximizar el ancho de banda (hasta 25Gbps). Se puede utilizar Enhanced Networking (red mejorada) para maximizar el beneficio. Es recomendable solicitar todas las instancias requeridas en una sola petición, todas las instancias serán creadas con el mismo tipo de instancia.

Si un miembro del grupo es apagado, una vez que inicie otra vez continuará siendo parte del cluster.

## Opciones de compra

EC2 tiene dos formas de compra de instancias, bajo demanda o reservada.

- On-Demand:
    - Permite crear instancias y eliminarlas cuando uno quiera en cualquier momento.
    - Es mas caro para instancias que estarán en ejecución durante largos periodos de tiempo.
    - Es mas flexible
    - Sólo se paga por el tiempo que la instancia ha estado encendida.
        - Precio por segundo: Para AMIs Amazon Linux y Ubuntu
        - Precio por hora: Windows, RHEL, o cualquier otra AMI donde no se especifica precio por segundo.
- Reservadas:
    - Permite comprar instancias por una cantidad de tiempo definido entre un año o tres años.
    - Permite obtener descuentos significativos en comparación con las instancias On-Demand.
    - Descuentos pueden llegar hasta un 75%.

Adicionalmente a estas dos opciones de compra, existen las instancias *Spot*. Esta opción permite a AWS vender el uso de instancias en desuso, por un corto periodo de tiempo con un descuento sustancial. Como funciona? Eliges el precio máximo que quieres pagar por una instancias, entonces cuando la demanda baje y el precio de la instancia es igual o menor que el precio requerido, se inicia la instancia. Se paga por uso aplicando las mismas condiciones de AMIs expuestas anteriormente. La instancia Spot es terminada o hibernada cuando el precio de la instancia nuevamente comienza a subir hasta sobrepasar el valor ingresado. Hay un warnning de dos minutos.

Si AWS elimina la instancia antes de la hora de uso, no se realiza cargo.

## AWS EFS Essentials

EFS es un filesystem por red muy similar al concepto de NFS, que consiste en un servidor que provee un filesystem a través de la red para que otros servidores puedan hacer uso de este filesytem.

La capacidad de este volumen es elástico, por lo que no hay que preocuparse por quedarse sin espacio, ya que el tamaño del volumen crece con el volumen de la información que se almacena en el filesystem. Debido a esto, las aplicaciones que corren en instancias EC2 que usan EFS, siempre tendrán el espacio necesario para funcionar sin la necesidad de añadir un disco adicional.

Adicionalmente, las instancias EFS son totalmente autoadministradas, por lo que no requieren mantención.

Algunos de los beneficios que se tiene al trabajar con este tipo de almacenamiento son:

- Los volúmenes EFS pueden ser presentados a más de una instancia EC2 al mismo tiempo, por lo que los archivos almacenados quedan disponibles para todas las instancias EC2, logrando que las aplicaciones puedan acceder a la misma información.
- Los volúmenes EFS pueden ser presentados también a servidores ubicados en ambientes On-Premises (datacenter locales), siempre y cuando haya conexión a la VPC utilizando AWS Direct Connect. Esto permite realizar migraciones de información o utilizar los volúmenes EFS como solución de respaldo.
- EFS puede escalar a tamaños de petabytes manteniendo la latencia baja y altos niveles de ancho de banda.
- Se paga solo por el monto de almacenamiento que es utilizado.
- Red de potente performance llegando a 100MB/s.

En cuanto a temas de seguridad, los volúmenes son protegidos con permisos POSIX, esto quiere decir que se pueden asignar a Dueños, Grupos y Otros/Todos los siguientes permisos:

- Read / Write: Otorga full permisos al filesystem compartido o archivo.
- Read-only: Un usuario puede leer el contenido del archivo y copiarlo, pero no puede guardar cambios en los archivos o filesystem.
- Write-only: Sólo esta permitido escribir el archivo, pero no leer el contenido de este
- No access: El usuario no puede acceder al contenido del filesystem o archivo, tampoco permite copiar.

También se puede restringir el acceso por permisos a través de la red VPC o utilizando el IAM para accesos de APIs.

Adicionalmente, se puede encriptar la información utilizando AWS KMS.

EFS es muy útil para los siguientes casos de uso:

- Big Data y análisis de datos.
- Cargas de procesos de contenido multimedia.
- Servidores web y administradores de contenido.