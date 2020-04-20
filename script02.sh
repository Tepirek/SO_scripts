#!/bin/bash

cat << END
Wyszukiwarka plików
+++++++++++++++++++++++++++++++
END
while [ true ] ; do
cat << END
    1. Nazwa pliku:     [$filename]
    2. Katalog:         [$filepath]
    3. Właściciel:      [$fileowner]
    4. Typ pliku:       [$filetype]
    5. Rozmiar [b]:     [$filesize]
    6. Zawartość pliku: [$filecontent]
    7. Szukaj
    8. Koniec
END
echo "Twój wybór:"
read option
clear
case $option in
  1)
    echo "Podaj nazwę pliku:"
    read filename
  ;;
  2) 
    echo "Podaj katalog w którym chcesz szukać pliku:" 
    read filepath
  ;;
  3) 
    echo "Podaj nazwę właściciela:"
    read fileowner
  ;;
  4) 
    echo "Podaj typ pliku:"
    read filetype
  ;;
  5) 
    echo "Podaj rozmiar pliku [b]:"
    read filesize
  ;;
  6) 
    echo "Podaj zawartość pliku:"
    read filecontent
  ;;
  7)
    if [ -z $filename ] ; then 
        search_filename=""
        else
            search_filename="-iname $filename" 
    fi
    if [ -z $filepath ] ; then
        filepath="."
        search_filepath="."
        else
            search_filepath="$filepath"
    fi
    if [ -z $fileowner ] ; then 
        search_fileowner=""
        else
            search_fileowner="-user $fileowner" 
    fi
    if [ -z $filetype ] ; then
        filetype="f"
        search_filetype="-type f"
        else
            search_filetype="-type $filetype" 
    fi
    if [ -z $filesize ] ; then 
        search_filesize=""
        else
            search_filesize="-size ${filesize}c" 
    fi
    if [ -z $filecontent ] ; then 
        search_filecontent=""
        else
            search_filecontent="-exec grep -l $filecontent {} +" 
    fi
    clear
    echo "Wynik wyszukiwania"
    echo "++++++++++++++++++++++++++++++++++++"
    find $search_filepath $search_filename $search_fileowner $search_filetype $search_filesize $search_filecontent
    echo "++++++++++++++++++++++++++++++++++++"
  ;;
  8) 
    echo "Dziękuję za skorzystanie z wyszukiwarki plików!"
    exit
  ;;
  *)
    echo "Błędny wybór! Spróbuj ponownie!"
    echo "+++++++++++++++++++++++++++++++"
  ;;
esac
done