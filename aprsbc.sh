#!/bin/bash
# APRSBC - APRS Bash Client for Linux
# LU3FLA - Luciano Javier Lagassa - info@lucianolagassa.com.ar - www.lucianolagassa.com.ar
#
# AppVersion
AppVer="0.18.03.08-1848"
#
# About
About()
{
 echo ""
 echo "----------------------------------------"
 echo "                 APRSBC"
 echo "           v$AppVer"
 echo "       APRS Bash Client for Linux"
 echo "----------------------------------------"
 echo "                LU3FLA"
 echo "         Luciano Javier Lagassa"
 echo "       info@lucianolagassa.com.ar"
 echo "       www.lucianolagassa.com.ar"
 echo "----------------------------------------" 
}
#
# Command Line Error
CmdError()
{
 echo "Command Line Error"
 echo "aprsb AppMode[BEACOM o IGATE o MANUAL]"
 echo "aprsb AppMode[BEACOM o IGATE o MANUAL] MyCall MyLat MyLong"
 echo "aprsb AppMode[BEACOM o IGATE o MANUAL] MyCall MyLat MyLong MyText"
 echo "aprsb AppMode[BEACOM o IGATE o MANUAL] MyCall MyLat MyLong MyText UpdDelay"
 echo "----------------------------------------"
 exit 3
}
#
# Load Config File
LoadConfig()
{
 if [ -f "/etc/aprsbc.conf" ]
 then
  . "/etc/aprsbc.conf"
  if [ "$MyCall" = "N0CALL-1" ]
  then
   echo "Error, Configuration File with Default Values"
   echo "Edit the Configuration File, it is located at /etc/aprsbc.conf"
   exit 1
  fi
 else
  RunFolder=`pwd`
  if [ -f "$RunFolder/aprsbc.conf" ]
  then
   . "$RunFolder/aprsbc.conf"
   if [ "$MyCall" = "N0CALL-1" ]
   then
    echo "Error, Configuration File with Default Values"
    echo "Edit the Configuration File, it is located at $RunFolder/aprsbc.conf"
    exit 1
   fi
  else
   echo "Error, Configuration File Not Found, Generates one with Default Values."
   echo '# APRSBC - APRS Bash Client for Linux' > aprsbc.conf
   echo '#' >> aprsbc.conf
   echo '# Config' >> aprsbc.conf
   echo 'MyCall="N0CALL-1"' >> aprsbc.conf
   echo 'MyPass="-1"' >> aprsbc.conf
   echo 'MyLat="0"' >> aprsbc.conf
   echo 'MyLong="0"' >> aprsbc.conf
   echo 'MyText="Testing APRS Bash Client for Linux"' >> aprsbc.conf
   echo 'ServerHost="rotate.aprs2.net"' >> aprsbc.conf
   echo 'ServerPort="14580"' >> aprsbc.conf
   echo 'UpdDelay=30' >> aprsbc.conf
   echo '#' >> aprsbc.conf
   echo "Edit the Configuration File, it is located at /etc/aprsbc.conf"
   exit 1
  fi
 fi
}
#
# Load CommandLine Arguments
LoadCommands()
{
 echo "Cmd: $#"
 if [ $# -gt 0 ]
 then
  case $# in
   1)
    case $1 in
     'BEACOM')
      AppMode="BEACOM"
      CmdCall=$MyCall
      CmdLat=$MyLat
      CmdLong=$MyLong
      CmdText=$MyText
     ;;
     'MANUAL')
      AppMode="MANUAL"
      CmdCall=$MyCall
      CmdLat=$MyLat
      CmdLong=$MyLong
      CmdText=$MyText
     ;;
     'IGATE')
      AppMode="IGATE"
      CmdCall=$MyCall
      CmdLat=$MyLat
      CmdLong=$MyLong
      CmdText=$MyText
     ;;
     'DEBUG')
      AppMode="BEACOM"
      AppDebug="OK"
      CmdCall=$MyCall
      CmdLat=$MyLat
      CmdLong=$MyLong
      CmdText=$MyText
     ;;
     *)
      CmdError
     ;;
    esac
   ;;
   4)
    case $1 in
     'BEACOM')
      AppMode="BEACOM"
      CmdCall=$2
      CmdLat=$3
      CmdLong=$4
      CmdText="Testing APRS Bash Client for Linux"
     ;;
     'MANUAL')
      AppMode="MANUAL"
      CmdCall=$2
      CmdLat=$3
      CmdLong=$4
      CmdText="Testing APRS Bash Client for Linux"
     ;;
     'IGATE')
      AppMode="IGATE"
      CmdCall=$2
      CmdLat=$3
      CmdLong=$4
      CmdText="Testing APRS Bash Client for Linux"
     ;;
     *)
      CmdError
     ;;
    esac
   ;;
   5)
    AppMode=$1
    case $1 in
     'BEACOM')
      CmdCall=$2
      CmdLat=$3
      CmdLong=$4
      CmdText=$5
     ;;
     'MANUAL')
      CmdCall=$2
      CmdLat=$3
      CmdLong=$4
      CmdText=$5
     ;;
     'IGATE')
      CmdCall=$2
      CmdLat=$3
      CmdLong=$4
      CmdText=$5
     ;;
     *)
      CmdError
     ;;
    esac
   ;;
   6)
    AppMode=$1
    UpdDelay=$6
    case $1 in
     'BEACOM')
      CmdCall=$2
      CmdLat=$3
      CmdLong=$4
      CmdText=$5
     ;;
     'MANUAL')
      CmdCall=$2
      CmdLat=$3
      CmdLong=$4
      CmdText=$5
     ;;
     'IGATE')
      CmdCall=$2
      CmdLat=$3
      CmdLong=$4
      CmdText=$5
     ;;
     *)
      CmdError
     ;;
    esac
   ;;
   7)
    AppMode=$1
    UpdDelay=$6
    if [ "$7" = "DEBUG" ]
    then
     AppDebug="OK"
    else
     AppDebug="NO"
    fi
    case $1 in
     'BEACOM')
      CmdCall=$2
      CmdLat=$3
      CmdLong=$4
      CmdText=$5
     ;;
     'MANUAL')
      CmdCall=$2
      CmdLat=$3
      CmdLong=$4
      CmdText=$5
     ;;
     'IGATE')
      CmdCall=$2
      CmdLat=$3
      CmdLong=$4
      CmdText=$5
     ;;
     *)
      CmdError
     ;;
    esac
   ;;
   *)
    CmdError
   ;;
  esac
 else
  AppMode="BEACOM"
 fi
}
#
# Show Info
ShowInfo()
{
 echo "Config:"
 echo " AppMode: $AppMode"
 if [ "$AppDebug" = "OK" ]
 then
  echo " Debug: ON"
  echo " MyCall: $MyCall"
  echo " MyLat: $MyLat"
  echo " MyLog: $MyLong"
  echo " MyText: $MyText"
  echo " CmdCall: $CmdCall"
  echo " CmdLat: $CmdLat"
  echo " CmdLog: $CmdLong"
  echo " CmdText: $CmdText"
 else
  case $AppMode in
   'BEACOM')
    echo " MyCall: $MyCall"
    echo " MyLat: $MyLat"
    echo " MyLog: $MyLong"
    echo " MyText: $MyText"
   ;;
   'MANUAL')
    echo " MyCall: $CmdCall"
    echo " MyLat: $CmdLat"
    echo " MyLog: $CmdLong"
    echo " MyText: $CmdText"
   ;;
   'IGATE')
    #echo " MyCall: $CmdCall"
    #echo " MyLat: $CmdLat"
    #echo " MyLog: $CmdLong"
    #echo " MyText: $CmdText"
   ;;
  esac
 fi
 echo " Update Delay: $UpdDelay Seconds"
 echo " APRS Config:"
 echo "  User: $MyCall"
 if [ "$AppDebug" = "OK" ]
 then
  echo "  Pass: $MyPass"
 else
  echo "  Pass: ******"
 fi
 echo "  Host: $ServerHost"
 echo "  Port: $ServerPort"
 case $AppMode in
  'BEACOM')
   # Para Futuros Usos
  ;;
  'MANUAL')
   # Para Futuros Usos
  ;;
  'IGATE')
   echo " Modem Config:"
   echo "  Port: $SerialPort"
   echo "  Speed: $SerialSpeed"
  ;;
 esac
 echo "----------------------------------------" 
}
#
# APRS NetClient
NetClient()
{
 # Connect
 while true
 do
  # Detecta el Modo
  case $AppMode in
   'BEACOM') # Envia Datos de CFG a Servidor APRS
    TmpData=`printf "%s\n" "user $MyCall pass $MyPass vers APRSB $AppVer" "$MyCall>APRS,TCPIP*:=$MyLat/$MyLong&$MyText {APRSBC}" | nc $ServerHost $ServerPort 2> /dev/null`
   ;;
   'MANUAL') # Envia Datos de CMD a Servidor APRS
    TmpData=`printf "%s\n" "user $MyCall pass $MyPass vers APRSB $AppVer" "$CmdCall>APRS,TCPIP*:=$CmdLat/$CmdLong#$CmdText {APRSBC}" | nc $ServerHost $ServerPort 2> /dev/null`
   ;;
   'IGATE') # Envia Datos de Modem a Servidor APRS
    TmpData=`printf "%s\n" "user $MyCall pass $MyPass vers APRSB $AppVer" "$SerialCall>APRS,TCPIP*:=$SerialLat/$SerialLong#$SerialText {APRSBC}" | nc $ServerHost $ServerPort 2> /dev/null`
   ;;
  esac
  if [ "$AppDebug" = "OK" ]
  then
   echo " TmpData: $TmpData"
  fi
  UpdState=`echo $TmpData | grep -c "# logresp $MyCall verified"`
  if [ "$UpdState" = "0" ]
  then
   echo "Connecting to APRS Server [Error]"
   if [ "$AppDebug" = "OK" ]
   then
    echo " UpdState: $UpdState"
   fi
  else
   ServerName=`echo $TmpData | grep logresp | awk -F',' '{print $2}' | awk '{print $2}' | awk -F'\r' '{print $1}'`
   echo "Connecting to APRS Server ($ServerName) [OK]"
   if [ "$AppDebug" = "OK" ]
   then
    ServerApp=`echo $TmpData | awk -F'#' '{print $2}' | awk '{print $1}' | awk -F'logresp' '{print $1}' | head -n 1`
    ServerVer=`echo $TmpData | awk -F'#' '{print $2}' | awk '{print $2}' | awk -F"$MyCall" '{print $1}' | head -n 1`
    echo " UpdState: $UpdState"
    echo " ServerName: $ServerName"
    echo " ServerApp: $ServerApp"
    echo " ServerVer: $ServerVer"
   fi
  fi
  # Detecta el Modo
  case $AppMode in
   'BEACOM') # Activa el UpdDelay
    echo "Waiting $UpdDelay Seconds"
    sleep $UpdDelay
   ;;
   'MANUAL') # Activa el UpdDelay
    echo "Waiting $UpdDelay Seconds"
    sleep $UpdDelay
   ;;
   'IGATE') # Sale del Bucle
    sleep 1
    break
   ;;
  esac
 done
 #
}
#
# ModemRead
ModemRead()
{
 SerialState=`ls /dev/tty* | grep -c "$SerialPort"`
 if [ "$AppDebug" = "OK" ]
 then
  echo "SerialState: $SerialState"
 fi
 echo -n "Search Modem Serial Port ($SerialPort)"
 if [ "$SerialState" = "1" ]
 then
  echo " [OK]"
  echo -n 'Connect to Serial Modem'
  SerialOpen=`stty -F $SerialPort $SerialSpeed 2> /dev/null`
  SerialStart=`echo $SerialOpen | grep "$SerialPort"`
  if [ -z "$SerialStart" ]
  then
   echo " [OK]"
   while true
   do
    echo -n 'Reading Data from Serial Modem'
    SerialData=`head -n 1 $SerialPort` # Lectura con Head
    #SerialData=`dd if=$SerialPort count=22 status=none` # Lectura con DD
    if [ -n "$SerialData" ]
    then
     echo " [OK]"
     if [ "$AppDebug" = "OK" ]
     then
      echo "Data Read"
      echo " $SerialData"
     fi
     echo "Data Read"
     echo " $SerialData"
     SerialCall="$CmdCall"
     SerialLat="$CmdLat"
     SerialLong="$CmdLong"
     SerialText="$SerialData"
     echo " MyCall: $SerialCall"
     echo " MyLat: $SerialLat"
     echo " MyLog: $SerialLong"
     echo " MyText: $SerialText"
     echo "Sending Data"
     NetClient
    else
     echo " [Error]"
    fi
   done
  else
   echo " [Error]"
   if [ "$AppDebug" = "OK" ]
   then
    echo "SerialOpen: $SerialOpen"
   fi
  fi
 else
  echo " [NO]"
  if [ "$AppDebug" = "OK" ]
  then
   echo "SerialState: $SerialState"
  fi
 fi
}
#
# AppStart
About
LoadConfig
LoadCommands $@
ShowInfo
case $AppMode in
 'BEACOM')
  NetClient
 ;;
 'MANUAL')
  NetClient
 ;;
 'IGATE')
  ModemRead
 ;;
esac
#

