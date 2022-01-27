echo "reboot?"
read s_or_n_reboot
if [ $s_or_n_reboot == "n" ];then
exit
elif [ $s_or_n_reboot == "dc" ];then
   echo "which directory?"
   read directory
   ~/$directory/term.sh
else
default=`echo $PWD | rev | cut -d'/' -f 1 | rev`
  ~/$default"/term.sh"
fi
