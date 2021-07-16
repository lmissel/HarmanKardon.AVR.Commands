# HarmanKardon.AVR.Commands
The PowerShell module `HarmanKardon.AVR.Commands` was created with the aim to remotely control a Harman Kardon AVR Controller 171S. The AVR Controller from Harman Kardon offers network functions for example AirPlay or Spotify. But other AVR controllers from the manufacturer can also be controlled via this module.

## Description
The PowerShell module `HarmanKardon.AVR.Commands` provides functions for remote control of a Harman Kardon AVR controller. With this module you are able to control all functions of the device via PowerShell. The PowerShell module could easily be extended to control other devices such as a bluray player from the manufacturer. The device's SOAP web service is used to control the device. This is done by establishing a TCP connection with port `10025` (default) and then sending the SOAP command (XML). The file `avr.xml` serves as a template and provides the structure of the SOAP command of the function `Invoke-HKAVRCommand`.

## Minimum Requirements
The module requires .NET and PowerShell. The following versions are supported:

|Product|Version|
|---|---|
|.NET Framework|2.0, 3.0, 3.5, 4.0, 4.5, 4.5.1, 4.5.2, 4.6, 4.6.1, 4.6.2, 4.7, 4.7.1, 4.7.2, 4.8|
|PowerShell|2.0 or higher|

## Installation
To install and run this module, copy the folder with the name `HarmanKardon.AVR.Commands` to one of the appropriate PowerShell paths, and use the command `Import-Module -Name HarmanKardon.AVR.Commands`.

The paths where you can install this module are in the `$env:PSModulePath` global variable. For example, a common path to store a module on a system would be `%SystemRoot%/users/<user>/Documents/PowerShell/Modules/<moduleName>`. Be sure to create a directory for this module that uses the same name as the script module. If you did not save this module in one of these paths, you must specify the location of the module in the `Import-Module` command. Otherwise, PowerShell would not be able to find the module.

Starting with PowerShell, if you've placed this module in one of the PowerShell module paths, you don't need to explicitly import it. This module is automatically loaded when a user calls a function of the module. For more information about the module path, see [Importing a PowerShell Module](https://docs.microsoft.com/en-us/powershell/scripting/developer/module/importing-a-powershell-module?view=powershell-7.1) and [Modifying the PSModulePath Installation Path](https://docs.microsoft.com/en-us/powershell/scripting/developer/module/modifying-the-psmodulepath-installation-path?view=powershell-7.1).

To remove this module from active service in the current PowerShell session, use `Remove-Module -name HarmanKardon.AVR.Commands`.

> [!Note]
> `Remove-Module` removes a module from the current PowerShell session, but doesn't uninstall the module or delete the module's files.

## Usage
````PowerShell
# Loading module
Import-Module HarmanKardon.AVR.Commands

# volume-up
Invoke-HKAVRCommand -HostName 172.16.15.123 -Port 10025 -Command "volume-up" -Zone "Main Zone"
````

## Known Issues

|Title|Description|
|---|---|
|Power-On|As soon as the device is in *standby mode* for a longer time, the device cannot be switched on with the command `Invoke-HKAVRCommand -HostName 172.16.15.123 -Port 10025 -Command "power-on" -Zone "Main Zone"`.|

## Notes
Support for the module is limited. Please report issues in the source code repository via the Feedback section using the link on this page.

## Feedback
Submit and view feedback for [this module](https://github.com/lmissel/HarmanKardon.AVR.Commands/issues/new).
