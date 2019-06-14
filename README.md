# HarmanKardon.AVR.Commands
Dieses PowerShell Module wurde mit dem Ziel erstellt, einen Harman Kardon AVR Controller 171S fernzusteuern und in meine SmartHome Umgebung zu integrieren. 

Der AVR Controller von Harman Kardon liefert Netzwerkfunktionen für AirPlay, Spotify und eine App-Steuerung 'HK Remote' für Android oder iOS. Für meine SmartHome Umgebung wollte ich aber ganze Sequenzen abbilden, was man leider nicht so einfach darstellen konnte. Beispielsweise sollte, sobald ich nach Hause komme, der AVR Controller angehen und Spotify meine Lieblingslieder abspielen. So kam es, dass ich mir den Traffic der HK Remote von meinem iPhone anschaute und das Ergebnis ist hier zu sehen...

## Beispiel
````PowerShell
# Module laden
Import-Module HarmanKardon.AVR.Commands

# Anschalten
Invoke-HKAVRCommand -HostName 172.16.15.123 -Port 10025 -Command "power-on" -Zone "Main Zone"

# Lauter
Invoke-HKAVRCommand -HostName 172.16.15.123 -Port 10025 -Command "volume-up" -Zone "Main Zone"
````
