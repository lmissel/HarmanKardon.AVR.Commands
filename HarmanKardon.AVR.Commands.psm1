<#
.Synopsis
    Stellt eine Verbindung zum Harman Kardon AVR Controller her.
.DESCRIPTION
    Diese Methode sendet einen Request an den angegebenen Harman Kardon AVR Controller.
.EXAMPLE
    Invoke-HKAVRCommand -HostName 172.16.15.123 -Port 10025 -Command "power-on" -Zone "Main Zone"
.EXAMPLE
    Invoke-HKAVRCommand -HostName 172.16.15.123 -Port 10025 -Command "power-off" -Zone "Main Zone"
.EXAMPLE
    Invoke-HKAVRCommand -HostName 172.16.15.123 -Port 10025 -Command "source-selection" -Zone "Main Zone" -Parameter "AUX"
.NOTES
    Getestet mit einem Harman Kardon AVR Controller 171S
#>
function Invoke-HKAVRCommand
{
    [CmdletBinding()]
    [Alias()]
    Param
    (
        [Parameter( Mandatory=$true,
                    ValueFromPipelineByPropertyName=$true,
                    Position=0)]
        [ValidateNotNullOrEmpty()]
        [String] $HostName,

        [Parameter( Mandatory=$false,
                    ValueFromPipelineByPropertyName=$true,
                    Position=1)]
        [int] $Port = 10025,

        [Parameter( Mandatory=$true,
                    ValueFromPipelineByPropertyName=$true,
                    Position=2)]
        [ValidateNotNullOrEmpty()]
        [ValidateSet('power-on', 'power-off', 'ok', 'volume-down', 'volume-up', 'up', 'sleep', 'source-selection', 'right', 'reverse', 'previous', 'play', 'pause', 'options', 'next', 'mute-toggle', 'left', 'info', 'home', 'heart-alive', 'forward', 'down', 'back')]
        [String] $Command,

        [Parameter( Mandatory=$true,
                    ValueFromPipelineByPropertyName=$true,
                    Position=3)]
        [ValidateSet('Main Zone', 'Zone 2')]
        [String] $Zone,

        [Parameter( Mandatory=$false,
                    ValueFromPipelineByPropertyName=$true,
                    Position=4)]
        [String] $Parameter
    )

    Begin
    {
        [XML] $XML = Get-Content -Path $($PSScriptRoot + '\avr.xml')
        $XML.harman.avr.common.control.name = $Command
        $XML.harman.avr.common.control.zone = $Zone
        $XML.harman.avr.common.control.param = $Parameter

        #Request erstellen
	    [string] $Request = "POST AVR HTTP/1.1\r\n";
        $Request += "Host: " + $HostName + ":" + $Port + "\r\n";
        $Request += "User-Agent: Harman Kardon AVR Controller /1.0\r\n";
        $Request += "Content-Length: " + $XML.InnerXml.Length + "\r\n";
        $Request += "\r\n";
        $Request += $XML.InnerXml;
    }
    Process
    {
        try
        {
            $TcpClient = [System.Net.Sockets.TcpClient]::new($HostName, $Port)
            $TcpClient.ReceiveTimeout = 100

            [Byte[]] $data = [System.Text.Encoding]::ASCII.GetBytes($Request) 
            [System.Net.Sockets.NetworkStream] $NetworkStream = $TcpClient.GetStream()
            $NetworkStream.Write($data, 0, $data.Length)

            $NetworkStream.Close()
            $TcpClient.Close()
        }
        catch [System.Exception]
        {
            throw
        }
    }
    End
    {        
    }
}