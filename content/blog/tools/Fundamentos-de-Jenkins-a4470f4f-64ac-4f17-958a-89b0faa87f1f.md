+++
author = "siorellana"
categories = ["Jenkins" , "DevOps", "Cloud"]
date = "2019-08-05"
description = "Principios básicos de Jenkins"
featured = "deva-darshan-Jt9syHEhrPE-unsplash.jpg"
featuredalt = "Photo by Deva Darshan on Unsplash"
featuredpath = "date"
linktitle = ""
title = "Jenkins in a nutshell"
type = "post"

+++

# Fundamentos de Jenkins

En los últimos tiempos, para los que trabajamos en TI escuchar conceptos como Integración Continua (CI), Entrega Continua (CD), Jenkins y Pipelines es muy común y los hemos adoptados dentro de nuestro día a día, pero muchas veces sin entender por completo de lo que estamos hablando.

Para esto, he escrito el siguiente post con el fin de aclarar dudas respecto a estas metodologías y tecnologías que ya son un *must* en casi todas las compañías que trabajan con equipos de desarrollos tanto en entornos On-Premise como Cloud.

Jenkins es una herramienta de CI/CD, por lo que necesitamos entender primero estos conceptos antes de trabajar con Jenkins.

## ¿Qué es Integración Continua (CI)?

Consiste en una práctica de desarrollo de software donde el equipo de desarrollo sube su código a un repositorio compartido, generalmente utilizando alguna herramienta de control de código basado en Git como GitHub, GitLab, Bitbucket, entre otros. De esta forma, cualquier cambio o aporte del desarrollador es incorporado de manera incremental a la rama maestra del proyecto. Con esto, los desarrolladores son capaces de integrar codigo dentro de un repositorio varias veces al día sin muchas dificultades y sin pasar a llevar el trabajo de sus compañeros.

Esta practica viene a reemplazar el típico "pásame el código en un .zip, lo descomprimo, hago mis cambios, lo comprimo y luego te mando mi .zip para que lo pruebes" lo cual causaba muchos dolores de cabezas cuando se estaba trabajando en equipo.

{{< fancybox path="/img/2019/08" file="Untitled-43e30ae7-00f5-48de-a671-0469c4c54eb4.png" caption="Proceso de integración continua." gallery="Gallery Name" >}}

Con CI, el sistema de control de versiones es monitoreado constantemente por herramientas como Jenkins, quien al detectar un nuevo cambio en el código automáticamente realiza distintas acciones pre-configuradas como:
    - Pruebas de código.
    - Creación de un ambiente de pruebas. 
    - Ejecución de la aplicación. 
    - Construncción de la aplicación.
    - Entre muchas otras opciones. 
En caso de detectar algún problema, ya sea en la ejecución o construcción de la aplicación, Jenkins notificará al equipo de desarrollo con el fin de poder realizar las correcciones necesarias de forma inmediata y oportuna.

### Beneficios de utilizar Integración Continua

* Detección de problemas o bugs lo mas pronto posible durante el desarrollo del proyecto.
* Permite realizar la incorporación de funcionalidades de un desarrollo en menor tiempo.
* Se pueden obtener métricas de calidad de código a medida que se va desarrollando.
* Mejora la productividad de los equipos de desarrollo.
* Fomenta el comportamiento que ayuda a reducir la cantidad de errores.
* Registro de los cambios en los códigos de las aplicaciones.

## ¿Qué es Entrega Continua (CD)?

La entrega continua o Continuous Delivery, es el paso que proviene de la Integración Continua y permite enviar el código funcional y sin errores a un ambiente en el cual un equipo de usuarios puedan interactuar con él con el fin de asegurar la calidad del producto y evaluar su comportamiento en un ambiente que simula producción.

## ¿Qué es Implementación Continua (CD)?

La implementación continua o Continuous Deployment, es el paso final y al cual todos los equipos de desarrollo aspiran implementar y consiste en la puesta en marcha del código directamente a producción tan pronto como se hayan agregado las funcionalidades en el código. Generalmente el paso a producción es un proceso manual que requiere de ciertas validaciones para garantizar el correcto funcionamiento en producción, pero con un nivel de madurez suficiente en la técnica de CI/CD, se puede lograr que los cambios realizados en el código pasen directamente en producción*.*

## Herramientas de CI/CD

Actualmente existen muchas herramientas que permiten realizar CI/CD, pero las mas conocidas son:

- Jenkins
- CircleCI
- TravisCI
- GoCD
- GitLab CI
- Spinnaker

En esta oportunidad y debido a que ya lo puse en el título, revisaremos los fundamentos de Jenkins.-

# Historia de Jenkins

Jenkins es un servidor de integración continua y construcción de proyectos de desarrollos, permite automatizar ciertas tareas de manera periódica o que se ejecuten a través de eventos.

Jenkins fue lanzado en 2005 bajo el nombre de Hudson, pero se creó en el 2004 por Kohsuke Kawaguchi que en ese tiempo trabajaba en la empresa Sun. Fue renombrada en el 2011 a Jenkis.

{{< fancybox path="/img/2019/08" file="Untitled-71dbf120-de00-427b-82a5-eaacc18398c5.png" caption="Logo de Hudson." gallery="Gallery Name" >}}

Esta herramientas es de código abierto y esta desarrollada en Java, actualmente es utilizada por equipos de desarrollo de distintos tamaños para proyectos en distintos lenguajes de programación como Java, .Net, Groovy, Ruby, entre muchos más.

Su popularidad se debe a que es una herramienta muy fácil de utilizar, con una interfaz amigable e intuitiva.

{{< fancybox path="/img/2019/08" file="Untitled-981a9957-7e91-46cb-9ae1-4c0a95769efd.png" caption="Interfaz de usuario de Jenkins." gallery="Gallery Name" >}}

Comenzar a utilizar Jenkins en realidad no tiene una complejidad mayor, ya que un servidor puede ser implementado en minutos. También Jenkins posee una flexibilidad extrema gracias a sus miles de complementos que proporcionan funcionalidades como:

- Complementos de sistemas de control de versiones.
- Métricas de calidad de código.
- Notificaciones de compilación.
- Personalización de interfaces de usuarios.

### Continuará ...