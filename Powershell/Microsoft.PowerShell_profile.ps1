set-location ~/

# function Get-CHM {
# 	Invoke-Item -Path ""
# }

function Get-CmdletAlias ($cmdletname) {
	Get-Alias |
	Where-Object -FilterScript {$_.Definition -like $cmdletname} |
		Format-Table -Property Definition, Name -AutoSize
}

function Prompt
{
	# Clean and add colors
	"$(Get-Date -Format g)"+ " " + (Get-Location) + "> "
}

function Get-Power {
	# Add text processing to cleanup output
	upower -i /org/freedesktop/UPower/devices/battery_BAT1
}

function Get-ModulesAll {
	Get-Module -ListAvailable
} 