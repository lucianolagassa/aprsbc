# APRSBC
APRS Bash Client for Linux

Este Software es Mayormente un Script Bash que Utiliza Herramienta disponibles en Linux
la idea es que pueda ser ejecutado en casi cualquier dispositivo que tenga este sistema operativo.

aun esta en desarrollo por lo que varias funciones no estan completamente finalizadas.

Se dispone de 4 modos:
  BEACON: modo baliza, sin datos desde linea de comandos, solo lee los datos desde el archivo aprsbc.conf, actualización infinita.
          modo baliza, toma los datos desde linea de comandos y solo lee los datos de login desde el archivo aprsbc.conf, solo se ejecuta una conección.
  MANUAL: modo manual, toma los datos desde linea de comandos y solo lee los datos de login desde el archivo aprsbc.conf, actualización infinita.
  IGATE:  modo serial, toma los datos desde modem tnc y solo lee los datos de login desde el archivo aprsbc.conf, actualización infinita.

Ejemplo Ejecucción Modo BEACON (Sin datos desde Linea de Comando)
aprsbc

----------------------------------------
                 APRSBC
           v0.18.03.27-1050
       APRS Bash Client for Linux
----------------------------------------
                LU3FLA
         Luciano Javier Lagassa
       info@lucianolagassa.com.ar
       www.lucianolagassa.com.ar
----------------------------------------
Config:
 AppMode: BEACON
 MyCall: MY-CALL
 MyLat: MY-LAT
 MyLog: MY-LONG
 MyText: Testing APRS Bash Client for Linux
 Update Delay: 30 Seconds
 APRS Config:
  User: MY-CALL
  Pass: ******
  Host: rotate.aprs2.net
  Port: 14580
----------------------------------------
Connecting to APRS Server (T2EISBERG) [OK]
Waiting 30 Seconds


Ejemplo Ejecucción Modo BEACON (Desde Linea de Comando)
aprsbc

----------------------------------------
                 APRSBC
           v0.18.03.27-1050
       APRS Bash Client for Linux
----------------------------------------
                LU3FLA
         Luciano Javier Lagassa
       info@lucianolagassa.com.ar
       www.lucianolagassa.com.ar
----------------------------------------
Config:
 AppMode: BEACON
 MyCall: MY-CALL
 MyLat: MY-LAT
 MyLog: MY-LONG
 MyText: MY-TEXT
 Update Delay: 30 Seconds
 APRS Config:
  User: MY-CALL
  Pass: ******
  Host: rotate.aprs2.net
  Port: 14580
----------------------------------------
Connecting to APRS Server (T2MAZURY) [OK]
