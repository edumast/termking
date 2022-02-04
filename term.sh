#!/bin/bash
data_file="databased"
local_directory=`echo $PWD | rev | cut -d'/' -f 1 | rev`
source ~/$local_directory"/"$data_file/database
version="1.0"
init_system=true
editor_init=false
cont_app=1
app_number="m"
tp_info="nd"
python3 style/wlc.py
tput setaf 2
echo "##########################" |lolcat
while [ $init_system == true ];do
  #<source>
  source ~/$local_directory"/"$data_file/database
  #<source>

  #<command>
 timestamp=$(date +"%T")
tput setaf 197
tput bold
 echo "$name_usr |" $timestamp "|termking"
 tput setaf 2
 read command
 #<command>
  
  #<distribution_parts>
  command_pt1=`echo $command | cut -d' ' -f1`
  command_pt2=`echo $command | cut -d' ' -f2`
  command_pt3=`echo $command | cut -d' ' -f3`
  #<distribution_parts>
  
  #<reboot>
  if [ "$command_pt1" == "reboot" ];
  then
    if [ "$command_pt2" == "clear" ];then
  clear
    fi
    ./term.sh
  fi
  #<reboot>
  
  #<shutdown>
  if [ "$command_pt1" == "shutdown" ];
  then
    echo "turning off..."
 sed -i "s/fatal_mensagem=.*#end/fatal_mensagem=false #end/g" ~/$local_directory/databased/database
 if [ "$command_pt2" == "clear" ];then 
clear
 fi
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
command=" "
  ./debug/deb_rm_in
fi
  #<format>
  if [ "$command_pt1" == "clin" ];then
    clin_command=`echo ${command:5}`
$clin_command
  fi

#<commands>
  if [ "$command" == "comman" ];then
echo "reboot | shutdown | update | info | change info | down | app | mep | format |comman "
  fi
#<commands>

#<see information>
  if [ "$command_pt1" == "info" ];then
    if [ "$command" == "info" ];then
   tp_info="info"
      wh_tela=true
  command=" "

    fi
    if [ "$command_pt2" == "age" ];then
      echo $age_usr
    fi
    if [ "$command_pt2" == "name" ];then
echo $name_usr
    fi
  fi
  #<see information>

#<change_info>
   
 if [ "$command_pt1" == "change" ];then
if [ $command == "change" ];then 
tp_info="change"
  wh_tela=true
 command=" "
  clear
fi
   #<name> 
    if [ "$command_pt2" == "name" ];then
              sed -i "s/name_usr=.*#end/name_usr=$command_pt3 #end/g" $data_file/database
        sed -i "s/name=.*#end/name='$command_pt3' #end/g" style/wlc.py
      fi
         #<name>
    if [ "$command_pt2" == "age" ];then
      sed -i "s/age_usr=.*#end/age_usr=$command_pt3 #end/g" $data_file/database
    fi
    fi

  #<change_info>
  
  while [ "$wh_tela" == true ];do
  info_blue_window=$( dialog --stdout --title "info_window" --menu "qual a informaçao" 0 0 0 "age_usr" "$age_usr" "name_usr" "$name_usr" "fatal_mensagem" "$fatal_mensagem")
   if [ "$info_blue_window" != " " ];then
   clear
  if [ "$tp_info" == "info" ];then
   echo -ne $info_blue_window=;eval echo '$'$info_blue_window
   wh_tela=false
   tp_info=" "
  fi
 if [ "$tp_info" == "change" ];then
echo diga o valor: |lolcat
   read change_resp
sed -i "s/$info_blue_window=.*#end/$info_blue_window=$change_resp #end/g" $data_file/database
tp_info=" "   
wh_tela=false
  fi
   fi
   done

#<lok>
  if [ "$command_pt1" == "lok" ];then
      if [ "$command_pt2" == "install" ];then
      chmod 755 ~/$local_directory/softwares/install_app/*
      ~/$local_directory/softwares/install_app/install_$command_pt3
      ~/$local_directory/softwares/adl/$command_pt3
   fi
  fi
  #<lok>

#<down>
repo="oficial"

#list
if [ "$command" == "down list" ];then
cat list/down_list.txt
fi
#list

if [ "$command_pt1" == "down" ];then
   if [ "$command_pt2" == "install" ];then
  if [ $repo == "oficial" ];then
   source list/down_list.sh
    git clone https://github.com/edumast/$command_pt3
   rm -rf $command_pt3/README.md
   if [ ! -e ~/$local_directory/softwares/software_app/$command_pt3 ];then
  rm -rf ~/$local_directory/$command_pt3
else
  mv $directory_down ~/$local_directory/softwares/software_app
fi
   else
     git clone $command_pt3
  directory_down=`echo $command_pt3 | rev | cut -d'/' -f 1 | rev`
  rm -rf $directory_down/README.md
mv $directory_down ~/$local_directory/softwares/software_app
   fi
   fi
 fi

#<remove>
    if [ "$command_pt2" == "remove" ];then
    rm -rf softwares/software_app/$command_pt3
    fi

#<remove>

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
      tput setaf 2
      tput bold
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

  #<corrompido>

  if [ "$command" == "corr!" ];then
./debug/corron.sh
fi

#<corrompido>

#<chmod>

if [ "$command_pt1" == "safety" ];then
chmod -R $command_pt2 softwares/software_app/*
echo security set for $command_pt2
fi

#<chmod> 

#<clear>
if [ "$command" == "clear" ];then
clear
  fi
#<clear>

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
