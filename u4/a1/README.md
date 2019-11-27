# Servidor 389-DS - OpenSuse

## 1. Prerequisitos
### 1.1. Nombre de Equipo FQDN

- Configuramos la máquina dandole el hostname ldap-***server19.curso1920*** y configuramos el fichero `/etc/hosts`

![](img/nombre_de_equipo_fqdn.png)

### 1.2. Abrir puertos requeridos de firewall

Ahora abriremos los puertos necesarios para la práctica.

![](img/abriendo_puertos.png)

## 2. Instalar el Servidor
### 2.1. Información



### 2.2. Script de Perl

Primero vamos a instalar la herramienta necesaria.

![](img/instalando.png)

Ahora vamos a configurar con el script para poder usar LDAP.

~~~
ldap-server19:/usr/sbin # setup-ds.pl

==============================================================================
This program will set up the 389 Directory Server.

It is recommended that you have "root" privilege to set up the software.
Tips for using this  program:
  - Press "Enter" to choose the default and go to the next screen
  - Type "Control-B" or the word "back" then "Enter" to go back to the previous screen
  - Type "Control-C" to cancel the setup program

Would you like to continue with set up? [yes]: yes

==============================================================================
Choose a setup type:

   1. Express
       Allows you to quickly set up the servers using the most
       common options and pre-defined defaults. Useful for quick
       evaluation of the products.

   2. Typical
       Allows you to specify common defaults and options.

   3. Custom
       Allows you to specify more advanced options. This is
       recommended for experienced server administrators only.

To accept the default shown in brackets, press the Enter key.

Choose a setup type [2]: 2

==============================================================================
Enter the fully qualified domain name of the computer
on which you are setting up server software. Using the form
<hostname>.<domainname>
Example: eros.example.com.

To accept the default shown in brackets, press the Enter key.

Warning: This step may take a few minutes if your DNS servers
can not be reached or if DNS is not configured correctly.  If
you would rather not wait, hit Ctrl-C and run this program again
with the following command line option to specify the hostname:

    General.FullMachineName=your.hostname.domain.name

Computer name [ldap-server19.curso1920]: ldap-server19.curso1920

==============================================================================
The server must run as a specific user in a specific group.
It is strongly recommended that this user should have no privileges
on the computer (i.e. a non-root user).  The setup procedure
will give this user/group some permissions in specific paths/files
to perform server-specific operations.

If you have not yet created a user and group for the server,
create this user and group using your native operating
system utilities.

System User [dirsrv]:
System Group [dirsrv]:

==============================================================================
The standard directory server network port number is 389.  However, if
you are not logged as the superuser, or port 389 is in use, the
default value will be a random unused port number greater than 1024.
If you want to use port 389, make sure that you are logged in as the
superuser, that port 389 is not in use.

Directory server network port [389]:

==============================================================================
Each instance of a directory server requires a unique identifier.
This identifier is used to name the various
instance specific files and directories in the file system,
as well as for other uses as a server instance identifier.

Directory server identifier [ldap-server19]:

==============================================================================
The suffix is the root of your directory tree.  The suffix must be a valid DN.
It is recommended that you use the dc=domaincomponent suffix convention.
For example, if your domain is example.com,
you should use dc=example,dc=com for your suffix.
Setup will create this initial suffix for you,
but you may have more than one suffix.
Use the directory server utilities to create additional suffixes.

Suffix [dc=curso1920]:

==============================================================================
Certain directory server operations require an administrative user.
This user is referred to as the Directory Manager and typically has a
bind Distinguished Name (DN) of cn=Directory Manager.
You will also be prompted for the password for this user.  The password must
be at least 8 characters long, and contain no spaces.
Press Control-B or type the word "back", then Enter to back up and start over.

Directory Manager DN [cn=Directory Manager]: cn=admin
Password:
Password (confirm):

Your new DS instance 'ldap-server19' was successfully created.
Exiting . . .

~~~

### 2.3. Comprobamos el servicio

- Habilitamos el servicio para que inicie al iniciar el equipo y comprobamos si esta activo.

![](img/habilitando_comprobando_servicio.png)

- Comprobamos si el "demonio" esta en ejecución.

![](img/comprobando_demonio.png)

- Comprobamos si LDAP es accesible desde la red.

![](img/accesible_red.png)

## 3. Browser LDAP
### 3.1. Instalar Browser LDAP



### 3.2. Crear usuario y grupos dentro del LDAP



## 4. Cliente para autenticación LDAP
### 4.1. Preparativos.



### 4.2. Comprobación



### 4.3. Instalar y configurar autenticación



### 4.4. Comprobamos desde el Cliente



## 5. Autenticación
