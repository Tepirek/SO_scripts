#!/bin/bash
while [ true ] ; do
    option1="1. Nazwa pliku:     ($filename)"
    option2="2. Katalog:         ($filepath)"
    option3="3. Właściciel:      ($fileowner)"
    option4="4. Typ pliku:       ($filetype)"
    option5="5. Rozmiar (b):     ($filesize)"
    option6="6. Zawartość pliku: ($filecontent)"
    option7="7. Szukaj"
    option8="8. Koniec"
    array=("$option1" "$option2" "$option3" "$option4" "$option5" "$option6" "$option7" "$option8")
    option=$(zenity --list --column=Opcje "${array[@]}" --height 400  --width 400)
    case "$option" in
        $option1) 
            filename=$(zenity --entry --height 50  --width 400 --title "Twój wybór" --text "Podaj nazwę pliku:")              
            ;;
        $option2) 
            filepath=$(zenity --entry --height 50  --width 400 --title "Twój wybór" --text "Podaj katalog w którym chcesz szukać pliku:")
            ;;
        $option3) 
            fileowner=$(zenity --entry --height 50  --width 400 --title "Twój wybór" --text "Podaj nazwę właściciela:")
            ;;
        $option4)  
            typeOptions=(b c d p f l s D)
            filetype=$(zenity --entry --height 50  --width 400 --title "Twój wybór" --text "Typ pliku:" "${typeOptions[@]}")
            ;;
        $option5)
            filesize=$(zenity --entry --height 50  --width 400 --title "Twój wybór" --text "Podaj rozmiar pliku [b]:")
            ;;
        $option6) 
            filecontent=$(zenity --entry --height 50  --width 400 --title "Twój wybór" --text "Podaj zawartość pliku:")
            ;;
        $option7)
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
            echo $search_filepath
            echo $search_filename
            echo $search_fileowner
            echo $search_filetype
            echo $search_filesize
            echo $search_filecontent
            echo "Wynik wyszukiwania"
            echo "++++++++++++++++++++++++++++++++++++"
            find $search_filepath $search_filename $search_fileowner $search_filetype $search_filesize $search_filecontent
            echo "++++++++++++++++++++++++++++++++++++"
            
            echo result=$(find $search_filepath $search_filename $search_fileowner $search_filetype $search_filesize $search_filecontent);

            find $search_filepath $search_filename $search_fileowner $search_filetype $search_filesize $search_filecontent | zenity --text-info --height 400 --width 400 --title "Wynik wyszukiwania"
            ;;
        $option8)
            exit
            ;;
    esac
done