+++
author = "siorellana"
categories = ["AWS" , "VPC", "Cloud"]
date = "2019-06-07"
description = "Principios básicos de Networking de AWS (VPC)"
featured = "unplash-network.jpg"
featuredalt = "Networking"
featuredpath = "date"
linktitle = ""
title = "AWS Virtual Private Cloud (VPC)"
type = "post"

+++

# AWS VPC Virtual Private Cloud 

Amazon Virtual Private Cloud (Amazon VPC) permite crear redes virtuales privadas en AWS para comunicar los distintos servicios o instancias EC2 simulando un entorno de red local como en un data center, pero con el beneficio de usar la infraestructura escalable de AWS. Antiguamente (previo a 2013) todas las instancias compartían una red publica y se aislaban mediante reglas de Firewall, pero esto no era óptimo y agregaba complejidad a las arquitecturas de las aplicaciones, por lo que se creó este servicio en el cual cada cliente puede tener su propia red privada y aislada del resto de los clientes.

## Datos de vital relevancia

- Los **Availability Zones** (AZ) son grupos de servidores ubicados en uno o mas data centers, aunque se les considera un cluster.
- Cuando se habla de **Multi-AZ**, se refiere a la habilidad de estar en varios grupos de servidores o (spoiler) Availability Zones.
- Existen unas subredes _llamadas **subnets**_ que es la red donde realmente van conectadas las instancias o los recursos y se les asignará una IP, estas pueden ser públicas o privadas.
- ¿Para qué quiero una red pública? Generalmente queremos que nuestro sitio web o aplicación pueda ser accesible para todos, para esto, los servicios deben estar en redes públicas para que los usuarios puedan llegar a ellos a través de internet. Por otro lado, estos usuarios no deberían tener acceso directo a las bases de datos, para esto se crean redes privadas donde se especifica que sólo los servidores de aplicación puedan ingresar o consultar los registros a la base de datos.
- IPV6 sólo es soportado para acceso público.
- Es opcional pero muy útil conocer un poco de **CIDR**, que es la notación con la que se definen los rangos de IP. Si no lo sabes o no los recuerdas, te dejo esta imagen.

{{< fancybox path="/img/2019/06" file="Untitled-acd8994c-3dde-49ff-b0a2-32a369a9b431.png" caption="CIDR Basic table." gallery="Gallery Name" >}}

- AWS permite sólo rangos de IP desde /16 (65.535 direcciones IP)hasta /28 (16 direcciones IP).


## Características de VPC

- No son redes globales, son solo redes restringidas a una región o AZ.
- Una VPC esta diseñada para parecerse a:
    - Un datacenter privado on-premise.
    - Una red corporativa privada.
- Existen subredes _llamadas subnets_ que pueden ser:
    - Públicas: Cuentan con acceso a través de internet. Conocidas como Front End.
    - Privadas: Limitadas al alcance de la red "local". Conocidas como Back End.
- Arquitectura escalable en base a las necesidades.
- Habilidad de extender la red corporativa/on-premise a la nube utilizando una conexión VPN.
- La VPC es alojada en la región seleccionada.
- Una VPC es distribuida en múltiples AZ para garantizar recursos redundantes donde los distintos grupos de servidores logren tener acceso a la misma red.
- AWS provee un servidor DNS para tu VPC, de esta forma cada una de las instancias obtienen un hostname. De todas formas tú puedes ejecutar tu propio servidor DNS cambiando la configuración de DHCP de la VPC.
- Por defecto, AWS provee una VPC para cada uno de sus clientes, pero también se pueden crear mas de una VPC.
- La VPC por defecto viene lista para usarla y cuenta con el re-direccionamiento a internet a través de Internet Gateway (IGW).
- No se recomienda usar la VPC por defecto para ambientes de producción.

## Beneficios de una VPC

- Habilidad de conectar las instancias EC2 a través de subnets, lo cual permite dividir la VPC en muchas subredes que pueden estar totalmente aisladas unas de otras.
- Opción de configurar un rango de IP personalizado dentro de cada subnet usando CIDR.
- Capacidad de crear rutas entre varias subnets mediante route tables.
- Se puede permitir el acceso a internet mediante un Internet Gateway, que provee una ruta a internet para los recursos dentro de la VPC.
- Provee dos capas de seguridad:
    - Seguridad a nivel de instancias con Security Groups que es el equivalente de un Firewall.
    - Seguridad a nivel de red utilizando ACLs (Access Control List) que equivale a un Firewall de red.
- Ya lo dije antes, pero lo repito porque es importante, la habilidad de conectar tu entorno On-premise con AWS a través de una VPN o utilizando un VPG (Virtual Private Gateway) que consiste en colocar un servidor o aplicación en el data center que crea un túnel a la red de AWS, permitiendo de esta manera extender la red local hacia la nube.

## Restricciones

- 5 VPC por región, se puede crear una solicitud en caso de requerir mas.
- 5 Internet Gateway por región, en realidad esta ligado a la cantidad de VPC que tengas. Si tienes 6, debe haber al menos un IGW por VPC.
- 50 clientes de Gateway por región
- 50 conexiones VPN por región.
- 200 route tables por región  y 50 entradas por route table.
- 5 IP elásticas.
- 500 security groups por VPC.
- 50 reglas de Firewall por security group.

## Regiones

Cada vez que se quieren crear recursos en AWS, se debe seleccionar una región. 

{{< fancybox path="/img/2019/06" file="Untitled-055d07b7-c190-4879-8869-e17c5a6dfb34.png" caption="Regiones de AWS, probablemente este desactualizado." gallery="Gallery Name" >}}

Lo recomendado es siempre validar la latencia o tiempo de conexión que hay hacia la región que se esta seleccionando o se quiere seleccionar. Para esto existe la siguiente herramienta llamada [https://www.cloudping.info](https://www.cloudping.info/) que permite evaluar el tiempo de conexión entre nuestro navegador actual y las distintas regiones de AWS.

{{< fancybox path="/img/2019/06" file="Untitled-1ccbf21f-3d1a-4df1-afbc-4e66b44afbad.png" caption="Latencia desde Chile a distintas regiones de AWS." gallery="Gallery Name" >}}


## Availability Zones

En este caso, se puede apreciar que el mejor tiempo de respuesta se encuentra en la región US-East (Este de Estados Unidos) o también conocida como Virginia, con 139 milisegundos de demora ante una solicitud del tipo HTTP.

Luego le sigue la región que esta mas cerca de mi posición actual (Santiago de Chile) que corresponde a South America ubicada en Sao Paulo Brasil con 153 milisegundos.

Por el contrario, la zona que tiene un peor tiempo de respuesta, por ende, no debería ser un candidato a seleccionar, corresponde a las regiones de China Beijing y Asia Pacifico Mumbai (India).

La latencia siempre debe ser un factor importante a considerar a la hora de seleccionar la región donde se van a generar los recursos, ya que puede afectar directamente en el performance de las aplicaciones o servicios que se darán desde AWS.

Cada una de las regiones cuenta con AZ (Availability Zones), que son uno o mas data centers en cluster ubicados a kilometros entre cada uno y permiten garantizar alta disponibilidad y tolerancia a fallas.

El siguiente diagrama se muestra como se encuentra ubicada una VPC entre las distintas AZ de una región, de esta forma permite tener comunicadas instancias ubicadas en distintas AZ siempre y cuando estén dentro de la misma región.

{{< fancybox path="/img/2019/06" file="Untitled-26675393-e4c7-4ee8-b6d0-5fe458545fd2.png" caption="Como se vería una VPC en una arquitectura." gallery="Gallery Name" >}}

## Seguridad

Existen dos tipos de reglas que deben ser consideradas a la hora de admitir o denegar tráfico. Uno es a nivel de red considerado **stateless** o olvidadizo o no estático y es llamado Network ACL y es aplicada a cada subnet dentro de una VPC. Debe especificarle como va a fluir el tráfico a través de una VPC, es decir, si necesitamos que el tráfico pase por el puerto 80 hay que especificar una regla **allow** tanto para el el tráfico entrante **inbound** o saliente **outbound.**

La otra regla es a nivel instancia y funciona de la misma forma que lo hace un Firewall. Por defecto todo el tráfico esta **Denied** al menos que haya un **Allow** explícito. Es **statefull** por que "recuerda" que si una regla es permitida en la entrada, debe ser permitida a la salida. La diferencia primordial con un NACL es que es a nivel de instancia.