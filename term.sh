#!/bin/bash
source config_system/database
version="0.5" 
init=true
editor_init=false
name_of_file="edi"
enter_app="0"
command="o"
echo "hello "$name_usr
while [ $init == true ];do
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
  if [ $"command" == "shutdown" ];
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

  #<name>
  if [ "$command_pt1" == "rename_usr_to" ];then
    new_name=$command_pt2
    sed -i "s/name_usr=.*#end/name_usr=$new_name #end/g" config_system/database 
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
      sed -i "s/age_usr=.*#end/age_usr=$years_old #end/g" config_system/database
    fi
  fi
  #<change_info>

  if [ "$command_pt1" == "down" ];then
    if [ "$command_pt1" == "install" ];then
      if [ "$command_pt1" == "editor"];then
        app1="edito"
      fi
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

