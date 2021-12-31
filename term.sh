#!/bin/bash
version="0.1"
name="dev"
app1="editor"
init=true
editor_init=false
name_of_file="edi"
echo "hello "$name
while(init==true);do
  read command
  if [ $command == "update" ];then
    cd uppate
    ./update_software
  fi
  if [ $command == "apps" ];then
    echo app?
    echo $app1
    read enter_app
  fi
  if [ "$enter_app" == "$app1" ]; then
      echo "initilling editor"
      editor_init=true
  fi
    while(editor_init==true);do
      echo $txt_definity_editor 
      read txt_editor
      txt_editor=$txt_editor
      txt_definity_editor=$txt_definity_editor$txt_editor
      if (txt_editor=="save");then
        echo $txt_definity_editor
        echo $txt_definity_editor >> $name_of_file
      fi
      
    done
  done

