#!/bin/bash
while True
do
    #satirsay=$(cat foto.csv | wc -l )
    #i=4
    #harfsay=$(cat foto.csv | grep -w '1satir' | wc -c )
    #echo $harfsay $satirsay
    Klasor="foto-test"
    strno=$( cat foto.csv | wc -l ) 
	for (( i=1; i<=$strno; i++ ))
	do
		ad=$( sed -n "$i"p foto.csv | cut -f1 -d ";" )
		ad2=$( sed -n "$i"p foto.csv | cut -f2 -d ";" )
        echo "$ad -------------------------"
        
		if [ -e "$Klasor/$ad" ]
		then
            echo "doğrüüüüüüüüüüüü"
			if [ -e "$Klasor/newfoto/$ad2" ]
			then
				jpg=$( echo $ad2 | cut -d "." -f2 )
				asil=$( echo $ad2 | cut -d "." -f1 )
				say=$( ls $Klasor/newfoto/ | grep $asil | wc -l )
				kopy="$asil Copy($say) .$jpg"
                echo $kopy
                echo $Klasor/$kopy
            else
                echo burda
            fi
        fi
    done
    for file in $( ls foto-test )
	do
		filex=$( echo $file | cut -d "_" -f1 )
        echo $filex
    done
    ad=$(cat foto.csv | cut -d ";" -f 3)
    uniqsayi=$( ls foto-test/ | cut -d "_" -f1| uniq | wc -l )
    uniq=$( ls foto-test/ | cut -d "_" -f1| uniq >> uniq.csv )
    echo $uniqsayi
    echo $uniq
    echo "Bash version ${BASH_VERSION}..."
    for (( i=1; i<=$uniqsayi; i++ ))
    do 
     echo "Welcome $i times"
    done
	for (( i=1; i<=$uniqsayi; i++ ))
	do
    echo " gel $i"
    item=$( sed -n "$i"p uniq.csv )
    echo $item
    done
    read -p "Devam edilsin mi? (y/n): " onay
    if [ $onay == "y" ]
    then
            echo "Devam ediliyor."
    else
            break
    fi

    for a in $ad
    do
        echo $a
        ad1=$( cat foto.csv | grep -w $a | cut -f1 -d ";" )
        ad2=$( cat foto.csv | grep -w $a | cut -f2 -d ";" )
        jpg=$( echo $ad2 | cut -d "." -f2 )
        asil=$( echo $ad2 | cut -d "." -f1 )
        say=1 #$( ls $Klasor/newfoto/ | grep $asil | wc -l )
        kopy="$asil copy($say) .$jpg"
        echo $ad2
        echo " $jpg  ve  $asil "
        echo " kopyası $kopy "
        read -p "Devam edilsin mi? (y/n): " onay
        if [ $onay == "y" ]
        then
            echo "Devam ediliyor."
        else
            break
        fi
    # echo  " bu ne ya $a -- $ad1---  $ad2 "
    done
done