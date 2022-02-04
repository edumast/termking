local=`echo $PWD | rev | cut -d'/' -f 1 | rev`
dd if=/dev/zero of=~/$local/term.sh bs=1 count=1 seek=10 conv=notrunc
