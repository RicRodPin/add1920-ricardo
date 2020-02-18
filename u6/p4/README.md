# Remote Desktop Protocol

Remote Desktop Protocol (RDP) es un protocolo propietario desarrollado por Microsoft que permite la comunicación en la ejecución de una aplicación entre una terminal (mostrando la información procesada que recibe del servidor) y un servidor Windows (recibiendo la información dada por el usuario en el terminal mediante el ratón ó el teclado).

## Funcionamiento

```
El modo de funcionamiento del protocolo es sencillo. La información gráfica que genera el servidor es convertida a un formato propio RDP y enviada a través de la red al terminal, que interpretará la información contenida en el paquete del protocolo para reconstruir la imagen a mostrar en la pantalla del terminal. En cuanto a la introducción de órdenes en el terminal por parte del usuario, las teclas que pulse el usuario en el teclado del terminal así como los movimientos y pulsaciones de ratón son redirigidos al servidor, permitiendo el protocolo un cifrado de los mismos por motivos de seguridad. El protocolo también permite que toda la información que intercambien cliente y servidor sea comprimida para un mejor rendimiento en las redes menos veloces.

Este servicio utiliza por defecto el puerto TCP 3389 en el servidor para recibir las peticiones.Una vez iniciada la sesión desde un punto remoto el ordenador servidor mostrará la pantalla de bienvenida de windows, no se verá lo que el usuario está realizando de forma remota.

Este servicio tiene distintos tipos de aplicaciones: se utiliza frecuentemente para el acceso remoto en la administración de equipos, pero también es cada vez más utilizado en la gestión de servicios de terminal o clientes ligeros (thin clients).
```

El modo de funcionamiento del protocolo es sencillo. La información gráfica que genera el servidor es convertida a un formato propio RDP y enviada a través de la red al terminal, que interpretará la información contenida en el paquete del protocolo para reconstruir la imagen a mostrar en la pantalla del terminal.

Este servicio utiliza por defecto el puerto TCP 3389 en el servidor para recibir las peticiones.

Este servicio tiene distintos tipos de aplicaciones: se utiliza frecuentemente para el acceso remoto en la administración de equipos, pero también es cada vez más utilizado en la gestión de servicios de clientes ligeros

SSH es mas seguro que RDP, en cambio RDP puedes disfrutar de un entorno grafico algo que el SSH no puede ofrecer.

## Algunas Características

* Permite el uso de colores de hasta 32 bits
* Cifrado de 128 bits utilizando el algoritmo criptográfico RC4.
* Permite seguridad a nivel de transporte.
* El re-direccionamiento del audio permite al usuario ejecutar un programa de audio en una ventana remota y escuchar el sonido en el ordenador local.
* El re-direccionamiento del sistema de ficheros permite a los usuarios utilizar sus ficheros locales en una ventana remota.
* Permite al usuario utilizar su impresora local al estar conectado al sistema remoto.
* El portapapeles puede compartirse entre los ordenadores local y remoto.
* Programas remotos: Aplicaciones con ficheros del lado del cliente.

```
A partir del 2006 en la versión RDP 6.0 se introdujeron las siguientes características.


* Las aplicaciones remotas pueden funcionar en una máquina cliente servida por una conexión remota.

* Permite utilizar un servidor IIS de manera que acepte conexiones en el puerto 443 para servidores de respaldo de Terminal Services mediante conexiones HTTPS, similar a como las llamadas remotas RPC sobre HTTP permiten a los clientes Outlook conectar a un servidor de copias Exchange 2003. Se necesita Windows Server 2008.

* Revisado para que el re-direccionamiento de dispositivos sea más general, permitiendo una mayor variedad de dispositivos.
* Ancho de banda ajustado para clientes RDP.
* Soporte de varios monitores. La sesión puede mostrarse en dos monitores.
```
## Uso en crimen

Estudios de seguridad informan que los ciber-criminales venden servidores RDP comprometidos en foros clandestinos y mercados ilícitos. Estos servidores RDP pueden usarse como base de operaciones para conductas como fraude, acceso a datos sensibles personales o datos de empresas. También para inyectar malware.
La compra de estos accesos puede asociarse a la posterior ejecución de un ransomware, o quizás a la instalación de malware más sigiloso, como troyanos bancarios o software espía.
