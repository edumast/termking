#!/bin/bash
version="0.1"
name="dev"
app1="editor"
init=true
editor_init=false
name_of_file="edi"
enter_app="0"
command="o"
echo "hello "$name
while( $init == true );do
  read command
  if [ $command == "reboot" ];then
    ./config_system/reboot.sh
  fi
  if [ $command == "shutdown" ];then
    echo "turning off..."
    exit
  fi
  if [ "$command" == "update" ];then
    cd update
    ./update_software
  fi
  if [ "$command" == "apps" ];then
    echo app?
    echo $app1
    read enter_app
  fi
  if [ "$enter_app" == "$app1" ]; then
      echo "initilling editor"
      cd softwares
      ./editor.py
  fi
  done

