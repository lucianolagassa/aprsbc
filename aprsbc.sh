#!/bin/sh
# APRSBC - APRS Bash Client for Linux
# LU3FLA - Luciano Javier Lagassa - info@lucianolagassa.com.ar - www.lucianolagassa.com.ar
#
# AppVersion
AppVer="0.23.04.13-23.47"
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
 echo "aprsbc AppMode[BEACON o GPS o IGATE o MANUAL]"
 echo "aprsbc AppMode[BEACON o GPS o IGATE o MANUAL] MyCall"
 echo "aprsbc AppMode[BEACON o IGATE o MANUAL] MyCall MyLat MyLong"
 echo "aprsbc AppMode[BEACON o IGATE o MANUAL] MyCall MyLat MyLong MyText"
 echo "aprsbc AppMode[BEACON o IGATE o MANUAL] MyCall MyLat MyLong MyText MyIcon"
 echo "aprsbc AppMode[BEACON o IGATE o MANUAL] MyCall MyLat MyLong MyText MyIcon UpdDelay"
 echo "aprsbc AppMode[BEACON o IGATE o MANUAL] MyCall MyLat MyLong MyText MyIcon UpdDelay DEBUG"
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
   echo 'MyIcon="&"' >> aprsbc.conf
   echo 'ServerHost="rotate.aprs2.net"' >> aprsbc.conf
   echo 'ServerPort="14580"' >> aprsbc.conf
   echo 'UpdDelay=60' >> aprsbc.conf
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
 if [ $# -gt 0 ]
 then
  case $# in
   1)
    case $1 in
     'BEACON')
      AppMode="BEACON"
      CmdCall=$MyCall
      CmdLat=$MyLat
      CmdLong=$MyLong
      CmdText=$MyText
      CmdIcon=$MyIcon
      #UpdDelay="60"
     ;;
     'GPS')
      AppMode="GPS"
      CmdCall=$MyCall
      #CmdLat=$MyLat
      #CmdLong=$MyLong
      CmdText=$MyText
      CmdIcon=$MyIcon
      #UpdDelay="60"
     ;;
     'MANUAL')
      AppMode="MANUAL"
      CmdCall=$MyCall
      CmdLat=$MyLat
      CmdLong=$MyLong
      CmdText=$MyText
      CmdIcon=$MyIcon
      #UpdDelay="60"
     ;;
     'IGATE')
      AppMode="IGATE"
      CmdCall=$MyCall
      CmdLat=$MyLat
      CmdLong=$MyLong
      CmdText=$MyText
      CmdIcon=$MyIcon
      #UpdDelay="30"
     ;;
     'DEBUG')
      AppMode="BEACON"
      AppDebug="OK"
      CmdCall=$MyCall
      CmdLat=$MyLat
      CmdLong=$MyLong
      CmdText=$MyText
      CmdIcon=$MyIcon
      #UpdDelay="0"
     ;;
     *)
      CmdError
     ;;
    esac
   ;;
   2)
    case $1 in
     'BEACON')
      AppMode="BEACON"
      CmdCall=$2
      CmdLat=$MyLat
      CmdLong=$MyLong
      CmdText=$MyText
      CmdIcon=$MyIcon
      UpdDelay="30"
     ;;
     'GPS')
      AppMode="GPS"
      CmdCall=$2
      CmdLat=$MyLat
      CmdLong=$MyLong
      CmdText=$MyText
      CmdIcon=$MyIcon
      UpdDelay="30"
     ;;
     'MANUAL')
      AppMode="MANUAL"
      CmdCall=$2
      CmdLat=$MyLat
      CmdLong=$MyLong
      CmdText=$MyText
      CmdIcon=$MyIcon
      UpdDelay="30"
     ;;
     'IGATE')
      AppMode="IGATE"
      CmdCall=$2
      CmdLat=$MyLat
      CmdLong=$MyLong
      CmdText=$MyText
      CmdIcon=$MyIcon
      UpdDelay="30"
     ;;
     'DEBUG')
      AppMode="BEACON"
      AppDebug="OK"
      CmdCall=$2
      CmdLat=$MyLat
      CmdLong=$MyLong
      CmdText=$MyText
      CmdIcon=$MyIcon
      UpdDelay="0"
     ;;
     *)
      CmdError
     ;;
    esac
   ;;
   4)
    case $1 in
     'BEACON')
      AppMode="BEACON"
      CmdCall=$2
      CmdLat=$3
      CmdLong=$4
      CmdText="Testing APRS Bash Client for Linux"
      CmdIcon="&"
      UpdDelay="30"
     ;;
     'MANUAL')
      AppMode="MANUAL"
      CmdCall=$2
      CmdLat=$3
      CmdLong=$4
      CmdText="Testing APRS Bash Client for Linux"
      CmdIcon="&"
      UpdDelay="30"
     ;;
     'IGATE')
      AppMode="IGATE"
      CmdCall=$2
      CmdLat=$3
      CmdLong=$4
      CmdText="Testing APRS Bash Client for Linux"
      CmdIcon="&"
      UpdDelay="30"
     ;;
     *)
      CmdError
     ;;
    esac
   ;;
   5)
    AppMode=$1
    case $1 in
     'BEACON')
      CmdCall=$2
      CmdLat=$3
      CmdLong=$4
      CmdText=$5
      CmdIcon="&"
      UpdDelay="30"
     ;;
     'MANUAL')
      CmdCall=$2
      CmdLat=$3
      CmdLong=$4
      CmdText=$5
      CmdIcon="&"
      UpdDelay="30"
     ;;
     'IGATE')
      CmdCall=$2
      CmdLat=$3
      CmdLong=$4
      CmdText=$5
      CmdIcon="&"
      UpdDelay="30"
     ;;
     *)
      CmdError
     ;;
    esac
   ;;
   6)
    AppMode=$1
    case $1 in
     'BEACON')
      CmdCall=$2
      CmdLat=$3
      CmdLong=$4
      CmdText=$5
      CmdIcon=$6
      UpdDelay="30"
     ;;
     'MANUAL')
      CmdCall=$2
      CmdLat=$3
      CmdLong=$4
      CmdText=$5
      UpdDelay="30"
     ;;
     'IGATE')
      CmdCall=$2
      CmdLat=$3
      CmdLong=$4
      CmdText=$5
      CmdIcon=$6
      UpdDelay="30"
     ;;
     *)
      CmdError
     ;;
    esac
   ;;
   7)
    AppMode=$1
    case $1 in
     'BEACON')
      CmdCall=$2
      CmdLat=$3
      CmdLong=$4
      CmdText=$5
      CmdIcon=$6
      UpdDelay="30"
     ;;
     'MANUAL')
      CmdCall=$2
      CmdLat=$3
      CmdLong=$4
      CmdText=$5
      CmdIcon=$6
      UpdDelay=$7
     ;;
     'IGATE')
      CmdCall=$2
      CmdLat=$3
      CmdLong=$4
      CmdText=$5
      CmdIcon=$6
      UpdDelay=$7
     ;;
     *)
      CmdError
     ;;
    esac
   ;;
   8)
    AppMode=$1
    if [ "$8" = "DEBUG" ]
    then
     AppDebug="OK"
    else
     AppDebug="NO"
    fi
    AppDebug="OK"
    case $1 in
     'BEACON')
      CmdCall=$2
      CmdLat=$3
      CmdLong=$4
      CmdText=$5
      CmdIcon=$6
      UpdDelay="0"
     ;;
     'MANUAL')
      CmdCall=$2
      CmdLat=$3
      CmdLong=$4
      CmdText=$5
      CmdIcon=$6
      UpdDelay=$7
     ;;
     'IGATE')
      CmdCall=$2
      CmdLat=$3
      CmdLong=$4
      CmdText=$5
      CmdIcon=$6
      UpdDelay=$7
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
  AppMode="BEACON"
  CmdCall=$MyCall
  CmdLat=$MyLat
  CmdLong=$MyLong
  CmdText=$MyText
  CmdIcon=$MyIcon
  #UpdDelay="60"
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
  echo " MyIcon: $MyIcon"
  echo " CmdCall: $CmdCall"
  echo " CmdLat: $CmdLat"
  echo " CmdLog: $CmdLong"
  echo " CmdText: $CmdText"
  echo " CmdIcon: $CmdIcon"
 else
  case $AppMode in
   'BEACON')
    echo " MyCall: $MyCall"
    echo " MyLat: $MyLat"
    echo " MyLog: $MyLong"
    echo " MyText: $MyText"
    echo " MyIcon: $MyIcon"
   ;;
   'MANUAL')
    echo " MyCall: $CmdCall"
    echo " MyLat: $CmdLat"
    echo " MyLog: $CmdLong"
    echo " MyText: $CmdText"
    echo " MyIcon: $CmdIcon"
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
  'BEACON')
   # Para Futuros Usos
  ;;
  'GPS')
   echo " GPS Config:"
   echo "  Port: $SerialPort"
   echo "  Speed: $SerialSpeed"
  ;;
  'IGATE')
   echo " Modem Config:"
   echo "  Port: $SerialPort"
   echo "  Speed: $SerialSpeed"
  ;;
  'MANUAL')
   # Para Futuros Usos
  ;;
 esac
 echo "----------------------------------------" 
}
#

# APRS NetClient
NetClient()
{
 # Detecta el Modo
 case $AppMode in
  'BEACON')
   if [ ! "$CmdCall" ]
   then
   {
    # Envia Datos de CFG a Servidor APRS
    TmpData=`printf "%s\n" "user $MyCall pass $MyPass vers APRSB $AppVer" "$MyCall>APRS,TCPIP*:=$MyLat/$MyLong$MyIcon$MyText {APRSBC}" | nc $ServerHost $ServerPort -N 2> /dev/null`
    #TmpData=`printf "%s\n" "user $MyCall pass $MyPass vers APRSB $AppVer" "$MyCall>APRS,TCPIP*:=$MyLat/$MyLong&$MyText {APRSBC}" | nc $ServerHost $ServerPort -N 2> /dev/null`
   }
   else
   {
    # Envia Datos de CMD a Servidor APRS
    TmpData=`printf "%s\n" "user $MyCall pass $MyPass vers APRSB $AppVer" "$CmdCall>APRS,TCPIP*:=$CmdLat/$CmdLong$CmdIcon$CmdText {APRSBC}" | nc $ServerHost $ServerPort -N 2> /dev/null`
    #TmpData=`printf "%s\n" "user $MyCall pass $MyPass vers APRSB $AppVer" "$CmdCall>APRS,TCPIP*:=$CmdLat/$CmdLong&$CmdText {APRSBC}" | nc $ServerHost $ServerPort -N 2> /dev/null`
   }
   fi
  ;;
  'GPS') # Envia Datos de GPS a Servidor APRS
   TmpData=`printf "%s\n" "user $MyCall pass $MyPass vers APRSB $AppVer" "$CmdCall>APRS,TCPIP*:=$CmdLat/$CmdLong$CmdIcon$CmdText {APRSBC}" | nc $ServerHost $ServerPort -N 2> /dev/null`
   #TmpData=`printf "%s\n" "user $MyCall pass $MyPass vers APRSB $AppVer" "$CmdCall>APRS,TCPIP*:=$CmdLat/$CmdLong&$CmdText {APRSBC}" | nc $ServerHost $ServerPort -N 2> /dev/null`
  ;;
  'IGATE') # Envia Datos de Modem a Servidor APRS
   TmpData=`printf "%s\n" "user $MyCall pass $MyPass vers APRSB $AppVer" "$SerialCall>APRS,TCPIP*:=$SerialLat/$SerialLong$CmdIcon$SerialText {APRSBC}" | nc $ServerHost $ServerPort -N 2> /dev/null`
   #TmpData=`printf "%s\n" "user $MyCall pass $MyPass vers APRSB $AppVer" "$SerialCall>APRS,TCPIP*:=$SerialLat/$SerialLong#$SerialText {APRSBC}" | nc $ServerHost $ServerPort -N 2> /dev/null`
  ;;
  'MANUAL') # Envia Datos de CMD a Servidor APRS
   TmpData=`printf "%s\n" "user $MyCall pass $MyPass vers APRSB $AppVer" "$CmdCall>APRS,TCPIP*:=$CmdLat/$CmdLong$CmdIcon$CmdText {APRSBC}" | nc $ServerHost $ServerPort -N 2> /dev/null`
   #TmpData=`printf "%s\n" "user $MyCall pass $MyPass vers APRSB $AppVer" "$CmdCall>APRS,TCPIP*:=$CmdLat/$CmdLong#$CmdText {APRSBC}" | nc $ServerHost $ServerPort -N 2> /dev/null`
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
}
#

# GPSRead
GPSRead()
{
 SerialState=`ls /dev/* | grep -c "$SerialPort"`
 if [ "$AppDebug" = "OK" ]
 then
  echo "SerialState: $SerialState"
 fi
 echo -n "Search Modem Serial Port ($SerialPort)"
 if [ "$SerialState" = "1" ]
 then
  echo " [OK]"
   echo -n 'Reading Data from GPS'
   while read -r SerialData < $SerialPort
   do
    if [ "$AppDebug" = "OK" ]
    then
     echo "Data Read"
     echo " $SerialData"
    fi
    if [ -n "$SerialData" ]
    then
     GPSCheck1=`echo $SerialData | grep -c '\$GPRMC'`
     GPSCheck2=`echo $SerialData | grep -c '\$GPGGA'`
     if [ "$GPSCheck1" = "1" ] || [ "$GPSCheck2" = "1" ]
     then
      if [ "$GPSCheck1" = "1" ]
      then
       GPSLatPoint=`echo $SerialData | awk -F',' '{print $5}'`
       GPSLongPoint=`echo $SerialData | awk -F',' '{print $7}'`
       GPSLatTemp=`echo $SerialData | awk -F',' '{print $4}'`
       GPSLongTemp=`echo $SerialData | awk -F',' '{print $6}'`
      fi
      if [ "$GPSCheck2" = "1" ]
      then
       GPSLatPoint=`echo $SerialData | awk -F',' '{print $4}'`
       GPSLongPoint=`echo $SerialData | awk -F',' '{print $6}'`
       GPSLatTemp=`echo $SerialData | awk -F',' '{print $3}'`
       GPSLongTemp=`echo $SerialData | awk -F',' '{print $5}'`
      fi
      GPSLatEnd=`echo $GPSLatTemp | awk -F'.' '{print $2}'`
      GPSLongEnd=`echo $GPSLongTemp | awk -F'.' '{print $2}'`
      GPSLatCount=${#GPSLatEnd}
      GPSLongCount=${#GPSLongEnd}
      if [ $GPSLatCount -ge 2 ]
      then
       GPSLatCut=$((GPSLatCount-1))
       GPSLatTemp=`echo $GPSLatTemp | rev | cut -c$GPSLatCut- | rev`
      fi
      if [ $GPSLongCount -ge 2 ]
      then
       GPSLongCut=$((GPSLongCount-1))
       GPSLongTemp=`echo $GPSLongTemp | rev | cut -c$GPSLongCut- | rev`
      fi
      CmdLat=`echo $GPSLatTemp$GPSLatPoint`
      CmdLong=`echo $GPSLongTemp$GPSLongPoint`
     fi
    fi
    if [ -n "$CmdLat" ] && [ -n "$CmdLong" ]
    then
     echo " [OK]"
     FechaActual=`date +"%d/%m/%Y %H:%M:%S"`
     echo "Sending Data to Server {$FechaActual}"
     break
    else
     ErrorCount=$((ErrorCount+1))
    fi
    if [ $ErrorCount -ge 15 ]
    then
     echo " [NO]"
     break
    fi
   done
 else
  echo " [NO]"
  if [ "$AppDebug" = "OK" ]
  then
   echo "SerialState: $SerialState"
  fi
 fi
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
   echo -n 'Reading Data from Serial Modem'
   #SerialData=`head -n 1 $SerialPort` # Lectura con Head
   #SerialData=`dd if=$SerialPort count=22 status=none` # Lectura con DD
   while read -r SerialData < $SerialPort
   do
    if [ -n "$SerialData" ]
    then
     #echo " [OK]"
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
     #echo " MyCall: $SerialCall"
     #echo " MyLat: $SerialLat"
     #echo " MyLog: $SerialLong"
     #echo " MyText: $SerialText"
     #echo "Sending Data to Server"
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
while true
do
 case $AppMode in
  'BEACON')
   NetClient
  ;;
  'GPS')
    GPSRead
    if [ -n "$CmdLat" ] && [ -n "$CmdLong" ]
    then
      NetClient
    fi
  ;;
  'IGATE')
    ModemRead
    if [ -n "$CmdLat" ] && [ -n "$CmdLong" ]
    then
     NetClient
    fi
  ;;
  'MANUAL')
   NetClient
  ;;
 esac
 if [ $UpdDelay -gt 0 ]
 then
  echo "Waiting $UpdDelay Seconds"
  sleep $UpdDelay
 else
  sleep 1
  break
 fi
done
#
