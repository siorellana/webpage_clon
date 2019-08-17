+++
author = "siorellana"
categories = ["AWS" , "ELB", "Cloud"]
date = "2019-06-08"
description = "Conceptos básicos sobre AutoScaling y Load Balancer"
featured = "unplash-load.jpg"
featuredalt = "AutoScaling"
featuredpath = "date"
linktitle = ""
title = "AWS AutoScaling y Elastic Load Balancer (ELB)"
type = "post"

+++

# Autoscaling

Es una de las principales ventajas de utilizar servicios cloud, ya que permite la flexibilidad de usar recursos bajo demanda en base a factores como la carga de un servidor. Quiero aclarar que sí es posible escalar en un ambiente on-premise utilizando las herramientas correctas, pero requiere de una fuerte inversión de infraestructura que debe ser aprovisionada con anterioridad. En cambio al hacerlo en la nube, los recursos ya se encuentran disponible si inversión inicial, sólo pago por uso.

Por ejemplo, cuando muchos usuarios se conectan a un sitio, los servidores aumentan el uso de recursos tales como CPU, RAM o Disco. Cuando la carga aumenta hace que se saturen estos componentes hasta el punto que no se permiten nuevos requerimientos o simplemente el servidor se va abajo, haciendo que el sitio ya no este disponible. Con autoscaling, al ver que la carga o el uso de recursos aumenta por sobre los valores establecidos, se crea un nuevo servidor y distribuye la carga de trabajo entre los dos servidores, evitando así que se deje de dar el servicio a los usuarios.

### Componentes de un AutoScaling Group:

- **Configuración de template**: Describe cómo serán las instancias que serán creadas de manera automática. Son las mismas definiciones para crear una instancia EC2.
- **Reglas de AutoScaling**: Todas las reglas relacionadas con el aprovisionamiento de las nuevas instancias o la eliminación de estas como:
    - Numero mínimo y máximo de instancias.
    - En qué VPC y AZ se crearán los nuevos servidores.
    - Si recibirán tráfico de una balanceador de carga.
    - Métricas y políticas de escalamiento.
    - Notificaciones utilizando SNS
- **Metricas**: Valores que se ajustan para crear o eliminar nuevas instancias.

{{< fancybox path="/img/2019/06" file="Untitled-7469e3cd-b4d2-48ab-aa62-912a8319ac7e.png" caption="AutoScaling." gallery="Gallery Name" >}}


## Elastic Load Balancer

Es un servicio administrado de AWS que permite distribuir el tráfico entre distintas instancias o recursos. Load Balancer o balanceador de carga es un método común utilizado para distribuir tráfico entrante entre varios servicios o servidores web. 

> El término **Elastic** se refiera a que tiene la capacidad de crecer o decrecer en base a la demanda.

Puede ser utilizado para balancear carga de manera pública hacia los usuarios a través de internet o privada para balancear cargas de trabajo a nivel de backend.

Posee su propio servidor DNS. Manda tráfico de manera automática a nuevas instancias EC2 que se hayan creado producto del autoscaling y también deja de mandar tráfico a las instancias que ya no estén disponibles, utilizando un **Health Check.**

Se pueden crear ELB que sean multi-AZ para asegurar la alta disponibilidad y la tolerancia a fallas.

Existen tres tipos de Load Balancer:

- **Classic**: Consiste en un balanceo diseñado para distribuir tráfico a múltiples instancias EC2. No existen reglas granulares, todas las instancias reciben el mismo tipo de tráfico. Puede balancear los siguientes tipos de tráfico:
    - SSL
    - TCP
    - HTTP
    - HTTPS
- **Application:** Esta diseñado para balancear el tráfico a uno o más grupos de instancias utilizando reglas basadas en contenido. estas reglas pueden ser configuradas utilizando:
    - Host-Based Rules: Reglas basadas en el nombre del host en el campo del Header HTTP.
    - Path-Based Rules: Reglas basadas en el path de la URL en el Header HTTP

    Esto permite estructurar la aplicaciones como pequeños servicios y monitorear o autoescalar basado en la carga de los grupos de instancias. Es ideal para servicios como Elastic Container Service o Elastic Kubernetes Service, Access Logs HTTPS, Sticky Session y AWS Web Application Firewall.

    > Sticky Session: Si un usuario inicia sesión, manda todo el tráfico a la misma instancia o grupo de instancia

- **Network:** No es elástico, solo puede dirigir tráfico a direcciones IP. Ideal para altas cargas programadas de tráfico. Puede ser a IP dentro de AWs como en ambientes on-premises.

{{< fancybox path="/img/2019/06" file="Untitled-2c4b9d3d-0c41-4543-afda-9ecf5fee7aa7.png" caption="AutoScaling." gallery="Gallery Name" >}}

