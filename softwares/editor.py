#!/usr/bin/env python
import os
enter_in_app="editor"
cod_definity_editor=""
os.system("mkdir data/editor_py")
while(enter_in_app=="editor"):
    cod_definity_editor=cod_definity_editor
    cod_editor=input("")
    cod_editor=cod_editor
    if (cod_editor=="save"):
        file=open("data/editor_py/py.txt", "a")
        file.write(cod_definity_editor)
        file=open("data/editor_py/py.txt", "a")
        print("finaly")
        cod_editor=""
    if (cod_definity_editor==""):
        cod_definity_editor=(cod_editor)
    else:
        cod_definity_editor=(cod_definity_editor)+"\n"+(cod_editor)
