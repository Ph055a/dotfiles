# Clear screen
cls

# Import modules
Import-Module Get-ChildItemColor
Import-Module posh-git
Import-Module oh-my-posh

# Set Default startup location
set-location ~/

# Oh-My-Posh configuration
# if (!(Test-Path -Path $PROFILE)) {New-Item -Type File -Path $PROFILE -Force }
Set-Theme Agnoster

# Aliases
Set-Alias dir -Value Get-ChildItemColor -Option AllScope -Force
Set-Alias ls -Value Get-ChildItemColorFormatWide -Option AllScope -Force

# Functions
function Get-CmdletAlias ($cmdletname) {
	Get-Alias |
	Where-Object -FilterScript {$_.Definition -like $cmdletname} |
		Format-Table -Property Definition, Name -AutoSize
}

function Get-Profile {
	micro ~/.config/powershell/Microsoft.PowerShell_profile.ps1
}

function Get-Update {
	sudo apt update; sudo apt upgrade
}

function Get-Power {
	# Add text processing to cleanup output
	upower -i /org/freedesktop/UPower/devices/battery_BAT1 | Select-String -SimpleMatch "time", "percentage", "state"
}

function Get-Constructor {
	[CmdletBinding()]
	Param(
		[Parameter(ValueFromPipeline=$true)]
		[type]$type
	)

	Process {
		$type.GetConstructor() |
		Format-Table -Wrap @{
			n="$($type.Name) Constructors"
			e={ ($_.GetParameters() | % {$_.ToString() }) -Join ", " }
		}
	}
}

function Find-Type {
  Param(
    [regex]$Pattern
    )
    [System.AppDomain]::CurrentDomain.GetAssemblies().GetTypes() | Select-String $Pattern
}

function Get-ModulesAll {
	Get-Module -ListAvailable
} 

function Get-Colors {
	[enum]::GetValues([System.ConsoleColor]) | ForEach-Object {Write-Host $_ -ForegroundColor $_}
}