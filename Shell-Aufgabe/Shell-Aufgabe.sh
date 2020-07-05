#!/bin/sh

while read line; do
    echo $line > line.txt
    #issn und datum ermitteln
    echo `grep -o -m 1 '[0-9][0-9][0-9][0-9]-[0-9][0-9][0-9][[:alnum:]]' ./line.txt | head -1 ; grep -o -E '[0-9]{4}[^ ]+$' ./line.txt` >> tmp.txt
done < 2020-05-23-Article_list_dirty.tsv
#Leerzeilen entfernen 
sed -i '/^$/d' tmp.txt
#sortieren und duplikate entfernen 
sort -u tmp.txt > output.tsv
#übrige Dateien löschen
rm line.txt
rm tmp.txt

