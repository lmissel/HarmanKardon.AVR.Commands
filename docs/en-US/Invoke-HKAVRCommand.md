---
external help file: HarmanKardon.AVR.Commands-help.xml
Module Name: HarmanKardon.AVR.Commands
online version:
schema: 2.0.0
---

# Invoke-HKAVRCommand

## SYNOPSIS
Sends a command to the AVR.

## SYNTAX

```
Invoke-HKAVRCommand [-HostName] <String> [[-Port] <Int32>] [-Command] <String> [-Zone] <String>
 [[-Parameter] <String>] [<CommonParameters>]
```

## DESCRIPTION
This method sends a specific SOAP request to the specified Harman Kardon AVR controller.

## EXAMPLES

### EXAMPLE 1
```
Invoke-HKAVRCommand -HostName 172.16.15.123 -Port 10025 -Command "power-on" -Zone "Main Zone"
```
This command switches an AVR controller from the "Standby" state to the "Power-On" state.

### EXAMPLE 2
```
Invoke-HKAVRCommand -HostName 172.16.15.123 -Port 10025 -Command "power-off" -Zone "Main Zone"
```

This command switches an AVR controller from the "Power-On" state to the "Power-Off" state.

### EXAMPLE 3
```
Invoke-HKAVRCommand -HostName 172.16.15.123 -Port 10025 -Command "source-selection" -Zone "Main Zone" -Parameter "AUX"
```

This command switches the source of the AVR controller to AUX.

## PARAMETERS

### -Command
Specifies the executing command.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 3
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -HostName
Use this parameter to set the host name or IP address of the AVR controller.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -Parameter
Use this parameter to set additional parameters for the command.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 5
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -Port
Specify the port on which the SOAP web service can be reached. Default is: "10025".

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: 10025
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -Zone
Use this parameter to specify the zone in which the command should be executed. Default is: "Main zone".

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 4
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### String

### Int

## OUTPUTS

## NOTES
Tested with a Harman Kardon AVR Controller 171S.

## RELATED LINKS
