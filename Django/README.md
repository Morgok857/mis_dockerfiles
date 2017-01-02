# Pack crear container para aplicaciones python 3.0 + virtualenv 
(Pensado para aplicaciones con Django pero se puede adaptar para otros framework)


Antes de crear la imagen a partir de este Dockerfile se debe editar el archivo defaultapache (Este archivo se utiliza para configurar el virtualhost de Apache).


En resumen deben cambiar en el Virtualhost:

-WSGIDaemonProcess myproyect python-path=/var/django/src:/var/django/lib/python3.4/site-packages

* Deben cambiarlo por WSGIDaemonProcess $(proyectname) python-path=$(path_to_django_project):$(path_to_lib_python_into_virtualenv)

- WSGIProcessGroup myproyect

* Deben cambiarlo por WSGIProcessGroup $(proyectname)

-WSGIScriptAlias / /var/django/src/myproyect/wsgi.py

* Deben cambiarlo por WSGIScriptAlias / $(path_to_file_wsgi.py)

En teste caso al directorio static y media estan movidos de directorio por lo cual se creo 2 alias:

Alias /media/ $(path_to_media)

Alias /static/ (path_to_static)

Luego todos los /var/django/src deben reemplazarlos por la ruta al directorio del proyecto.

