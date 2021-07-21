#!/usr/bin/env powershell

# .ExternalHelp HarmanKardon.AVR.Commands-help.xml
function Invoke-HKAVRCommand
{
	[CmdletBinding()]
	Param
	(
		[Parameter(Mandatory = $true,
				   HelpMessage = 'Use this parameter to set the host name or IP address of the AVR controller.',
				   ValueFromPipelineByPropertyName = $true,
				   Position = 0)]
		[ValidateNotNullOrEmpty()]
		[String] $HostName,

		[Parameter(Mandatory = $false,
				   ValueFromPipelineByPropertyName = $true,
				   Position = 1)]
		[int] $Port = 10025,

		[Parameter(Mandatory = $true,
				   HelpMessage = 'Specifies the executing command.',
				   ValueFromPipelineByPropertyName = $true,
				   Position = 2)]
		[ValidateNotNullOrEmpty()]
		[ValidateSet('power-on', 'power-off', 'ok', 'volume-down', 'volume-up', 'up', 'sleep', 'source-selection', 'right', 'reverse', 'previous', 'play', 'pause', 'options', 'next', 'mute-toggle', 'left', 'info', 'home', 'heart-alive', 'forward', 'down', 'back')]
		[String] $Command,

		[Parameter(Mandatory = $true,
				   HelpMessage = 'Use this parameter to specify the zone in which the command should be executed. Default is: "Main zone".',
				   ValueFromPipelineByPropertyName = $true,
				   Position = 3)]
		[ValidateSet('Main Zone', 'Zone 2')]
		[String] $Zone,

		[Parameter(Mandatory = $false,
				   ValueFromPipelineByPropertyName = $true,
				   Position = 4)]
		[String] $Parameter = [String]::Empty
	)

	Begin
	{
		$CRLF = '\r\n'
		[XML] $XML = Get-Content -Path $($PSScriptRoot + '\avr.xml')
		$XML.harman.avr.common.control.name = $Command
		$XML.harman.avr.common.control.zone = $Zone
		$XML.harman.avr.common.control.param = $Parameter

		#Request erstellen
		[string] $Request = 'POST AVR HTTP/1.1' + $CRLF

		$Request += 'Host: ' + $HostName + ':' + $Port + $CRLF
		$Request += 'User-Agent: Harman Kardon AVR Controller /1.0' + $CRLF
		$Request += 'Content-Length: ' + $XML.InnerXml.Length + $CRLF
		$Request += $CRLF
		$Request += $XML.InnerXml

	}
	Process
	{
		try
		{
			$TcpClient = [Net.Sockets.TcpClient]::new($HostName, $Port)
			$TcpClient.ReceiveTimeout = 100

			[Byte[]] $data = [Text.Encoding]::ASCII.GetBytes($Request)
			[Net.Sockets.NetworkStream] $NetworkStream = $TcpClient.GetStream()
			$NetworkStream.Write($data, 0, $data.Length)

			$NetworkStream.Close()
			$TcpClient.Close()
		}
		catch 
		{
			throw
		}
	}
	End
	{
	}
}