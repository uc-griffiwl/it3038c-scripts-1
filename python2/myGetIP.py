import socket, sys
def getHostnameByIP(h):
	try:
	  hostname = str(sys.argv[1])
	  ip = socket.gethostbyname(hostname)
	  nwj-centos python]$ vim myGetIP.py

print (hostname + "has an IP of " + ip)
except:
	print("oops, something is wrong with that host")
getHostnameByIP(sys.argv[1])
