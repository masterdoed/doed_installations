#FLUSH
iptables -F

#DROP
iptables -P INPUT DROP
iptables -P OUTPUT DROP
iptables -P FORWARD DROP

#LOGGING
#iptables -N LOGGING
#iptables -A INPUT -j LOGGING
#iptables -A LOGGING -m limit --limit 2/min -j LOG --log-prefix "iptables-DROP: " --log-level 4
#iptables -A LOGGING -j DROP

#LO
iptables -A INPUT -i lo -j ACCEPT
iptables -A OUTPUT -o lo -j ACCEPT

#TUN0
iptables -A INPUT -i tun0 -j ACCEPT
iptables -A OUTPUT -o tun0 -j ACCEPT

#ESTABLISHED
iptables -A INPUT -i venet0 -m state --state RELATED,ESTABLISHED -j ACCEPT
iptables -A OUTPUT -o venet0 -m state --state RELATED,ESTABLISHED -j ACCEPT

#DNS
iptables -A INPUT -i venet0 -p udp --dport 53 --sport 1024:65535 -j ACCEPT
iptables -A OUTPUT -o venet0 -p udp --dport 53 --sport 1024:65535 -j ACCEPT

#SSH
#iptables -A INPUT -i venet0 -p tcp --dport 22 -j ACCEPT
iptables -A OUTPUT -o venet0 -p tcp --dport 22 -j ACCEPT

#HTTP
iptables -A OUTPUT -o venet0 -p tcp --dport 80 --sport 1024:65535 -j ACCEPT
iptables -A INPUT -i venet0 -p tcp --dport 80 --sport 1024:65535 -j ACCEPT

#HTTPS
iptables -A INPUT -i venet0 -p tcp --dport 443 --sport 1024:65535 -j ACCEPT
iptables -A OUTPUT -o venet0 -p tcp --dport 443 --sport 1024:65535 -j ACCEPT

#OPENVPN
iptables -A OUTPUT -o venet0 -p tcp --dport 1194 -j ACCEPT
iptables -A INPUT -i venet0 -p tcp --dport 1194 -j ACCEPT

#mail
iptables -A OUTPUT -o venet0 -p tcp --dport 587 -j ACCEPT
iptables -A OUTPUT -o venet0 -p tcp --dport 25 -j ACCEPT



#KIBANA
#iptables -A INPUT -i venet0 -p tcp --dport 5601 -j ACCEPT
