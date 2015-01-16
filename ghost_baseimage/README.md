# Ghost Baseimage

Imágen basada en [phusion-baseimage](http://phusion.github.io/baseimage-docker/), que es una versión de Ubuntu optimizada para Docker.

Contiene una instalación básica de [Ghost](http://ghost.org), que es una plataforma de blogging desarrollada con Node.js y con una interfaz simple y muy cuidada.


## Arrancar el contenedor

Para arrancar el contenedor, ejecuto:

	$ > sudo docker run -d -p 80:2368 khernandez/ghost_baseimage

, por lo que accediendo a [http://localhost:2368](http://localhost:2368) deberíamos ver una instalación vacía de Ghost.

Si por el contratio estás utilizando Boot2Docker, probablemente tendrás que acceder a [http://192.168.59.103:2368](http://192.168.59.103:2368). Puedes conocer la ip que te corresponde ejecutando: 

	$ > boot2docker ip



## Personalizando el CMS

Si ya disponemos de la personalización del CMS (datos, imagenes, themes, etc…) podremos hacer uso de ellas en el contenedor montando los volúmenes donde le corresponda.

De esta forma, conseguimos 2 cosas:

- Tener una imagen que nos sirva como base para crear un contenedor en cualquier momento con la configuración básica de Ghost

- Persistir la BBDD, imágenes y themes independientemente de si estamos corriendo un contenedor o no


**1. Configuración del blog**

Imaginemos que tenemos ya en nuestro host/equipo el blog montado y queremos que el nuevo contenedor *tire* de dicha configuración. Para ello, indicaremos que el contenedor debe cojer el fichero de configuración de nuestro host ejecutando:

	$ > sudo docker run -d -p 80:2368 -v <PATH_ABSOLUTO_EN_NUESTRO_HOST>/config.js:/home/ghost/config.js khernandez/ghost_baseimage

**2. Datos, imagenes y theme**

Si además, tenemos personalizado el theme, hemos escrito algunos post y tenemos imágenes asociadas a dicho post, podremos también hacer que la instalación del contenedor de Docker *tire* de nuestro entorno de desarrollo:

	$ > sudo docker run -d -p 80:2368 -v <PATH_ABSOLUTO_EN_HOST>/config.js:/home/ghost/config.js -v <PATH_ABSOLUTO_EN_HOST>/content:/home/ghost/content khernandez/ghost_baseimage

De esta forma, ya podemos utilizar un contenedor con una versión optimizada de Ubuntu para Docker y el CMS Ghost instalado.


## Administrar el contenedor

Durante los próximos días actualizaré esta documentación para mostrar cómo podemos acceder a los contenedores creados con esta imagen para poder administrarlos y ejecutar comandos sobre ellos.