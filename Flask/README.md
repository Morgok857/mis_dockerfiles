# Dockerfile para Desarrollo en Flask

## Descripción

Genera un contenedor Docker en base a la ultima imagen de Ubuntu, instala Flask y las dependencias listadas en el archivo requeriments.txt.

Esta pensado para un desarrollo continuo de la aplicación ya que no requiere reiniciar el contenedor para que apliquen la mayoría de los cambios.

El contenedor seguirá levantado una vez lanzado mientras no se detenga la ejecución de la aplicación.

En el subdirectorio Example se deja un Hello World para que puedan validar el funcionamiento del contenedor.

## A tener en cuenta

- El directorio de trabajo dentro del contenedor es **/app** 
- Se presume que el nombre del archivo a ejecutar será **main.py**, en caso de utilizar otro nombre se debe cambiar en el Dockerfile antes de construir la imagen.
- Una vez construida la imagen se puede detener, reiniciar el contenedor o iniciar sin perder el código generado.

## Build de la imagen

Primero clonamos el repo con el comando:
```
# mkdir mis_dockerfiles
# cd mis_dockerfiles
# git clone https://github.com/Morgok857/mis_dockerfiles.git
```

En caso de necesitar agregar, eliminar o editar una dependencia a instalar de debe editar el archivo **requeriments.txt**

Para construir la imagen usamos el comando:

```
# cd Flask
# docker build --no-cache -t flask:0.3 .
```

Con **-t** indicamos el nombre de la imagen y el tag a asignar. Este valor pueden cambiarlo a su preferencia.

Una vez finalizado el proceso, podemos ver la imagen de la siguiente forma:

```
# docker images
REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
flask               0.3                 f4ace31becdd        4 weeks ago         457MB
ubuntu              latest              0458a4468cbc        2 months ago        112MB
```

Suponiendo que el código se encuentre el directorio **/home/morgok/www/MY_APP**, debemos lanzar el contenedor con el comando:

```
docker run -d --name My_APP -p 5001:5000 -v /home/morgok/www/MY_APP:/app -t flask:0.3
```

Deberíamos ver algo similar a: 

```
# docker ps
CONTAINER ID        IMAGE               COMMAND             CREATED             STATUS              PORTS                    NAMES
12e316224655        flask:0.3           "python3 main.py"   4 minutes ago       Up About a minute   0.0.0.0:5001->5000/tcp   My_APP
```

Solo restaría ingresar con nuestro navegador favorito a la ip:puerto de nuestro equipo.
Ejemplo:

```
http://172.16.10.98:5001
```

## Logs

Por defecto Flask emite todos su output por salida estándar. Para poder visualizarlos debemos utilizar el comando:

```
docker logs CONTAINER_ID
```

En caso de querer ver la salida de forma constante se le puede agregar el flag **-f**

```
docker logs -f CONTAINER_ID
```

