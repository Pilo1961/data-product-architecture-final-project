# 311 NYC Service Request Web-Service
***
<div align="justify">

### Integrantes:

- Cadavid Sánchez Sebastián, [C1587S](https://github.com/C1587S)
- Herrera Musi Juan Pablo, [Pilo1961](https://github.com/Pilo1961)
- Paz Cendejas Francisco, [MrFranciscoPaz](https://github.com/MrFranciscoPaz)
- Villa Lizárraga Diego M., [dvilla88](https://github.com/dvilla88)
- Pinto Veizaga Daniela, [dapivei](https://github.com/dapivei)

### Contenidos de sitio:

- [X] I. Introducción

- [X] II. Problema

[X] III. Objetivos del producto de datos

[] IV. Métricas de Desempeño

[] V. Datos requeridos

[X] VI. Solución Propuesta: Producto final

[] VII. Modelos utilizados

### Introducción:

El gobierno de Nueva York, con el fin de proveer a la comunidad *newyorkina* con acceso directo a los servicios gubernamentales  y mejorar el seguimiento y control de los servicios gubernamentales, provee el servicio de petición *NYC311*, disponible las 24 horas del día, los 7 días de la semana, los 365 días del año. De esta manera, según el portal web principal de [*NYC311*](https://portal.311.nyc.gov/about-nyc-311/), la misión del servicio de petición es:

>* "es proporcionar al público un acceso rápido y fácil a todos los servicios e información del gobierno de la ciudad de Nueva York al tiempo que ofrece el mejor servicio al cliente. Ayudamos a las agencias a mejorar la prestación de servicios permitiéndoles centrarse en sus misiones principales y administrar su carga de trabajo de manera eficiente. También proporcionamos información para mejorar el gobierno de la Ciudad a través de mediciones y análisis precisos y consistentes de la prestación de servicios".

### Problema




### Objetivos del producto de datos

El desarrollo de este producto de datos tiene los siguientes objetivos:

* Proporcionar a todo el público una herramienta de seguimiento y control de las peticiones realizadas a la línea 311 en la ciudad de Nueva York por medio de una estimación en el tiempo de respuesta del problema;

* Proporcionar una herramienta que permita a las agencias estatales reubicar de manera óptima sus recursos para atender mejor a los requerimientos en las llamadas de los ciudadanos;

* Evaluar la efectividad en pronóstico del tiempo de respuesta estimado por las agencias;

* Medir la divergencia en el tiempo de respuesta por distritos de la ciudad, por agencia y por tipo de solicitud.

#### Predicción:

Tiempo estimado de resolución de un *service request*


#### Data Product Architecture:

```mermaid
graph LR
    id1(API NYC 311) -->
    id2(Extract)-. S3 .->
    id3(Transform ETL)-->
    id4[(Database)]-->
    id5(Transform ML) -->
    id6(Módulos Spark/Training)-->
    id7(Predecir)-->
    id8((Web Server))

```

<p align="center">
<image width="900" height="130" src="https://github.com/dapivei/data-product-architecture-final-project/blob/master/images/mockup.png">
</p>

### Producto Final:
</div>

<p align="center">
  <image width="350" height="250" src="https://github.com/dapivei/data-product-architecture-final-project/blob/master/images/web_service_proposal.png">
</p>
