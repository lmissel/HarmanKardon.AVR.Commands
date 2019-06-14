# HarmanKardon.AVR.Commands
Dieses PowerShell Module wurde mit dem Ziel erstellt, einen Harman Kardon AVR Controller 171S fernzusteuern. Dabei wird die API des AVR Controllers angesprochen.


## Beispiel
````PowerShell
# Modul laden
Import-Module HarmanKardon.AVR.Commands

# Anschalten
Invoke-HKAVRCommand -HostName 172.16.15.123 -Port 10025 -Command "power-on" -Zone "Main Zone"

# Lauter
Invoke-HKAVRCommand -HostName 172.16.15.123 -Port 10025 -Command "volume-up" -Zone "Main Zone"
````
