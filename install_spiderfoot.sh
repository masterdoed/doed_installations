#Server-Infos
VirtualMachine-Host: Virtualbox 5.0
OS: ubuntu-14.04.3-server-amd64.iso
Network-Context: OTN exAstrium DSL NET (guest-net)

#OS Preparation
hostname: sfoot-imsec
username: sfoot
inital-password: SfootPoc2015!
encrypted LVM: ask mdoetterl
no automatic updates

sudo apt-get update && sudo apt-get upgrade
sudo apt-get install openssh-server vim git python2.7 python-pip python2.7-lxml python-netaddr python-M2Crypto python-mako

git clone https://github.com/cherrypy/cherrypy.git
cd cherrypy
sudo python setup.py install

#Spiderfoot
git clone https://github.com/smicallef/spiderfoot.git
cd spiderfoot
vi sf.py
	replace
	    '__webaddr': '127.0.0.1',
	with
	    '__webaddr': 'xxx.xxx.xxx.xxx',

python sf.py


firefox http://localhost:5001
