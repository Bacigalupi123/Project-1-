#!/bin/bash

echo "A Quick SYstem Audit Script"
10/3/2018
echo ""
echo "Machine Type Info:"
echo$MACHTYPE
echo -e "Uname info: $(uname -a) \n"
echo -e "IP Info: $(IP addr | grep inet | tail -2 | head -1) \n"
echo "Hostname: $(hostname -s) "
echo "DNS Servers:"
free
echo -e "\nCPU Info:"
lscpu | grep CPU
echo -e "\nDisk Usage:'
df -H | head -2
echo -e "\nWho is logged in: \n$(who) \n"
