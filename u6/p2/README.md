### 1. Salt-Stack

Salt-stack es una herramienta de tipo de gestor de infraestructura.

### 2. Preparativos

| Config   | MV1          | MV2          |
|----------|--------------|--------------|
| Alias    | Master       | Minion       |
| Hostname | master19g    | minion19g    |
| SO       | OpenSUSE     | OpenSUSE     |
| IP       | 172.19.19.31 | 172.19.19.32 |

### 3. Master: Instalar y configurar

Instalaremos el Salt-Stack Master en la MV1

![](img/master-install.png)

Vamos a modificar el fichero `/etc/salt/master` para configurar nuestro master.

![](img/master-config-file.png)
![](img/master-config.png)

Activamos el servicio para que arranque con el sistema y lo iniciamos si no estuviera ya iniciado.

![](img/master-activar_iniciar_servicio.png)

Comprobamos los minions aceptados por nuestro master, de momento no debería aparecer ninguno.

![](img/master-minions_aceptados_ninguno.png)

### 4. Minion
#### 4.1. Instalación y configuración

Instalar Salt-Stack Minion en la MV2

![](img/minion-install.png)

Modificamos el fichero `/etc/salt/minion` para definir el master

![](img/minion-config_file.png)
![](img/minion-config.png)

Habilitamos el servicio y lo iniciamos.

![](img/minion-activar_iniciar_servicio.png)

comprobamos que el apache2 no esta instalado en el minion.

![](img/minion-apache2_no_instalado.png)

#### 4.2. Aceptación desde el Master

Comprobamos que el master tiene una petición de nuestro minion.

![](img/master-peticion.png)

Aceptamos la petición y comprobamos la lista y comprobamos si ahora nuestro minion esta aceptado.

![](img/master-aceptar_minion.png)

![](img/master-minion_aceptado.png)

#### 4.3. Comprobar conectividad

Comprobamos la conectividad entre el master y el minion.

![](img/master-comprobar_conectividad_minion.png)

### 5. Salt States
#### 5.1. Preparar el directorio para los estados

En el master vamos a crear los directorios para guardar los estados de Salt.

Crearemos los directorios `/srv/salt/base` y `/srv/salt/devel`

![](img/master-crear_directorios_estado.png)

crearemos el fichero `/etc/salt/master.d/roots.conf` para que Salt tenga en cuenta nuestros nuevos directorios de estado.

![](img/master-config_estados.png)

```
- base = Guardar nuestros estados
- devel = para desarrollo o pruebas.
```

#### 5.2. Crear un nuevo estado

Vamos a crear un nuevo estado para ello crearemos el fichero `/svr/salt/base/apache/init.sls` con el siguiente contenido:

![](img/master-crear_nuevo_estado.png)

#### 5.3. Asociar Minions a estados

Vamos a asociar todos los Minions al estado que acabamos de crear para ello tendremos que crear el fichero `/srv/salt/base/top.sls` con el siguiente contenido:

![](img/master-asignando_estados.png)

#### 5.4. Comprobar: estados definidos

Consultamos los estados que hemos definido para cada Minion

![](img/master-comprobar_estados.png)

#### 5.5. Aplicar el nuevo estado

Comprobamos que no tengamos errores en las definiciones.

![](img/master-lowstate.png)
![](img/master-highstate.png)

Una vez comprobado que no tenemos ningún error aplicamos el estado.

[![](img/master-aplicando_estado.png)](src/state.apply)

Click sobre la imagen para ver el resultado completo

Comprobamos que el apache2 ha sido instalado.

![](img/minion-apache2_instalado.png)

### 6. Crear más estados
#### 6.1. Crear estado "users"

Vamos a crear el fichero `/srv/salt/base/users/init.sls`

![](img/master-crear_users_file.png)

Dentro del fichero crearemos las definiciones para el grupo `mazingerz` y los usuarios `koji19` y `drinfierno19` en dicho grupo.

![](img/master-group_users_file.png)

Asociaremos el estado a todos los minions para que podamos aplicarlo.

![](img/master-fichero_aplicar_estados_users.png)

![](img/master-aplicar_estado_users.png)

Aplicamos el estado.

[![](img/master-aplicando_estado_users.png)](src/users_state.apply)

Click en la imagen para ver todo el resultado.

Comprobamos en el minion que el grupo y los usuarios se han creado.

![](img/minion-group_users_creados.png)

#### 6.2. Crear estado "directories"

Vamos a crear un estado para crear los directorios `private`(700), `public`(755) y `group`(750) en el home del usuario `Koji19`

Primero deberemos crear el directorio `/srv/salt/base/directories`

![](img/master-creando_estado_directories.png)

Ahora crearemos el fichero `/srv/salt/base/directories/init.sls`

![](img/master-directories_estado_file.png)

Asociaremos el estado a los minions que tenemos en el ficher `/srv/salt/base/top.sls`

![](img/master-asociando_estado_directories.png)

Comprobamos que no tenemos errores.

![](img/master-show_lowstate_directories.png)

Comprobamos los estados disponibles para los diferentes minions.

![](img/master-comprobar_estados_directories.png)

Y aplicamos el nuevo estado.

[![](img/master-aplicando_estado_directories.png)](src/directories_state.apply)

Click en la imagen para ver el resultado completo.

Comprobamos que se han creado los directorios en la máquina minion.

![](img/minion-comprobando_estado_directories.png)

### 7. Añadir minion.

Creamos una nueva MV3 con Windows y yo le he aplicado la siguiente configuración de red.

![](img/minion-win-configuracion.png)

Vemos que la IP es `172.19.19.11` Y el Hostname es `minion19w`

Nos descargaremos el minion Salt-Stack desde la página oficial.

![](img/minion-win-descargar_salt_stack.png)

Comenzamos la instalación y lo primero que debemos indicar es la IP del master y el nombre del minion.

![](img/minion-win-instal_ss_master_ip_minion_name.png)

Le daremos a `Install` y esperamos que termine el proceso.

![](img/minion-win-instalando_ss.png)

Una vez instalado iremos a la máquina master y comprobaremos si tiene la petición del nuevo minion

![](img/master-comprrobar_lista_windows.png)

Aceptaremos la nueva petición

![](img/master-minion_win_aceptado.png)

Ahora comprobamos la conectividad.

![](img/master-comprobar_conectividad_minion_win.png)
