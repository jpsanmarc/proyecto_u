from subprocess import *
import time

#Input_nes.txt
#left:right:up:down:A:B:start:select

def main():
	comando = ["fceux", "--loadlua", "log.lua","mario.nes"]
	child = Popen(comando,stdin=PIPE,stdout=PIPE)
	while True:
		time.sleep(15)
		#print check_output("ls")
		if "null.txt" in check_output("ls"):
			call(["rm","-r","null.txt"])
			#print check_output("ls")
			child.kill()
			break
main()
