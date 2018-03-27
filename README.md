# APRSBC
APRS Bash Client for Linux

Este Software es Mayormente un Script Bash que Utiliza Herramienta disponibles en Linux
la idea es que pueda ser ejecutado en casi cualquier dispositivo que tenga este sistema operativo.

aun esta en desarrollo por lo que varias funciones no estan completamente finalizadas.

Se dispone de 4 modos:
 - **BEACON**: *modo baliza, sin datos desde linea de comandos, solo lee los datos desde el archivo aprsbc.conf, actualización infinita.* *modo baliza, toma los datos desde linea de comandos y solo lee los datos de login desde el archivo aprsbc.conf, solo se ejecuta una conección.*
 - **MANUAL**: *modo manual, toma los datos desde linea de comandos y solo lee los datos de login desde el archivo aprsbc.conf, actualización infinita.*
 - **IGATE**:  *modo serial, toma los datos desde modem tnc y solo lee los datos de login desde el archivo aprsbc.conf, actualización infinita.*
