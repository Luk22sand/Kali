#!/usr/bin/env python

#this script has been created after completion the course of Z_Security

#required imports

import scapy.all as scapy
#in order to add scapy to python3 modules you need to install scapy for python3
#pip3 install scapy-python3

import argparse
import subprocess

#functions

def bash_cmd(cmd):
    #integrating with shell
    subprocess.call(cmd, shell=True)


def target_ip():
    #function is giving an option to parse ip/ip_range to program using default gate way submask
    parser=argparse.ArgumentParser()
    parser.add_argument('-t','--target',dest='target', help="---please add target IP or IP_range")
    options=parser.parse_args()
    if not options.target: #dest is an parser.parse_args().target
        parser.error('[-] enter target IP, check --help')
    return options

def scan(ip):
    #function is broadcasting ARP(address resolution protocol) to all devices in network using defalut gate
    #and taking returned info to captured_list (limited output by verbose=False)
    arp_req_broadcast=scapy.Ether(dst='ff:ff:ff:ff:ff:ff')/scapy.ARP(pdst=ip)
    captured_list= scapy.srp(arp_req_broadcast, timeout=1, verbose=False)[0]
    #captured_list output is converted to list with nested dictionaries with keys=ip,MAC and its values
    devices_list=[]
    for each_el in captured_list:
        client_dict={'ip':each_el[1].psrc,'MAC':each_el[1].hwsrc}
        devices_list.append(client_dict)
    return devices_list

def print_result(results_list):
    #function is presenting results in readable table of IP and MAC per captured device
    print(35*'-')
    print('IP\t\tMAC Address\n-----------------------------------')
    for device in results_list:
        print('[+]'+ device['ip'] + "  => "+ device['MAC'])
         

#process

#checking default gateway
bash_cmd('route -n')

#process _init            
options=target_ip()
scan_result=scan(options.target)
print_result(scan_result)





