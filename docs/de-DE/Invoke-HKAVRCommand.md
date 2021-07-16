---
external help file: HarmanKardon.AVR.Commands-help.xml
Module Name: HarmanKardon.AVR.Commands
online version:
schema: 2.0.0
---

# Invoke-HKAVRCommand

## SYNOPSIS
Sendet einen Befehl an einem AVR Controller.

## SYNTAX

```
Invoke-HKAVRCommand [-HostName] <String> [[-Port] <Int32>] [-Command] <String> [-Zone] <String>
 [[-Parameter] <String>] [<CommonParameters>]
```

## DESCRIPTION
Diese Methode sendet einen SOAP-Request an den angegebenen Harman Kardon AVR Controller.

## EXAMPLES

### EXAMPLE 1
```
Invoke-HKAVRCommand -HostName 172.16.15.123 -Port 10025 -Command "power-on" -Zone "Main Zone"
```

Dieser Befehl schaltet einen AVR-Controller vom Zustand "Standby" in den Zustand "Power-On".

### EXAMPLE 2
```
Invoke-HKAVRCommand -HostName 172.16.15.123 -Port 10025 -Command "power-off" -Zone "Main Zone"
```

Dieser Befehl schaltet einen AVR-Controller vom Zustand "Power-On" in den Zustand "Power-Off".

### EXAMPLE 3
```
Invoke-HKAVRCommand -HostName 172.16.15.123 -Port 10025 -Command "source-selection" -Zone "Main Zone" -Parameter "AUX"
```

Dieser Befehl schaltet die Quelle des AVR-Controllers auf AUX um.

## PARAMETERS

### -Command
Gibt den ausführenden Befehl an.

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
Verwenden Sie diesen Parameter, um den Hostnamen oder die IP-Adresse des AVR-Controllers einzustellen.

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
Verwenden Sie diesen Parameter, um zusätzliche Parameter für den Befehl mitzugeben.

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
Geben Sie den Port an, auf dem der SOAP-Webdienst erreicht werden kann. Standard ist: "10025".

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
Verwenden Sie diesen Parameter, um die Zone anzugeben, in der der Befehl ausgeführt werden soll. Voreinstellung ist: "Main-Zone".

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
Getestet mit einem Harman Kardon AVR Controller 171S

## RELATED LINKS
