---
Module Name: HarmanKardon.AVR.Commands
Module Guid: cde59d5f-e956-4a93-93ce-b0f862a53aab
Download Help Link: {{ Update Download Link }}
Help Version: {{ Please enter version of help manually (X.X.X.X) format }}
Locale: en-US
---

# HarmanKardon.AVR.Commands Module
## Description
Das PowerShell-Modul `HarmanKardon.AVR.Commands` bietet Funktionen zur Fernsteuerung eines Harman Kardon AVR-Controllers. Mit diesem Modul sind Sie in der Lage, alle Funktionen des Geräts über die PowerShell zu steuern. Das PowerShell-Modul könnte leicht erweitert werden, um andere Geräte zu steuern, z. B. einen Bluray-Player des Herstellers. Zur Steuerung des Gerätes wird der SOAP-Webservice des Gerätes verwendet. Dazu wird eine TCP-Verbindung mit Port `10025` (Standard) aufgebaut und dann der SOAP-Befehl (XML) gesendet. Die Datei `avr.xml` dient als Vorlage und liefert die Struktur des SOAP-Befehls der Funktion `Invoke-HKAVRCommand`.

## HarmanKardon.AVR.Commands Cmdlets
### [Invoke-HKAVRCommand](Invoke-HKAVRCommand.md)
Sendet einen Befehl an einem AVR Controller.

## Feedback
Feedback für [dieses Modul](https://github.com/lmissel/HarmanKardon.AVR.Commands/issues/new) abgeben und anzeigen.
