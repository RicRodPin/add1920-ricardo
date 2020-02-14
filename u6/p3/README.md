# 1. Contenedores con Docker

## 1.1. Introducción

Esta herramienta nos permite crear lo que ellos denominan contenedores, lo cual son aplicaciones empaquetadas auto-suficientes, muy livianas, que son capaces de funcionar en prácticamente cualquier ambiente, ya que tiene su propio sistema de archivos, librerías, terminal, etc.

## 1.2. Requisitos

* Vamos a usar OpenSUSE
* Kernel 3.10 o Superior(`uname -a`)
![](img/kernel.png)

## 1.3. Habilitar el acceso a la red externa a los Contenedores

Para que nuestro contenedor tenga acceso a la red exterior activaremos el IP_FORWARD

![](img/habilitar_forwarding.png)

# 2. Instalación y primeras pruebas.

## 2.1. Instalación

Vamos a instalar docker
![](img/instalando_docker.png)

Ahora activaremos el servicio de docker.

![](img/activando_servicio_docker.png)

Vamos a comprobar la versiones de docker

![](img/version_docker.png)

## 2.2. Primera prueba

Comprobamos que no tenemos imágenes creadas.

![](img/docker_images_vacio.png)

Comprobamos que no tenemos contenedores creados.

![](img/docker_ps_a_vacio.png)

Vamos a descargar y ejecutar el contenedor con la imagen "Hello-word"

![](img/docker_contenedor_hello-world.png)

Comprobamos la nueva imagen.

![](img/docker_images_hello-world.png)

Comprobamos el estado del contenedor.

![](img/docker_ps_a_hello-world.png)

## 2.3. Información

| Comando                     | Descripción |
| --------------------------- | ------------------- |
| `docker stop CONTAINERID`   | parar un contenedor |
| `docker start CONTAINERID`  | iniciar un contenedor |
| `docker attach CONTAINERID` | conectar el terminal actual con el interior de contenedor |
| `docker ps`                 | mostrar los contenedores en ejecución |
| `docker ps -a`              | mostrar todos los contenedores (en ejecución o no) |
| `docker rm CONTAINERID`     | eliminar un contenedor |
| `docker rmi IMAGENAME`      | eliminar una imagen |

# 3. Creación manual

## 3.1. Crear una imagen manualmente

Buscamos una imagen de debian en los repositorios de Docker.

![](img/docker_search_debian.png)

Descargamos una imagen 'debian:9'

![](img/docker_pull_debian.png)

Comprobamos las imagenes descargadas.

![](img/docker_images_debian.png)

comprobamos los contenedores

![](img/docker_ps_a_debian_no.png)

Comprobamos los contenedores solo en ejecución

![](img/docker_ps_nada.png)

Ahora vamos a crear un contenedor con el nombre `con_debian` a partir de la imagen de `debian` que descargamos anteriormente, también ejecutaremos /bin/bash

![](img/docker_run_debian_bash.png)

## 3.2. Personalizar el contenedor

Ahora que estamos dentro del contenedor vamos a personalizarlo.

Comprobamos primero que estamos en debian.

![](img/docker_comprobacion_debian.png)

Ahora vamos a actualizar los repositorios.

![](img/docker_debian_actualizar_repos.png)

**Vamos a instalar Nginx y el editor de textos Vi**

![](img/docker_debian_instalar_nginx.png)
![](img/docker_debian_instalar_vim.png)

Iniciamos el servicio Nginx

![](img/docker_debian_iniciar_nginx.png)

Vamos a comprobar los procesos a ver si entre ellos encontramos Nginx.

![](img/docker_debian_ps_ef_no_encontrado.png)

Vemos que no se ha encontrado el comando, vamos a probar a instalarlo.

![](img/docker_debian_install_procps.png)

Comprobamos ahora si funciona.

![](img/docker_debian_ps_ef_funciona.png)

Ahora vamos a **crear un fichero HTML** para nuestro Nginx.

![](img/docker_debian_html_nginx.png)

**Crearemos un script** que arranque Nginx por nosotros a la hora de arrancar el Docker.

![](img/creando_script_inicio.png)

![](img/crear_scrip_inicio_nginx.png)

## 3.3. Crear una imagen a partir del contenedor

Ahora que tenemmos nuestro contendor con Nginx vamos a crear una imagen con los cambios que hemos realizado, para ello debemos buscar la ID del contenedor.

![](img/docker_ps_debian.png)

A partir de esta ID crearemos la nueva imagen.

![](img/docker_commit_debian_nginx.png)

Ahora vamos a eliminar el contenedor, primero vamos a comprobar los contenedores activos, pararemos el contenedor debian, comprobamos que se ha parado y lo eliminamos.

![](img/docker_eliminando_contenedor_debian.png)

# 4. Crear contenedor a partir de nuestra imagen

## 4.1. Crear contenedor con Nginx

Tenemos nuestra imagen instalada ahora vamos a iniciarla, con el puerto 80 abierto para nginx.

![](img/docker_iniciar_nginx.png)

## 4.2. Buscar los puertos de salida

Buscamos los puertos que se corresponde de la maquina real con el puero 80 de nuestro docker con nginx

![](img/buscar_puertos.png)

Ahora comprobamos si podemos acceder al servicio de Nginx

![](img/conexion_nginx_docker.png)

Ahora comprobamos si podemos acceder al fichero holamundo.html

![](img/nginx_holamundo_html.png)

## 4.3 Migrar la imágen a otra máquina.

**Exportar** un Docker a un fichero tar

Ahora vamos a exportar nuestro docker para que otra persona pueda usarlo.

![](img/exportar_docker.png)

**Importar** un Docker desde un fichero tar.

Ahora vamos a tomar un docker de un compañero y lo vamos a importar.

![](img/importar_imagen.png)

# 5. Dockerfile

## 5.1. Preparar ficheros

Crearemos el directorio `/home/ricardo/docker19a`, en el pondremos una copia del fichero `holamundo.html` y una copia del fichero `server.sh`

![](img/preparando_archivos_para_dockerfile.png)

Ahora crearemos el fichero `Dockerfile` con el siguiente contenido.

![](img/crear_dockerfile.png)

![](img/dockerfile_contenido.png)

## 5.2. Crear imagen a partir del Dockerfile

Vamos a construir la nueva imagen a partir del Dockerfile

![](img/docker_build.png)

Comprobamos que se ha creado y que aparece en la lista de imagenes de docker que tenemos.

![](img/docker_build_nueva_imagen.png)

## 5.3. Crear contenedor y comprobar

Ahora crearemos un contenedor a partir de la imagen creada anteriormente

![](img/nginx2_creando_contenedor.png)

Ahora vamos a averiguar que puerto escucha el servidor nginx y comprobamos la conexión en el navegador

![](img/nginx2_puertos.png)

vemos que el puerto 8081 de la máquina se corresponde al puerto del Docker

![](img/nginx2_acceso_web.png)

![](img/nginx2_holamundo_html.png)

## 5.4. Usar imágenes ya creadas

{ Falta Por Arreglar }

Vamos a crear el directorio `docker19b` y crearemos el siguiente `Dockerfile`

![](img/dockerfile2_contenido.png)

Creamos la imagen.

![](img/docker_build2.png)

Comprobamos la imagen.

![](img/nueva_imagen_nginx3.png)

Iniciamos el contendor.

![](img/iniciar_contenedor_nginx3.png)

Comprobamos los contenedores que tenemos activos.

![](img/comprobamos_ultimo_contenedor.png)

Ahora comprobamos si el servidor web esta funcionando.

![](img/nginx3_funciona.png)

Ahora comprobamos si podemos acceder al fichero `holamundo.html` que hemos creado para este contenedor



# 6. Limpiar contenedores e imágenes
