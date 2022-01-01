#!/bin/bash
data_file="databased"
source $data_file/database
version="0.5" 
init=true
editor_init=false
name_of_file="edi"
enter_app="0"
number_sequence_app=1
echo "hello "$name_usr
while [ $init == true ];do
  source $data_file/database
  read command

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
  
  #<update>
  if [ "$command" == "update" ];then
    cd update
    ./update_software
  fi
  #<update>

  if [ "$command" == "commands" ];then
echo "reboot | shutdown | update | rename_usr_to | see_info | change info | down | apps"
  fi
 
 #<name>
  if [ "$command_pt1" == "rename_usr_to" ];then
    new_name=$command_pt2
    sed -i "s/name_usr=.*#end/name_usr=$new_name #end/g" $data_file/database 
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

  if [ "$command_pt1" == "down" ];then
    if [ "$command_pt2" == "install" ];then
        sed -i "s/app1=.*#end/app1=$command_pt3 #end/g" $data_file/database
    fi
  fi

  #<enter_app>
  if [ "$command" == "apps" ];then
    echo app?
    echo $app1
    read enter_app
  #<enter_app>
  
  #<app1>
  if [ "$enter_app" == "$app1" ]; then
      echo "initilling editor"
      cd softwares
      ./editor.py
  fi
  #<app1>
  fi
  done

