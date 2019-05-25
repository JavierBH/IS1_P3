# IS1 Practica 3

## Comienzo

- Descargar los archivos del `moodle`

- Descargar `spain-latest.osm.bz2` de http://download.geofabrik.de/europe.html

- Descomprimir, y obtener `spain-latest.osm`

- Instalar `omstfilter` y `omsconverter`

- Extraer la seccion de madrid con el comando:
	`osmconvert spain-latest.osm -B=CiudadMadrid.poly -o=Madrid.osm`


## Parte 1
He extraido la información relativa a cafes,restaurantes,bares, paradas de autobus y estaciones de metro 
con los siguiente comandos (mirad: https://wiki.openstreetmap.org/wiki/Osmfilter y https://wiki.openstreetmap.org/wiki/Osmconvert).

Los atributos que se han guardado en cada uno de los CSV son: `id`, `Latitud`, `Longitud`, `amenity` (en caso de los bares,cafes y restaurantes) y `name`.
 
### Comandos para sacar la informacion de necesaria para la practica 

Al ejecutar `script.sh` se crean todos los ficheros .osm de cada uno de los elementos (cafe, bar, etc.) y la base de datos. 

Para que el script funcione debe existir una carpeta llamada raw-data con el fichero .osm con la información de madrid (mirad el comando de mas arriba) llamado Madrid.osm. 

Tambien hace falta una carpeta lllamada specify-data, donde se guardaran los ficheros .osm

#### Creación de la base de datos
La creación de la base de datos sigue el siguiente proceso:

- Se utiliza osmconverter para convertir los ficheros osm a formato CSV
- Luego se utiliza el comando 'grep' para filtar los resultados sin nombre 
- Para la creacion de la base de datos se usa el fichero 'csv-to-sql.py', llamandolo con el nombre de la   base de datos

Ejemplo:

'''

osmconvert bar.osm --all-to-nodes --csv="@id @lon @lat @amenity @name" --csv-separator=, --csv-headline |grep ",.*,.*,.*,." | python3 ../csv-to-sql.py bar

'''

## Bases de Datos

## Información de los elementos

Los elementos que tenemos son de 2 tipos: Establecimientos y Tansportes. Los cuales se dividien en: bares, cafes, restaurantes y buses y metro. 

Los establecimentos tienen los siguientes campos: 
 ![Alt text](Resources/Propiedades_establecimeintos.png)
Los Transportes tienen los siguientes campos: 
 ![Alt text](Resources/Propiedades_transportes.png)

El significado de los campos es el siguiente:
- `Id`: Es el identificador de cada uno de los elementos
- `long`: Es el valor de longitud del elemento
- `lat`: Es la latitud del elemento
- `amenity`: Es el tipo de establecimiento (solo se aplica en establicimientos)
- `name`: Es el nombre de el elemento.

