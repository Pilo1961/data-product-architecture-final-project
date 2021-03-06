## Exploratory Data Analysis (EDA): NYC 311 Service Request
***

## Hallazgos

<div align="justify">

Con el propósito de limpiar la base de datos *NYC 311 Service Request* e identificar las quejas más frecuentes y las agencias con mayor número de peticiones o quejas (que servirá como base para el modelado posterior), realizamos el siguiente análisis exploratorio con *pyspark* (medinate el uso de zeppelin).

El output de este análisis es el siguiente documento: [eda_nyc311.json](https://github.com/dapivei/data-product-architecture-final-project/blob/master/eda/eda_nyc311.json); mismo que será publicado próximamente en [ZeppelinHub](https://www.zepl.com/).

Acá se presenta un breve resumen.

### Estructura Inicial
En el momento en que realizamos el EDA, la base datos tenía la siguiente estructura:

```
root
 |-- address_type: string (nullable = true)
 |-- agency: string (nullable = true)
 |-- agency_name: string (nullable = true)
 |-- bbl: string (nullable = true)
 |-- borough: string (nullable = true)
 |-- bridge_highway_direction: string (nullable = true)
 |-- bridge_highway_name: string (nullable = true)
 |-- bridge_highway_segment: string (nullable = true)
 |-- city: string (nullable = true)
 |-- closed_date: string (nullable = true)
 |-- community_board: string (nullable = true)
 |-- complaint_type: string (nullable = true)
 |-- created_date: string (nullable = true)
 |-- cross_street_1: string (nullable = true)
 |-- cross_street_2: string (nullable = true)
 |-- descriptor: string (nullable = true)
 |-- due_date: string (nullable = true)
 |-- facility_type: string (nullable = true)
 |-- incident_address: string (nullable = true)
 |-- incident_zip: string (nullable = true)
 |-- intersection_street_1: string (nullable = true)
 |-- intersection_street_2: string (nullable = true)
 |-- landmark: string (nullable = true)
 |-- latitude: string (nullable = true)
 |-- location: struct (nullable = true)
 |    |-- human_address: string (nullable = true)
 |    |-- latitude: string (nullable = true)
 |    |-- longitude: string (nullable = true)
 |-- location_type: string (nullable = true)
 |-- longitude: string (nullable = true)
 |-- open_data_channel_type: string (nullable = true)
 |-- park_borough: string (nullable = true)
 |-- park_facility_name: string (nullable = true)
 |-- resolution_action_updated_date: string (nullable = true)
 |-- resolution_description: string (nullable = true)
 |-- road_ramp: string (nullable = true)
 |-- status: string (nullable = true)
 |-- street_name: string (nullable = true)
 |-- taxi_company_borough: string (nullable = true)
 |-- taxi_pick_up_location: string (nullable = true)
 |-- unique_key: string (nullable = true)
 |-- vehicle_type: string (nullable = true)
 |-- x_coordinate_state_plane: string (nullable = true)
 |-- y_coordinate_state_plane: string (nullable = true)
```

+ *Variables totales*: $40$.

+ *Registros totales (quejas)*: $22,601,839$.


### Valores nulos

- *Problemas:* Los valores nulos no estaban homogenizados; existían registros 'N/A', 'nan', 'NaN', 'n/a', 'Na', '.'

- *Solución:* Homogeneizar esos valores a "nulls".

- *Observación:* Las variables con mayor porcentaje de valores nulos son aquellos de locación (zip-code, domicilio, calles colindante, entre otros) o tipo de instalación. Aún así, el porcentaje de registros con valores nulos es menor al uno por ciento.

#### Tipo de variables

- *Problemas:* Variables con tipos distintos al que realmente son.

- *Solución:* Cambio de variables a sus tipos correctos.

- *Observación 1*: Por la naturaleza de la pregunta objeto del presente trabajo, únicamente nos quedaremos con la variable *created_date* (fecha de creación de las quejas).

- *Observación 2:* Tras la limipieza correspondiente, no quedarán valores numéricos: únicamente valores de string y timestamp.

### Registros con mayúsculas y minúsculas

- *Solución*: Cambiar todos los registros a minúsculas.

### Valores únicos

La mayoría de las variables son variables de tipo categórico. Aún así, conforme con la tabla que se muestra a continucaión, cada variable tiepo múltiples categorías.

<div align="center">

<image width="250" height="270" src="./images/unique_values.png">

</div>

### Quejas según su estatus

Las quejas son clasificadas en 12 categorías; $95$ por ciento de las quejas se encuentran con estatus *cerrado*.

<div align="center">

<image width="600" height="200" src="./images/cases_status.png">

</div>

### Quejas según municipio

El municipio/condado con mayor número de quejas es *Brooklyn*, con cerca de 6.72 millones de quejas en total (desde el 2010); le siguen, Queens, Manhattan, Bronx y Staten Island.

<div align="center">

<image width="600" height="200" src="./images/cases_borough.png">

</div>

### Quejas según agencia

Existe 31 distintos registros de tipos de agencia en la base de datos. Entre estos distintos tipos de agencias, las agencias con mayor número registros históricos son: New York City Department of Housing Preservation and Development (HDP) y New York City Police Department. Cada uno con 6.08 y 5.44 millones de quejas, respectivamente.

<div align="center">

<image width="600" height="200" src="./images/cases_agency.png">

</div>


### Quejas según tipo de quejas

Como se vio anteriormente, los tipos de quejas se clasifican en 428 tipos, previo a realizar cualquier tipo de limipieza.

Sin realizar ninguna limpieza previa, es notorio que la mayoría de las quejas tienen que ver con temas de ruido residencial; para ser precisos, históricamente, cerca del 8 por ciento (1.86 milllones) de las quejas han sido relativas a este asunto.

<div align="center">


<image width="600" height="200" src="./images/cases_complaint.png">

</div>

### Ruido $\bigcup$ NYPD

Cuando filtramos Ruido por NYPD, observamos que hay seis distintas categorías de quejas de "ruido". Recordemos que, de acuerdo con unas cuántas gráficas anteriores, el tipo de queja más frecuente era el "ruido residencial".

En etapas posteriores, se retomará esta observación para orientar nuestra predicción únicamente a las quejas de "ruido" que recibe el Departamento de la Policía de la Nueva York.


<div align="center">


<image width="600" height="200" src="./images/noise_nypd.png">


</div>


### Quejas por año


Identificamos que para nuestros propósitos, las variables existentes en la base de datos de *NYC 311 Service Request* no son de mucha utilidad. La única que realmente nos interesa, luego de filtrar la base de datos por agencia y tipo de queja, son los conteos de registros de quejas y las fechas de creación de las quejas o solicitudes de servicio. 

Considerando esta última variable, comenzamos a explorar más datos relacionados con las fechas de creación de las quejas. Comenzamos revisando el número de quejas históricas, según el año.

<div align="center">

<image width="250" height="270" src="./images/cases_year.png">

</div>




En la etapa de preprocesamiento para comenzar con el modelado, crearemos más varibles  a partir de la fecha de creación de las solicitudes de servicios.

</div>
