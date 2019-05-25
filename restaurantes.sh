#Filtra los elementos de la comunidad de madrid
osmfilter raw-data/Madrid.osm --keep="amenity=restaurant" > specify-data/restaurants.osm

osmfilter raw-data/Madrid.osm --keep="amenity=bar" > specify-data/bar.osm

osmfilter raw-data/Madrid.osm --keep="amenity=cafe " > specify-data/cafe.osm

#Crea la base de datos 

osmconvert specify-data/bar.osm --all-to-nodes --csv="@id @lon @lat name" --csv-separator=, --csv-headline | grep ".*,.*,.*,."  | python3 csv-to-sql.py bar

osmconvert specify-data/restaurants.osm --all-to-nodes --csv="@id @lon @lat name" --csv-separator=, --csv-headline | grep ".*,.*,.*,."  | python3 csv-to-sql.py restaurants

osmconvert specify-data/cafe.osm --all-to-nodes --csv="@id @lon @lat name" --csv-separator=, --csv-headline |  grep ".*,.*,.*,." | python3 csv-to-sql.py cafe

#Crea los ficheros CSV

osmconvert specify-data/bar.osm --all-to-nodes --csv="@id @lon @lat name" --csv-headline > CSV/bar.csv

osmconvert specify-data/restaurants.osm --all-to-nodes --csv="@id @lon @lat name" --csv-headline > CSV/restaurants.csv

osmconvert specify-data/cafe.osm --all-to-nodes --csv="@id @lon @lat name" --csv-headline > CSV/cafe.csv
