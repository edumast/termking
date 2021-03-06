#bin/bash
data_file=`echo $PWD | rev | cut -d'/' -f 1 | rev`
source databased/database
echo edumast,inc 2022
echo project termking_os
echo created by eduardo kenji
sleep 0.5
echo checking system status!
sleep 0.5
sed -i "s/name=.*#end/name='$name_usr' #end/g" style/wlc.py

if [ -z $name_usr ];then
echo "name_usr:off"
echo "system error!!!"
sed -i "s/name_usr=.*#end/name_usr=usr #end/g" databased/database
sed -i "s/name=.*#end/name='usr' #end/g" style/wlc.py
echo "fixed error!"
else
echo "name_status:ok"
fi
sleep 0.5
if [ -z $age_usr ];then
  echo "age_usr:off"
  echo "system error!!!"
  sed -i "s/age_usr=.*#end/age_usr=undefined #end/g" databased/database
echo "fixed error!"
else
echo "age_usr:ok"
fi
sleep 0.5

if ping -q -c 1 -W 1 8.8.8.8 >/dev/null; then
  echo IPv4=ok
else
  echo IPv4=off
  echo wifi network did not work!
fi

err2=false
sleep 1
if [ -e style ];then
  if [ -e config_system ];then
if [ -e debug ];then 
  if [ -e bios_init.sh ];then
    if [ -e databased ];then
    if [ -e softwares ];then 
      if [ -e update ];then
      if [ -e term.sh ];then
echo "system files:ok"
      err2=true
    fi
  fi
fi
fi
fi
fi
fi
fi
if [ $err2 == false ];then
echo "system files:off"
echo "system error!!!"
echo "correcting error"
./update/update_software
fi
sleep 0.5
echo "starting system"
sleep 0.5
echo press space to start system
read press_space_continue_sys
clear
./term.sh
source databased/database
if [ "$fatal_mensagem" == false ];then
   sed -i "s/fatal_mensagem=.*#end/fatal_mensagem=true #end/g" ~/$data_file/databased/database
elif [ "$fatal_mensagem" == true ];then
while :; do fatal_ny=$( dialog --stdout --title "fatal!!!" --menu " fatal error!
  your system is broken!!!
  format your system!!!
  Do you want to format the system? " 0 0 0 "yes" " " "no" " ")
if [ "$fatal_ny" == "yes" ];then
clear
  ./update/update_software
break
bk=true
fi

if [ "$fatal_ny" == "no" ];then
clear
break
  bk=true
fi
if [ "$bk" == true ];then
break
fi

done
fi

