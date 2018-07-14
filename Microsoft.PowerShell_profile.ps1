# Shell Startup
# ------------------------------------
cls # Clear screen
Import-Module Get-ChildItemColor
Import-Module posh-git
Import-Module oh-my-posh

# Set Default startup location
set-location ~/


# Oh-My-Posh Theme
Set-Theme Darkblood
# ------------------------------------

# 			Aliases
# ------------------------------------
Set-Alias dir	-Value Get-ChildItemColor -Option AllScope -Force
Set-Alias ls 	-Value Get-ChildItem -Option AllScope -Force
Set-Alias up	-Value Get-Update
Set-Alias profile -Value Get-Profile
Set-Alias clean	-Value	Clear-PackageManager

Set-Alias vpn -Value Get-Vpn

# Docker Aliases
Set-Alias dc -Value Show-DockerImages
Set-Alias dps -Value Show-DockerRunning
Set-Alias dprune -Value Clear-DockerPrune
# ------------------------------------

# 			Golang
# ------------------------------------
# Set Go path
$env:GOPATH = "/home/ph055a/go"
# ------------------------------------

# 		Powershell
# ------------------------------------
# Function gets all powershell modules
function Get-ModulesAll {
	Get-Module -ListAvailable
}

function Get-Colors {
	[enum]::GetValues([System.ConsoleColor]) | ForEach-Object {Write-Host $_ -ForegroundColor $_}
}

function Get-Profile {
	micro ~/.config/powershell/Microsoft.PowerShell_profile.ps1
}
function Get-VersionTable {
	$PSVersionTable
	$Host
}
function Get-Vpn {
	Set-Location /etc/openvpn/Countries/UDP
}
# ------------------------------------

# 		Utilities
# ------------------------------------
function Get-CmdletAlias ($cmdletname) {
	Get-Alias |
	Where-Object -FilterScript {$_.Definition -like $cmdletname} |
		Format-Table -Property Definition, Name -AutoSize
}

function Get-Power {
	# Add text processing to cleanup output
	upower -i /org/freedesktop/UPower/devices/battery_BAT1 | Select-String -SimpleMatch "time", "percentage", "state"
}
function Get-Cal {
  $day = Get-Date -DisplayHint Time
  Write-Output "Day Of The Year:" + $day
  cal
}
function Get-System {
  # Requires neofetch
  screenfetch -N
}
function Get-Ranger {
	ranger .
}
# ------------------------------------

# 		Security
# ------------------------------------
function Scan-Clamav {
	clamscan -r -i .
}

function Get-FreshClam {
	freshclam
}
# ------------------------------------

# 		Package Management
# ------------------------------------
function Get-Update {
	sudo apt update; sudo apt upgrade
}

function Clear-PackageManager{
	sudo apt autoclean; sudo apt autoremove
}
# ------------------------------------

# 		Docker
# ------------------------------------
function Show-DockerImages {
	sudo docker images
}
# Show all running containers
function Show-DockerRunning {
	sudo docker ps -a
}
# Kill all docker containers (docker kill)
function Clear-DockerPrune {
	sudo docker system prune
}
# ------------------------------------

# 		Unknown
# ------------------------------------
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
# ------------------------------------
