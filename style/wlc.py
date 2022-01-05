import os,sys,time,random
print("")
name='dev' #end
os.system("tput setaf 1")
color=["\033[1;31m","\033[1;32m"]
m = ("welcome to termking_os %s \n" %(name)) 
for msg in m:
    sys.stdout.write(msg)
    sys.stdout.flush()
    time.sleep(0.06)
print("") 
