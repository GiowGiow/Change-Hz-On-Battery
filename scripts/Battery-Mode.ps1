$DisplayHzOnBattery = 90
$DisplayHzDefault = 165
$LaptopDisplayNumber = 0

# Start Logging
$LogFile = "log.txt"
Start-Transcript -path $LogFile -append

# Load Common Functions
. "$PSScriptRoot\Common-Functions.ps1"

$Action = $args[0]

If (Test-Is-On-Battery) {
    if ($Action -eq "apply") {
        Set-Laptop-Display-Hz -LaptopDisplayNumber $LaptopDisplayNumber -DisplayFrequency $DisplayHzOnBattery
        "Display is now running on $DisplayHzOnBattery Hz" | Show-Notification -ToastTitle 'Battery Mode'
    }
}
else {
    if ($Action -eq "apply") {
        Set-Laptop-Display-Hz -LaptopDisplayNumber $LaptopDisplayNumber -DisplayFrequency $DisplayHzDefault
        "Display is now running on $DisplayHzDefault Hz" | Show-Notification -ToastTitle 'Balanced Mode'
    }
}

# Stop Logging
Stop-Transcript