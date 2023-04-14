#!/bin/sh
echo ""
echo "----------------------------------------------------------------------"
echo "                         APRS Bash Client for Linux"
echo "                            v0.23.04.13-23.47"
echo "----------------------------------------------------------------------"
echo "                                 LU3FLA"
echo "                         Luciano Javier Lagassa"
echo "                        info@lucianolagassa.com.ar"
echo "                        www.lucianolagassa.com.ar"
echo "----------------------------------------------------------------------"
echo ""
echo -n "Install Software"
# Detectar Root
if [ "$(id -u)" != "0" ]
then
 echo " [FAIL]"
 echo "You have no permission to install this software."
 exit 1;
fi
#

# Descargar Fuente
wget -c https://github.com/lucianolagassa/aprsbc/raw/master/aprsbc.conf
wget -c https://github.com/lucianolagassa/aprsbc/raw/master/aprsbc.sh
#

# APRSBC
if [ ! -f "/etc/aprsbc.conf" ]
then
 mv aprsbc.conf /etc/aprsbc.conf
fi
if [ -f "/usr/bin/aprsbc" ]
then
 rm /usr/bin/aprsbc
fi
mv aprsbc.sh /usr/bin/aprsbc
chmod 755 /usr/bin/aprsbc
chmod +x /usr/bin/aprsbc
#
echo " [OK]"
echo ""
echo "----------------------------------------------------------------------"
echo "To use the software, follow these instructions"
echo "----------------------------------------------------------------------"
echo "APRSBC - APRS Bash Client for Linux"
echo "Edit the Configuration File, it is located at /etc/aprsbc.conf"
echo "You can then use the application by sending the commands or arguments."
echo "aprsbc AppMode[BEACON o GPS o IGATE o MANUAL]"
echo "aprsbc AppMode[BEACON o GPS o IGATE o MANUAL] MyCall"
echo "aprsbc AppMode[BEACON o IGATE o MANUAL] MyCall MyLat MyLong"
echo "aprsbc AppMode[BEACON o IGATE o MANUAL] MyCall MyLat MyLong MyText"
echo "aprsbc AppMode[BEACON o IGATE o MANUAL] MyCall MyLat MyLong MyText MyIcon"
echo "aprsbc AppMode[BEACON o IGATE o MANUAL] MyCall MyLat MyLong MyText MyIcon UpdDelay"
echo "aprsbc AppMode[BEACON o IGATE o MANUAL] MyCall MyLat MyLong MyText MyIcon UpdDelay DEBUG"
echo "----------------------------------------------------------------------"

