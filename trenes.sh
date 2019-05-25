#Creacion del fichero de datos de la comunidad de madrid 

osmconvert raw-data/spain-latest.osm -B=ComunidadMadrid.poly -o=Madrid.osm

#Filtra los elementos de la comunidad de madrid

osmfilter raw-data/Madrid.osm --keep="bus=yes" > specify-data/bus_stations.osm

osmfilter raw-data/Madrid.osm --keep="railway=station" > specify-data/subway_stations.osm

osmfilter raw-data/Madrid.osm --keep="station=subway" > specify-data/subway.osm


#Crea la base de datos 

osmconvert specify-data/subway.osm --all-to-nodes --csv="@id @lon @lat name" --csv-separator=, --csv-headline |  grep ".*,.*,.*,." | python3 csv-to-sql.py subway_stations

osmconvert specify-data/bus_stations.osm --all-to-nodes --csv="@id @lon @lat name" --csv-separator=, --csv-headline |  grep ".*,.*,.*,." | python3 csv-to-sql.py bus_stations

osmconvert specify-data/subway_stations.osm --all-to-nodes --csv="@id @lon @lat name" --csv-separator=, --csv-headline |  grep ".*,.*,.*,." | python3 csv-to-sql.py train_stations


#Crea los ficheros CSV

osmconvert specify-data/subway.osm --all-to-nodes --csv="@id @lon @lat name" --csv-headline > CSV/subway.csv

osmconvert specify-data/bus_stations.osm --all-to-nodes --csv="@id @lon @lat name" --csv-headline > CSV/bus_stations.csv

osmconvert specify-data/subway_stations.osm --all-to-nodes --csv="@id @lon @lat name" --csv-headline > CSV/subway_stations.csv
