---
Module Name: HarmanKardon.AVR.Commands
Module Guid: cde59d5f-e956-4a93-93ce-b0f862a53aab
Download Help Link: {{ Update Download Link }}
Help Version: {{ Please enter version of help manually (X.X.X.X) format }}
Locale: en-US
---

# HarmanKardon.AVR.Commands Module
## Description
The PowerShell module `HarmanKardon.AVR.Commands` provides functions for remote control of a Harman Kardon AVR controller. With this module you are able to control all functions of the device via PowerShell. The PowerShell module could easily be extended to control other devices such as a bluray player from the manufacturer. The device's SOAP web service is used to control the device. This is done by establishing a TCP connection with port `10025` (default) and then sending the SOAP command (XML). The file `avr.xml` serves as a template and provides the structure of the SOAP command of the function `Invoke-HKAVRCommand`.

## HarmanKardon.AVR.Commands Cmdlets
### [Invoke-HKAVRCommand](Invoke-HKAVRCommand.md)
Sends a command to the AVR.

## Feedback
Submit and view feedback for [this module](https://github.com/lmissel/HarmanKardon.AVR.Commands/issues/new).
