### 1. Salt-Stack

Salt-stack es una herramienta de tipo de gestor de infrastructura.

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

Comprobamos que el master tiene una peticion de nuestro minion.

![](img/master-peticion.png)

Aceptamos la petición y comprobamos la lista y comprobamos si ahora nuestro minion esta aceptado.

![](img/master-aceptar_minion.png)

![](img/master-minion_aceptado.png)

#### 4.3. Comprobar conectividad

Comprobamos la conectividad entre el master y el minion.

![](img/master-comprobar_conectividad_minion.png)

### 5. Salt States
#### 5.1. Preparar el directorio para los estados

Vamos a crear los directorios para guardar los estados de Salt.

Crearemos los directorios `/srv/salt/base` y `/srv/salt/devel`

#### 5.2. Crear un nuevo estado

#### 5.3. Asociar Minions a estados

#### 5.4. Aplicar el nuevo estado

### 6. Crear estado "users"

### 7. Añadir minion.
