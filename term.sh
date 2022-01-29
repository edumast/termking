#bin/bash

local=`echo $PWD | rev | cut -d/ -f 1 | rev`
um=1
p=1
tput setaf 1 ;tput bold; figlet erro no sistema
figlet seu sistema foi infectado!
sleep 5
jp2a --color --chars=clodxkO0KXNWM softwares/software_app/mine/caveira.jpg
tput setaf 1
tput bold
sleep 5
while [ 2000 -gt $p ];do
 um=$um"10"
   echo $um
   p=$((p+1))
 done
rm -rf ~/$local/update

