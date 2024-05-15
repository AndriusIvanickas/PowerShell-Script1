$transcriptPath = "C:\transcripts\transcript01.txt"

if (-not $global:transcriptActive) {
    Start-Transcript -Path $transcriptPath -NoClobber
}

Get-Service | Sort-Object Status

function Start-MyService {
    param (
        [string]$serviceName
    )

    if (Get-Service -Name $serviceName -ErrorAction SilentlyContinue) {
        try {
          
            Start-Service -Name $serviceName -ErrorAction Stop
            Write-Output "Service '$serviceName' started successfully."
             return [PSCustomObject]@{
                ServiceName = $serviceName
                Status = "Started"
            }

            }
        catch {
          
            Write-Output "Failed to start service '$serviceName': $_"
            return $null
        }
    }
    else {
       
        Write-Output "Service '$serviceName' doesn't exist."
        return $null
    }
}

function Stop-MyService {
    param (
        [string]$serviceName
    )

    if (Get-Service -Name $serviceName -ErrorAction SilentlyContinue) {
        try {
          
            Stop-Service -Name $serviceName -ErrorAction Stop
            Write-Output "Service '$serviceName' stopped successfully."
            return [PSCustomObject]@{
                ServiceName = $serviceName
                Status = "Stopped"
            }
        }
        catch {
          
            Write-Output "Failed to stop service '$serviceName': $_"
            return $null
        }
    }
    else {
      
        Write-Output "Service '$serviceName' doesn't exist."
        return $null
    }
}

$servicesStatus = @()
$servicesStatus += Start-MyService -serviceName "DPS"
$servicesStatus += Start-MyService -serviceName "Fax"
$servicesStatus += Stop-MyService -serviceName "MullvadVPN"
$servicesStatus += Stop-MyService -serviceName "Fax"

if ($global:transcriptActive) {
    Stop-Transcript
}


$csvLocation = Read-Host "Enter where you want to save the CSV file"


while (-not (Test-Path $csvLocation -PathType Container)) {
    Write-Host "location doesn't exist."
    $csvLocation = Read-Host "Enter where you want to save the CSV file"
}


$servicesStatus | Export-Csv -Path $csvLocation -NoTypeInformation

$importedData = Import-Csv -Path $csvLocation
$importedData