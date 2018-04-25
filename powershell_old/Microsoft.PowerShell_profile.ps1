# Import modules
Import-Module Get-ChildItemColor
Import-Module posh-git
Import-Module oh-my-posh

# Clear screen
cls

# Set Default startup location
set-location ~/

# Oh-My-Posh configuration
# if (!(Test-Path -Path $PROFILE)) {New-Item -Type File -Path $PROFILE -Force }
Set-Theme Darkblood

# Set Go path
$env:GOPATH = "/home/ph055a/go"

# Aliases
Set-Alias dir	-Value Get-ChildItemColor -Option AllScope -Force
Set-Alias ls 	-Value Get-ChildItemColor -Option AllScope -Force
Set-Alias up	-Value Get-Update
Set-Alias profile -Value Get-Profile
Set-Alias clean	-Value	Clear-PackageManager
 
# Docker Aliases
Set-Alias dc -Value Show-DockerImages
Set-Alias dps -Value Show-DockerRunning
Set-Alias dprune -Value Clean-DockerPrune
 
# Functions
function Get-CmdletAlias ($cmdletname) {
	Get-Alias |
	Where-Object -FilterScript {$_.Definition -like $cmdletname} |
		Format-Table -Property Definition, Name -AutoSize
}

function Get-Profile {
	micro ~/.config/powershell/Microsoft.PowerShell_profile.ps1
}

function Scan-Clamav {
	clamscan -r -i .
}

function Get-FreshClam {
	freshclam
}

function Get-Update {
	sudo apt update; sudo apt upgrade
}

function Clear-PackageManager{
	sudo apt autoclean; sudo apt autoremove
}

function Get-Power {
	# Add text processing to cleanup output
	upower -i /org/freedesktop/UPower/devices/battery_BAT1 | Select-String -SimpleMatch "time", "percentage", "state"
}

# Docker functions
function Show-DockerImages {
	docker images
}
# Show all running containers
function Show-DockerRunning {
	docker ps -a
}
# Kill all docker containers (docker kill)
function Clean-DockerPrune {
	docker system prune
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

# Love2D 
function Get-Love2D {
	love .
}