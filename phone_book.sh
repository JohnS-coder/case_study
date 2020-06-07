#!/bin/bash
clear
su<<END
if [ $? == 0 ] ;
then
    exit
    echo "welcome $whoami" 
else 
    echo "Not root!"

fi
END
control=$(find . -name AccessLog.txt | wc -l)
echo $control
if [ $control = 0 ]; then
sudo touch AccessLog.txt
sudo chmod 777 AccessLog.txt
fi
num=$(cat AccessLog.txt | wc -l )
date=$( date )
sudo echo "$(($num+1)) $USER $date"  >> AccessLog.txt
control=$( sudo yum list installed | grep python3 | wc -l )
if [ $control = 0 ]
then
    echo "There is NO Python3....."
else
    echo "installing Python3...."
    sudo yum install -y python3
    sleep 1
fi
currentdir=$( pwd )
p=$( echo $PATH )

# code=$(cat<<END
# r=False
# print(r)
# var = str('$p').split(":")
# def odev(var):
#     for i in var:
#         print(i)
#         if i=="$currentdir":
#             print("------------------------")
#             print("'$currentdir' in PATH")
#             print("------------------------")
#             r=True
#     return r
# print(r)
# odev(var)
# END
# )
control=$( sudo yum list installed | grep git | wc -l )
if [ $control = 0 ]
then
    echo "There is NO Python3....."
else
    echo "installing Python3...."
    sudo yum install -y git
    sleep 1
fi

python -c "$code"
python pyt.py
echo $r