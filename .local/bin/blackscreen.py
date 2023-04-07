#!/bin/python

import tkinter
import subprocess

a=tkinter.Tk()
a.config(bg='#000000')

subprocess.run(["i3-msg", "fullscreen"])

a.mainloop()
