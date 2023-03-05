#!/bin/sh

iptables -F

iptables -P INPUT ACCEPT
iptables -P OUTPUT ACCEPT
iptables -P FORWARD ACCEPT

iptables -A INPUT -i lo -j ACCEPT
iptables -A OUTPUT -i lo -j ACCEPT

# allow incoming ssh
iptables -A INPUT -p tcp --dport 22 -m state --state NEW,ESTABLISHED -j ACCEPT
iptables -A OUTPUT -p tcp --sport 22 -m state --state ESTABLISHED -j ACCEPT

# allow outgoing ssh
iptables -A INPUT -p tcp --sport 22 -m state --state ESTABLISHED -j ACCEPT
iptables -A OUTPUT -p tcp --dport 22 -m state --state NEW,ESTABLISHED -j ACCEPT

# allow other ports
#iptables -A INPUT -p tcp --dport 80 -j ACCEPT
#iptables -A OUTPUT -p tcp --sport 80 -j ACCEPT

# drop all other traffic
iptables -A INPUT -j DROP
iptables -A OUTPUT -j DROP

sleep 5

iptables -F

iptables-save
