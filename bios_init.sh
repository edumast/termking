#bin/bash
data_file=`echo $PWD | rev | cut -d'/' -f 1 | rev`
source databased/database
echo "checking system status!"
sleep 1
if [ -z $name_usr ];then
echo "name_usr:off"
echo "system error!!!"
sed -i "s/name_usr=.*#end/name_usr=usr #end/g" databased/database
sed -i "s/name=.*#end/name='usr' #end/g" style/wlc.py
echo "fixed error!"
else
echo "name_status:ok"
fi
sleep 1
if [ -z $age_usr ];then
  echo "age_usr:off"
  echo "system error!!!"
  sed -i "s/age_usr=.*#end/age_usr=undefined #end/g" databased/database
echo "fixed error!"
else
echo "age_usr:ok"
fi
err2=false
sleep 1
if [[ -e style && config_system ]];then
if [ -e debug ];then 
  if [[ -e bios_init.sh && databased ]];then
    if [[ -e softwares && update ]];then
      if [ -e term.sh ];then
echo "system files:ok"
      err2=true
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
echo "starting system"
./term.sh
echo "fatal error!"
