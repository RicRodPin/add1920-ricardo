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
