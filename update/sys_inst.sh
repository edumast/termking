#!/bin/bash
local=`echo $PWD | rev | cut -d'/' -f 2 | rev`
echo "hello welcome to kingterm system installer" |lolcat
while :; do dir=$( dialog --stdout --title "config_install" --menu "want to download the system in which directory?" 0 0 0 "1. $local" "diretorio principal" "2. diretorio alternativo" "escolher diretorio" )
if [ "$dir" == "2. diretorio alternativo" ]; then 
  alt=true
  clear 
  break
fi
if [ "$dir" == "1. $local" ];then directory_download_system="$local" 
  clear 
  break    
fi 
done
if [ "$alt" == true ];then
  echo qual o diretorio |lolcat
read directory_download_system
fi

echo "what is your name"|lolcat
read name_first
echo "how old are you?"|lolcat
read age_first

while :; do download_app=$( dialog --stdout --title "down" --menu "deseja baixar um app?" 0 0 0 "yes" " " "no" " ")

if [ $download_app == "no" ];then
clear
break
fi

  if [ "$download_app" == "yes" ];then
    while :; do download_app_name=$( dialog --stdout --title "down" --menu "deseja baixar qual app?" 0 0 0 "cal" " " "go" " " "editor_py" " " "mine" " ")
if [ "$download_app_name" != " " ];then
      pre_yes_install=$download_app_name
brek1=true
      break

fi

done
if [ $brek1 == true ];then
break
fi
fi
done

if [ $download_app == "yes" ];then
  directory_down="$download_app_name"
fi

figlet load...|lolcat
git clone https://github.com/edumast/termking
sed -i "s/name_usr=.*#end/name_usr=$name_first #end/g" ~/$directory_download_system/update/termking/databased/database
sed -i "s/name=.*#end/name='$new_first' #end/g" style/wlc.py
sed -i "s/age_usr=.*#end/age_usr=$age_first #end/g" ~/$directory_download_system/update/termking/databased/database
   mv ~/$directory_download_system/update/termking/update/* ~/$directory_download_system/update
   mv ~/$directory_download_system/update/termking/* ~/$directory_download_system
if [ $download_app == "yes" ];then
  git clone https://github.com/edumast/$download_app_name
   mv ~/$directory_download_system/update/$directory_down ~/$directory_download_system/softwares/software_app
fi
   rm -rf termking
   echo done |lolcat

