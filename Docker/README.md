# Dockerfiles: Documentación e instrucciones 

Esta carpeta contiene las imagenes de docker y scripts necesarios para ejecutar el proyecto en un entorno aislado.

La primera versión de la imagen se encuentras disponible en [dockerhub](https://hub.docker.com/repository/docker/c1587s/dpa_nyc311_image), asociada al repositorio: c1587s/dpa_nyc311_image.

**Nota:** La imagen es generada utilizando `pipenv`, los pipfiles asociados se encuentran en esta carpeta. Sin embargo, es posible descargar la imagen directamente por medio del siguiente comando:

> docker pull c1587s/dpa_nyc311_image:v1

inicializar imagen 

> docker run -it --rm c1587s/dpa_nyc311_image:v1

**Nota:** En la EC2 el anterior comando (y los relacionados con `docker`) se debe ejecutar como superusuario: `sudo docker ...`
