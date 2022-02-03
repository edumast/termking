max_app=10
if [ $command_pt3 -lt $max_app ];then
  command_pt3="app$command_pt3"
app1="editor_py"
app2="go"
app3="mine"
app4="cal"
command_pt3=`eval echo '$'$command_pt3`
echo $command_pt3
fi

