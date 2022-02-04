<<<<<<< HEAD
max_app='^[0-9]+$'
if [[ $command_pt3 =~ $max_app ]];then
=======
max_app=10
if [ $command_pt3 -lt $max_app ];then
>>>>>>> 50ee937177c1d4eb2d73dcc219ee8bb061f8f189
  command_pt3="app$command_pt3"
app1="editor_py"
app2="go"
app3="mine"
app4="cal"
command_pt3=`eval echo '$'$command_pt3`
echo $command_pt3
fi

