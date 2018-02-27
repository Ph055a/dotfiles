set-location ~/

if (!(Test-Path -Path $PROFILE)) {New-Item -Type File -Path $PROFILE -Force}
micro $PROFILE

Import-Module posh-git
Import-Module oh-my-posh
Set-Theme Agnoster

function Get-CmdletAlias ($cmdletname) {
	Get-Alias |
	Where-Object -FilterScript {$_.Definition -like $cmdletname} |
		Format-Table -Property Definition, Name -AutoSize
}

function Get-Update {
	sudo apt update; sudo apt upgrade
}

function Get-Power {
	# Add text processing to cleanup output
	upower -i /org/freedesktop/UPower/devices/battery_BAT1 | Select-String -SimpleMatch "time", "percentage", "state"
}

function Get-ModulesAll {
	Get-Module -ListAvailable
} 

function Get-Colors {
	[enum]::GetValues([System.ConsoleColor]) | ForEach-Object {Write-Host $_ -ForegroundColor $_}
}