#!/usr/bin/env python

import subprocess
import time
import random

#mac generator

l=[]

for i in range(0,6):
    z=random.randint(11,99)
    l.append(z)
    
m_g=':'.join(map(str,l))

#interface check

print('[+] available interfaces: \n')
subprocess.call('ifconfig', shell=True)
interface='wlan0'

#Card specs cmds
Crd_on = ('sudo ifconfig {} up'.format(interface))
Crd_off= ('sudo ifconfig {} down'.format(interface))
Crd_mac= ('sudo ifconfig {} hw ether {}'.format(interface,m_g))


#functions

def bash_cmd(cmd):
        #integrating with shell
	subprocess.call(cmd, shell=True)

def interface_off():
	#turning off eht0 lan card
	print('disconnecting card interface')
	bash_cmd(Crd_off)
	time.sleep(1)

def mac_chng():
	#changing mac card address
	print('changing mac to: ',m_g)
	bash_cmd(Crd_mac)
	time.sleep(2)

def interface_on():
	#turning on wlan card
	print('launching card interface')
	bash_cmd(Crd_on)
	time.sleep(1)


###process###

	

#---shutting down card---#

interface_off()

#---changing mac address of interface---#

mac_chng()

#---rebooting interface----#

interface_on()

#---summary---#

print("\n [+] Process completed")

bash_cmd('ifconfig')

	

