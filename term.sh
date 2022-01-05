#!/bin/bash
data_file="databased"
local_directory=`echo $PWD | rev | cut -d'/' -f 1 | rev`
source ~/$local_directory"/"$data_file/database
version="1.0" 
init_system=true
editor_init=false
cont_app=1
app_number="m"
python3 style/wlc.py
tput setaf 2
while [ $init_system == true ];do
  #<source>
  source ~/$local_directory"/softwares/termking_soft/soft_database"
  source ~/$local_directory"/"$data_file/database
  #<source>

  #<command>
  read command
  #<command>
  
  #<distribution_parts>
  command_pt1=`echo $command | cut -d' ' -f1`
  command_pt2=`echo $command | cut -d' ' -f2`
  command_pt3=`echo $command | cut -d' ' -f3`
  #<distribution_parts>

  #<reboot>
  if [ "$command" == "reboot" ];
  then
    ./config_system/reboot.sh
  fi
  #<reboot>

  #<shutdown>
  if [ "$command" == "shutdown" ];
  then
    echo "turning off..."
    exit
  fi
  #<shutdown>
  
  #<mep>
  if [ "$command_pt1" == "mep" ];then
    if [ -e softwares/software_app/$command_pt2 ];then
    du -sh softwares/software_app/$command_pt2
  else
    err1=true
    fi
fi
  #<mep>

  #<update>
  if [ "$command" == "update" ];then
    cd update
    ./update_software
  fi
  #<update>

  #<format>
if [ "$command" == "format" ];then
./debug/deb_rm_in
fi
  #<format>

  
  if [ "$command_pt1" == "clin" ];then
$command_pt2 $command_pt3
  fi

#<commands>
  if [ "$command" == "comman" ];then
echo "reboot | shutdown | update | rename_usr_to | see_info | change info
down | app | mep | format |comman "
  fi
#<commands>
 
 #<name>
  if [ "$command_pt1" == "rename_usr" ];then
    new_name=$command_pt2
    sed -i "s/name_usr=.*#end/name_usr=$new_name #end/g" $data_file/database 
    sed -i "s/name=.*#end/name='$new_name' #end/g" style/wlc.py
  fi
  #<name>

  #<see information>
  if [ "$command_pt1" == "see_info" ];then
    if [ "$command_pt2" == "age" ];then
      echo $age_usr
    fi
  fi
  #<see information>

  #<change_info>
  if [ "$command" == "change info" ];then
    echo change what information?
    read what_information
    if [ "$what_information" == "age" ];then
      echo "how old are you?"
      read years_old
      sed -i "s/age_usr=.*#end/age_usr=$years_old #end/g" $data_file/database
    fi
  fi
  #<change_info>

  #<lok>
  if [ "$command_pt1" == "lok" ];then
    if [ "$command_pt2" == "install" ];then
      chmod 755 ~/$local_directory/softwares/install_app/*
      ~/$local_directory/softwares/install_app/install_$command_pt3
    fi
  fi
  #<lok>

  #<down>
 if [ "$command_pt1" == "down" ];then
  
   if [ "$command_pt2" == "install" ];then
  git clone $command_pt3
  directory_down=`echo $command_pt3 | rev | cut -d'/' -f 1 | rev`
  rm -rf $directory_down/README.md 
mv $directory_down ~/$local_directory/softwares/software_app
    fi

       #<remove>
    if [ "$command_pt2" == "rem" ];then
    rm -rf softwares/software_app/$command_pt3
    fi
       #<remove>

 fi
   #<down>

  #<enter_app>
  if [ "$command_pt1" == "apps" ];then
    if [ "$command_pt2" == "enter" ];then
    enter_app=$command_pt3  
     ~/$local_directory/softwares/software_app/$enter_app/init.sh
    else
    echo app?
    echo ~×~
    ls ~/$local_directory/softwares/software_app
    echo ~×~
    read enter_app
    if [ "$enter_app" != "" ];then
      if [ -e ~/$local_directory/softwares/software_app/$enter_app/init.sh ];then
    ~/$local_directory/softwares/software_app/$enter_app/init.sh
  else
    err1=true
      fi
      fi
    fi
  #<enter_app>
  fi

  #<err1>
  if [ "$err1" == true ];then
    tput bold
 tput setaf 1
 echo "arquivo não encontrado!(err! #1)"
 tput setaf 2
 err1=false
fi
  #<err1>

done

