# Recursos SMB/CIFS (OpenSUSE)

## 1. Servidor Samba(MV1)

### 1.1 Preparativos

Configuramos el nombre del equipo para que sea smb-server19g y el archivo `/etc/hosts` para que las direcciones IP de esos equipos respondan al nombre que le hemos asignado a cada uno.

![](img/etc_host_server.png)

![](img/configuracion_server.png)

### 1.2 Usuarios locales

Creamos los grupos y usuarios con el siguiente orden:
  - Piratas
    - pirata1
    - pirata2
    - supersamba
  - Soldados
    - soldado1
    - soldado2
    - supersamba
  - Todos
    - pirata1 y pirata2
    - soldado1 y soldado2
    - supersamba
    - smbguest

![](img/grupos_usuarios_server.png)

### 1.3 Crear las carpetas para los futuros recursos compartidos

Creamos las carpetas `Public.d`, `castillo.d` y `public.d` les damos el propietario y grupos adecuados y los permisos.

![](img/carpetas_permisos_server.png)

### 1.4 Configurar el servidor Samba

Hacemos una copia de seguridad del fichero de configuración `/etc/samba/smb.conf`

![](img/copia_configuracion_samba.png)

Ahora nos dirigiremos a la configuración del servidor samba y en la pestaña de identidad pondremos que el grupo de trabajo sea 'CURSO1920' y En controlador de dominio elegiremos la opción 'No es un controlador de dominio'

![](img/confi_samba_workgroup.png)

Ahora en la pestaña inicio marcaremos la opción de inicio del servicio 'Durante el arranque' y en la configuración del cortafuegos marcaremos la opción de 'Puerto abierto en el cortafuegos'

![](img/confi_samba_inicio.png)

### 1.5 Crear recursos compartidos de Samba

Creamos los recursos compartidos en `Yast > Samba Server > Recursos compartidos` y le configuramos las opciones pertinentes.

![](img/recursos_comp_samba.png)

Comprobamos los cambios en el archivo de configuración.

(En este caso no se ha usado una captura de pantalla debido a que el archivo es demasiado largo)

``` bash
[global]
	workgroup = CURSO1920
	passdb backend = tdbsam
	printing = cups
	printcap name = cups
	printcap cache time = 750
	cups options = raw
	map to guest = Bad User
	include = /etc/samba/dhcp.conf
	logon path = \\%L\profiles\.msprofile
	logon home = \\%L\%U\.9xprofile
	logon drive = P:
	usershare allow guests = No
	wins support = No
	guest account = smbguest
	netbios name = smb-server19
	security = user
	server string = Servidor de Ricardo19
	wins server =

[Barco]
	comment = Bardo de Ricardo19
	path = /srv/samba19/barco.d
	read only = Yes
	guest ok = Yes
	valid users = pirata1, pirata2

[Castillo]
	comment = Castillo de Ricardo19
	path = /srv/samba19/castillo.d
	read only = Yes
	guest ok = Yes
	valid users = @soldados

[Public]
	comment = Public de Ricardo19
	path = /srv/samba19/public.d
	read only = Yes
	guest ok = Yes

[cdrom]
	guest ok = Yes
	path = /dev/cdrom
	read only = Yes
```

Y comprobamos con el comando `testparm`

![](img/samba_testparm.png)

### 1.6 Usuarios Samba

Una vez creados los usuarios en el sistema ahora tenemos que añadirlos al servidor samba para ello utilizaremos el comando `smbpasswd -a USUARIO`

![](img/creando_usuarios_samba.png)

Comprobamos los usuarios creados en samba.

![](img/comprobacion_usuarios_samba.png)

### 1.7 Reiniciar

Reiniciamos el servicio `smb` y `nmb`

![](img/reiniciar_servicios.png)

y comprobamos con los comandos `sudo testparm` y `sudo lsof -i`

![](img/comprobacion_samba.png)
![](img/comprobacion_puertos_samba.png)

## 2. Windows
### 2.1 Cliente Windows GUI

Desde cliente Windows accedemos a los recursos compartidos en el servidor Samba

![](img/w7_carpetas_samba.png)

- Comprobamos la conexión de Castillo usando el comando `net use` desde Windows

![](img/w7_comprobando_conex_castillo.png)

Comprobamos desde el Servidor con el comando `smbstatus`

![](img/OS_comprobando_conexion_castillo.png)

- Comprobamos la conexión de Barco usado el comando `net use` desde Windows.

![](img/w7_comprobando_conex_barco.png)

Comprobamos desde el Servidor con el comando `smbstatus`

![](img/OS_comprobando_conexion_barco.png)

- También comprobamos con el comando `lsof -i`

![](img/OS_comprobando_puertos_barco.png)

- Comprobamos los recursos del Servidor desde nuestro cliente windows.

![](img/w7_comprobando_recursos.png)

- Vamos a crear una conexión con uno de los recursos compartidos y montarlo en un unidad comosi fuera un disco duro.

![](img/w7_montando_disco_compartido.png)

- Comprobamos la conexión creada con `netuse`

![](img/w7_probando_conexion_disco.png)

- Comprobamos que podemos crear archivos y carpetas dentro de la carpeta "barco"

![](img/w7_creando_en_disco_samba.png)

## 3. Linux
### 3.1. Cliente GNU/Linux GUI

Comprobamos que podemos acceder a los archivos compartidos de nuestro servidor Samba con la IP del servidor.

![](img/cli_os_comprobando_conex.png)

Comprobamos a crear carpetas y ficheros en las carpetas `barco` y `castillo`

- Comprobamos que podemos crear carpetas en el servidor Samba desde el cliente, para ello creamos la carpeta`Inventario del barco` y fichero `Distribuciones de cañones` en la carpeta `barco`

![](img/cli_os_creando_carpeta_ficheros.png)

- Comprobamos que podemos crear carpetas también en `castillo`, para ello crearemos la carpeta `Inventario` y el fichero `Horario Guardias`

![](img/cli_os_creando_carpeta_ficheros2.png)

- Comprobamos que la carpeta `public` es solo de lectura

![](img/cli_os_creando_carpeta_ficheros_fail.png)

- Comprobamos las conexiones desde el servidor.

![](img/comprobando_conexion_samba_cli_os.png)
![](img/comprobando_conexion_samba_cli_os2.png)

### 3.2. Cliente GNU/Linux comandos

Vamos a comprobar si podemos ver los ficheros de Samba. En un principio veremos que no podemos verlo, para ello desactivaremos el firewall por el momento y comprobamos.

![](img/cli_cmd_probando_conex.png)

Vamos a ver los recursos solo de nuestra maquina en concreto.

![](img/cli_cmd_carpetas_compartidas.png)

Vamos a crear una carpeta local en nuestra maquina cliente para montar allí una de nuestras carpetas compartidas del servidor.

![](img/cli_cmd_preparando_montaje.png)

Ahora vamos a montar el recurso compartido en la carpeta creada anteriormente y comprobamos que se ha montado. ¡¡¡OJO!!! este paso hay que hacerlo con usuario `root`

![](img/cli_cmd_montando_recurso.png)

Comprobamos que en la carpeta que hemos montado que están los ficheros de Samba y no esta vacía.

![](img/cli_cmd_comprobando_recurso_compartido.png)

Comprobamos desde el servidor Samba las conexiones.

![](img/cli_cmd_comprobando_conexion.png)
![](img/cli_cmd_comprobando_conexion2.png)

### 3.3. Montaje automático

- Creamos una instantánea de la máquina virtual

![](img/instantanea.png)

Comprobamos que en el cliente tras el reinicio veremos que el recurso compartido no esta montando.

![]()

Ahora vamos a configurar un montaje automático de un recurso compartido.

![]()

Reiniciamos la máquina y comprobamos que se monta automáticamente.

![]()

Contenido del fichero `/etc/fstab`

``` bash

```
